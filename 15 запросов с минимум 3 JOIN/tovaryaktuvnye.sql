SELECT p.name AS товар, c.name AS категория
FROM products p
JOIN product_categories pc ON p.product_id = pc.product_id
JOIN categories c ON pc.category_id = c.category_id
WHERE p.is_active = TRUE;
