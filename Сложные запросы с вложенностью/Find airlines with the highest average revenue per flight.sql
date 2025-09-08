SELECT al.name, AVG(subq.revenue) as avg_revenue_per_flight
FROM airlines al
JOIN (
    SELECT f.aircraft_id, f.flight_id, SUM(t.price) as revenue
    FROM flights f
    JOIN tickets t ON f.flight_id = t.flight_id
    GROUP BY f.aircraft_id, f.flight_id
) subq ON al.airline_id = (
    SELECT airline_id FROM aircrafts WHERE aircraft_id = subq.aircraft_id
)
GROUP BY al.name
ORDER BY avg_revenue_per_flight DESC
LIMIT 5;
