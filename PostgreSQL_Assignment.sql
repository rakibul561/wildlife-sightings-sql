-- Active: 1747583459747@@127.0.0.1@5432@conservation_db



CREATE DATABASE  conservation_db ;

 CREATE Table rangers (
    ranger_id SERIAL  PRIMARY KEY ,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100)
 );


 INSERT INTO rangers (name, region) VALUES 
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

SELECT * FROM rangers 