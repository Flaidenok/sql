SELECT 
    f.flight_id,
    c.captain.first_name AS captain_first_name,
    c.captain.last_name AS captain_last_name,
    fo.first_name AS first_officer_first_name,
    fo.last_name AS first_officer_last_name
FROM crew c
JOIN flights f ON c.flight_id = f.flight_id
JOIN staff captain ON c.captain_id = captain.staff_id
JOIN staff fo ON c.first_officer_id = fo.staff_id;
