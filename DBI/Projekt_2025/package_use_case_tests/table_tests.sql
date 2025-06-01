-- test for table package

-- test for add new table
BEGIN
    table_api.assign_game_to_table(
            p_place => 'VIP Lounge',
            g_game_id => 1
    );
END;
