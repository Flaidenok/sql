CREATE OR REPLACE PROCEDURE update_flight_status(
    p_flight_id INT,
    p_new_status VARCHAR(20))
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE flights 
    SET status = p_new_status
    WHERE flight_id = p_flight_id;
    
    IF p_new_status = 'Cancelled' THEN
        -- Возврат средств за билеты
        UPDATE tickets
        SET status = 'Refunded'
        WHERE flight_id = p_flight_id AND status = 'Confirmed';
    END IF;
END;
$$;
