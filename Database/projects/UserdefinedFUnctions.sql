use BikeStores;
go

-- USER DEFINED FUNCTIONS
-- TYPES
-- 1.scalar functions => returns a value
-- 2.Tabluar functions => returns a table



-- example
CREATE FUNCTION dbo.Fun (@var INT)
RETURNS INT
AS
BEGIN
    RETURN @var - 100
END
GO

SELECT dbo.Fun(300);

CREATE FUNCTION dbo.getSum(@num1 INT, @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 + @num2
END

-- dbo database owner

SELECT dbo.getSum(10,20)

DROP FUNCTION getSum



DROP FUNCTION dbo.Fun

-- several params
CREATE FUNCTION dbo.AddNumbers(@num1 INT, @num2 INT)
RETURNS INT
AS
BEGIN
    RETURN @num1 + @num2
END

SELECT dbo.AddNumbers(10, 20)















-- SELECT dbo.Fun(100)
-- GO

CREATE  FUNCTION sums(@columnName INT,@percentage INT)
RETURNS INT AS
BEGIN
    RETURN @columnName +(@columnName *@percentage)/100
END
GO

SELECT *
FROM production.products

SELECT *, dbo.sums(list_price, 10) As AddingIncome
FROM production.products





-- ALTERING


--TABLE VALUED FUNCTIONS
CREATE  FUNCTION checkModel(@year INT)
RETURNS TABLE
RETURN
    SELECT *
    FROM production.products
    where model_year < @year
Go






SELECT * from production.products

SELECT * from checkModel(2018)

ALTER FUNCTION checkModel(@year INT)
RETURNs TABLE
RETURN 
    SELECT * FROM production.products 
    WHERE category_id = @year


SELECT * FROM checkModel(3)





-- DELETING FUNCTIONS
-- SYNTAX:
    -- DROP FUNCTION functionName

DROP FUNCTION checkModel

-- functions cannot update data in tables
-- We can use TABLE variable in user defined functions
-- dbo. database owner with login o f dbo