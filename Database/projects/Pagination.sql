use Scores;

-- creating sample data we will use;

CREATE TABLE SampleFruits
(
    Id INT PRIMARY KEY IDENTITY(1,1) ,
    FruitName VARCHAR(50) ,
    Price INT
)
GO
INSERT INTO SampleFruits
VALUES('Apple', 20)
INSERT INTO SampleFruits
VALUES('Apricot', 12)
INSERT INTO SampleFruits
VALUES('Banana', 8)
INSERT INTO SampleFruits
VALUES('Cherry', 11)
INSERT INTO SampleFruits
VALUES('Strawberry', 26)
INSERT INTO SampleFruits
VALUES('Lemon', 4)
INSERT INTO SampleFruits
VALUES('Kiwi', 14)
INSERT INTO SampleFruits
VALUES('Coconut', 34)
INSERT INTO SampleFruits
VALUES('Orange', 24)
INSERT INTO SampleFruits
VALUES('Raspberry', 13)
INSERT INTO SampleFruits
VALUES('Mango', 9)
INSERT INTO SampleFruits
VALUES('Mandarin', 19)
INSERT INTO SampleFruits
VALUES('Pineapple', 22)
GO
SELECT *
FROM SampleFruits

-- example 1: OFFSET key word
SELECT FruitName, Price
FROM SampleFruits
ORDER BY Price
OFFSET 3 ROWS

-- OFFSET =0
SELECT FruitName, Price
FROM SampleFruits
ORDER BY Price
OFFSET 0 ROWS

-- OFFSET = 20
SELECT FruitName, Price
FROM SampleFruits
ORDER BY Price
OFFSET 50 ROWS


-- example 2. Fetch
SELECT FruitName, Price
FROM SampleFruits
ORDER BY Price
OFFSET 5 ROWS FETCH NEXT 6 ROWS ONLY

-- example 3 REAL PAGINATION.

-- query example;

DECLARE @PageNumber AS INT
DECLARE @RowsOfPage AS INT
SET @PageNumber=2
SET @RowsOfPage=4
SELECT FruitName, Price
FROM SampleFruits
ORDER BY Price 
OFFSET (@PageNumber-1)*@RowsOfPage ROWS
FETCH NEXT @RowsOfPage ROWS ONLY
-- OFFSET (1*4) FETCH NEXT 4 ROWS ONLY.









-- DYNAMIC SORTING IN PAGINATION.

-- DECLARE @PageNumber AS INT
-- DECLARE @RowsOfPage AS INT
-- DECLARE @SortingCol AS VARCHAR(100) ='FruitName'
-- DECLARE @SortType AS VARCHAR(100) = 'DESC'
-- SET @PageNumber=1
-- SET @RowsOfPage=4
-- SELECT FruitName, Price
-- FROM SampleFruits
-- ORDER BY 
-- CASE WHEN @SortingCol = 'Price' AND @SortType ='ASC' THEN Price END ,
-- CASE WHEN @SortingCol = 'Price' AND @SortType ='DESC' THEN Price END DESC,
-- CASE WHEN @SortingCol = 'FruitName' AND @SortType ='ASC' THEN FruitName END ,
-- CASE WHEN @SortingCol = 'FruitName' AND @SortType ='DESC' THEN FruitName END DESC
-- OFFSET (@PageNumber-1)*@RowsOfPage ROWS
-- FETCH NEXT @RowsOfPage ROWS ONLY

-- 
SELECT *
FROM SampleFruits
ORDER BY FruitName DESC


SELECT *
FROM SampleFruits
ORDER BY Price ASC











-- PAGINATION IN A LOOP

-- EXAMPLE 1

-- DECLARE @PageNumber AS INT
-- DECLARE @RowsOfPage AS INT
-- DECLARE @MaxTablePage  AS FLOAT
-- SET @PageNumber=1
-- SET @RowsOfPage=4
-- SELECT @MaxTablePage = COUNT(*)
-- FROM SampleFruits
-- SET @MaxTablePage = CEILING(@MaxTablePage/@RowsOfPage)
-- WHILE @MaxTablePage >= @PageNumber
--         BEGIN
--     SELECT FruitName, Price
--     FROM SampleFruits
--     ORDER BY Price 
--         OFFSET (@PageNumber-1)*@RowsOfPage ROWS
--         FETCH NEXT @RowsOfPage ROWS ONLY
--     SET @PageNumber = @PageNumber + 1
-- END


-- EXAMPLE 2

-- DECLARE @PageNumber AS INT = 1
-- DECLARE @RowsPerPage AS INT = 5
-- DECLARE @TotalRows AS INT

-- -- get the total number of rows
-- SELECT @TotalRows = COUNT(*)
-- FROM SampleFruits

-- -- loop through the pages until all rows have been retrieved
-- WHILE (@PageNumber - 1) * @RowsPerPage < @TotalRows
-- BEGIN
--     -- retrieve the current page of rows
--     SELECT *
--     FROM (
--     SELECT ROW_NUMBER() OVER (ORDER BY Price) AS RowNum, *
--         -- The ROW_NUMBER() function assigns a unique number to each row, based on the ordering specified by the ORDER BY clause.
--         FROM SampleFruits
--   ) AS MyTableWithRowNumbers
--     WHERE RowNum BETWEEN (@PageNumber - 1) * @RowsPerPage + 1 AND @PageNumber * @RowsPerPage

--     -- increment the page number
--     SET @PageNumber = @PageNumber + 1
-- END
