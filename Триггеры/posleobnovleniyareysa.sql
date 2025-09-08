CREATE OR REPLACE FUNCTION notify_passengers_about_changes()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF OLD.departure_time <> NEW.departure_time OR 
       OLD.arrival_time <> NEW.arrival_time OR
       OLD.status <> NEW.status THEN
        -- Здесь должна быть логика уведомления пассажиров
        -- Например, запись в таблицу уведомлений
        INSERT INTO notifications (flight_id, message, created_at)
        VALUES (NEW.flight_id, 
                CONCAT('Flight schedule changed. New departure time: ', 
                       NEW.departure_time, '. Status: ', NEW.status),
                NOW());
    END IF;
    
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_notify_passengers_after_update
AFTER UPDATE ON flights
FOR EACH ROW
EXECUTE FUNCTION notify_passengers_about_changes();
