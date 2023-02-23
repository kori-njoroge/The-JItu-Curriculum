use Scores

SELECT * from results.scores_data
ALTER TABLE results.scores_data ADD  modifiedOn DATE

INSERT INTO results.scores_data (names, score, rank,percentages, id, modifiedOn)
VALUES ('Rick',10,2,3,7,GETDATE())



INSERT INTO results.scores_data (names , modifiedOn)
VALUES ('Rick',GETDATE())