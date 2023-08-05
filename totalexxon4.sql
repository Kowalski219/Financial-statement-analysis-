-- Active: 1688313602053@@127.0.0.1@5432@total_exxon
SET search_path TO total, PUBLIC;



UPDATE balancesheet2018
SET balance_sheet='total_liabilities_and_shareholders_equity'
WHERE balance_sheet= 'TOTAL LIABILITIES & SHAREHOLDERS'' EQUITY';
UPDATE balancesheet2019
SET balance_sheet='share_holders_equity'
WHERE balance_sheet= 'TOTAL SHAREHOLDERS'' EQUITY';



DROP TABLE gross_profit_margins;


DELETE FROM ratios;
CREATE TABLE ratios( company TEXT,
								gross_profit_margin NUMERIC,net_profit_margin NUMERIC,roa NUMERIC,roe NUMERIC, current_ratio NUMERIC,
					debt_ratio NUMERIC,
								year DATE);
INSERT INTO ratios(company,gross_profit_margin,net_profit_margin,roa,roe,current_ratio,debt_ratio,year)

SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2021
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2021 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
	(SELECT
(SELECT SUM(amount) AS tot_amt
FROM incomestatement2021
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM incomestatement2021
  WHERE TRIM(income_statement) = 'Revenue') 
FROM incomestatement2021
GROUP BY Year )AS net_profit_margin ,

		(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2021
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2021
	  WHERE balance_sheet='TOTAL ASSETS'))AS ROAs
FROM incomestatement2021
GROUP BY year) AS ROA,

		(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2021
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2021
	  WHERE balance_sheet='share_holders_equity'))
FROM incomestatement2021
GROUP BY year) AS ROE,
		
		(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2021
	 WHERE balance_sheet='TOTAL CURRENT ASSETS')/
	 (SELECT SUM(amount)
	  FROM balancesheet2021
	  WHERE balance_sheet='TOTAL CURRENT LIABILITIES'))
FROM incomestatement2021
GROUP BY year)  AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2021
	 WHERE balance_sheet='total_liabilities_and_shareholders_equity')/
	 (SELECT SUM(amount)
	  FROM balancesheet2021
	  WHERE balance_sheet='share_holders_equity')) 
FROM incomestatement2021
GROUP BY year) AS debt_ratio,

       year 
FROM incomestatement2021
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year

UNION ALL

SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2020
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2020 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
(SELECT
(SELECT SUM(amount) AS tot_amt
FROM incomestatement2020
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM incomestatement2020
  WHERE TRIM(income_statement) = 'Revenue') 
FROM incomestatement2020
GROUP BY Year) AS net_profit_margin	
	,
	
	
			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2020
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2020
	  WHERE balance_sheet='TOTAL ASSETS'))AS ROAs
FROM incomestatement2020
GROUP BY year) AS ROA,

			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2020
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2020
	  WHERE balance_sheet='share_holders_equity'))
FROM incomestatement2020
GROUP BY year) AS ROE,


		(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2020
	 WHERE balance_sheet='TOTAL CURRENT ASSETS')/
	 (SELECT SUM(amount)
	  FROM balancesheet2020
	  WHERE balance_sheet='TOTAL CURRENT LIABILITIES'))
FROM incomestatement2020
GROUP BY year)  AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2020
	 WHERE balance_sheet='total_liabilities_and_shareholders_equity')/
	 (SELECT SUM(amount)
	  FROM balancesheet2020
	  WHERE balance_sheet='share_holders_equity')) 
FROM incomestatement2020
GROUP BY year) AS debt_ratio,

       year 
FROM incomestatement2020
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year

		UNION ALL
		
SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2019
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2019 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
(SELECT
(SELECT SUM(amount) AS tot_amt
FROM incomestatement2019
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM incomestatement2019
  WHERE TRIM(income_statement) = 'Revenue') 
FROM incomestatement2019
GROUP BY Year) AS net_profit_margin	
	,
	
			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2019
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2019
	  WHERE balance_sheet='TOTAL ASSETS'))AS ROAs
FROM incomestatement2019
GROUP BY year) AS ROA,

			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2019
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2019
	  WHERE balance_sheet='share_holders_equity'))
FROM incomestatement2019
GROUP BY year) AS ROE,


(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2019
	 WHERE balance_sheet='TOTAL CURRENT ASSETS')/
	 (SELECT SUM(amount)
	  FROM balancesheet2019
	  WHERE balance_sheet='TOTAL CURRENT LIABILITIES'))
FROM incomestatement2019
GROUP BY year)  AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2019
	 WHERE balance_sheet='total_liabilities_and_shareholders_equity')/
	 (SELECT SUM(amount)
	  FROM balancesheet2019
	  WHERE balance_sheet='share_holders_equity')) 
