-- Question: The "ON" part of a statement will never change when dealing with PK and FK, but
-- the type of "JOIN" will?

-- 1) For which collars can we identify an owner?

SELECT dog_owners.dog_name AS dogs_with_owners
FROM dog_owners
JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name
;

-- dogs_with_owners
-- ------------------
-- Boogie
-- Gilly
-- Lilly
-- Linux
-- Bronson
-- (5 rows)

-- 2) For which collars is there no known owner?

SELECT lost_dog_collars.dog_name AS collars
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name
WHERE dog_owners.dog_name IS NULL
;

-- collars
-- ---------
-- Lassie
-- Fido
-- Goose
-- (3 rows)

-- 3) We need to see all collars, with an owner, if one matches.
SELECT lost_dog_collars.dog_name AS collars, dog_owners.name AS owners
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name
;
-- collars | owners
-- ---------+---------
-- Boogie  | Evan
-- Lassie  |
-- Gilly   | Whitney
-- Lilly   | Spencer
-- Fido    |
-- Linux   | Dan
-- Bronson | Omid
-- Goose   |
-- (8 rows)


-- 4) We need to see all owners, with collars in the Lost and Found, if one matches.
SELECT dog_owners.name AS owners, lost_dog_collars.dog_name AS collars
FROM dog_owners
LEFT JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name
;
-- owners  | collars
-- ---------+---------
-- Evan    | Boogie
-- Whitney | Gilly
-- Spencer | Lilly
-- Dan     | Linux
-- Omid    | Bronson
-- Dan     |
-- (6 rows)
