CREATE OR REPLACE PACKAGE reports_test IS
  PROCEDURE test_daily_payout_report;
  PROCEDURE test_most_profitable_customers;
  PROCEDURE run_all_tests;
END reports_test;

CREATE OR REPLACE PACKAGE BODY reports_test IS

  PROCEDURE test_daily_payout_report IS
    v_cursor reports.payout_report_cursor;
    v_row    reports.payout_report_rec;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_daily_payout_report');

    v_cursor := reports.daily_payout_report(SYSDATE);

    IF v_cursor IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('❌ No report generated.');
      RETURN;
    END IF;

    LOOP
      FETCH v_cursor INTO v_row;
      EXIT WHEN v_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(
        '👤 Customer: ' || v_row.firstname || ' ' || v_row.lastname ||
        ' | Total Payout: €' || TO_CHAR(v_row.total_payout, '9999990.00')
      );
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('✅ Finished test_daily_payout_report.');

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Error in daily payout report: ' || SQLERRM);
  END;


  PROCEDURE test_most_profitable_customers IS
    v_cursor reports.payout_report_cursor;
    v_row    reports.payout_report_rec;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_most_profitable_customers');

    v_cursor := reports.most_profitable_customers(
      s_start_date => TO_DATE('2024-01-01', 'YYYY-MM-DD'),
      e_end_date   => SYSDATE
    );

    IF v_cursor IS NULL THEN
      DBMS_OUTPUT.PUT_LINE('❌ No profitable customers found.');
      RETURN;
    END IF;

    LOOP
      FETCH v_cursor INTO v_row;
      EXIT WHEN v_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(
        '👑 Customer: ' || v_row.firstname || ' ' || v_row.lastname ||
        ' | Total Profit: €' || TO_CHAR(v_row.total_payout, '9999990.00')
      );
    END LOOP;

    CLOSE v_cursor;

    DBMS_OUTPUT.PUT_LINE('✅ Finished test_most_profitable_customers.');

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Error in most profitable customers report: ' || SQLERRM);
  END;


  PROCEDURE run_all_tests IS
  BEGIN
    test_daily_payout_report;
    test_most_profitable_customers;
  END;

END reports_test;
