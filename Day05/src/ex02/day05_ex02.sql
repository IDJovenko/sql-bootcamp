-- Index creation
CREATE INDEX idx_person_name ON person USING BTree (UPPER(name));

-- Set off sequences scanning
SET enable_seqscan = OFF;

EXPLAIN ANALYZE 
SELECT * FROM person
WHERE name='Dmitriy';

/* QUERY PLAN
Index Scan using idx_person_name on person  (cost=0.14..8.15 rows=1 width=108) (actual time=0.030..0.031 rows=1 loops=1)
  Index Cond: (upper((name)::text) = 'DMITRIY'::text)
Planning Time: 0.637 ms
Execution Time: 0.082 ms
*/