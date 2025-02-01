-- 1st select statement containing comparison signs (<=, >=):
SELECT pz.name, pz.rating
FROM pizzeria pz
WHERE pz.rating >= 3.5 AND pz.rating <= 5
ORDER BY pz.rating;

-- 2nd select statement containing BETWEEN keyword:
SELECT pz.name, pz.rating
FROM pizzeria pz
WHERE pz.rating BETWEEN 3.5 AND 5
ORDER BY pz.rating;
