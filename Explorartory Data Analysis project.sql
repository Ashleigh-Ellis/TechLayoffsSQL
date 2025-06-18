-- Exploratory Data Analysis


-- Just a quick look at everything
SELECT *
FROM layoffs_staging2;

-- View the most employees let go by a given company and what the maximum percentage of layoffs is in the dataset.
SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

-- Shows all companies that let go of 100% of the employees organized by how many funds they raised.
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

-- Shows the earliest and latest entry into the dataset.
SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

-- Shows total layoffs by year.
SELECT YEAR(`date`), SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

-- Shows how many layoffs occured depending on the stage of the companies.
SELECT stage, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

-- Shows how many layoffs occured depending on the industry.
SELECT industry, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

-- Shows how many layoffs occured depending on the country.
SELECT country, SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

-- Full list of Companies and their percentage of total staff laid off.
SELECT company, AVG(percentage_laid_off) 
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Shows which months have higher layoff rates each year. 
SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;

-- Also shows layoffs by month of year, as well as a column showing the rolling total of layoffs after each month has passed.
WITH Rolling_total AS
(SELECT substring(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE substring(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off
, SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_total;

-- Shows total number of layoffs per company.
SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

-- Shows total number of layoffs per company for a particular year. Ordered by layoff total, decending.
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

-- Shows the top resulting 5 companies per year ranked by layoff total. 
WITH company_year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT *, dense_rank() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM company_year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
;

-- Thanks for learning with me :)
