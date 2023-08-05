SET search_path TO total, PUBLIC;

DELETE FROM incomestatement2019;


SELECT * FROM incomestatement2019;
SELECT * FROM exxonincomestatement2021;

SELECT amount FROM incomestatement2020 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation' ;
CREATE TABLE gross_profit_and_yoy(company TEXT,
								 gross_profit NUMERIC,
								 yoy_gross_profit_change NUMERIC,
								 year DATE);
INSERT INTO gross_profit_and_yoy(company,gross_profit,yoy_gross_profit_change,year)
WITH gross_profits AS(
SELECT 'total' AS company, 
       (SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenues from sales') +
       (SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation') AS gross_profit,
       year
FROM incomestatement2021
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year;

UNION ALL
SELECT 'total' AS company, 
       (SELECT amount FROM incomestatement2020  WHERE TRIM(income_statement) = 'Revenues from sales') +
       (SELECT amount FROM incomestatement2020 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation') AS gross_profit,
       year
FROM incomestatement2020
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT amount FROM incomestatement2019  WHERE TRIM(income_statement) = 'Revenues from sales') +
       (SELECT amount FROM incomestatement2019 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation') AS gross_profit,
       year
FROM incomestatement2019
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT amount FROM incomestatement2018  WHERE TRIM(income_statement) = 'Revenues from sales') +
       (SELECT amount FROM incomestatement2018 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation') AS gross_profit,
       year
FROM incomestatement2018
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'total' AS company, 
       (SELECT amount FROM incomestatement2017  WHERE TRIM(income_statement) = 'Revenues from sales') +
       (SELECT amount FROM incomestatement2017 WHERE TRIM(income_statement) = 
		'Purchases, net of inventory variation') AS gross_profit,
       year
FROM incomestatement2017
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year
UNION ALL
SELECT 'exxon' AS company, '64302' AS gross_profit, year
FROM exxonincomestatement2021
GROUP BY year;
UNION ALL
SELECT 'exxon' AS company, '30942' AS gross_profit, year
FROM exxonincomestatement2020
GROUP BY year
UNION ALL
SELECT 'exxon' AS company, '53786' AS gross_profit, year
FROM exxonincomestatement2019
GROUP BY year
UNION ALL
SELECT 'exxon' AS company, '64965' AS gross_profit, year
FROM exxonincomestatement2018
GROUP BY year
UNION ALL
SELECT 'exxon' AS company, '53352' AS gross_profit, year
FROM exxonincomestatement2017
GROUP BY year)

SELECT company,gross_profit,COALESCE((gross_profit - LAG(gross_profit) OVER (PARTITION BY company ORDER BY year)) / 
       LAG(gross_profit) OVER (PARTITION BY company ORDER BY year),0) AS YOY_gross_profit_change,year
  FROM gross_profits
  ORDER BY year;
