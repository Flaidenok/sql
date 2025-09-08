SELECT 
    p.first_name,
    p.last_name,
    p.passport_number,
    t.seat_number,
    t.class,
    t.price
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
WHERE f.flight_id = 123;
