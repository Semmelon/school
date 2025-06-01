CREATE OR REPLACE PACKAGE personal_api IS
  PROCEDURE add_contract(
    p_personal_id IN NUMBER,
    s_since       IN DATE,
    t_till        IN DATE,
    s_salary      IN NUMBER
  );
END personal_api;

CREATE OR REPLACE PACKAGE BODY personal_api IS

  -- private helper function for add_contract
  FUNCTION personal_exists(p_id NUMBER) RETURN BOOLEAN IS
    v_count NUMBER;
  BEGIN
    SELECT COUNT(*) INTO v_count FROM personal WHERE id = p_id;
    RETURN v_count > 0;
  END;

  -- public procedure
  PROCEDURE add_contract(
    p_personal_id IN NUMBER,
    s_since       IN DATE,
    t_till        IN DATE,
    s_salary      IN NUMBER
  ) IS
    v_new_id personal_contract_history.id%TYPE;
  BEGIN
    -- Validations
    IF NOT personal_exists(p_personal_id) THEN
      RAISE_APPLICATION_ERROR(-20050, 'Staff member does not exist.');
    END IF;

    IF t_till <= s_since THEN
      RAISE_APPLICATION_ERROR(-20051, 'End date must be after start date.');
    END IF;

    FOR r IN (
      SELECT 1 FROM personal_contract_history
      WHERE personal = p_personal_id
        AND since = s_since
        AND salary = s_salary
    ) LOOP
      RAISE_APPLICATION_ERROR(-20052, 'Contract with same start date and salary already exists.');
    END LOOP;

    -- make new id
    SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM personal_contract_history;

    -- Insert
    INSERT INTO personal_contract_history(id, personal, since, till, salary)
    VALUES (v_new_id, p_personal_id, s_since, t_till, s_salary);
  END;

END personal_api;
