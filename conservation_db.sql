-- Active: 1747407712104@@127.0.0.1@5432@conservation_db@public
------------------- ranger table --------------
CREATE TABLE rangers (
    ranger_id SERIAL,
    ranger_name VARCHAR(25),
    contact VARCHAR(30),
    ranger_zone VARCHAR(30),
    PRIMARY KEY (ranger_id)
);
INSERT INTO rangers(ranger_name, contact, ranger_zone)
VALUES
('Hossain Meera', '01711111111', 'Shyamnagar'),
('Abdul Kader', '01722222222', 'Mongla'),
('Sabina Akter', '01733333333', 'Katalatoli'),
('Mohammad Ali', '01744444444', 'Hiron Point'),
('Ruksana Parvin', '01755555555', 'Satkhira Range'),
('Jasim Uddin', '01766666666', 'Chandpai'),
('Mina Begum', '01777777777', 'Khulna'),
('Rahim Uddin', '01788888888', 'Burigoalini'),
('Afsana Akter', '01799999999', 'Shyamnagar'),
('Tanvir Hasan', '01800000000', 'Joymoni');

-------------------------- species table ---------------------

CREATE TABLE species(
    specie_id SERIAL,
    common_name VARCHAR(50) NOT NULL,
    scientific_name VARCHAR(50),
    discovery_date TIMESTAMP,
    conservation_status VARCHAR(30),
    PRIMARY KEY(specie_id)
);
INSERT INTO species(common_name, scientific_name, discovery_date, conservation_status)
VALUES
('Royal Bengal Tiger', 'Panthera tigris tigris', '1900-01-01', 'Endangered'),
('Fishing Cat', 'Prionailurus viverrinus', '1827-06-15', 'Vulnerable'),
('Irrawaddy Dolphin', 'Orcaella brevirostris', '1866-01-01', 'Vulnerable'),
('Saltwater Crocodile', 'Crocodylus porosus', '1800-01-01', 'Least Concern'),
('River Terrapin', 'Batagur baska', '1831-05-01', 'Critically Endangered'),
('Smooth-coated Otter', 'Lutrogale perspicillata', '1826-03-12', 'Vulnerable'),
('Ganges River Dolphin', 'Platanista gangetica', '1801-08-20', 'Endangered'),
('Indian Cobra', 'Naja naja', '1758-01-01', 'Least Concern'),
('Mangrove Monitor Lizard', 'Varanus indicus', '1802-04-10', 'Least Concern'),
('Green Sea Turtle', 'Chelonia mydas', '1758-01-01', 'Endangered'),
('Olive Ridley Turtle', 'Lepidochelys olivacea', '1887-09-09', 'Vulnerable'),
('Bengal Monitor', 'Varanus bengalensis', '1802-01-01', 'Least Concern'),
('Spotted Deer', 'Axis axis', '1777-01-01', 'Least Concern'),
('Wild Boar', 'Sus scrofa', '1758-01-01', 'Least Concern'),
('Indian Python', 'Python molurus', '1758-01-01', 'Near Threatened'),
('White-rumped Vulture', 'Gyps bengalensis', '1786-01-01', 'Critically Endangered'),
('Asian Openbill', 'Anastomus oscitans', '1786-01-01', 'Least Concern'),
('Lesser Adjutant Stork', 'Leptoptilos javanicus', '1821-01-01', 'Vulnerable'),
('Mangrove Horseshoe Crab', 'Carcinoscorpius rotundicauda', '1850-01-01', 'Data Deficient'),
('Small-clawed Otter', 'Aonyx cinereus', '1837-01-01', 'Vulnerable');

------------------------ sightings table -----------------------
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    specie_id INT,
    sighting_time TIMESTAMP,
    sighting_location VARCHAR(30),
    notes VARCHAR(50),
    FOREIGN KEY (ranger_id) REFERENCES rangers(ranger_id),
    FOREIGN KEY (specie_id) REFERENCES species(specie_id)
);
DROP TABLE sightings;
INSERT INTO sightings(ranger_id, specie_id, sighting_time, sighting_location, notes)
VALUES
(1, 3, '2023-05-01 08:30:00', 'Kotka', 'Tiger footprints spotted'),
(2, 1, '2023-05-02 5:15:00', 'Hiron Point', 'Spotted a deer herd'),
(3, 5, '2023-05-03 06:45:00', 'Dubla Island', 'Bird migration observed'),
(4, 2, '2023-05-04 09:30:00', 'Karamjal', 'Monkey group sighted'),
(5, 6, '2023-05-05 3:10:00', 'Nilkamal', 'Snake near trail'),
(1, 4, '2023-05-06 12:00:00', 'Kotka Point', 'Wild boar spotted'),
(2, 7, '2023-05-07 07:45:00', 'Dublar Char', 'Dolphins seen'),
(3, 8, '2023-05-08 13:30:00', 'Harinagar Point', 'Spotted king cobra'),
(4, 9, '2023-05-09 10:20:00', 'Chandpai', 'Monitor lizard crossing'),
(5, 10, '2023-05-10 11:15:00', 'Katka Beach', 'Rare bird nesting'),
(1, 1, '2023-05-11 1:00:00', 'Kotka', 'Deer group running'),
(2, 3, '2023-05-12 16:25:00', 'Mandarbaria', 'Tiger roars heard'),
(3, 2, '2023-05-13 06:00:00', 'Harbaria', 'Monkey in trees'),
(4, 5, '2023-05-14 09:45:00', 'Koira', 'Flock of birds flying low'),
(5, 4, '2023-05-15 08:10:00', 'Mongla Point', 'Wild boar in bushes');


SELECT * FROM rangers;
SELECT * FROM species;
SELECT * FROM sightings;

-------------------------------- problem-1 
-- Register a new ranger with provided data with name = 'Derek Fox' and region = 'Coastal Plains'

INSERT INTO rangers(ranger_name, contact, ranger_zone)
VALUES
('Derek Fox', '01735365276', 'Coastal Plains');

------------------------------- problem-2
--  Count unique species ever sighted.

SELECT count(ranger_id) FROM sightings;

---------------------------- problem-3
-- Find all sightings where the location includes "Pass".
SELECT * FROM sightings
WHERE sighting_location LIKE '%Point%';

---------------------------- problem-4
-- List each ranger's name and their total number of sightings.
SELECT ranger_name, COUNT(sighting_id) as total_sightings FROM sightings
FULL JOIN rangers ON sightings.ranger_id = rangers.ranger_id
GROUP BY ranger_name;

------------------------------- problem-5
-- List species that have never been sighted.

SELECT common_name FROM species
LEFT JOIN sightings ON species.specie_id = sightings.specie_id
WHERE sightings.ranger_id IS NULL;

----------------------- problem-6
-- Show the most recent 2 sightings.
SELECT common_name, sighting_time, ranger_name FROM sightings
JOIN species ON sightings.specie_id = species.specie_id
JOIN rangers ON sightings.sighting_id = rangers.ranger_id
ORDER BY sighting_time ASC LIMIT 2

------------------------------- problem-7
-- Update all species discovered before year 1800 to have status 'Historic'.
UPDATE species WHERE discovery_date < '1800-01-01'
AND conservation_status = 'Endangered';

----------------------- problem-8
-- Label each sighting's time of day as 'Morning', 'Afternoon', or 'Evening'.




----------------------- problem-9
-- Delete rangers who have never sighted any species
DELETE FROM rangers WHERE NOT EXISTS(
    SELECT sightings FROM sightings WHERE sightings.ranger_id = rangers.ranger_id
);
SELECT * FROM rangers;


