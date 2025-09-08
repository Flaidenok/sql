SELECT 
    s.first_name,
    s.last_name,
    s.position,
    g.number AS gate_number,
    t.name AS terminal_name,
    a.name AS airport_name,
    sh.start_time,
    sh.end_time
FROM shifts sh
JOIN staff s ON sh.staff_id = s.staff_id
JOIN gates g ON sh.gate_id = g.gate_id
JOIN terminals t ON g.terminal_id = t.terminal_id
JOIN airports a ON t.airport_id = a.airport_id;
