SELECT f.flight_id, 
       c1.first_name as captain_first, c1.last_name as captain_last,
       c2.first_name as fo_first, c2.last_name as fo_last,
       a.model as aircraft
FROM crew cr
JOIN flights f ON cr.flight_id = f.flight_id
JOIN staff c1 ON cr.captain_id = c1.staff_id
JOIN staff c2 ON cr.first_officer_id = c2.staff_id
JOIN aircrafts a ON f.aircraft_id = a.aircraft_id;
