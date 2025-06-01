-- test for table package

-- test for add new table
BEGIN
    table_api.assign_game_to_table(
            p_place => 'VIP Lounge',
            g_game_id => 1
    );
END;

-- test for assign_personal_to_table
BEGIN
    TABLE_API.assign_personal_to_table(
            p_personal_id => 1,
            t_table_id => 1,
            w_work_date => DATE '2025-06-01',
            s_start_time => TO_TIMESTAMP('2025-06-01 14:00', 'YYYY-MM-DD HH24:MI'),
            e_end_time => TO_TIMESTAMP('2025-06-01 18:00', 'YYYY-MM-DD HH24:MI')
    );
END;

select *
from table_personal
where personal = 1;
