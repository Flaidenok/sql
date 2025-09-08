SELECT d.airport_name, d.city, d.country, 
       a.name as popular_destination, a.city as dest_city, 
       d.flight_count
FROM (
    SELECT a1.airport_id, a1.name as airport_name, a1.city, a1.country,
           a2.airport_id as dest_airport_id, 
           COUNT(*) as flight_count,
           ROW_NUMBER() OVER (PARTITION BY a1.airport_id ORDER BY COUNT(*) DESC) as rank
    FROM flights f
    JOIN airports a1 ON f.departure_airport_id = a1.airport_id
    JOIN airports a2 ON f.arrival_airport_id = a2.airport_id
    GROUP BY a1.airport_id, a1.name, a1.city, a1.country, a2.airport_id
) d
JOIN airports a ON d.dest_airport_id = a.airport_id
WHERE d.rank = 1;
