CREATE VIEW v_price_with_discount AS
    SELECT p.name,
    	   m.pizza_name,
           m.price,
           (m.price - 0.1*m.price)::INTEGER AS discount_price
    FROM person_order ord
    JOIN person p ON ord.person_id = p.id
    JOIN menu m ON ord.menu_id = m.id
    ORDER BY 1, 2;
