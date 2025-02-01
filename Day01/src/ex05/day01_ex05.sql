SELECT p.*, pz.*
FROM person p
CROSS JOIN pizzeria pz
ORDER BY p.id ASC, pz.id ASC;
