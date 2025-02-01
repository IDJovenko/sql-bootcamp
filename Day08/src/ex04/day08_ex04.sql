--Session #1
-- get sure transaction isolation level is READ COMMITED
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
BEGIN;

--Session #2
BEGIN;

--Session #1
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #2
UPDATE pizzeria
SET rating=3.0 WHERE name='Pizza Hut';

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
