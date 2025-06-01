-- test for report package

-- the daily payout of the people who played

DECLARE
  v_cursor reports.payout_report_cursor;
  v_row    reports.payout_report_rec;
BEGIN
  v_cursor := reports.daily_payout_report(SYSDATE);

  IF v_cursor IS NULL THEN
    DBMS_OUTPUT.PUT_LINE('No report generated.');
    RETURN;
  END IF;

  LOOP
    FETCH v_cursor INTO v_row;
    EXIT WHEN v_cursor%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE(
      'Customer: ' || v_row.firstname || ' ' || v_row.lastname ||
      ', Total Payout: €' || TO_CHAR(v_row.total_payout, '9990.00')
    );
  END LOOP;

  CLOSE v_cursor;
END;
