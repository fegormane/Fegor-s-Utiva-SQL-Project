-- 3 years, profit, anglophone and francophone--
SELECT DISTINCT (years)
FROM breweries;

SELECT DISTINCT (countries)
FROM breweries;

SELECT SUM(profit) AS sum_of_profit
FROM breweries;

--total profit between anglophone and francophone--
SELECT SUM(profit), 
CASE
	WHEN countries = 'Senegal' THEN 'Francophone'
	WHEN countries = 'Nigeria' THEN 'Anglophone'
	WHEN countries = 'Ghana' THEN 'Anglophone'
	WHEN countries = 'Benin' THEN 'Francophone'
	WHEN countries = 'Togo' THEN 'Francophone'
	ELSE 'Unknown'
	END AS territories
FROM breweries
GROUP BY 2
ORDER BY 1 DESC;

SELECT countries, 
CASE
	WHEN countries = 'Senegal' THEN 'Francophone'
	WHEN countries = 'Nigeria' THEN 'Anglophone'
	WHEN countries = 'Ghana' THEN 'Anglophone'
	WHEN countries = 'Benin' THEN 'Francophone'
	WHEN countries = 'Togo' THEN 'Francophone'
	ELSE 'Unknown'
	END AS territories
FROM breweries

--Country, highest profit, 2019--
SELECT countries, SUM(profit)
FROM breweries
WHERE years = 2019
GROUP BY 1
ORDER BY 2 DESC;

--year, highest profit--
SELECT years, SUM(profit)
FROM breweries
GROUP BY 1
ORDER BY 2 DESC;

--month, least profit--
SELECT months, SUM(profit)
FROM breweries
GROUP BY 1
ORDER BY 2 ASC;

--min profit, dec 2018--
SELECT months, years, profit
FROM breweries
WHERE months = 'December' AND years = 2018
ORDER BY 3 ASC;

--compare profit in percentage for each month in 2019--
SELECT months, profit_per_month, 
(profit_per_month * 100.00)/ 
	(SELECT SUM(profit)
	FROM breweries
	WHERE years = 2019) AS percent_profit
	FROM
	(SELECT months, SUM(profit) AS profit_per_month
	FROM breweries
	WHERE years = 2019
	GROUP BY 1
	ORDER BY 2) sub1;

SELECT SUM(profit)
FROM breweries
WHERE years = 2019;

/*
percentage = profit_jan/total_profit * 100
*/

--Brand, highest_profit, Senegal--
SELECT brands, SUM(profit), countries
FROM breweries
WHERE countries = 'Senegal'
GROUP BY 1, 3
ORDER BY 2 DESC;

--2 years, top 3 brands, francophone--
SELECT brands, SUM(quantity)
FROM breweries
WHERE years IN (2018, 2019)
AND countries IN ('Benin', 'Togo', 'Senegal')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

--top 2 brand choice in Ghana--
SELECT brands, Sum(quantity)
FROM breweries
WHERE countries = 'Ghana'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--details of beers consumed, 3 years, Nigeria--
SELECT DISTINCT (brands)
FROM breweries;

SELECT DISTINCT (brands)
FROM breweries
WHERE brands NOT LIKE '%malt%';

SELECT brands, countries, quantity, profit
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT LIKE '%malt%';

--favourite malt in Anglophone, 2018 and 2019--
SELECT brands, Sum(quantity)
FROM breweries
WHERE countries IN ('Nigeria', 'Ghana')
AND years IN (2018, 2019)
AND brands LIKE '%malt%'
GROUP BY 1
ORDER BY 2 DESC;

--brands, highest, 2019, Nigeria--
SELECT brands, SUM(quantity)
FROM breweries
WHERE years = 2019
AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

--favourite brand, south-south, Nigeria--
SELECT brands, SUM(quantity)
FROM breweries
WHERE region = 'southsouth'
AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

--beer consumption in Nigeria--
SELECT brands, Sum(quantity)
FROM breweries
WHERE countries = 'Nigeria'
AND brands NOT LIKE '%malt%'
GROUP BY 1
ORDER BY 2 DESC;

--consumption, budweiser, region, Nigeria--
SELECT region, SUM(quantity)
FROM breweries
WHERE brands = 'budweiser'
AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC;

--consumption, budweiser, years, region, Nigeria--
SELECT region, SUM(quantity)
FROM breweries
WHERE brands = 'budweiser'
AND countries = 'Nigeria'
AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;

--country, highest beer consumption--
SELECT countries, brands, SUM(quantity)
FROM breweries
WHERE brands NOT LIKE '%malt'
GROUP BY 1, 2
ORDER BY 3 DESC;

-- highest paid sales_personnel, budweiser, Senegal--
SELECT sales_rep, SUM(quantity)
FROM breweries
WHERE countries = 'Senegal'
AND brands = 'budweiser'
GROUP BY 1
ORDER BY 2 DESC;

--countries, highest profit, 4th quater, 2019--
SELECT countries, SUM(profit)
FROM breweries
WHERE months IN ('October', 'November', 'December')
AND years = 2019
GROUP BY 1
ORDER BY 2 DESC;