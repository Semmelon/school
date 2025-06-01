-- chack taht customer cannot be removed if balance is negative
CREATE OR REPLACE TRIGGER prevent_delete_negative_money
    BEFORE DELETE
    ON customer
    FOR EACH ROW
BEGIN
    IF :OLD.money < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete customer with negative money balance.');
    END IF;
END;

-- update a cusomers balance after he played a session and the entry gets added in game_history

CREATE OR REPLACE TRIGGER trg_update_customer_balance
    AFTER INSERT
    ON game_history
    FOR EACH ROW
BEGIN
    -- update cusomer
    UPDATE customer
    SET money = money + :NEW.payout
    WHERE id = :NEW.customer;
END;
