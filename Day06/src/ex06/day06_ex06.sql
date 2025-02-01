CREATE SEQUENCE seq_person_discounts
	AS BIGINT
    INCREMENT BY 1
    START WITH 1
    OWNED BY person_discounts.id;

-- set right value to sequence
SELECT setval('seq_person_discounts', (SELECT COUNT(*) FROM person_discounts)); 

--  set a default value for id attribute of person_discounts table to take a value from seq_person_discounts each time automatically
ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT nextval('seq_person_discounts');
