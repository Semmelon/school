CREATE OR REPLACE PACKAGE customer_test IS
  PROCEDURE test_register_valid_customer;
  PROCEDURE test_register_underage_customer;
  PROCEDURE run_all_tests;
END customer_test;

CREATE OR REPLACE PACKAGE BODY customer_test IS

  PROCEDURE test_register_valid_customer IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_register_valid_customer');

    customer_api.register_customer(
      p_svz       => 'TEST123456',
      p_firstname => 'Valid',
      p_lastname  => 'Customer',
      p_birthdate => DATE '1990-01-01'
    );

    DBMS_OUTPUT.PUT_LINE('✅ Passed: Valid customer registered.');

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Failed: ' || SQLERRM);
  END;


  PROCEDURE test_register_underage_customer IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_register_underage_customer');

    customer_api.register_customer(
      p_svz       => 'UNDERAGE001',
      p_firstname => 'Young',
      p_lastname  => 'Customer',
      p_birthdate => SYSDATE - INTERVAL '17' YEAR  -- 17 years old
    );

    DBMS_OUTPUT.PUT_LINE('❌ Failed: Underage customer was registered (should not be).');

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('✅ Passed: Error correctly raised for underage customer: ' || SQLERRM);
  END;


  PROCEDURE run_all_tests IS
  BEGIN
    test_register_valid_customer;
    test_register_underage_customer;
  END;

END customer_test;
