-- test for customer package

-- test for register customer
BEGIN
    customer_api.register_customer(
            s_svz => '987643210',
            f_firstname => 'Alice',
            l_lastname => 'Smith',
            b_birthdate => TO_DATE('1990-07-01', 'YYYY-MM-DD')
    );
END;

select * from CUSTOMER where SVZ = '987643210';

-- test for get customer balance
DECLARE
    v_balance NUMBER;
BEGIN
    v_balance := customer_api.get_customer_balance('987643210');
    DBMS_OUTPUT.PUT_LINE('Customer Balance: ' || v_balance);
END;

-- test for update customer info
BEGIN
    customer_api.update_customer_info(
            svz => '987643210',
            f_firstname => 'Alice',
            l_lastname => 'Brown',
            b_birthdate => TO_DATE('1992-06-01', 'YYYY-MM-DD')
    );
END;

-- test for get customer history
DECLARE
    v_cursor customer_api.game_history_rec;
    v_time   TIMESTAMP;
    v_payout NUMBER;
    v_place  VARCHAR2(40);
    v_game   VARCHAR2(40);
BEGIN
    -- Get game history for customer by SVZ
    v_cursor := customer_api.get_game_history('C015'); -- change SVZ to existing one

    LOOP
        FETCH v_cursor INTO v_time, v_payout, v_place, v_game;
        EXIT WHEN v_cursor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
                'Game: ' || v_game || ', Table: ' || v_place ||
                ', Time: ' || TO_CHAR(v_time, 'YYYY-MM-DD HH24:MI') ||
                ', Payout: ' || TO_CHAR(v_payout)
        );
    END LOOP;

    CLOSE v_cursor;
END;
