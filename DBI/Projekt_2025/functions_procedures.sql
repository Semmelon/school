-- customer package
CREATE OR REPLACE PACKAGE customer_api IS
    PROCEDURE register_customer(
        svz IN VARCHAR2,
        firstname IN VARCHAR2,
        lastname IN VARCHAR2,
        birthdate IN DATE
    );

    FUNCTION get_customer_balance(
        svz IN VARCHAR2
    ) RETURN NUMBER;
END customer_api;

-- customer package body
CREATE OR REPLACE PACKAGE BODY customer_api IS

    -- private helper function for register_customer
    FUNCTION get_default_money RETURN NUMBER IS
    BEGIN
        RETURN 100.00;
    END;

    -- private helper function for register_customer
    FUNCTION validate_age(p_birthdate DATE) RETURN BOOLEAN IS
    BEGIN
        RETURN (MONTHS_BETWEEN(SYSDATE, p_birthdate) / 12) >= 18;
    END;

    -- public procedure
    PROCEDURE register_customer(
        svz IN VARCHAR2,
        firstname IN VARCHAR2,
        lastname IN VARCHAR2,
        birthdate IN DATE
    ) IS
        v_new_id customer.id%TYPE;
        v_money  customer.money%TYPE := get_default_money;
    BEGIN
        -- Age check
        IF NOT validate_age(birthdate) THEN
            RAISE_APPLICATION_ERROR(-20002, 'Customer must be at least 18 years old.');
        END IF;

        -- Generate new ID
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM customer;

        -- Insert new customer with default money
        INSERT INTO customer(id, svz, firstname, lastname, birthdate, money)
        VALUES (v_new_id, svz, firstname, lastname, birthdate, v_money);
    END;

    -- private helper function for get_customer_balance
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
        i_id      customer.id%TYPE;
    BEGIN
        i_id := get_customer_id_by_svz(svz);
        SELECT money
        INTO balance
        FROM customer
        WHERE id = i_id;

        RETURN balance;
    END;

END customer_api;

-- test for customer package

-- test for register customer
BEGIN
    customer_api.register_customer(
            svz => '987643210',
            firstname => 'Alice',
            lastname => 'Smith',
            birthdate => TO_DATE('2290-07-01', 'YYYY-MM-DD')
    );
END;

-- test for get customer balance
DECLARE
  v_balance NUMBER;
BEGIN
  v_balance := customer_api.get_customer_balance('9876543210');
  DBMS_OUTPUT.PUT_LINE('Customer Balance: ' || v_balance);
END;