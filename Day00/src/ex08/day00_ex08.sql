SELECT * FROM person_order ord
WHERE ord.id % 2 = 0
ORDER BY ord.id;
