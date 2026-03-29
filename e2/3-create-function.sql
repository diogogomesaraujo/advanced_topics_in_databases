CREATE OR REPLACE FUNCTION party_by_short_name(p_shortname text)
    RETURNS text AS
    $$DECLARE
        v_name text;
        BEGIN
        SELECT name
        INTO v_name
        FROM party WHERE shortname = p_shortname;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Party not found with shortname %', p_shortname;
        END IF;
        RETURN v_name;
        END;
    $$ LANGUAGE plpgsql;