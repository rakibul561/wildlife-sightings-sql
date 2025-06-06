-- Active: 1747583459747@@127.0.0.1@5432@conservation_db

CREATE DATABASE conservation_db;
-- Create rangers table
CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
);
 

-- Create species table
CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150),
    discovery_date DATE,
    conservation_status VARCHAR(50)
);



-- Create  sightings table
CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    species_id INTEGER REFERENCES species (species_id),
    ranger_id INTEGER REFERENCES rangers (ranger_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
);

-- Insert rangers
 INSERT INTO rangers (name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');


-- Insert species
INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


-- Insert sightings
INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

----- problem 1 -------------
INSERT INTO
    rangers (name, region)
VALUES ('Derek Fox', 'Coastal Plains')



--------problem 2 ----------


SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;




-------Problem 3 -------------
SELECT
    sighting_id,
    species_id,
    ranger_id,
    sighting_time,
    location,
    notes
FROM sightings
WHERE
    location LIKE '%Pass%';




-----problem 4 ----------

SELECT rangers.name, COUNT(sightings.ranger_id) AS total_sightings
FROM rangers
    INNER JOIN sightings ON rangers.ranger_id = sightings.ranger_id
GROUP BY rangers.name;




--------problem 5 ----------

 SELECT * FROM species 
 WHERE species_id NOT IN (
    SELECT species_id FROM sightings 
 ) 
 ----------------problem 6----------------------

  
 SELECT common_name,sighting_time,name as renjers_name
FROM sightings
INNER JOIN species ON species.species_id = sightings.species_id
INNER JOIN rangers ON rangers.ranger_id = sightings.ranger_id
ORDER BY sighting_time DESC
LIMIT 2 ;




 
 -----problem 7 ---------

  UPDATE species
  SET conservation_status ='Historic'
  WHERE EXTRACT(year FROM  discovery_date) < '1800';




---------problem 8 -----------
SELECT sighting_id , sighting_time ,
CASE 
    WHEN  EXTRACT(HOUR FROM  sighting_time ) BETWEEN 5 AND 11 THEN  'Morning'
    WHEN  EXTRACT(HOUR FROM  sighting_time ) BETWEEN 12 AND 17 THEN  'Afternoon'
    WHEN  EXTRACT(HOUR FROM  sighting_time ) BETWEEN 18 AND 23 THEN  'Evening'
    ELSE 'Night'
END time_of_day 
FROM sightings ;



-------------problem 9-----------

 DELETE FROM rangers
 WHERE ranger_id NOT IN(
    SELECT DISTINCT ranger_id FROM sightings
 );


