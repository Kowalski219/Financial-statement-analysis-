SET search_path TO total, PUBLIC;



CREATE TABLE gross_profit_margins( company TEXT,
								gross_profit_margin NUMERIC,
								year DATE);
INSERT INTO gross_profit_margins(company,gross_profit_margin,year)

SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2021
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
       year 
FROM incomestatement2021
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2020
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
       year 
FROM incomestatement2020
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2019
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
       year 
FROM incomestatement2019
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2018
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
       year 
FROM incomestatement2018
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2017
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
       year 
FROM incomestatement2017
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'Exxon' AS company, '64302' / (
    SELECT amount
    FROM exxonincomestatement2021
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, year
FROM exxonincomestatement2021
GROUP BY year
UNION ALL
SELECT 'Exxon' AS company, '30942' / (
    SELECT amount
    FROM exxonincomestatement2020
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, year
FROM exxonincomestatement2020
GROUP BY year
UNION ALL
SELECT 'Exxon' AS company, '53786' / (
    SELECT amount
    FROM exxonincomestatement2019
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, year
FROM exxonincomestatement2019
GROUP BY year
UNION ALL
SELECT 'Exxon' AS company, '64965' / (
    SELECT amount
    FROM exxonincomestatement2018
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, year
FROM exxonincomestatement2018
GROUP BY year
UNION ALL
SELECT 'Exxon' AS company, '53352' / (
    SELECT amount
    FROM exxonincomestatement2017
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, year
FROM exxonincomestatement2017
GROUP BY year;

