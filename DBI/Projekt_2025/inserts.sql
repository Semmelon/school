-- inserts
-- personal inserts
INSERT INTO personal
VALUES (1, 'SVZ001', 'Alice', 'Smith', TO_DATE('1980-01-01', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (2, 'SVZ002', 'Bob', 'Jones', TO_DATE('1975-05-12', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (3, 'SVZ003', 'Carol', 'Taylor', TO_DATE('1988-09-23', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (4, 'SVZ004', 'David', 'Brown', TO_DATE('1990-02-02', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (5, 'SVZ005', 'Eve', 'Wilson', TO_DATE('1982-11-30', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (6, 'SVZ006', 'Frank', 'Moore', TO_DATE('1970-03-18', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (7, 'SVZ007', 'Grace', 'Clark', TO_DATE('1995-07-07', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (8, 'SVZ008', 'Hank', 'Lee', TO_DATE('1984-04-14', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (9, 'SVZ009', 'Ivy', 'Hall', TO_DATE('1989-10-10', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (10, 'SVZ010', 'Jake', 'Allen', TO_DATE('1992-06-06', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (11, 'SVZ011', 'Kate', 'Young', TO_DATE('1979-08-20', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (12, 'SVZ012', 'Leo', 'King', TO_DATE('1985-12-12', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (13, 'SVZ013', 'Mia', 'Wright', TO_DATE('1991-01-15', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (14, 'SVZ014', 'Nick', 'Lopez', TO_DATE('1986-03-03', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (15, 'SVZ015', 'Olivia', 'Hill', TO_DATE('1983-05-05', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (16, 'SVZ016', 'Paul', 'Scott', TO_DATE('1976-07-07', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (17, 'SVZ017', 'Quinn', 'Green', TO_DATE('1987-09-09', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (18, 'SVZ018', 'Rose', 'Adams', TO_DATE('1993-11-11', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (19, 'SVZ019', 'Sam', 'Baker', TO_DATE('1981-02-22', 'YYYY-MM-DD'));
INSERT INTO personal
VALUES (20, 'SVZ020', 'Tina', 'Nelson', TO_DATE('1994-04-04', 'YYYY-MM-DD'));

-- customer insters
INSERT INTO customer
VALUES (1, 'C001', 'Aaron', 'Morris', TO_DATE('1988-05-21', 'YYYY-MM-DD'), 1200.50);
INSERT INTO customer
VALUES (2, 'C002', 'Bella', 'Rogers', TO_DATE('1979-04-12', 'YYYY-MM-DD'), 3000.00);
INSERT INTO customer
VALUES (3, 'C003', 'Cory', 'Murphy', TO_DATE('1991-08-10', 'YYYY-MM-DD'), -785.00);
INSERT INTO customer
VALUES (4, 'C004', 'Daisy', 'Reed', TO_DATE('1982-06-16', 'YYYY-MM-DD'), 2150.75);
INSERT INTO customer
VALUES (5, 'C005', 'Eli', 'Price', TO_DATE('1995-07-23', 'YYYY-MM-DD'), 540.40);
INSERT INTO customer
VALUES (6, 'C006', 'Fiona', 'Perry', TO_DATE('1990-09-02', 'YYYY-MM-DD'), 920.25);
INSERT INTO customer
VALUES (7, 'C007', 'Gabe', 'Russell', TO_DATE('1987-11-11', 'YYYY-MM-DD'), 1500.00);
INSERT INTO customer
VALUES (8, 'C008', 'Holly', 'Bennett', TO_DATE('1980-01-15', 'YYYY-MM-DD'), -3100.80);
INSERT INTO customer
VALUES (9, 'C009', 'Ian', 'Watson', TO_DATE('1992-10-08', 'YYYY-MM-DD'), 245.90);
INSERT INTO customer
VALUES (10, 'C010', 'Jane', 'West', TO_DATE('1985-12-19', 'YYYY-MM-DD'), 625.30);
INSERT INTO customer
VALUES (11, 'C011', 'Kyle', 'Knight', TO_DATE('1993-03-04', 'YYYY-MM-DD'), -1125.60);
INSERT INTO customer
VALUES (12, 'C012', 'Lily', 'Austin', TO_DATE('1978-02-07', 'YYYY-MM-DD'), 3300.00);
INSERT INTO customer
VALUES (13, 'C013', 'Mike', 'Stone', TO_DATE('1991-04-22', 'YYYY-MM-DD'), 1950.75);
INSERT INTO customer
VALUES (14, 'C014', 'Nina', 'Warren', TO_DATE('1986-06-17', 'YYYY-MM-DD'), 865.00);
INSERT INTO customer
VALUES (15, 'C015', 'Omar', 'Harper', TO_DATE('1994-05-01', 'YYYY-MM-DD'), -1420.00);
INSERT INTO customer
VALUES (16, 'C016', 'Paula', 'Wells', TO_DATE('1983-09-03', 'YYYY-MM-DD'), 1010.10);
INSERT INTO customer
VALUES (17, 'C017', 'Ray', 'Fisher', TO_DATE('1990-07-14', 'YYYY-MM-DD'), 480.90);
INSERT INTO customer
VALUES (18, 'C018', 'Sara', 'Dean', TO_DATE('1989-11-22', 'YYYY-MM-DD'), -1290.35);
INSERT INTO customer
VALUES (19, 'C019', 'Tom', 'Carr', TO_DATE('1984-01-10', 'YYYY-MM-DD'), -765.80);
INSERT INTO customer
VALUES (20, 'C020', 'Uma', 'Ford', TO_DATE('1996-03-30', 'YYYY-MM-DD'), 2200.00);

-- game inserts
INSERT INTO game
VALUES (1, 'Poker', 'Classic card game', 'Players bet based on the strength of their cards.');
INSERT INTO game
VALUES (2, 'Roulette', 'Wheel game', 'Players bet on numbers, colors or ranges.');
INSERT INTO game
VALUES (3, 'Blackjack', '21 game', 'Beat the dealer without going over 21.');
INSERT INTO game
VALUES (4, 'Craps', 'Dice game', 'Players bet on dice roll outcomes.');
INSERT INTO game
VALUES (5, 'Baccarat', 'Card comparison', 'Compare hands between player and banker.');
INSERT INTO game
VALUES (6, 'Slots', 'Machine game', 'Spin reels and match symbols.');
INSERT INTO game
VALUES (7, 'Keno', 'Lottery style', 'Choose numbers and wait for draws.');
INSERT INTO game
VALUES (8, 'Pai Gow', 'Domino game', 'Form high and low hands.');
INSERT INTO game
VALUES (9, 'Sic Bo', 'Chinese dice game', 'Bet on outcomes of three dice.');
INSERT INTO game
VALUES (10, 'War', 'Card game', 'Higher card wins.');
INSERT INTO game
VALUES (11, 'Texas Holdem', 'Poker variant', 'Community cards and betting rounds.');
INSERT INTO game
VALUES (12, 'Omaha', 'Poker variant', 'Four hole cards, five community.');
INSERT INTO game
VALUES (13, 'Caribbean Stud', 'Poker variant', 'Dealer vs player poker hands.');
INSERT INTO game
VALUES (14, 'Mini Baccarat', 'Fast paced', 'Simplified Baccarat.');
INSERT INTO game
VALUES (15, 'Big Six', 'Wheel of fortune', 'Bet on symbols on wheel.');
INSERT INTO game
VALUES (16, 'Red Dog', 'Card game', 'Bet on spread between cards.');
INSERT INTO game
VALUES (17, 'Three Card Poker', 'Poker variant', 'Beat the dealer’s hand.');
INSERT INTO game
VALUES (18, 'Let It Ride', 'Poker variant', 'Make strategic bet withdrawals.');
INSERT INTO game
VALUES (19, 'Video Poker', 'Electronic poker', 'Play against a payout table.');
INSERT INTO game
VALUES (20, 'Crapless Craps', 'Dice game variant', 'No don’t pass line.');

-- table inserts
INSERT INTO "table"
VALUES (1, 'Las Vegas', 1);
INSERT INTO "table"
VALUES (2, 'Atlantic City', 2);
INSERT INTO "table"
VALUES (3, 'Monte Carlo', 3);
INSERT INTO "table"
VALUES (4, 'Macau', 4);
INSERT INTO "table"
VALUES (5, 'Singapore', 5);
INSERT INTO "table"
VALUES (6, 'London', 6);
INSERT INTO "table"
VALUES (7, 'Paris', 7);
INSERT INTO "table"
VALUES (8, 'Berlin', 8);
INSERT INTO "table"
VALUES (9, 'Toronto', 9);
INSERT INTO "table"
VALUES (10, 'Vancouver', 10);
INSERT INTO "table"
VALUES (11, 'Melbourne', 11);
INSERT INTO "table"
VALUES (12, 'Sydney', 12);
INSERT INTO "table"
VALUES (13, 'Tokyo', 13);
INSERT INTO "table"
VALUES (14, 'Seoul', 14);
INSERT INTO "table"
VALUES (15, 'Dubai', 15);
INSERT INTO "table"
VALUES (16, 'Madrid', 16);
INSERT INTO "table"
VALUES (17, 'Barcelona', 17);
INSERT INTO "table"
VALUES (18, 'Rome', 18);
INSERT INTO "table"
VALUES (19, 'Vienna', 19);
INSERT INTO "table"
VALUES (20, 'Zurich', 20);


-- game_history inserts
INSERT INTO game_history
VALUES (1, 1, 1, TO_TIMESTAMP('2024-01-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 500);
INSERT INTO game_history
VALUES (2, 2, 2, TO_TIMESTAMP('2024-01-02 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 200);
INSERT INTO game_history
VALUES (3, 3, 3, TO_TIMESTAMP('2024-01-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0);
INSERT INTO game_history
VALUES (4, 4, 4, TO_TIMESTAMP('2024-01-04 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 750);
INSERT INTO game_history
VALUES (5, 5, 5, TO_TIMESTAMP('2024-01-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 90);
INSERT INTO game_history
VALUES (6, 6, 6, TO_TIMESTAMP('2024-01-06 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 305);
INSERT INTO game_history
VALUES (7, 7, 7, TO_TIMESTAMP('2024-01-07 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 140);
INSERT INTO game_history
VALUES (8, 8, 8, TO_TIMESTAMP('2024-01-08 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 0);
INSERT INTO game_history
VALUES (9, 9, 9, TO_TIMESTAMP('2024-01-09 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 250);
INSERT INTO game_history
VALUES (10, 10, 10, TO_TIMESTAMP('2024-01-10 23:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1000);
INSERT INTO game_history
VALUES (11, 11, 11, TO_TIMESTAMP('2024-01-11 11:11:00', 'YYYY-MM-DD HH24:MI:SS'), 600);
INSERT INTO game_history
VALUES (12, 12, 12, TO_TIMESTAMP('2024-01-12 12:12:00', 'YYYY-MM-DD HH24:MI:SS'), 0);
INSERT INTO game_history
VALUES (13, 13, 13, TO_TIMESTAMP('2024-01-13 13:13:00', 'YYYY-MM-DD HH24:MI:SS'), 330);
INSERT INTO game_history
VALUES (14, 14, 14, TO_TIMESTAMP('2024-01-14 14:14:00', 'YYYY-MM-DD HH24:MI:SS'), 0);
INSERT INTO game_history
VALUES (15, 15, 15, TO_TIMESTAMP('2024-01-15 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), 725);
INSERT INTO game_history
VALUES (16, 16, 16, TO_TIMESTAMP('2024-01-16 16:16:00', 'YYYY-MM-DD HH24:MI:SS'), 120);
INSERT INTO game_history
VALUES (17, 17, 17, TO_TIMESTAMP('2024-01-17 17:17:00', 'YYYY-MM-DD HH24:MI:SS'), 80);
INSERT INTO game_history
VALUES (18, 18, 18, TO_TIMESTAMP('2024-01-18 18:18:00', 'YYYY-MM-DD HH24:MI:SS'), 990);
INSERT INTO game_history
VALUES (19, 19, 19, TO_TIMESTAMP('2024-01-19 19:19:00', 'YYYY-MM-DD HH24:MI:SS'), 470);
INSERT INTO game_history
VALUES (20, 20, 20, TO_TIMESTAMP('2024-01-20 20:20:00', 'YYYY-MM-DD HH24:MI:SS'), 110);
INSERT INTO game_history
VALUES (21, 1, 1, TO_TIMESTAMP('2025-05-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), -50.00);
INSERT INTO game_history
VALUES (22, 2, 2, TO_TIMESTAMP('2025-05-02 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), -75.50);
INSERT INTO game_history
VALUES (23, 3, 3, TO_TIMESTAMP('2025-05-03 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), -120.00);
INSERT INTO game_history
VALUES (24, 4, 4, TO_TIMESTAMP('2025-05-04 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), -30.00);
INSERT INTO game_history
VALUES (25, 5, 5, TO_TIMESTAMP('2025-05-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), -200.00);
INSERT INTO game_history
VALUES (26, 6, 6, TO_TIMESTAMP('2025-05-06 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), -10.00);
INSERT INTO game_history
VALUES (27, 7, 7, TO_TIMESTAMP('2025-05-07 17:30:00', 'YYYY-MM-DD HH24:MI:SS'), -90.00);
INSERT INTO game_history
VALUES (28, 8, 8, TO_TIMESTAMP('2025-05-08 18:45:00', 'YYYY-MM-DD HH24:MI:SS'), -60.00);
INSERT INTO game_history
VALUES (29, 9, 9, TO_TIMESTAMP('2025-05-09 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), -45.00);
INSERT INTO game_history
VALUES (30, 10, 10, TO_TIMESTAMP('2025-05-10 21:15:00', 'YYYY-MM-DD HH24:MI:SS'), -80.00);
INSERT INTO game_history
VALUES (31, 11, 11, TO_TIMESTAMP('2025-05-11 22:30:00', 'YYYY-MM-DD HH24:MI:SS'), -35.00);
INSERT INTO game_history
VALUES (32, 12, 12, TO_TIMESTAMP('2025-05-12 23:45:00', 'YYYY-MM-DD HH24:MI:SS'), -55.00);
INSERT INTO game_history
VALUES (33, 13, 13, TO_TIMESTAMP('2025-05-13 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), -150.00);
INSERT INTO game_history
VALUES (34, 14, 14, TO_TIMESTAMP('2025-05-14 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), -70.00);
INSERT INTO game_history
VALUES (35, 15, 15, TO_TIMESTAMP('2025-05-15 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), -95.00);
INSERT INTO game_history
VALUES (36, 16, 16, TO_TIMESTAMP('2025-05-16 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), -40.00);
INSERT INTO game_history
VALUES (37, 17, 17, TO_TIMESTAMP('2025-05-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), -65.00);
INSERT INTO game_history
VALUES (38, 18, 18, TO_TIMESTAMP('2025-05-18 15:15:00', 'YYYY-MM-DD HH24:MI:SS'), -85.00);
INSERT INTO game_history
VALUES (39, 19, 19, TO_TIMESTAMP('2025-05-19 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), -100.00);
INSERT INTO game_history
VALUES (40, 20, 20, TO_TIMESTAMP('2025-05-20 17:45:00', 'YYYY-MM-DD HH24:MI:SS'), -25.00);


-- table_personal inserts

INSERT INTO table_personal
VALUES (1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (2, 2, 2, TO_DATE('2024-01-02', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-02 18:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (3, 3, 3, TO_DATE('2024-01-03', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (4, 4, 4, TO_DATE('2024-01-04', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-04 19:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (5, 5, 5, TO_DATE('2024-01-05', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-05 07:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (6, 6, 6, TO_DATE('2024-01-06', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-06 14:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-06 22:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (7, 7, 7, TO_DATE('2024-01-07', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-07 20:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (8, 8, 8, TO_DATE('2024-01-08', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-08 08:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-08 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (9, 9, 9, TO_DATE('2024-01-09', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-09 09:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-09 17:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (10, 10, 10, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-10 10:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-10 18:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (11, 11, 11, TO_DATE('2024-01-11', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-11 11:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-11 19:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (12, 12, 12, TO_DATE('2024-01-12', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-12 12:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-12 20:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (13, 13, 13, TO_DATE('2024-01-13', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-13 13:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-13 21:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (14, 14, 14, TO_DATE('2024-01-14', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-14 14:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-14 22:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (15, 15, 15, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-15 15:30:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-15 23:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (16, 16, 16, TO_DATE('2024-01-16', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-16 16:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (17, 17, 17, TO_DATE('2024-01-17', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-17 17:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-18 01:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (18, 18, 18, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-18 18:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-19 02:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (19, 19, 19, TO_DATE('2024-01-19', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-19 19:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-20 03:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO table_personal
VALUES (20, 20, 20, TO_DATE('2024-01-20', 'YYYY-MM-DD'), TO_TIMESTAMP('2024-01-20 20:00:00', 'YYYY-MM-DD HH24:MI:SS'),
        TO_TIMESTAMP('2024-01-21 04:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- personal_contract_history inserts
INSERT INTO personal_contract_history
VALUES (1, 1, TO_DATE('2021-01-01', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), 3500);
INSERT INTO personal_contract_history
VALUES (2, 2, TO_DATE('2020-02-01', 'YYYY-MM-DD'), TO_DATE('2021-02-01', 'YYYY-MM-DD'), 3700);
INSERT INTO personal_contract_history
VALUES (3, 3, TO_DATE('2019-03-01', 'YYYY-MM-DD'), TO_DATE('2020-03-01', 'YYYY-MM-DD'), 4000);
INSERT INTO personal_contract_history
VALUES (4, 4, TO_DATE('2018-04-01', 'YYYY-MM-DD'), TO_DATE('2019-04-01', 'YYYY-MM-DD'), 3800);
INSERT INTO personal_contract_history
VALUES (5, 5, TO_DATE('2017-05-01', 'YYYY-MM-DD'), TO_DATE('2018-05-01', 'YYYY-MM-DD'), 3600);
INSERT INTO personal_contract_history
VALUES (6, 6, TO_DATE('2016-06-01', 'YYYY-MM-DD'), TO_DATE('2017-06-01', 'YYYY-MM-DD'), 4200);
INSERT INTO personal_contract_history
VALUES (7, 7, TO_DATE('2015-07-01', 'YYYY-MM-DD'), TO_DATE('2016-07-01', 'YYYY-MM-DD'), 3400);
INSERT INTO personal_contract_history
VALUES (8, 8, TO_DATE('2014-08-01', 'YYYY-MM-DD'), TO_DATE('2015-08-01', 'YYYY-MM-DD'), 4100);
INSERT INTO personal_contract_history
VALUES (9, 9, TO_DATE('2013-09-01', 'YYYY-MM-DD'), TO_DATE('2014-09-01', 'YYYY-MM-DD'), 3900);
INSERT INTO personal_contract_history
VALUES (10, 10, TO_DATE('2012-10-01', 'YYYY-MM-DD'), TO_DATE('2013-10-01', 'YYYY-MM-DD'), 4300);
INSERT INTO personal_contract_history
VALUES (11, 11, TO_DATE('2011-11-01', 'YYYY-MM-DD'), TO_DATE('2012-11-01', 'YYYY-MM-DD'), 3700);
INSERT INTO personal_contract_history
VALUES (12, 12, TO_DATE('2010-12-01', 'YYYY-MM-DD'), TO_DATE('2011-12-01', 'YYYY-MM-DD'), 3500);
INSERT INTO personal_contract_history
VALUES (13, 13, TO_DATE('2009-01-01', 'YYYY-MM-DD'), TO_DATE('2010-01-01', 'YYYY-MM-DD'), 3600);
INSERT INTO personal_contract_history
VALUES (14, 14, TO_DATE('2008-02-01', 'YYYY-MM-DD'), TO_DATE('2009-02-01', 'YYYY-MM-DD'), 3900);
INSERT INTO personal_contract_history
VALUES (15, 15, TO_DATE('2007-03-01', 'YYYY-MM-DD'), TO_DATE('2008-03-01', 'YYYY-MM-DD'), 4100);
INSERT INTO personal_contract_history
VALUES (16, 16, TO_DATE('2006-04-01', 'YYYY-MM-DD'), TO_DATE('2007-04-01', 'YYYY-MM-DD'), 3700);
INSERT INTO personal_contract_history
VALUES (17, 17, TO_DATE('2005-05-01', 'YYYY-MM-DD'), TO_DATE('2006-05-01', 'YYYY-MM-DD'), 4200);
INSERT INTO personal_contract_history
VALUES (18, 18, TO_DATE('2004-06-01', 'YYYY-MM-DD'), TO_DATE('2005-06-01', 'YYYY-MM-DD'), 4000);
INSERT INTO personal_contract_history
VALUES (19, 19, TO_DATE('2003-07-01', 'YYYY-MM-DD'), TO_DATE('2004-07-01', 'YYYY-MM-DD'), 4300);
INSERT INTO personal_contract_history
VALUES (20, 20, TO_DATE('2002-08-01', 'YYYY-MM-DD'), TO_DATE('2003-08-01', 'YYYY-MM-DD'), 3900);
