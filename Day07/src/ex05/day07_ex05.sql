SELECT DISTINCT p.name
FROM person_order ord
JOIN person p ON ord.person_id = p.id
ORDER BY p.name ASC;
