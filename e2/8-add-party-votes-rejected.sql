UPDATE party_votes
SET votes = -10
WHERE municipality_code = '131200'
    AND party_id = 1;