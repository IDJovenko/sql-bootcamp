-- create a table to log changes in person table
CREATE TABLE IF NOT EXISTS person_audit (
    created TIMESTAMPTZ DEFAULT current_timestamp NOT NULL,
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR,
    constraint ch_type_event CHECK(type_event IN ('I', 'U', 'D'))
);

-- add comment to the created person_audit table
COMMENT ON TABLE person_audit IS 'saves logs of DML(INSERT/UPDATE/DELETE) executed on the person table';
COMMENT ON COLUMN person_audit.created IS 'timestamp when a new event has been created';
COMMENT ON COLUMN person_audit.type_event IS 'possible values I (insert), D (delete), U (update)';
COMMENT ON COLUMN person_audit.row_id IS 'copy of person.id.';
COMMENT ON COLUMN person_audit.name IS 'copy of person.name';
COMMENT ON COLUMN person_audit.age IS 'copy of person.age';
COMMENT ON COLUMN person_audit.gender IS 'copy of person.gender';
COMMENT ON COLUMN person_audit.address IS 'copy of person.address';

-- About triggers in PL/pgSQL in russian:
-- https://postgrespro.ru/docs/postgresql/9.6/triggers
-- About trigger funvtions in PL/pgSQL in russian:
-- https://postgrespro.ru/docs/postgresql/9.6/plpgsql-trigger

-- create trigger function that logs after each insert into person table
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS trigger AS
    $body$
    BEGIN
        -- (person_audit.created and person_audit.type_event sets by default)
        INSERT INTO person_audit (row_id, name, age, gender, address)
        VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
        RETURN NULL; -- return value for AFTER trigger is ignored
    END;
    $body$
LANGUAGE plpgsql;

-- create trigger 
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE PROCEDURE fnc_trg_person_insert_audit();

--  issue an INSERT statement into the person table to check autoloпging
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
