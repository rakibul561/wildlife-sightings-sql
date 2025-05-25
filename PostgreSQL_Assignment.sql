-- Active: 1747583459747@@127.0.0.1@5432@conservation_db



CREATE DATABASE  conservation_db ;

 CREATE Table rangers (
    ranger_id SERIAL  PRIMARY KEY ,
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
    species_id INTEGER REFERENCES species(species_id),
    ranger_id  INTEGER REFERENCES rangers(ranger_id),
    sighting_time TIMESTAMP,
    location VARCHAR(100),
    notes TEXT
   );

 


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
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL),
(2, 1, 'Riverbend Trail', '2024-05-20 08:15:00', 'Tracks found near river'),
(3, 2, 'Eastern Bamboo Trail', '2024-05-21 13:00:00', 'Adult seen resting'),
(4, 3, 'Forest Edge', '2024-05-22 19:45:00', 'Heard trumpet call');


SELECT * FROM sightings;




