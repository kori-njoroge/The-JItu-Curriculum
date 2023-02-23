-- Creatind a schema
CREATE SCHEMA results;

-- creating a table
CREATE TABLE results.scores_data
(
    names varchar(255),
    score INT,
    rank INT,
    percentages int
)

-- Display all from a table.
SELECT * from results.Scores_data


-- Adding a column
use Scores;
ALTER TABLE results.Scores_data ADD iod INT IDENTITY (1,1) PRIMARY KEY
-- auto increment in msql uses the identity attribute 

-- inserting data to the created table.
INSERT INTO results.scores_data(names,score,rank,percentages) VALUES('Gideon Kori',25,1,80)
