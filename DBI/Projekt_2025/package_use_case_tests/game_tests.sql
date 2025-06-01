-- test for game package

-- test for add new game
BEGIN
  game_api.add_game(
    b_bezeichnung => 'Blackjack',
    d_description => 'Card game where you try to reach 21',
    r_rules       => 'Players play against dealer. Closest to 21 wins.'
  );
END;
