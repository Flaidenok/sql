SELECT p.passenger_id, p.first_name, p.last_name, COUNT(*) as flights_count
FROM passengers p
JOIN tickets t ON p.passenger_id = t.passenger_id
JOIN flights f ON t.flight_id = f.flight_id
WHERE f.departure_time BETWEEN CURRENT_DATE - INTERVAL '1 month' AND CURRENT_DATE
GROUP BY p.passenger_id, p.first_name, p.last_name
HAVING COUNT(*) > 3;
