-- game package
CREATE OR REPLACE PACKAGE game_api IS
  PROCEDURE add_game(
    b_bezeichnung IN VARCHAR2,
    d_description IN VARCHAR2 DEFAULT NULL,
    r_rules       IN VARCHAR2
  );
END game_api;

CREATE OR REPLACE PACKAGE BODY game_api IS

  PROCEDURE add_game(
    b_bezeichnung IN VARCHAR2,
    d_description IN VARCHAR2 DEFAULT NULL,
    r_rules       IN VARCHAR2
  ) IS
    v_new_id game.id%TYPE;
  BEGIN
    -- validate input
    IF b_bezeichnung IS NULL OR r_rules IS NULL THEN
      RAISE_APPLICATION_ERROR(-20010, 'Bezeichnung and rules must not be null.');
    END IF;

    -- make new id
    SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM game;

    -- Insert
    INSERT INTO game (id, bezeichnung, description, rules)
    VALUES (v_new_id, b_bezeichnung, d_description, r_rules);

  END add_game;

END game_api;
