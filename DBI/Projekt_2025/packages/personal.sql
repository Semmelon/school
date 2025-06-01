CREATE OR REPLACE PACKAGE personal_api IS
    PROCEDURE add_contract(
        p_personal_id IN NUMBER,
        s_since IN DATE,
        t_till IN DATE,
        s_salary IN NUMBER
    );

    TYPE staff_rec IS RECORD
                      (
                          personal_id personal.id%TYPE,
                          firstname   personal.firstname%TYPE,
                          lastname    personal.lastname%TYPE,
                          start_time  TIMESTAMP,
                          end_time    TIMESTAMP
                      );

    TYPE staff_cursor IS REF CURSOR RETURN staff_rec;

    FUNCTION get_current_table_personal(
        t_table_id IN NUMBER
    ) RETURN staff_cursor;
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
        s_since IN DATE,
        t_till IN DATE,
        s_salary IN NUMBER
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
            SELECT 1
            FROM personal_contract_history
            WHERE personal = p_personal_id
              AND since = s_since
              AND salary = s_salary
            )
            LOOP
                RAISE_APPLICATION_ERROR(-20052, 'Contract with same start date and salary already exists.');
            END LOOP;

        -- make new id
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM personal_contract_history;

        -- Insert
        INSERT INTO personal_contract_history(id, personal, since, till, salary)
        VALUES (v_new_id, p_personal_id, s_since, t_till, s_salary);
    END;

    -- private helper function for get_current_table_personal
    FUNCTION table_exists(t_table_id NUMBER) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM "table" WHERE id = t_table_id;
        RETURN v_count > 0;
    END;

    -- public function
    FUNCTION get_current_table_personal(
        t_table_id IN NUMBER
    ) RETURN staff_cursor IS
        v_cursor staff_cursor;
    BEGIN
        -- check if table there
        IF NOT table_exists(t_table_id) THEN
            RAISE_APPLICATION_ERROR(-20053, 'Table does not exist.');
        END IF;

        -- open cursor
        OPEN v_cursor FOR
            SELECT p.id,
                   p.firstname,
                   p.lastname,
                   tp.start_time,
                   tp.end_time
            FROM table_personal tp
                     JOIN personal p ON tp.personal = p.id
            WHERE tp."table" = t_table_id
              AND tp."date" = TRUNC(SYSDATE)
              AND SYSTIMESTAMP BETWEEN tp.start_time AND tp.end_time;

        RETURN v_cursor;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN NULL;
    END;

END personal_api;
