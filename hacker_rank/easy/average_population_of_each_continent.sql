-- https://www.hackerrank.com/challenges/average-population-of-each-continent
SELECT
    country.continent,
    ROUND(AVG(city.population), 0)
FROM
    city
    INNER JOIN country ON city.countrycode = country.code
GROUP BY
    country.continent