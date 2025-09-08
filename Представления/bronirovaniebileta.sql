CREATE OR REPLACE PROCEDURE book_ticket(
    p_passenger_id INT,
    p_flight_id INT,
    p_seat_number VARCHAR(10),
    p_class VARCHAR(20),
    p_price DECIMAL(10,2)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO tickets (flight_id, passenger_id, seat_number, class, price, purchase_date)
    VALUES (p_flight_id, p_passenger_id, p_seat_number, p_class, p_price, NOW());
    
    UPDATE flights 
    SET seats_available = seats_available - 1
    WHERE flight_id = p_flight_id;
END;
$$;
