SELECT m.id AS menu_id
FROM menu m
WHERE NOT EXISTS (SELECT 0
                  FROM person_order ord
                  WHERE ord.menu_id = m.id)
ORDER BY 1;
 