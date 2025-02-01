(SELECT v.visit_date AS action_date, v.person_id
 FROM person_visits v)
INTERSECT
(SELECT ord.order_date, ord.person_id
 FROM person_order ord)
ORDER BY action_date ASC, person_id DESC;