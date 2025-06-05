CREATE OR REPLACE PACKAGE game_test IS
  PROCEDURE test_add_game;
  PROCEDURE run_all_tests;
END game_test;

CREATE OR REPLACE PACKAGE BODY game_test IS

  PROCEDURE test_add_game IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE('Running: test_add_game');

    game_api.add_game(
      b_bezeichnung => 'Blackjack',
      d_description => 'Card game where you try to reach 21',
      r_rules       => 'Players play against dealer. Closest to 21 wins.'
    );

    DBMS_OUTPUT.PUT_LINE('✅ Passed: Game added successfully.');
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('❌ Failed: ' || SQLERRM);
  END;

  PROCEDURE run_all_tests IS
  BEGIN
    test_add_game;
  END;

END game_test;
