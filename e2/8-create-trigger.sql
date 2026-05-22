CREATE OR REPLACE TRIGGER trigger_check_negative_party_votes
    BEFORE INSERT OR UPDATE OF votes ON party_votes
    FOR EACH ROW
EXECUTE FUNCTION prevent_negative_party_votes();