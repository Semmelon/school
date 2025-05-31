CREATE OR REPLACE TRIGGER prevent_delete_negative_money
BEFORE DELETE ON customer
FOR EACH ROW
BEGIN
  IF :OLD.money < 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cannot delete customer with negative money balance.');
  END IF;
END;
