CREATE OR REPLACE PACKAGE game_session_api IS
    PROCEDURE record_session(
        s_svz IN VARCHAR2,
        t_table IN NUMBER,
        p_payout IN NUMBER,
        t_time IN TIMESTAMP DEFAULT SYSTIMESTAMP
    );
END game_session_api;

CREATE OR REPLACE PACKAGE BODY game_session_api IS

    -- help function for record_session
    FUNCTION get_customer_id(p_svz VARCHAR2) RETURN NUMBER IS
        v_id customer.id%TYPE;
    BEGIN
        SELECT id INTO v_id FROM customer WHERE svz = p_svz;
        RETURN v_id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20030, 'Customer with this SVZ does not exist.');
    END;

    -- help function for record_session
    FUNCTION validate_table(p_table_id NUMBER) RETURN BOOLEAN IS
        v_exists NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_exists FROM "table" WHERE id = p_table_id;
        RETURN v_exists > 0;
    END;

    -- public procedure
    PROCEDURE record_session(
        s_svz IN VARCHAR2,
        t_table IN NUMBER,
        p_payout IN NUMBER,
        t_time IN TIMESTAMP DEFAULT SYSTIMESTAMP
    ) IS
        v_customer_id NUMBER;
        v_new_id      NUMBER;
    BEGIN
        -- validate the table
        IF NOT validate_table(t_table) THEN
            RAISE_APPLICATION_ERROR(-20031, 'Table does not exist.');
        END IF;

        -- get customer id
        v_customer_id := get_customer_id(s_svz);

        -- make id
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM game_history;

        -- Insert
        INSERT INTO game_history(id, customer, "table", time, payout)
        VALUES (v_new_id, v_customer_id, t_table, t_time, p_payout);
    END;

END game_session_api;
