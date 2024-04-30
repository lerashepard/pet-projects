-- Defines schema for `emotions` table 
CREATE TABLE emotions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME NOT NULL,
    body_sensations TEXT NOT NULL,
    thoughts TEXT NOT NULL,
    feelings TEXT NOT NULL,
    associations TEXT NOT NULL,
    desires TEXT NOT NULL
);

-- Insertion procedure for creating an entry in the `emotions` table with specified data 
INSERT INTO emotions (created_at, body_sensations, thoughts, feelings, associations, desires)
VALUES (:createdAt, :bodySensations, :thoughts, :feelings, :associations, :desires);

-- Retrieve all entries within a specified datetime range ordered chronologically 
SELECT *
FROM emotions
WHERE created_at BETWEEN :createdFrom AND :createdTo
ORDER BY created_at;

-- Retrieve a limited number of the most recent entries 
SELECT *
FROM emotions
ORDER BY created_at DESC
LIMIT :amount;
