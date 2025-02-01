-- using IN
SELECT pz.name
FROM pizzeria pz
WHERE pz.id NOT IN (SELECT DISTINCT v.pizzeria_id
                    FROM person_visits v);
-- using EXIST
SELECT pz.name
FROM pizzeria pz
WHERE NOT EXISTS (SELECT 1 FROM person_visits v
                  WHERE v.pizzeria_id = pz.id);

-- without IN and EXIST:
/*
SELECT pz.name
FROM pizzeria pz
LEFT JOIN person_visits v ON v.pizzeria_id = pz.id
WHERE v.id IS NULL;
*/
