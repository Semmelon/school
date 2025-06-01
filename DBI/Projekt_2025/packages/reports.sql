CREATE OR REPLACE PACKAGE reports IS
    TYPE payout_report_rec IS RECORD
                              (
                                  customer_id  customer.id%TYPE,
                                  firstname    customer.firstname%TYPE,
                                  lastname     customer.lastname%TYPE,
                                  total_payout NUMBER
                              );

    TYPE payout_report_cursor IS REF CURSOR RETURN payout_report_rec;

    FUNCTION daily_payout_report(p_date IN DATE) RETURN payout_report_cursor;

    FUNCTION most_profitable_customers(
        s_start_date IN DATE DEFAULT NULL,
        e_end_date IN DATE DEFAULT NULL
    ) RETURN payout_report_cursor;
END reports;

-- there could be syntax errors in the sql file - they should not be relevant when running the code though
CREATE OR REPLACE PACKAGE BODY reports IS

    -- public function
    FUNCTION daily_payout_report(p_date IN DATE) RETURN payout_report_cursor IS
        v_cursor payout_report_cursor;
    BEGIN
        OPEN v_cursor FOR
            SELECT c.id           AS customer_id,
                   c.firstname,
                   c.lastname,
                   SUM(gh.payout) AS total_payout
            FROM game_history gh
                     JOIN customer c ON gh.customer = c.id
            WHERE TRUNC(gh.time) = TRUNC(p_date)
            GROUP BY c.id, c.firstname, c.lastname;

        RETURN v_cursor;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error generating payout report: ' || SQLERRM);
            RETURN NULL;
    END;

    -- there could be syntax errors in the sql file - they should not be relevant when running the code though
    -- public function
    FUNCTION most_profitable_customers(
        s_start_date IN DATE DEFAULT NULL,
        e_end_date IN DATE DEFAULT NULL
    ) RETURN payout_report_cursor IS
        v_cursor payout_report_cursor;
    BEGIN
        OPEN v_cursor FOR
            SELECT c.id           AS customer_id,
                   c.firstname,
                   c.lastname,
                   SUM(gh.payout) AS total_payout
            FROM game_history gh
                     JOIN customer c ON gh.customer = c.id
            WHERE (s_start_date IS NULL OR gh.time >= s_start_date)
              AND (e_end_date IS NULL OR gh.time <= e_end_date)
            GROUP BY c.id, c.firstname, c.lastname
            HAVING SUM(gh.payout) > 0
            ORDER BY total_payout DESC;

        RETURN v_cursor;

    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error generating profit report: ' || SQLERRM);
            RETURN NULL;
    END;

END reports;
