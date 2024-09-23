--4.1
/* no because it violates the foreign key contraint and a 1 to M relationship */

--4.2
/* no becasue "income" violates the foreign key contraint and '80' is invalid */

--4.3
/* The ChatGPT responses are pretty good but not perfect */

--4.4 
/* ER diagram downloaded from PgAdmin */ 

--4.5 
/* ChatGPT can recognize the ER diagram and provided a breakdown */

--4.6 
/* it worked! District of Columbia, 2019 */
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
SELECT 
recent_data.year AS recent_year, 
recent_data.pop AS recent_population,
old_data.year AS five_years_ago,
old_data.pop AS population_five_years_ago, 
((recent_data.pop - old_data.pop) / old_data.pop) * 1 
FROM 
(SELECT pop, year
FROM population
WHERE fips = '51'
ORDER BY year DESC
LIMIT 1) AS recent_data 
JOIN 
(SELECT pop, year
FROM population
WHERE fips = '51'
ORDER BY year DESC 
OFFSET 5
LIMIT 1) AS old_data
ON 1 = 1;
/* I modified the prompt to give a more accurate guidline */ 

--4.8 
/* ChatGPT gives accurate responses most of the time. Sometimes the prompt needs to be altered in order to answer the question fully */ 
