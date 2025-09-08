SELECT 
    f.flight_id,
    f.departure_time,
    f.arrival_time,
    a.model AS aircraft_model,
    al.name AS airline_name,
    al.country AS airline_country
FROM flights f
JOIN aircrafts a ON f.aircraft_id = a.aircraft_id
JOIN airlines al ON a.airline_id = al.airline_id;
