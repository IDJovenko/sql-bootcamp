CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr NUMERIC[])
RETURNS NUMERIC AS $$
DECLARE
    min NUMERIC := NULL;
    elem NUMERIC;
BEGIN
    min := arr[1];
    FOREACH elem IN ARRAY arr LOOP
        IF elem < min THEN
            min := elem;
        END IF;
    END LOOP;
    RETURN min;
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
