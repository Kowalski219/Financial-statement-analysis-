
SET search_path TO total, public;



CREATE TABLE revenue_change (
    company TEXT,
    income_statement TEXT,
	amount NUMERIC,
    change_in_revenue NUMERIC,
    year DATE
);


INSERT INTO revenue_change (company, income_statement, amount,change_in_revenue, year);
WITH revenue_data AS (
   
 SELECT 'total' AS company, income_statement, amount, year
  FROM incomestatement2021
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'total' AS company, income_statement, amount, year
  FROM incomestatement2020
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'total' AS company, income_statement, amount, year
  FROM incomestatement2019
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'total' AS company, income_statement, amount, year
  FROM incomestatement2018
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'total' AS company, income_statement, amount, year
  FROM incomestatement2017
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'exxon' AS company, income_statement, amount, year
  FROM exxonincomestatement2021
  WHERE TRIM(income_statement) = 'Revenue' 
  UNION ALL
  SELECT 'exxon' AS company, income_statement, amount, year
  FROM exxonincomestatement2020
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'exxon' AS company, income_statement, amount, year
  FROM exxonincomestatement2019
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'exxon' AS company, income_statement, amount, year
  FROM exxonincomestatement2018
  WHERE TRIM(income_statement) = 'Revenue'
  UNION ALL
  SELECT 'exxon' AS company, income_statement, amount, year
  FROM exxonincomestatement2017
  WHERE income_statement = 'Revenue')
SELECT
    company,
    income_statement,amount,
    COALESCE(
        (amount - LAG(amount) OVER (PARTITION BY company ORDER BY year)) / LAG(amount) OVER (PARTITION BY company ORDER BY year),
        0
    ) AS change_in_revenue,
    year
FROM revenue_data
ORDER BY year DESC;


