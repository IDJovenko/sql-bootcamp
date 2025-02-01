CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

-- Set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT price FROM menu
WHERE pizzeria_id=1 AND pizza_name='cheese pizza';

/* QUERY PLAN
Index Scan using idx_menu_unique on menu  (cost=0.14..8.16 rows=1 width=32) (actual time=0.081..0.082 rows=1 loops=1)
  Index Cond: ((pizzeria_id = 1) AND ((pizza_name)::text = 'cheese pizza'::text))
Planning Time: 0.838 ms
Execution Time: 0.149 ms
*/