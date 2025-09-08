CREATE OR REPLACE FUNCTION prevent_flight_deletion_if_tickets_exist()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_tickets_count INT;
BEGIN
    SELECT COUNT(*) INTO v_tickets_count
    FROM tickets
    WHERE flight_id = OLD.flight_id;
    
    IF v_tickets_count > 0 THEN
        RAISE EXCEPTION 'Cannot delete flight with existing tickets';
    END IF;
    
    RETURN OLD;
END;
$$;

CREATE TRIGGER trg_prevent_deletion_if_tickets_exist
BEFORE DELETE ON flights
FOR EACH ROW
EXECUTE FUNCTION prevent_flight_deletion_if_tickets_exist();
