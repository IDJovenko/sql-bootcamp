--Session #1
BEGIN;

--Session #2
BEGIN;

--Session #1
SELECT SUM(rating) FROM pizzeria;

--Session #2
UPDATE pizzeria
SET rating=1 WHERE name='Pizza Hut';
COMMIT;

--Session #1
SELECT SUM(rating) FROM pizzeria;
COMMIT;

--Session #1
SELECT SUM(rating) FROM pizzeria;

--Session #2
SELECT SUM(rating) FROM pizzeria;


/* Two cents

The difference is that: 

A non-repeatable read returns different values for the same logical row.
(For example, if the primary key is employee_id,
    then a certain employee may have different salaries in the two results.)

A phantom read returns two different sets of rows,
but for every row that appears in both sets, the column values are the same.

                                Don Smith
                                https://stackoverflow.com/questions/11043712/non-repeatable-read-vs-phantom-read
