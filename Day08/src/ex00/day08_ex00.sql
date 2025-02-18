--Session #1

--  init transaction
BEGIN;
--  update of rating for “Pizza Hut” to 5 points.
UPDATE pizzeria
SET rating=5 WHERE name='Pizza Hut';
--  check that you can see a changes in session #1
SELECT * FROM pizzeria
WHERE name='Pizza Hut';


--Session #2

--  check that you can’t see a changes in session #2
SELECT * FROM pizzeria
WHERE name='Pizza Hut';


--Session #1

--  publish your changes for all parallel sessions.
--  (storing changes performed by a transaction)
COMMIT;


--Session #2

--  check that you can see a changes in session #2
SELECT * FROM pizzeria
WHERE name='Pizza Hut';
