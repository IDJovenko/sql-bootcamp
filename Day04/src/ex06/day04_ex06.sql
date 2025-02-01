CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	SELECT DISTINCT pz.name AS pizzeria_name
    FROM person_visits v
    JOIN pizzeria pz ON v.pizzeria_id = pz.id
    JOIN menu m ON v.pizzeria_id = m.pizzeria_id
    JOIN person p ON v.person_id = p.id
    WHERE p.name='Dmitriy' AND v.visit_date='2022-01-08' AND m.price<800;
