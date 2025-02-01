CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts USING BTree (person_id, pizzeria_id);

-- set off sequency scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT * FROM person_discounts
WHERE person_id='4' AND pizzeria_id IN (1, 2, 5);

/* QUERY PLAN
Index Scan using idx_person_discounts_unique on person_discounts  (cost=0.14..8.16 rows=1 width=56) (actual time=0.030..0.031 rows=2 loops=1)
  Index Cond: (person_id = '4'::bigint)
  Filter: (pizzeria_id = ANY ('{1,2,5}'::bigint[]))
  Rows Removed by Filter: 1
Planning Time: 0.834 ms
Execution Time: 0.064 ms
*/