SELECT 
    p.first_name,
    p.last_name,
    s.name AS service_name,
    s.description,
    s.price AS service_price,
    b.booking_time,
    f.flight_id,
    f.departure_time
FROM bookings b
JOIN passengers p ON b.passenger_id = p.passenger_id
JOIN services s ON b.service_id = s.service_id
JOIN flights f ON b.flight_id = f.flight_id;
