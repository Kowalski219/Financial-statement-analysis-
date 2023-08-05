SET search_path TO total, PUBLIC;

SELECT * FROM exxonincomestatement2018;

UPDATE exxonincomestatement2016
SET income_statement='net_income'
WHERE income_statement='Net income attributable to ExxonMobil';

CREATE TABLE netincome(company TEXT,
			income_statement TEXT,
			amount NUMERIC,
			year DATE);
INSERT INTO netincome(company,income_statement,amount,year)

SELECT 'total' AS company, income_statement,amount,year
FROM incomestatement2021
WHERE income_statement='net_income'
UNION ALL
SELECT 'total' AS company, income_statement,amount,year
FROM incomestatement2020
WHERE income_statement='net_income'
UNION ALL
SELECT 'total' AS company, income_statement,amount,year
FROM incomestatement2019
WHERE income_statement='net_income'
UNION ALL
SELECT 'total' AS company, income_statement,amount,year
FROM incomestatement2018
WHERE income_statement='net_income'
UNION ALL
SELECT 'total' AS company, income_statement,amount,year
FROM incomestatement2017
WHERE income_statement='net_income'
UNION ALL
SELECT 'exxon' AS company, income_statement,amount,year
FROM exxonincomestatement2021
WHERE income_statement='net_income'
UNION ALL
SELECT 'exxon' AS company, income_statement,amount,year
FROM exxonincomestatement2020
WHERE income_statement='net_income'
UNION ALL
SELECT 'exxon' AS company, income_statement,amount,year
FROM exxonincomestatement2019
WHERE income_statement='net_income'
UNION ALL
SELECT 'exxon' AS company, income_statement,amount,year
FROM exxonincomestatement2018
WHERE income_statement='net_income'
UNION ALL
SELECT 'exxon' AS company, income_statement,amount,year
FROM exxonincomestatement2017
WHERE income_statement='net_income';