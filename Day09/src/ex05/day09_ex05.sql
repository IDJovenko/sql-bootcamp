DROP FUNCTION fnc_persons_female, fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar DEFAULT 'female')
RETURNS SETOF person AS
$$
    SELECT * FROM person
    WHERE gender=$1;
$$ LANGUAGE SQL;

select *
from fnc_persons(pgender := 'male');

select *
from fnc_persons();
