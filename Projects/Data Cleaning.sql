-- Data Cleaning

SELECT *
FROM world_layoffs.layoffs_staging;


-- Steps
-- 0. Create staging table
-- 1. Remove Duplicates (if any)
-- 2. Standardize the Data
-- 3. Null values or blank values
-- 4. Remove any columns

-- Create staging table
CREATE TABLE world_layoffs.layoffs_staging
LIKE world_layoffs.layoffs;

INSERT world_layoffs.layoffs_staging
SELECT *
FROM world_layoffs.layoffs;

-- Remove duplicates
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, 
location, 
industry, 
total_laid_off, 
percentage_laid_off, 
`date`, 
stage, country, 
funds_raised_millions) 
AS row_num
FROM world_layoffs.layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE world_layoffs.`layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO world_layoffs.layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM world_layoffs.layoffs_staging;

DELETE
FROM world_layoffs.layoffs_staging2
WHERE row_num > 1;

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE row_num > 2;

-- Standardize data
SELECT company, TRIM(company)
FROM world_layoffs.layoffs_staging2;

UPDATE world_layoffs.layoffs_staging2
SET company =  TRIM(company);

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE world_layoffs.layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

UPDATE world_layoffs.layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE '%.';

SELECT DISTINCT country
FROM world_layoffs.layoffs_staging2
ORDER BY 1;

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM world_layoffs.layoffs_staging2;

UPDATE world_layoffs.layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

SELECT `date`
FROM world_layoffs.layoffs_staging2;

ALTER TABLE world_layoffs.layoffs_staging2
MODIFY COLUMN `date` DATE;

-- Null values or Blank values
UPDATE world_layoffs.layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE industry IS NULL
OR industry = '';

SELECT *
FROM world_layoffs.layoffs_staging2
WHERE company = 'Airbnb';

SELECT *
FROM world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE world_layoffs.layoffs_staging2 t1
JOIN world_layoffs.layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL)
AND t2.industry IS NOT NULL;

-- Remove rows and columns
SELECT *
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

DELETE
FROM world_layoffs.layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

ALTER TABLE world_layoffs.layoffs_staging2
DROP COLUMN row_num;

SELECT *
FROM world_layoffs.layoffs_staging2;