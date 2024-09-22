-- Fuzzy Search with SOUNDEX
SELECT * FROM Patient
WHERE SOUNDEX(first_name) = SOUNDEX('Rolando');