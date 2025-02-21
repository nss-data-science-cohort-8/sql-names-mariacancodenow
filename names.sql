/*
## SQL Names

Save a script containing the query you used to answer each question.

18. Find all names that made their first appearance in the 2010s.

19. Find the names that have not be used the longest.

20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
*/

/*
1. How many rows are in the names table?
1957046
*/

SELECT COUNT(*)
FROM names;

/*
2. How many total registered people appear in the dataset?
351653025
*/

SELECT SUM(num_registered)
FROM names;

/*
3. Which name had the most appearances in a single year in the dataset?
Linda
*/

SELECT *
FROM names
ORDER BY num_registered DESC
LIMIT 1;

/*
4. What range of years are included?
1880-2018
*/

SELECT MIN(year), MAX(year)
FROM names;

/*
5. What year has the largest number of registrations?
1957
*/

SELECT year, SUM(num_registered)
FROM names
GROUP BY year
ORDER BY SUM(num_registered) DESC
LIMIT 1;

/*
6. How many different (distinct) names are contained in the dataset?
98400
*/

SELECT COUNT(DISTINCT name) AS count_distinct_names
FROM names;

/*
7. Are there more males or more females registered?
Males
*/

SELECT gender, SUM(num_registered)
FROM names
GROUP BY gender
ORDER BY SUM(num_registered) DESC
LIMIT 1;

/*
8. What are the most popular male and female names overall (i.e., the most total registrations)?
James (male) and Mary (female)
*/

SELECT name, gender, SUM(num_registered)
FROM names
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC
LIMIT 10;
/* is there a way to show just top M and top F names? */

/*
9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
Jacob (male) and Emily (female)
*/

SELECT name, gender, SUM(num_registered)
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC
LIMIT 10;

/*
10. Which year had the most variety in names (i.e. had the most distinct names)?
2008
*/

SELECT year, COUNT(DISTINCT name) AS distinct_names
FROM names
GROUP BY year
ORDER BY distinct_names DESC
LIMIT 1;

/*
11. What is the most popular name for a girl that starts with the letter X?
Ximena
*/

SELECT name, gender, SUM(num_registered)
FROM names
WHERE name LIKE 'X%' AND gender = 'F'
GROUP BY name, gender
ORDER BY SUM(num_registered) DESC
LIMIT 1;

/*
12. Write a query to find all (distinct) names that start with a 'Q' but whose second letter is not 'u'.
*/

SELECT DISTINCT name
FROM names
WHERE name LIKE 'Q%' AND name NOT LIKE '_u%';

/*
13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
Steven
*/

SELECT name, SUM(num_registered)
FROM names
WHERE name IN ('Stephen', 'Steven')
GROUP BY name
ORDER BY SUM(num_registered) DESC;

/*
14. Find all names that are "unisex" - that is all names that have been used both for boys and for girls.
*/

SELECT name, COUNT(DISTINCT gender)
FROM names
WHERE gender IN ('M', 'F')
GROUP BY name
HAVING COUNT(DISTINCT gender) > 1;

/*
15. Find all names that have made an appearance in every single year since 1880.
*/

SELECT COUNT(DISTINCT year)
FROM names;

SELECT name, COUNT(DISTINCT year)
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 139;
/* is there a way to do this in one query? */

/*
16. Find all names that have only appeared in one year.
*/

SELECT name, COUNT(DISTINCT year)
FROM names
GROUP BY name
HAVING COUNT(DISTINCT year) = 1;

/*
17. Find all names that only appeared in the 1950s.
*/

SELECT DISTINCT name
FROM names
WHERE year BETWEEN 1950 AND 1959; 

SELECT DISTINCT name
FROM names
WHERE year NOT BETWEEN 1950 AND 1959;