CREATE OR REPLACE PACKAGE personal_test IS
  PROCEDURE test_add_contract;
  PROCEDURE test_get_current_table_personal;
  PROCEDURE run_all_tests;
END personal_test;

CREATE OR REPLACE PACKAGE BODY personal_test IS

  PROCEDURE test_add_contract IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_add_contract');

    personal_api.add_contract(
      p_personal_id => 1,
      s_since       => DATE '2025-06-01',
      t_till        => DATE '2026-06-01',
      s_salary      => 3500.00
    );

    DBMS_OUTPUT.PUT_LINE('✅ Passed: Contract inserted.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Failed: ' || SQLERRM);
  END;


  PROCEDURE test_get_current_table_personal IS
    v_cursor PERSONAL_API.personal_cursor;
    v_id     personal.id%TYPE;
    v_fn     personal.firstname%TYPE;
    v_ln     personal.lastname%TYPE;
    v_start  TIMESTAMP;
    v_end    TIMESTAMP;
    v_exists NUMBER;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_get_current_table_personal');

    -- Check if a shift exists for today, insert if needed
    SELECT COUNT(*) INTO v_exists
    FROM table_personal
    WHERE personal = 1 AND "table" = 1 AND "date" = TRUNC(SYSDATE);

    IF v_exists = 0 THEN
      INSERT INTO table_personal (
        id, personal, "table", "date", start_time, end_time
      )
      VALUES (
        (SELECT NVL(MAX(id), 0) + 1 FROM table_personal),
        1, 1, TRUNC(SYSDATE),
        SYSTIMESTAMP - INTERVAL '1' HOUR,
        SYSTIMESTAMP + INTERVAL '2' HOUR
      );
      COMMIT;
      DBMS_OUTPUT.PUT_LINE('Inserted test shift for personal ID 1.');
    END IF;

    -- Run test
    v_cursor := PERSONAL_API.get_current_table_personal(1);

    IF v_cursor IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('❌ Failed: Cursor is NULL or error occurred.');
      RETURN;
    END IF;

    LOOP
      FETCH v_cursor INTO v_id, v_fn, v_ln, v_start, v_end;
      EXIT WHEN v_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(
        '👤 Personal: ' || v_fn || ' ' || v_ln ||
        ' | Shift: ' || TO_CHAR(v_start, 'HH24:MI') || ' - ' || TO_CHAR(v_end, 'HH24:MI')
      );
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('✅ Passed: Fetched current staff data.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Failed: ' || SQLERRM);
  END;


  PROCEDURE run_all_tests IS
  BEGIN
    test_add_contract;
    test_get_current_table_personal;
  END;

END personal_test;
