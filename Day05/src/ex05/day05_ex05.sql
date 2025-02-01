CREATE UNIQUE INDEX idx_person_order_order_date
                 ON person_order USING BTree (person_id, menu_id)
                 INCLUDE (id, order_date)
WHERE order_date='2022-01-01';

-- Set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person_order
WHERE order_date = '2022-01-01';

/* QUERY PLAN
Index Only Scan using idx_person_order_order_date on person_order  (cost=0.13..8.15 rows=1 width=28) (actual time=0.070..0.073 rows=5 loops=1)
  Heap Fetches: 5
Planning Time: 0.835 ms
Execution Time: 0.119 ms
*/