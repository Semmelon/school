-- customer package
CREATE OR REPLACE PACKAGE customer_api IS
    PROCEDURE register_customer(
        s_svz IN VARCHAR2,
        f_firstname IN VARCHAR2,
        l_lastname IN VARCHAR2,
        b_birthdate IN DATE
    );

    FUNCTION get_customer_balance(
        svz IN VARCHAR2
    ) RETURN NUMBER;

    PROCEDURE update_customer_info(
        svz IN VARCHAR2,
        f_firstname IN VARCHAR2 DEFAULT NULL,
        l_lastname IN VARCHAR2 DEFAULT NULL,
        b_birthdate IN DATE DEFAULT NULL
    );

    TYPE game_history_rec IS REF CURSOR;

    FUNCTION get_game_history(p_svz IN VARCHAR2) RETURN game_history_rec;
END customer_api;

-- customer package body
CREATE OR REPLACE PACKAGE BODY customer_api IS

    -- private helper function for register_customer
    FUNCTION get_default_money RETURN NUMBER IS
    BEGIN
        RETURN 100.00;
    END;

    -- private helper function for register_customer, update_customer_info
    FUNCTION validate_age(p_birthdate DATE) RETURN BOOLEAN IS
    BEGIN
        RETURN (MONTHS_BETWEEN(SYSDATE, p_birthdate) / 12) >= 18;
    END;

    -- public procedure
    PROCEDURE register_customer(
        s_svz IN VARCHAR2,
        f_firstname IN VARCHAR2,
        l_lastname IN VARCHAR2,
        b_birthdate IN DATE
    ) IS
        v_new_id customer.id%TYPE;
        v_money  customer.money%TYPE := get_default_money;
    BEGIN
        -- validate alter
        IF NOT validate_age(b_birthdate) THEN
            RAISE_APPLICATION_ERROR(-20002, 'Customer must be at least 18 years old.');
        END IF;

        -- Generate new ID
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM customer;

        -- Insert
        INSERT INTO customer(id, svz, firstname, lastname, birthdate, money)
        VALUES (v_new_id, s_svz, f_firstname, l_lastname, b_birthdate, v_money);
    END;

    -- private helper function for get_customer_balance, update_customer_info
    FUNCTION get_customer_id_by_svz(s_svz VARCHAR2) RETURN customer.id%TYPE IS
        id customer.id%TYPE;
    BEGIN
        SELECT id
        INTO id
        FROM customer
        WHERE svz = s_svz;

        RETURN id;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20003, 'Customer with given SVZ does not exist.');
    END;

    -- public function
    FUNCTION get_customer_balance(
        svz IN VARCHAR2
    ) RETURN NUMBER IS
        balance customer.money%TYPE;
        i_id    customer.id%TYPE;
    BEGIN
        i_id := get_customer_id_by_svz(svz);
        SELECT money
        INTO balance
        FROM customer
        WHERE id = i_id;

        RETURN balance;
    END;

    -- public procedure
    PROCEDURE update_customer_info(
        svz IN VARCHAR2,
        f_firstname IN VARCHAR2 DEFAULT NULL,
        l_lastname IN VARCHAR2 DEFAULT NULL,
        b_birthdate IN DATE DEFAULT NULL
    ) IS
        v_id customer.id%TYPE;
    BEGIN
        -- get id
        v_id := get_customer_id_by_svz(svz);

        -- validate age
        IF b_birthdate IS NOT NULL THEN
            IF NOT validate_age(b_birthdate) THEN
                RAISE_APPLICATION_ERROR(-20004, 'Birthdate update rejected: customer must be at least 18.');
            END IF;
        END IF;

        -- Update
        UPDATE customer
        SET firstname = COALESCE(f_firstname, firstname),
            lastname  = COALESCE(l_lastname, lastname),
            birthdate = COALESCE(b_birthdate, birthdate)
        WHERE id = v_id;

    END update_customer_info;

    -- public function
    FUNCTION get_game_history(p_svz IN VARCHAR2) RETURN game_history_rec IS
        i_id     customer.id%TYPE;
        c_cursor game_history_rec;
    BEGIN
        -- Get customer ID
        i_id := get_customer_id_by_svz(p_svz);

        -- Open cursor
        OPEN c_cursor FOR
            SELECT gh.time,
                   gh.payout,
                   t.place       AS table_place,
                   g.bezeichnung AS game_name
            FROM game_history gh
                     JOIN "table" t ON gh."table" = t.id
                     JOIN game g ON t.game = g.id
            WHERE gh.customer = i_id
            ORDER BY gh.time DESC;

        RETURN c_cursor;
    END get_game_history;

END customer_api;
