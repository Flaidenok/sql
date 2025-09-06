SELECT 
    COALESCE(orders.name, visits.name) AS name,
    COALESCE(orders.count, 0) + COALESCE(visits.count, 0) AS total_count
FROM 
    (
        SELECT 
            pz.name,
            COUNT(po.id) AS count
        FROM 
            person_order po
        JOIN 
            menu m ON po.menu_id = m.id
        JOIN 
            pizzeria pz ON m.pizzeria_id = pz.id
        GROUP BY 
            pz.name
    ) AS orders
FULL JOIN 
    (
        SELECT 
            pz.name,
            COUNT(pv.id) AS count
        FROM 
            person_visits pv
        JOIN 
            pizzeria pz ON pv.pizzeria_id = pz.id
        GROUP BY 
            pz.name
    ) AS visits ON orders.name = visits.name
ORDER BY 
    total_count DESC,
    name ASC;
