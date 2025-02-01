CREATE INDEX idx_1 ON pizzeria USING BTree (rating, ID);

-- Set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

/* before
Sort  (cost=64.80..64.85 rows=19 width=96) (actual time=0.499..0.501 rows=19 loops=1)
  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
  Sort Method: quicksort  Memory: 26kB
  ->  WindowAgg  (cost=64.01..64.39 rows=19 width=96) (actual time=0.421..0.435 rows=19 loops=1)
        ->  Sort  (cost=64.01..64.06 rows=19 width=64) (actual time=0.404..0.406 rows=19 loops=1)
              Sort Key: pz.rating
              Sort Method: quicksort  Memory: 25kB
              ->  Nested Loop  (cost=0.29..63.61 rows=19 width=64) (actual time=0.339..0.381 rows=19 loops=1)
                    ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..12.42 rows=19 width=40) (actual time=0.164..0.172 rows=19 loops=1)
                          Heap Fetches: 19
                    ->  Index Scan using pizzeria_pkey on pizzeria pz  (cost=0.15..2.69 rows=1 width=40) (actual time=0.010..0.010 rows=1 loops=19)
                          Index Cond: (id = m.pizzeria_id)
Planning Time: 2.671 ms
Execution Time: 0.947 ms
*/

/* after (2 attempt)
Sort  (cost=25.95..26.00 rows=19 width=96) (actual time=0.215..0.218 rows=19 loops=1)
  Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
  Sort Method: quicksort  Memory: 26kB
  ->  WindowAgg  (cost=0.27..25.54 rows=19 width=96) (actual time=0.117..0.145 rows=19 loops=1)
        ->  Nested Loop  (cost=0.27..25.21 rows=19 width=64) (actual time=0.095..0.113 rows=19 loops=1)
              ->  Index Only Scan using idx_1 on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.037..0.039 rows=6 loops=1)
                    Heap Fetches: 6
              ->  Index Only Scan using idx_menu_unique on menu m  (cost=0.14..2.15 rows=1 width=40) (actual time=0.010..0.011 rows=3 loops=6)
                    Index Cond: (pizzeria_id = pz.id)
                    Heap Fetches: 19
Planning Time: 1.401 ms
Execution Time: 0.456 ms
