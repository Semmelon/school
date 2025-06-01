-- test for personal package

-- test for add personal_contract_history
BEGIN
    personal_api.add_contract(
            p_personal_id => 1,
            s_since => DATE '2025-06-01',
            t_till => DATE '2026-06-01',
            s_salary => 3500.00
    );
END;

select *
from personal_contract_history
where personal = 1;


-- test for get_current_table personal

-- insert personal for now if not exists yet
INSERT INTO table_personal (
  id, personal, "table", "date", start_time, end_time
)
VALUES (
  (SELECT NVL(MAX(id), 0) + 1 FROM table_personal), -- auto ID
  1,                      -- personal ID
  1,                      -- table ID
  TRUNC(SYSDATE),         -- today's date
  SYSTIMESTAMP - INTERVAL '1' HOUR, -- started 1 hour ago
  SYSTIMESTAMP + INTERVAL '2' HOUR  -- ends in 2 hours
);

-- test
DECLARE
  v_cursor PERSONAL_API.personal_cursor;
  v_id     personal.id%TYPE;
  v_fn     personal.firstname%TYPE;
  v_ln     personal.lastname%TYPE;
  v_start  TIMESTAMP;
  v_end    TIMESTAMP;
BEGIN
  v_cursor := PERSONAL_API.get_current_table_personal(1);

  IF v_cursor IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('No personal or error occurred.');
    RETURN;
  END IF;

  LOOP
    FETCH v_cursor INTO v_id, v_fn, v_ln, v_start, v_end;
    EXIT WHEN v_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
      'personal: ' || v_fn || ' ' || v_ln ||
      ', Shift: ' || TO_CHAR(v_start, 'HH24:MI') || ' - ' || TO_CHAR(v_end, 'HH24:MI')
    );
  END LOOP;

  CLOSE v_cursor;
END;
