-- test for table package

-- test for add game session - add a new entry in game history so cusomer play a game

BEGIN
    game_session_api.record_session(
            s_svz => '9876543210',
            t_table => 1,
            p_payout => 300.00
    );
END;

select *
from GAME_HISTORY
where "table" = 1;
select *
from CUSTOMER
where SVZ = '9876543210';