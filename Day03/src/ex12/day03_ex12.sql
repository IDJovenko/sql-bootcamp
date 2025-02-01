INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
	generate_series((SELECT MAX(id) + 1 FROM person_order),
                    (SELECT MAX(ID) FROM person) + (SELECT MAX(id) FROM person_order)),
	generate_series(1, (SELECT MAX(ID) FROM person)),
    (SELECT m.id FROM menu m WHERE m.pizza_name='greek pizza'),
    '2022-02-25';

/*-- Show result
SELECT *
FROM person_order;
*/