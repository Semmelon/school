-- table package
CREATE OR REPLACE PACKAGE table_api IS
    PROCEDURE assign_game_to_table(
        p_place IN VARCHAR2,
        g_game_id IN NUMBER
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

END table_api;
