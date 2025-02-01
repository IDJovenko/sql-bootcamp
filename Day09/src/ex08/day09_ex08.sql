CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS SETOF INTEGER AS $$
    DECLARE
        F_1 INTEGER := 0;
        F_2 INTEGER := 1;
    BEGIN
        IF pstop<=1 THEN
            RAISE NOTICE 'There''s no Fibonacci number less then %', pstop;
            RETURN;
        END IF;
        RETURN NEXT 1; -- F_1 (don't consider F_0 (see Wiki, it's not forbidden))
        IF pstop>1 THEN
            LOOP
                F_2 := F_1 + F_2;
                F_1 := F_2 - F_1;
                EXIT WHEN F_2 >= pstop;
                RETURN NEXT F_2;
            END LOOP;
        END IF;
        RETURN;
    END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();

