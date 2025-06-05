CREATE OR REPLACE PACKAGE table_test IS
  PROCEDURE test_add_new_table;
  PROCEDURE test_assign_personal_to_table;
  PROCEDURE run_all_tests;
END table_test;

CREATE OR REPLACE PACKAGE BODY table_test IS

  PROCEDURE test_add_new_table IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_add_new_table');

    table_api.assign_game_to_table(
      p_place => 'VIP Lounge',
      g_game_id => 1
    );

    DBMS_OUTPUT.PUT_LINE('✅ Table assigned with game successfully.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Error in test_add_new_table: ' || SQLERRM);
  END;


  PROCEDURE test_assign_personal_to_table IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_assign_personal_to_table');

    table_api.assign_personal_to_table(
      p_personal_id => 1,
      t_table_id => 1,
      w_work_date => DATE '2025-06-01',
      s_start_time => TO_TIMESTAMP('2025-06-01 14:00', 'YYYY-MM-DD HH24:MI'),
      e_end_time => TO_TIMESTAMP('2025-06-01 18:00', 'YYYY-MM-DD HH24:MI')
    );

    DBMS_OUTPUT.PUT_LINE('✅ Personal assigned to table successfully.');

    -- Show inserted data
    FOR rec IN (
      SELECT * FROM table_personal WHERE personal = 1 ORDER BY "date" DESC, start_time DESC
    ) LOOP
      DBMS_OUTPUT.PUT_LINE(
        'TablePersonal: id=' || rec.id || ', personal=' || rec.personal ||
        ', table=' || rec."table" || ', date=' || TO_CHAR(rec."date", 'YYYY-MM-DD') ||
        ', start=' || TO_CHAR(rec.start_time, 'HH24:MI') || ', end=' || TO_CHAR(rec.end_time, 'HH24:MI')
      );
    END LOOP;

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Error in test_assign_personal_to_table: ' || SQLERRM);
  END;


  PROCEDURE run_all_tests IS
  BEGIN
    test_add_new_table;
    test_assign_personal_to_table;
  END;

END table_test;
