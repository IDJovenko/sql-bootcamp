--Session #1
--  init transaction
BEGIN;

--Session #2
--  init transaction
BEGIN;

--Session #1
--check a rating for “Pizza Hut”
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #2
--check a rating for “Pizza Hut”
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #1
--  update of rating for “Pizza Hut” to 4 points.
UPDATE pizzeria
SET rating=4 WHERE name='Pizza Hut';

--Session #2
--  update of rating for “Pizza Hut” to 3.6 points.
UPDATE pizzeria
SET rating=3.6 WHERE name='Pizza Hut';

--Session #1
--  storing changes performed by a transaction
COMMIT;

--Session #2
--  storing changes performed by a transaction
COMMIT;

--Session #1
--  check that you lost a changes from session #1,
SELECT * FROM pizzeria
WHERE name='Pizza Hut';

--Session #2
--  / you instead save a changes from session #2
SELECT * FROM pizzeria
WHERE name='Pizza Hut';
