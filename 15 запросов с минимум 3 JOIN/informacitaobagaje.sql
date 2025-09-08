SELECT 
    p.first_name,
    p.last_name,
    b.weight,
    b.status,
    f.departure_airport_id,
    f.arrival_airport_id,
    f.departure_time
FROM baggage b
JOIN tickets t ON b.ticket_id = t.ticket_id
JOIN passengers p ON t.passenger_id = p.passenger_id
JOIN flights f ON t.flight_id = f.flight_id;
