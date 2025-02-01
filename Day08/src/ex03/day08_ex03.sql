--Session #1
BEGIN;

--Session #2
-- get sure transaction isolation level is READ COMMITED
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;

--Session #1
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #2
UPDATE pizzeria
SET rating=3.6 WHERE name='Pizza Hut';
COMMIT;

--Session #1
SELECT * FROM pizzeria
WHERE name='Pizza Hut';
COMMIT;

--Session #1
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #2
SELECT * FROM pizzeria
WHERE name='Pizza Hut';
