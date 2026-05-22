CREATE OR REPLACE FUNCTION prevent_negative_party_votes()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.votes < 0 THEN
        RAISE EXCEPTION 'votes cannot be non-negative.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;