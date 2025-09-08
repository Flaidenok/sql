SELECT 
    f.flight_id,
    f.departure_time,
    f.arrival_time,
    dep.name AS departure_airport,
    dep.city AS departure_city,
    arr.name AS arrival_airport,
    arr.city AS arrival_city
FROM flights f
JOIN airports dep ON f.departure_airport_id = dep.airport_id
JOIN airports arr ON f.arrival_airport_id = arr.airport_id;
