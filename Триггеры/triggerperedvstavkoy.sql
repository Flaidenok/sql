CREATE OR REPLACE FUNCTION check_flight_capacity()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE
    v_capacity INT;
    v_booked INT;
BEGIN
    SELECT a.capacity INTO v_capacity
    FROM flights f
    JOIN aircrafts a ON f.aircraft_id = a.aircraft_id
    WHERE f.flight_id = NEW.flight_id;
    
    SELECT COUNT(*) INTO v_booked
    FROM tickets
    WHERE flight_id = NEW.flight_id;
    
    IF v_booked >= v_capacity THEN
        RAISE EXCEPTION 'Flight % is fully booked', NEW.flight_id;
    END IF;
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_check_capacity_before_insert
BEFORE INSERT ON tickets
FOR EACH ROW
EXECUTE FUNCTION check_flight_capacity();
