SELECT f.flight_id, a.model, a.manufacture_year
FROM flights f
JOIN aircrafts a ON f.aircraft_id = a.aircraft_id
WHERE EXTRACT(YEAR FROM CURRENT_DATE) - a.manufacture_year > 10;
