/*
Now practice your new skills by combining GROUP BY and ORDER BY with some more aggregate functions!

Make sure to always put the ORDER BY clause at the end of your query. You can't sort values that you haven't calculated yet!
*/

/*
Instructions
- Get the release year and lowest gross earnings per release year.
- Get the language and total gross amount films in each language made.
- Get the country and total budget spent making movies in each country.
- Get the release year, country, and highest budget spent making a film for each year, for each country. Sort your results by release year and country.
- Get the country, release year, and lowest amount grossed per release year per country. Order your results by country and release year.
*/

SELECT release_year, MIN(gross) FROM films GROUP BY (release_year)

SELECT language, SUM(gross) FROM films GROUP BY (language)

SELECT country, SUM(budget) FROM films GROUP BY (country)

SELECT MAX(budget), MAX(release_year) as release_year, MAX(country) as country FROM films GROUP BY release_year, country ORDER BY release_year, country

SELECT MIN(gross), MIN(release_year) as release_year, MIN(country) as country FROM films GROUP BY release_year, country ORDER BY country,release_year