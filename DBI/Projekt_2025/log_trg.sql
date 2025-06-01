PROCEDURE log_event(
  p_table_name VARCHAR2,
  p_operation  VARCHAR2,
  p_desc       VARCHAR2
)
IS
BEGIN
  INSERT INTO log_table(table_name, table_operation, description, executed_by, executed_at)
  VALUES (p_table_name, p_operation, p_desc, SYS_CONTEXT('USERENV', 'SESSION_USER'), SYSDATE);
END;

CREATE OR REPLACE TRIGGER trg_log_personal
AFTER INSERT OR UPDATE OR DELETE ON personal
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Mitarbeiter: SVZ=' || :NEW.svz || ', Name=' || :NEW.firstname || ' ' || :NEW.lastname;

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Mitarbeiter geändert: SVZ=' || :OLD.svz ||
              ' -> SVZ=' || :NEW.svz ||
              ', Name=' || :OLD.firstname || ' ' || :OLD.lastname ||
              ' -> ' || :NEW.firstname || ' ' || :NEW.lastname;

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Mitarbeiter gelöscht: SVZ=' || :OLD.svz || ', Name=' || :OLD.firstname || ' ' || :OLD.lastname;
  END IF;

  log_event('PERSONAL', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_customer
AFTER INSERT OR UPDATE OR DELETE ON customer
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Kunde: SVZ=' || :NEW.svz ||
              ', Name=' || :NEW.firstname || ' ' || :NEW.lastname ||
              ', Geld=' || TO_CHAR(:NEW.money, 'FM9999990.00');

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Kunde geändert: SVZ=' || :OLD.svz || ' -> ' || :NEW.svz ||
              ', Name=' || :OLD.firstname || ' ' || :OLD.lastname || 
              ' -> ' || :NEW.firstname || ' ' || :NEW.lastname ||
              ', Geld=' || TO_CHAR(:OLD.money, 'FM9999990.00') || 
              ' -> ' || TO_CHAR(:NEW.money, 'FM9999990.00');

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Kunde gelöscht: SVZ=' || :OLD.svz ||
              ', Name=' || :OLD.firstname || ' ' || :OLD.lastname ||
              ', Geld=' || TO_CHAR(:OLD.money, 'FM9999990.00');
  END IF;

  log_event('CUSTOMER', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_game
AFTER INSERT OR UPDATE OR DELETE ON game
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neues Spiel: Bezeichnung=' || :NEW.bezeichnung ||
              ', Beschreibung=' || NVL(:NEW.description, 'NULL') ||
              ', Regeln=' || :NEW.rules;

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Spiel geändert: Bezeichnung=' || :OLD.bezeichnung || 
              ' -> ' || :NEW.bezeichnung ||
              ', Beschreibung=' || NVL(:OLD.description, 'NULL') || 
              ' -> ' || NVL(:NEW.description, 'NULL') ||
              ', Regeln=' || :OLD.rules || 
              ' -> ' || :NEW.rules;

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Spiel gelöscht: Bezeichnung=' || :OLD.bezeichnung ||
              ', Beschreibung=' || NVL(:OLD.description, 'NULL') ||
              ', Regeln=' || :OLD.rules;
  END IF;

  log_event('GAME', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_game_history
AFTER INSERT OR UPDATE OR DELETE ON game_history
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Spielverlauf: Customer=' || :NEW.customer ||
              ', Table=' || :NEW."table" ||
              ', Time=' || TO_CHAR(:NEW.time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Payout=' || TO_CHAR(:NEW.payout, 'FM9999990.00');

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Spielverlauf geändert: Customer=' || :OLD.customer || ' -> ' || :NEW.customer ||
              ', Table=' || :OLD."table" || ' -> ' || :NEW."table" ||
              ', Time=' || TO_CHAR(:OLD.time, 'YYYY-MM-DD HH24:MI:SS') || ' -> ' || TO_CHAR(:NEW.time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Payout=' || TO_CHAR(:OLD.payout, 'FM9999990.00') || ' -> ' || TO_CHAR(:NEW.payout, 'FM9999990.00');

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Spielverlauf gelöscht: Customer=' || :OLD.customer ||
              ', Table=' || :OLD."table" ||
              ', Time=' || TO_CHAR(:OLD.time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Payout=' || TO_CHAR(:OLD.payout, 'FM9999990.00');
  END IF;

  log_event('GAME_HISTORY', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_table
AFTER INSERT OR UPDATE OR DELETE ON "table"
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Tisch: Ort=' || :NEW.place || ', Spiel-ID=' || :NEW.game;

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Tisch geändert: Ort=' || :OLD.place || ' -> ' || :NEW.place ||
              ', Spiel-ID=' || :OLD.game || ' -> ' || :NEW.game;

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Tisch gelöscht: Ort=' || :OLD.place || ', Spiel-ID=' || :OLD.game;
  END IF;

  log_event('"TABLE"', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_table_personal
AFTER INSERT OR UPDATE OR DELETE ON table_personal
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Einsatz: Personal=' || :NEW.personal ||
              ', Table=' || :NEW."table" ||
              ', Datum=' || TO_CHAR(:NEW."date", 'YYYY-MM-DD') ||
              ', Start=' || TO_CHAR(:NEW.start_time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Ende=' || TO_CHAR(:NEW.end_time, 'YYYY-MM-DD HH24:MI:SS');

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Einsatz geändert: Personal=' || :OLD.personal || ' -> ' || :NEW.personal ||
              ', Table=' || :OLD."table" || ' -> ' || :NEW."table" ||
              ', Datum=' || TO_CHAR(:OLD."date", 'YYYY-MM-DD') || ' -> ' || TO_CHAR(:NEW."date", 'YYYY-MM-DD') ||
              ', Start=' || TO_CHAR(:OLD.start_time, 'YYYY-MM-DD HH24:MI:SS') || ' -> ' || TO_CHAR(:NEW.start_time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Ende=' || TO_CHAR(:OLD.end_time, 'YYYY-MM-DD HH24:MI:SS') || ' -> ' || TO_CHAR(:NEW.end_time, 'YYYY-MM-DD HH24:MI:SS');

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Einsatz gelöscht: Personal=' || :OLD.personal ||
              ', Table=' || :OLD."table" ||
              ', Datum=' || TO_CHAR(:OLD."date", 'YYYY-MM-DD') ||
              ', Start=' || TO_CHAR(:OLD.start_time, 'YYYY-MM-DD HH24:MI:SS') ||
              ', Ende=' || TO_CHAR(:OLD.end_time, 'YYYY-MM-DD HH24:MI:SS');
  END IF;

  log_event('TABLE_PERSONAL', v_action, v_desc);
END;

CREATE OR REPLACE TRIGGER trg_log_personal_contract_history
AFTER INSERT OR UPDATE OR DELETE ON personal_contract_history
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
  v_desc   VARCHAR2(4000);
BEGIN
  IF INSERTING THEN
    v_action := 'INSERT';
    v_desc := 'Neuer Vertrag: Personal=' || :NEW.personal ||
              ', Seit=' || TO_CHAR(:NEW.since, 'YYYY-MM-DD') ||
              ', Bis=' || TO_CHAR(:NEW.till, 'YYYY-MM-DD') ||
              ', Gehalt=' || TO_CHAR(:NEW.salary, 'FM9999990.00');

  ELSIF UPDATING THEN
    v_action := 'UPDATE';
    v_desc := 'Vertrag geändert: Personal=' || :OLD.personal || ' -> ' || :NEW.personal ||
              ', Seit=' || TO_CHAR(:OLD.since, 'YYYY-MM-DD') || ' -> ' || TO_CHAR(:NEW.since, 'YYYY-MM-DD') ||
              ', Bis=' || TO_CHAR(:OLD.till, 'YYYY-MM-DD') || ' -> ' || TO_CHAR(:NEW.till, 'YYYY-MM-DD') ||
              ', Gehalt=' || TO_CHAR(:OLD.salary, 'FM9999990.00') || ' -> ' || TO_CHAR(:NEW.salary, 'FM9999990.00');

  ELSIF DELETING THEN
    v_action := 'DELETE';
    v_desc := 'Vertrag gelöscht: Personal=' || :OLD.personal ||
              ', Seit=' || TO_CHAR(:OLD.since, 'YYYY-MM-DD') ||
              ', Bis=' || TO_CHAR(:OLD.till, 'YYYY-MM-DD') ||
              ', Gehalt=' || TO_CHAR(:OLD.salary, 'FM9999990.00');
  END IF;

  log_event('PERSONAL_CONTRACT_HISTORY', v_action, v_desc);
END;
