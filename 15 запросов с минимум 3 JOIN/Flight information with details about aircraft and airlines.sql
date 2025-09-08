SELECT f.flight_id, al.name as airline, ac.model as aircraft,
       a1.name as departure_airport, a2.name as arrival_airport,
       f.departure_time, f.arrival_time
FROM flights f
JOIN aircrafts ac ON f.aircraft_id = ac.aircraft_id
JOIN airlines al ON ac.airline_id = al.airline_id
JOIN airports a1 ON f.departure_airport_id = a1.airport_id
JOIN airports a2 ON f.arrival_airport_id = a2.airport_id;
