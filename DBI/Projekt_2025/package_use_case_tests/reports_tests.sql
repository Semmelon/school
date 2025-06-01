-- test for report package

-- the daily payout of the people who played
-- prints out all customers who played today if negative number should look something like this: €########
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

-- test for the most_profitable_customers
-- prints out all customers with positive score descending
DECLARE
    v_cursor reports.payout_report_cursor;
    v_row    reports.payout_report_rec;
BEGIN
    v_cursor := reports.most_profitable_customers(
            s_start_date => TO_DATE('2024-01-01', 'YYYY-MM-DD'),
            e_end_date => SYSDATE
                );

    IF v_cursor IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No profitable customers found.');
        RETURN;
    END IF;

    LOOP
        FETCH v_cursor INTO v_row;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
                'Customer: ' || v_row.firstname || ' ' || v_row.lastname ||
                ', Total Profit: €' || TO_CHAR(v_row.total_payout, '9990.00')
        );
    END LOOP;

    CLOSE v_cursor;
END;
