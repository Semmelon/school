-- test for personal package

-- test for add personal_contract_history
BEGIN
  personal_api.add_contract(
    p_personal_id => 1,
    s_since       => DATE '2025-06-01',
    t_till        => DATE '2026-06-01',
    s_salary      => 3500.00
  );
END;

select * from personal_contract_history where personal = 1;
