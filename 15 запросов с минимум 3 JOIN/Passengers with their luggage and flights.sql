SELECT p.first_name, p.last_name, f.flight_id, 
       a1.name as departure, a2.name as arrival,
       b.weight as baggage_weight, b.status as baggage_status
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
JOIN airports a1 ON f.departure_airport_id = a1.airport_id
JOIN airports a2 ON f.arrival_airport_id = a2.airport_id
JOIN baggage b ON t.ticket_id = b.ticket_id;
