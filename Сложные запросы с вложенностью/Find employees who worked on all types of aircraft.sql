SELECT s.staff_id, s.first_name, s.last_name
FROM staff s
WHERE NOT EXISTS (
    SELECT a.model 
    FROM aircrafts a
    WHERE NOT EXISTS (
        SELECT 1 
        FROM flights f 
        JOIN crew c ON f.flight_id = c.flight_id
        WHERE (c.captain_id = s.staff_id OR c.first_officer_id = s.staff_id)
        AND f.aircraft_id = a.aircraft_id
    )
);
