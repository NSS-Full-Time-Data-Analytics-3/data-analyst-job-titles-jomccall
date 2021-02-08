/* #1. How many total rows?*/
SELECT COUNT(*)
FROM da_jobs;

/* #2. Look at first 10 rows.
What company associated with 10th post? (ExxonMobil)*/
SELECT *
FROM da_jobs
LIMIT 10;

/* #3. How many postings are in TN?
How many in either TN or KY?*/
SELECT COUNT(location) AS "TN_Postings"
FROM da_jobs
WHERE location = 'TN';

SELECT COUNT(location)
FROM da_jobs AS "TN_KY_Postings"
WHERE location = 'TN'
OR location = 'KY';

/* #4. How many postings in TN have a star rating above 4?*/
SELECT COUNT(*) AS "TN_O4"
FROM da_jobs
WHERE location = 'TN'
AND star_rating >4;

/* #5. How many postings have rev count btw 500 and 1000?*/
SELECT COUNT(*) 
FROM da_jobs
WHERE review_count BETWEEN 500 AND 1000;

/* #6. Show average star rating by state. Call this "avg_rating".*/
SELECT location AS "state", AVG(star_rating) AS "avg_rating"
FROM da_jobs
GROUP BY location;

/* #7. Select and count unique job titles. (add or remove *COUNT* to show or count)*/
SELECT COUNT(DISTINCT title)
FROM da_jobs;

/* #8. How many unique job titles for CA companies? */
SELECT COUNT(DISTINCT title) AS "CA_UniqueTitles"
FROM da_jobs;

/* #9. Find name of company and avg. star rating for all companies
with more than 5,000 reviews from all locations. How many are there? */
SELECT DISTINCT company, AVG(star_rating) AS "Company_AVGRating"
FROM da_jobs
WHERE review_count <5000
GROUP BY company;

SELECT COUNT(DISTINCT company)
FROM da_jobs
WHERE review_count <5000;

/* #10. Order the query from #9 from highest to lowest avg star rating.
Which company has the highest rating?: There are 12 companies with average ratings of 5:
Acq. Life Cycle MGMT, Alteryx, Assoc. of Un. for Research in Astronomy
Beaver Dam.....*/
SELECT DISTINCT company, AVG(star_rating) AS "Company_AVGRating"
FROM da_jobs
WHERE review_count <5000
GROUP BY company
ORDER BY AVG(star_rating) DESC;

/* #11. Find all job titles containing word "Analyst" how many different titles are there?*/
SELECT DISTINCT(title)
FROM da_jobs
WHERE title LIKE '%Analyst%';

SELECT COUNT(DISTINCT title)
FROM da_jobs
WHERE title LIKE '%Analyst%';

/* #12. How many job titles do not contain either the word "Analyst" or the word "Analytics"?
What word do these positions have in common? */
SELECT DISTINCT(title)
FROM da_jobs
WHERE title NOT LIKE '%Analyst%' OR NOT LIKE '%Analytics%';