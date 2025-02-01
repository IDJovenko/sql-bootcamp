SELECT
    (SELECT p.name FROM person p
     WHERE p.id = ord.person_id
    ) AS NAME,
    EXISTs (SELECT p2.name FROM person p2 
           WHERE p2.id = ord.person_id AND p2.name='Denis') AS check_name
FROM person_order ord
WHERE (ord.menu_id = 13 OR ord.menu_id = 14 OR ord.menu_id = 18) AND ord.order_date = '2022-01-07';
