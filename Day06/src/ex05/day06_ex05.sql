COMMENT ON TABLE person_discounts IS 'discount for each person of each specific pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'id of specific person (foreing key references to person.id)';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id of specific pizzeria (foreing key references to pizzeria.id)';
COMMENT ON COLUMN person_discounts.discount IS 'discount in percent (floating), is between 0 and 100';

/* query to see comment to person_discounts table
SELECT
    obj_description('person_discounts'::regclass, 'pg_class') AS comment;
*/

/* query to see comments to all tables attributes
SELECT
    c.relname AS table_name,
    a.attname AS column_name,
    d.description AS comment
FROM
    pg_class c
JOIN
    pg_attribute a ON a.attrelid = c.oid
JOIN
    pg_description d ON d.objoid = a.attrelid AND d.objsubid = a.attnum
WHERE
    c.relkind = 'r' AND a.attnum > 0
ORDER BY
    table_name, column_name;
*/