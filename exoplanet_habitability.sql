-- Table for storing information about stars
CREATE TABLE stars (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    star_type VARCHAR(100),
    mass NUMERIC,
    radius NUMERIC,
    luminosity NUMERIC
);

-- Table for storing information about exoplanets
CREATE TABLE exoplanets (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    star_id INT,
    name VARCHAR(255),
    orbital_period NUMERIC,
    mass NUMERIC,
    radius NUMERIC,
    equilibrium_temperature NUMERIC,
    FOREIGN KEY (star_id) 
    REFERENCES stars(id)
);

-- Table for storing potential signs of life
CREATE TABLE biosignatures (
    exoplanet_id INT,
    water_presence BOOLEAN,
    organic_compounds BOOLEAN,
    oxygen_levels NUMERIC,
    FOREIGN KEY (exoplanet_id) 
    REFERENCES exoplanets(id)
);

-- Adding sample data to 'stars' table
INSERT INTO stars (name, star_type, mass, radius, luminosity) 
VALUES
('Sun', 'G-Type', 1.0, 1.0, 1.0),
('Proxima Centauri', 'M-Type', 0.12, 0.14, 0.0017);

-- Adding sample data to 'exoplanets' table
INSERT INTO exoplanets (star_id, name, orbital_period, mass, radius, equilibrium_temperature) 
VALUES
((SELECT id FROM stars WHERE name = 'Sun'), 'Earth', 365.25, 1, 1, 288),
((SELECT id FROM stars WHERE name = 'Proxima Centauri'), 'Proxima Centauri b', 11.186, 0.00315, 0.11, 234);

-- Adding sample data to 'biosignatures' table
INSERT INTO biosignatures (exoplanet_id, water_presence, organic_compounds, oxygen_levels) 
VALUES
((SELECT id FROM exoplanets WHERE name = 'Earth'), TRUE, TRUE, 21.0),
((SELECT id FROM exoplanets WHERE name = 'Proxima Centauri b'), FALSE, FALSE, 0);

-- Querying the database
SELECT e.name, e.equilibrium_temperature, b.water_presence, b.oxygen_levels
FROM exoplanets AS e
JOIN biosignatures AS b ON e.id = b.exoplanet_id
WHERE b.water_presence = TRUE AND b.oxygen_levels > 5;

-- Querying the database
SELECT s.name AS star_name, s.luminosity, e.name AS exoplanet_name, e.orbital_period
FROM stars AS s
JOIN exoplanets AS e ON s.id = e.star_id
WHERE s.luminosity >= 0.8;
