CREATE OR REPLACE FUNCTION municipality_size_class(p_code text)
RETURNS text AS $$
    DECLARE mandate_count bigint;
    BEGIN
        SELECT mandates INTO mandate_count
        FROM municipality WHERE p_code = code;

        IF mandate_count IS NULL THEN
            RETURN NULL;
        ELSIF mandate_count < 5 THEN
            RETURN 'SMALL';
        ELSIF mandate_count < 10 THEN
            RETURN 'MEDIUM';
        ELSE
            RETURN 'LARGE';
        END IF;
    END;
$$ LANGUAGE plpgsql;