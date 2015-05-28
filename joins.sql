-- For which collars can we identify an owner?

SELECT dog_owners.name, dog_owners.dog_name
FROM dog_owners
JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name;

-- name   | dog_name
-- ---------+----------
-- Evan    | Boogie
-- Whitney | Gilly
-- Spencer | Lilly
-- Dan     | Linux
-- Omid    | Bronson

-- For which collars is there no known owner?

SELECT lost_dog_collars.dog_name AS collars
FROM dog_owners
RIGHT JOIN lost_dog_collars
ON dog_owners.dog_name = lost_dog_collars.dog_name;
