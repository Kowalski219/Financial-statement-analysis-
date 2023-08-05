-- Active: 1688313602053@@127.0.0.1@5432@total_exxon@public
SET search_path TO total, PUBLIC;

CREATE TABLE total_assets(company TEXT,total_assets NUMERIC,current_asset_to_total_asset NUMERIC,
						  non_current_asset_to_total_asset NUMERIC,year DATE);

INSERT INTO total_assets(company,total_assets,current_asset_to_total_asset,
						  non_current_asset_to_total_asset,year)

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2021
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2021
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount

UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2020
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount


UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2019
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount


UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2018
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount



UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2017
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount

UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2021
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2021
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2021
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount

UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2020
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2020
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2020
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount

UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2020
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2020
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount


UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2019
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2019
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount


UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2018
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2018
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount



UNION ALL

SELECT 
    'total' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS current_asset_to_total_asset,
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL NON-CURRENT ASSETS'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM balancesheet2017
     WHERE balance_sheet = 'TOTAL ASSETS'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM balancesheet2017
WHERE balance_sheet = 'TOTAL ASSETS'
GROUP BY year, amount

UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2021
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2021
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2021
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2021
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount


UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2020
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2020
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2020
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2020
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount

UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
   ( SELECT 
    (SELECT SUM(amount)
     FROM exxonbalancesheet2019
     WHERE TRIM(balance_sheet) = 'Total current assets'
     GROUP BY year)
     /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2019
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year)) AS current_asset_to_total_asset,
	
	(SELECT
	 ((SELECT SUM(amount)
	 FROM exxonbalancesheet2019
	 WHERE TRIM(balance_sheet)= 'Total assets'
	 GROUP BY year) 
     -
	(SELECT SUM(amount)
	 FROM exxonbalancesheet2019
     WHERE TRIM(balance_sheet) = 'Total current assets'
     GROUP BY year)) / 
	 (SELECT SUM(amount)
	 FROM exxonbalancesheet2019
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_assett
	 FROM exxonbalancesheet2019
	 GROUP BY year) AS non_current_asset_to_total_asset
	  
,
    year
FROM exxonbalancesheet2019
WHERE TRIM(balance_sheet) = 'Total assets'
GROUP BY year, amount


UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2018
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2018
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2018
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2018
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount


UNION ALL

SELECT 
    'exxon' AS company,
    amount AS total_assets,
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE balance_sheet = 'Total current assets'
     GROUP BY year) /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE balance_sheet = 'Total assets'
     GROUP BY year) AS current_asset_to_total_asset,
    ((SELECT SUM(amount)
      FROM exxonbalancesheet2017
      WHERE balance_sheet = 'Total assets')
    - 
    (SELECT SUM(amount)
      FROM exxonbalancesheet2017
      WHERE balance_sheet = 'Total current assets'))
    /
    (SELECT SUM(amount)
     FROM exxonbalancesheet2017
     WHERE TRIM(balance_sheet) = 'Total assets'
     GROUP BY year) AS non_current_asset_to_total_asset,
    year
FROM exxonbalancesheet2017
WHERE balance_sheet = 'Total assets'
GROUP BY year, amount;








