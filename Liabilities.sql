-- Active: 1688313602053@@127.0.0.1@5432@total_exxon@total
SET search_path TO total, PUBLIC;

SELECT 
    'total' AS company,
    amount AS total_liabilities,
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL NON-CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2021
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount

UNION ALL

SELECT 
    'total' AS company,
    amount AS total_liabilities,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL NON-CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2020
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount


UNION ALL

SELECT 
    'total' AS company,
    amount AS total_liabilities,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL NON-CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2019
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount



UNION ALL

SELECT 
    'total' AS company,
    amount AS total_liabilities,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL NON-CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2018
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount



UNION ALL

SELECT 
    'total' AS company,
    amount AS total_liabilities,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL NON-CURRENT LIABILITIES'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS non_liab_to_totalliab,
    year
FROM balancesheet2017
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount

		UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'current_liabilities'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
	 
   ((SELECT SUM(amount)
  FROM exxonbalancesheet2021
  WHERE balance_sheet = 'total_liabilities')
- 
(SELECT SUM(amount)
  FROM exxonbalancesheet2021
  WHERE balance_sheet = 'current_liabilities'))

    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE TRIM(balance_sheet) = 'current_liabilities'
     GROUP BY year) AS non_current_liab_to_total_liab,
    year
FROM exxonbalancesheet2021
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount

     UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'current_liabilities'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
	 
   ((SELECT SUM(amount)
  FROM exxonbalancesheet2020
  WHERE balance_sheet = 'total_liabilities')
- 
(SELECT SUM(amount)
  FROM exxonbalancesheet2020
  WHERE balance_sheet = 'current_liabilities'))

    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE TRIM(balance_sheet) = 'current_liabilities'
     GROUP BY year) AS non_current_liab_to_total_liab,
    year
FROM exxonbalancesheet2020
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount


		UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2019
     WHERE balance_sheet = 'current_liabilities'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2019
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
	 
   ((SELECT SUM(amount)
  FROM exxonbalancesheet2019
  WHERE balance_sheet = 'total_liabilities')
- 
(SELECT SUM(amount)
  FROM exxonbalancesheet2019
  WHERE balance_sheet = 'current_liabilities'))

    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2019
     WHERE TRIM(balance_sheet) = 'current_liabilities'
     GROUP BY year) AS non_current_liab_to_total_liab,
    year
FROM exxonbalancesheet2019
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount


		UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE balance_sheet = 'current_liabilities'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
	 
   ((SELECT SUM(amount)
  FROM exxonbalancesheet2018
  WHERE balance_sheet = 'total_liabilities')
- 
(SELECT SUM(amount)
  FROM exxonbalancesheet2018
  WHERE balance_sheet = 'current_liabilities'))

    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE TRIM(balance_sheet) = 'current_liabilities'
     GROUP BY year) AS non_current_liab_to_total_liab,
    year
FROM exxonbalancesheet2018
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount

	UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE balance_sheet = 'current_liabilities'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE balance_sheet = 'total_liabilities'
     GROUP BY year) AS current_liab_to_total_liab,
	 
   ((SELECT SUM(amount)
  FROM exxonbalancesheet2017
  WHERE balance_sheet = 'total_liabilities')
- 
(SELECT SUM(amount)
  FROM exxonbalancesheet2017
  WHERE balance_sheet = 'current_liabilities'))

    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE TRIM(balance_sheet) = 'current_liabilities'
     GROUP BY year) AS non_current_liab_to_total_liab,
    year
FROM exxonbalancesheet2017
WHERE balance_sheet = 'total_liabilities'
GROUP BY year, amount





"Total liabilities"  "Total current 

SELECT * FROM exxonbalancesheet2021;



UPDATE exxonbalancesheet2019
SET balance_sheet = TRIM('total_liabilities')
WHERE TRIM(balance_sheet) = 'Total liabilities';



