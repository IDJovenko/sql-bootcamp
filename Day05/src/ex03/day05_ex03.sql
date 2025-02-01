CREATE INDEX idx_person_order_multi 
          ON person_order USING BTree (person_id, menu_id) INCLUDE (order_date);

-- Set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

/* QUERY PLAN
"Index Only Scan using idx_person_order_multi on person_order  (cost=0.14..8.16 rows=1 width=20) (actual time=0.053..0.054 rows=0 loops=1)"
"  Index Cond: ((person_id = 8) AND (menu_id = 19))"
"  Heap Fetches: 0"
"Planning Time: 1.962 ms"
"Execution Time: 0.105 ms"
*/