-- Let's set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT m.pizza_name, pz.name pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id;

-- And restore default settings
SET enable_seqscan = ON;

/* Query plan:
"Nested Loop  (cost=0.29..63.61 rows=19 width=64) (actual time=0.300..0.332 rows=19 loops=1)"
"  ->  Index Scan using idx_menu_pizzeria_id on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.152..0.156 rows=19 loops=1)"
"  ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.15..2.69 rows=1 width=40) (actual time=0.008..0.008 rows=1 loops=19)"
"        Index Cond: (id = m.pizzeria_id)"
"Planning Time: 3.352 ms"
"Execution Time: 0.429 ms"
*/