--4.1
/* no because it violates the foreign key contraint and a 1 to M relationship */

--4.2
/* no becasue "income" violates the foreign key contraint and '80' is invalid */

--4.3
/* The ChatGPT responses are pretty good but not perfect */

--4.6 
/* it worked! */
SELECT name.name, income.income, income.year
FROM income
JOIN name ON income.fips = name.fips
WHERE income.year = (
    SELECT MAX(year) FROM income
)
ORDER BY income.income DESC
LIMIT 1;

--4.7 
/*prompt: Write your prompt to calculate the VA population growth rate in the past five years.*/ 
SELECT population
FROM population
WHERE fips = '51'
AND year = (SELECT MAX(year) - 5 FROM population)
/* prompt needs to be adjusted */ 
