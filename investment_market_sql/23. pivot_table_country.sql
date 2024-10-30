WITH
     inv_2011 AS (SELECT country_code AS country,
                         AVG(funding_total) AS avg_funding_2011
                  FROM company
                  WHERE EXTRACT(YEAR FROM founded_at) = 2011
                  GROUP BY country_code),
     inv_2012 AS (SELECT country_code AS country,
                         AVG(funding_total) AS avg_funding_2012
                  FROM company
                  WHERE EXTRACT(YEAR FROM founded_at) = 2012
                  GROUP BY country_code),
     inv_2013 AS (SELECT country_code AS country,
                         AVG(funding_total) AS avg_funding_2013
                  FROM company
                  WHERE EXTRACT(YEAR FROM founded_at) = 2013
                  GROUP BY country_code)
SELECT inv_2011.country,
       inv_2011.avg_funding_2011,
       inv_2012.avg_funding_2012,
       inv_2013.avg_funding_2013
FROM inv_2011
JOIN inv_2012 ON inv_2011.country = inv_2012.country
JOIN inv_2013 ON inv_2012.country = inv_2013.country
ORDER BY inv_2011.avg_funding_2011 DESC