-- table package
CREATE OR REPLACE PACKAGE table_api IS
    PROCEDURE assign_game_to_table(
        p_place IN VARCHAR2,
        g_game_id IN NUMBER
    );

    PROCEDURE assign_personal_to_table(
        p_personal_id IN NUMBER,
        t_table_id IN NUMBER,
        w_work_date IN DATE,
        s_start_time IN TIMESTAMP,
        e_end_time IN TIMESTAMP
    );
END table_api;

CREATE OR REPLACE PACKAGE BODY table_api IS

    -- public procedure
    PROCEDURE assign_game_to_table(
        p_place IN VARCHAR2,
        g_game_id IN NUMBER
    ) IS
        v_new_id "table".id%TYPE;
        v_dummy  NUMBER;
    BEGIN
        -- chack if existing
        SELECT 1 INTO v_dummy FROM game WHERE id = g_game_id;

        -- make new id
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM "table";

        -- insert
        INSERT INTO "table" (id, place, game)
        VALUES (v_new_id, p_place, g_game_id);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20020, 'Game ID does not exist.');
    END assign_game_to_table;

    -- private help function for assign_personal_to_table
    FUNCTION personal_exists(p_id NUMBER) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM personal WHERE id = p_id;
        RETURN v_count > 0;
    END;

    -- private help function for assign_personal_to_table
    FUNCTION table_exists(p_id NUMBER) RETURN BOOLEAN IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM "table" WHERE id = p_id;
        RETURN v_count > 0;
    END;

    -- public procedure
    PROCEDURE assign_personal_to_table(
        p_personal_id IN NUMBER,
        t_table_id IN NUMBER,
        w_work_date IN DATE,
        s_start_time IN TIMESTAMP,
        e_end_time IN TIMESTAMP
    ) IS
        v_new_id table_personal.id%TYPE;
    BEGIN
        -- Validations
        IF NOT personal_exists(p_personal_id) THEN
            RAISE_APPLICATION_ERROR(-20021, 'Staff member does not exist.');
        END IF;

        IF NOT table_exists(t_table_id) THEN
            RAISE_APPLICATION_ERROR(-20022, 'Table does not exist.');
        END IF;

        IF e_end_time <= s_start_time THEN
            RAISE_APPLICATION_ERROR(-20023, 'End time must be after start time.');
        END IF;

        -- chack if shift overlapps
        FOR r IN (
            SELECT 1
            FROM table_personal
            WHERE personal = p_personal_id
              AND "table" = t_table_id
              AND "date" = w_work_date
              AND (
                (s_start_time BETWEEN start_time AND end_time)
                    OR (e_end_time BETWEEN start_time AND end_time)
                    OR (start_time BETWEEN s_start_time AND e_end_time)
                )
            )
            LOOP
                RAISE_APPLICATION_ERROR(-20024, 'Overlapping shift already exists for this staff and table.');
            END LOOP;

        -- make new id
        SELECT NVL(MAX(id), 0) + 1 INTO v_new_id FROM table_personal;

        -- Insert
        INSERT INTO table_personal(id, personal, "table", "date", start_time, end_time)
        VALUES (v_new_id, p_personal_id, t_table_id, w_work_date, s_start_time, e_end_time);
    END;

END table_api;
