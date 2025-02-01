CREATE OR REPLACE FUNCTION  fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy',
                                                               IN pprice numeric DEFAULT 500,
                                                               IN pdate date DEFAULT '2022-01-01')
RETURNS SETOF varchar AS $body$
BEGIN
    RETURN QUERY SELECT DISTINCT pz.name
                 FROM person_visits v
                 JOIN person p ON v.person_id=p.id
                 JOIN pizzeria pz ON v.pizzeria_id=pz.id
                 JOIN menu m ON v.pizzeria_id=m.pizzeria_id
                 WHERE v.visit_date=$3 AND p.name=$1 AND m.price<$2;
    IF NOT FOUND THEN
        RAISE EXCEPTION 'There is no pizzerias % visited on % that have pizza costs less then %.', $1, $3, $2;
    END IF;
END;
$body$ LANGUAGE plpgsql;

COMMENT ON FUNCTION fnc_person_visits_and_eats_on_date(pperson varchar, pprice numeric, pdate date) IS
                'find the names of pizzerias 
                that a person (IN pperson parameter with default value ''Dmitriy'') visited 
                and where he could buy pizza 
                for less than the given amount in rubles (IN pprice parameter with default value 500) 
                on the given date (IN pdate parameter with default value January 8, 2022).';

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
