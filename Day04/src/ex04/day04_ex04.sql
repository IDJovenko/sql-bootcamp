CREATE VIEW v_symmetric_union AS
	WITH R AS (
      	SELECT person_id FROM person_visits
    	WHERE visit_date='2022-01-02'
    ), S AS (
      	SELECT person_id FROM person_visits
    	WHERE visit_date='2022-01-06'
    )
    -- query start
    ( SELECT * FROM R
      EXCEPT
      SELECT * FROM S
    )
    UNION
    ( SELECT * FROM S
      EXCEPT
      SELECT * FROM R
    );

-- (R - S)∪(S - R) 
-- R is the person_visits table with a filter through January 2, 2022,
-- S is also the person_visits table but with a different filter through January 6, 2022