FROM incomestatement2019
GROUP BY year) AS debt_ratio,

       year 
FROM incomestatement2019
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year

		UNION ALL

SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2018
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2018 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
(SELECT
(SELECT SUM(amount) AS tot_amt
FROM incomestatement2018
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM incomestatement2018
  WHERE TRIM(income_statement) = 'Revenue') 
FROM incomestatement2018
GROUP BY Year) AS net_profit_margin	
	,
	
			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2018
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2018
	  WHERE balance_sheet='TOTAL ASSETS'))AS ROAs
FROM incomestatement2018
GROUP BY year) AS ROA,

			(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2018
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2018
	  WHERE balance_sheet='share_holders_equity'))
FROM incomestatement2018
GROUP BY year) AS ROE,

		(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2018
	 WHERE balance_sheet='TOTAL CURRENT ASSETS')/
	 (SELECT SUM(amount)
	  FROM balancesheet2018
	  WHERE balance_sheet='TOTAL CURRENT LIABILITIES'))
FROM incomestatement2018
GROUP BY year)  AS current_ratio,


(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2018
	 WHERE balance_sheet='total_liabilities_and_shareholders_equity')/
	 (SELECT SUM(amount)
	  FROM balancesheet2018
	  WHERE balance_sheet='share_holders_equity')) 
FROM incomestatement2018
GROUP BY year) AS debt_ratio,
		
       year 
FROM incomestatement2018
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year

		UNION ALL

SELECT 'total' AS company, 
       (SELECT SUM(amount) AS total_amount
FROM incomestatement2017
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation'))/ 
		(SELECT amount FROM incomestatement2018 WHERE TRIM(income_statement) = 'Revenue') AS gross_profit_margin,
(SELECT
(SELECT SUM(amount) AS tot_amt
FROM incomestatement2017
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM incomestatement2017
  WHERE TRIM(income_statement) = 'Revenue') 
FROM incomestatement2017
GROUP BY Year) AS net_profit_margin	
	,
	
		(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2017
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2017
	  WHERE balance_sheet='TOTAL ASSETS'))AS ROAs
FROM incomestatement2017
GROUP BY year) AS ROA,

		(SELECT 
	((SELECT SUM(amount)
	 FROM incomestatement2017
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM balancesheet2017
	  WHERE balance_sheet='share_holders_equity'))
FROM incomestatement2017
GROUP BY year) AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2017
	 WHERE balance_sheet='TOTAL CURRENT ASSETS')/
	 (SELECT SUM(amount)
	  FROM balancesheet2017
	  WHERE balance_sheet='TOTAL CURRENT LIABILITIES'))
FROM incomestatement2017
GROUP BY year)  AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM balancesheet2017
	 WHERE balance_sheet='total_liabilities_and_shareholders_equity')/
	 (SELECT SUM(amount)
	  FROM balancesheet2017
	  WHERE balance_sheet='share_holders_equity')) 
FROM incomestatement2017
GROUP BY year) AS debt_ratio,

       year 
FROM incomestatement2017
WHERE TRIM(income_statement) IN ('Revenues from sales', 'Purchases, net of inventory variation')
GROUP BY year

UNION ALL


SELECT 'Exxon' AS company, '64302' / (
    SELECT amount
    FROM exxonincomestatement2021
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, 
(SELECT
(SELECT SUM(amount) AS tot_amt
FROM exxonincomestatement2021
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM exxonincomestatement2021
  WHERE TRIM(income_statement) = 'Revenue') 
FROM exxonincomestatement2021
GROUP BY Year) AS net_profit_margin	
	,

		(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2021
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2021
	  WHERE balance_sheet='Total assets'))AS ROAs
FROM exxonincomestatement2021
GROUP BY year) AS ROA,
	
	(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2021
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2021
	 WHERE balance_sheet='Total equity')) AS ROE
FROM exxonincomestatement2021
GROUP BY year)  AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2021
	 WHERE balance_sheet='Total current assets')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2021
	  WHERE balance_sheet='Total current liabilities'))
FROM exxonincomestatement2021
GROUP BY year) AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2020
	 WHERE balance_sheet='Total liabilities')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2020
	  WHERE balance_sheet='Total equity'))
FROM exxonincomestatement2020
GROUP BY year) AS debt_ratio,

	
	year
FROM exxonincomestatement2021
GROUP BY year

UNION ALL

SELECT 'Exxon' AS company, '30942' / (
    SELECT amount
    FROM exxonincomestatement2020
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, 

(SELECT
(SELECT SUM(amount) AS tot_amt
FROM exxonincomestatement2020
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM exxonincomestatement2020
  WHERE TRIM(income_statement) = 'Revenue') 
FROM exxonincomestatement2020
GROUP BY Year) AS net_profit_margin	,

		(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2020
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2020
	  WHERE balance_sheet='Total assets'))AS ROAs
