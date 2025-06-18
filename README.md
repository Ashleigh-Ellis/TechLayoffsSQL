# TechLayoffsSQL
This project analyzes global tech layoffs using SQL to uncover trends, key metrics, and insights into the tech industry's workforce reductions.



## 📊 Dataset Overview

- **Table Name**: `layoffs_staging2`
- **Source**: Curated dataset of global tech layoffs (provided to me from AlexTheAnalyst)
- **Fields** include:
  - `company`
  - `industry`
  - `location` 
  - `total_laid_off`
  - `percentage_laid_off`
  - `date`
  - `stage` 
  - `funds_raised_millions`
  - ect

## 🧪 Key Questions Explored

- What companies laid off the most employees?
- Which companies laid off 100% of their workforce?
- What are the total layoffs over time (monthly, yearly)?
- Are there trends in layoffs by stage or industry?
- What were the top 5 companies with most layoffs per year?


## 🧠 Techniques Used

- SQL window functions (`DENSE_RANK`, `OVER`)
- Aggregations (`SUM`, `AVG`)
- Time-based analysis (`YEAR`, `SUBSTRING(date, 1, 7)`)
- Common Table Expressions (CTEs)


## 📂 Files in this Repository

| File | Description |
|------|-------------|
| `layoffs_staging2.csv` | The dataset used for analysis |
| `layoffs_exploratory_queries.sql` | SQL queries performing the EDA |


## 🛠️ How to Reproduce

1. Import the `layoffs_staging2.csv` into your local or cloud-based MySQL environment.
2. Run the queries from `layoffs_exploratory_queries.sql` in your SQL editor.


Thanks for learning with me :) 

## 📬 Contact
Let’s connect!
📧 Email: ashleighellis1999@gmail.com 🌐 portfolio site pending...
💼 LinkedIn: https://www.linkedin.com/in/ashleigh-ellis-2bba081a8/
