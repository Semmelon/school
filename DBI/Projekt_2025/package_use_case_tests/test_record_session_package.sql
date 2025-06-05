CREATE OR REPLACE PACKAGE record_session_test IS
  PROCEDURE test_record_session;
  PROCEDURE run_all_tests;
END record_session_test;

CREATE OR REPLACE PACKAGE BODY record_session_test IS

  PROCEDURE test_record_session IS
    v_svz     VARCHAR2(40) := '987643210';
    v_table   NUMBER := 1;
    v_payout  NUMBER := 300.00;
    v_exists  NUMBER;
    v_game_id NUMBER := 1;
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_record_session');

    -- Ensure a game exists
    SELECT COUNT(*) INTO v_exists FROM game WHERE id = v_game_id;
    IF v_exists = 0 THEN
      INSERT INTO game (id, bezeichnung, description, rules)
      VALUES (v_game_id, 'Test Game', 'For testing session', 'Basic test rules.');
    END IF;

    -- Ensure table exists
    SELECT COUNT(*) INTO v_exists FROM "table" WHERE id = v_table;
    IF v_exists = 0 THEN
      INSERT INTO "table" (id, place, game)
      VALUES (v_table, 'Test Room', v_game_id);
    END IF;

    -- Ensure customer exists
    SELECT COUNT(*) INTO v_exists FROM customer WHERE svz = v_svz;
    IF v_exists = 0 THEN
      INSERT INTO customer (id, svz, firstname, lastname, birthdate, money)
      VALUES (
        (SELECT NVL(MAX(id), 0) + 1 FROM customer),
        v_svz, 'Test', 'User', DATE '1995-01-01', 1000.00
      );
    END IF;

    -- Call the procedure to test
    game_session_api.record_session(
      s_svz    => v_svz,
      t_table  => v_table,
      p_payout => v_payout
    );

    DBMS_OUTPUT.PUT_LINE('✅ Game session recorded successfully.');

    -- Show game history entry
    FOR gh IN (
      SELECT * FROM game_history
      WHERE "table" = v_table
      AND customer = (SELECT id FROM customer WHERE svz = v_svz)
      ORDER BY time DESC FETCH FIRST 1 ROWS ONLY
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('🧾 Game History → Payout: ' || gh.payout || ', Time: ' || gh.time);
    END LOOP;

    -- Show updated customer balance
    FOR c IN (
      SELECT firstname, lastname, money FROM customer WHERE svz = v_svz
    ) LOOP
      DBMS_OUTPUT.PUT_LINE('💰 Customer: ' || c.firstname || ' ' || c.lastname || ' | Balance: ' || c.money);
    END LOOP;

  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Error: ' || SQLERRM);
  END;

  PROCEDURE run_all_tests IS
  BEGIN
    test_record_session;
  END;

END record_session_test;