FROM exxonincomestatement2020
GROUP BY year) AS ROA,
	
	(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2020
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2020
	 WHERE balance_sheet='Total equity')) AS ROE
FROM exxonincomestatement2020
GROUP BY year)  AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2020
	 WHERE balance_sheet='Total current assets')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2020
	  WHERE balance_sheet='Total current liabilities'))
FROM exxonincomestatement2020
GROUP BY year) AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2020
	 WHERE balance_sheet='Total liabilities')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2020
	  WHERE balance_sheet='Total equity'))
FROM exxonincomestatement2020
GROUP BY year) AS debt_ratio,

	
year
FROM exxonincomestatement2020
GROUP BY year


UNION ALL


SELECT 'Exxon' AS company, '53786' / (
    SELECT amount
    FROM exxonincomestatement2019
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, 

(SELECT
(SELECT SUM(amount) AS tot_amt
FROM exxonincomestatement2019
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM exxonincomestatement2019
  WHERE TRIM(income_statement) = 'Revenue') 
FROM exxonincomestatement2019
GROUP BY Year) AS net_profit_margin	,

	(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2019
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2019
	  WHERE TRIM(balance_sheet)='Total assets'))AS ROAs
FROM exxonincomestatement2019
GROUP BY year) AS ROA,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2019
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2019
	 WHERE TRIM(balance_sheet)='Total equity')) 
FROM exxonincomestatement2019
GROUP BY year)  AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2019
	 WHERE TRIM(balance_sheet)='Total current assets')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2019
	  WHERE TRIM(balance_sheet)='Total current liabilities'))
FROM exxonincomestatement2019
GROUP BY year) AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2019
	 WHERE TRIM(balance_sheet)='Total liabilities')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2019
	  WHERE TRIM(balance_sheet)='Total equity'))
FROM exxonincomestatement2021
GROUP BY year) AS debt_ratio,

	
year
FROM exxonincomestatement2019
GROUP BY year


UNION ALL


SELECT 'Exxon' AS company, '64965' / (
    SELECT amount
    FROM exxonincomestatement2018
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, 

(SELECT
(SELECT SUM(amount) AS tot_amt
FROM exxonincomestatement2018
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM exxonincomestatement2018
  WHERE TRIM(income_statement) = 'Revenue') 
FROM exxonincomestatement2018
GROUP BY Year) AS net_profit_margin	,

	(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2018
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2018
	  WHERE balance_sheet='Total assets'
	 ))AS ROAs
FROM exxonincomestatement2018
GROUP BY year) AS ROA,

		(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2018
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2018
	 WHERE balance_sheet='Total equity')) 
FROM exxonincomestatement2018
GROUP BY year)  AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2018
	 WHERE balance_sheet='Total current assets')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2018
	  WHERE balance_sheet='Total current liabilities'))
FROM exxonincomestatement2018
GROUP BY year) AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2018
	 WHERE balance_sheet='Total liabilities')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2018
	  WHERE balance_sheet='Total equity'))
FROM exxonincomestatement2018
GROUP BY year) AS debt_ratio,


year
FROM exxonincomestatement2018
GROUP BY year

UNION ALL

SELECT 'Exxon' AS company, '53352' / (
    SELECT amount
    FROM exxonincomestatement2017
    WHERE TRIM(income_statement) = 'Revenue'
) AS gross_profit_margin, 

(SELECT
(SELECT SUM(amount) AS tot_amt
FROM exxonincomestatement2017
WHERE income_statement='net_income')/(SELECT SUM(amount) AS tot_rev
  FROM exxonincomestatement2017
  WHERE TRIM(income_statement) = 'Revenue') 
FROM exxonincomestatement2017
GROUP BY Year) AS net_profit_margin,

		(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2017
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2017
	  WHERE balance_sheet='Total assets'))AS ROAs
FROM exxonincomestatement2017
GROUP BY year) AS ROA,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonincomestatement2017
	 WHERE income_statement='net_income')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2017
	 WHERE balance_sheet='Total equity')) 
FROM exxonincomestatement2017
GROUP BY year)  AS ROE,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2017
	 WHERE balance_sheet='Total current assets')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2017
	  WHERE balance_sheet='Total current liabilities'))
FROM exxonincomestatement2017
GROUP BY year) AS current_ratio,

(SELECT 
	((SELECT SUM(amount)
	 FROM exxonbalancesheet2017
	 WHERE balance_sheet='Total liabilities')/
	 (SELECT SUM(amount)
	  FROM exxonbalancesheet2017
	  WHERE balance_sheet='Total equity'))
FROM exxonincomestatement2017
GROUP BY year) AS debt_ratio,

year
FROM exxonincomestatement2017
GROUP BY year;

	


