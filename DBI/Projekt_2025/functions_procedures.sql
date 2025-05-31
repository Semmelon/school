-- customer package
CREATE OR REPLACE PACKAGE customer_api IS
    PROCEDURE register_customer(
        p_svz IN VARCHAR2,
        p_firstname IN VARCHAR2,
        p_lastname IN VARCHAR2,
        p_birthdate IN DATE
    );
END customer_api;

-- customer package body
CREATE OR REPLACE PACKAGE BODY customer_api IS

    FUNCTION get_default_money RETURN NUMBER IS
    BEGIN
        RETURN 100.00;
    END;

    FUNCTION validate_age(p_birthdate DATE) RETURN BOOLEAN IS
    BEGIN
        RETURN (MONTHS_BETWEEN(SYSDATE, p_birthdate) / 12) >= 18;
    END;

    -- Public: Register a new customer
    PROCEDURE register_customer(
        p_svz IN VARCHAR2,
        p_firstname IN VARCHAR2,
        p_lastname IN VARCHAR2,
        p_birthdate IN DATE
    ) IS
        v_new_id customer.id%TYPE;
        v_money  customer.money%TYPE := get_default_money;
    BEGIN
        -- Age check
        IF NOT validate_age(p_birthdate) THEN
            RAISE_APPLICATION_ERROR(-20002, 'Customer must be at least 18 years old.');
        END IF;

        -- Generate new ID
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM customer;

        -- Insert new customer with default money
        INSERT INTO customer(id, svz, firstname, lastname, birthdate, money)
        VALUES (v_new_id, p_svz, p_firstname, p_lastname, p_birthdate, v_money);
    END;

END customer_api;

-- test for customer package

-- test for register customer
BEGIN
  customer_api.register_customer(
    p_svz       => '987643210',
    p_firstname => 'Alice',
    p_lastname  => 'Smith',
    p_birthdate => TO_DATE('2290-07-01', 'YYYY-MM-DD')
  );
END;