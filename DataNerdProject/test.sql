SELECT COUNT(*) FROM company_dim;
SELECT COUNT(*) FROM skills_dim;
SELECT COUNT(*) FROM job_postings_fact;
SELECT COUNT(*) FROM skills_job_dim;

SELECT job_posted_date FROM job_postings_fact
LIMIT 100;

SELECT 
    '2023-01-15'::DATE,
    '123':: INTEGER,
    'TRUE'::BOOLEAN,
    '3.14'::REAL; 


SELECT 
    job_title_short AS TITLE,
    job_location AS LOCATION,
    job_posted_date AS POSTED_DATE
FROM job_postings_fact
WHERE job_location LIKE '%India%'
GROUP BY job_title_short, job_location, job_posted_date
ORDER BY job_title_short;

SELECT 
    job_title_short AS TITLE,
    job_location AS LOCATION,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST' AS POSTED_DATE
FROM job_postings_fact
LIMIT 5;


SELECT
    COUNT(job_id) AS total_jobs,
    EXTRACT(MONTH from job_posted_date) AS tot_month
FROM job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    tot_month
ORDER BY
    total_jobs ASC;



Practice problem 1:

SELECT AVG(salary_year_avg), AVG(salary_hour_avg), job_schedule_type

FROM job_postings_fact

WHERE job_posted_date > '2023-06-01'

GROUP BY job_schedule_type;

Practice problem 2:

SELECT
    COUNT(job_id) AS total_jobs,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS job_month

FROM job_postings_fact
GROUP BY job_month
ORDER BY job_month;

Practice problem 3:

SELECT
    SPLIT_PART(job_via, ' ', 2) AS company_name
--    EXTRACT(MONTH from job_posted_date) AS job_month
FROM job_postings_fact
WHERE EXTRACT(MONTH from job_posted_date) IN (4, 5, 6) 
    AND job_health_insurance = TRUE;


--option AND job_posted_date > '2023-04-01' AND job_posted_date < '2023-06-30'

--CASE WHEN problem

SELECT
    COUNT(job_id) AS total_jobs,
    CASE
        WHEN salary_year_avg < 60000 THEN 'Low Salary'
        WHEN salary_year_avg BETWEEN 60000 AND 100000 THEN 'medium Salary'
        ELSE 'High Salary'
    END AS salary_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY salary_category
ORDER BY salary_category;



SELECT skill_id, COUNT(*) AS total
FROM skills_job_dim
GROUP BY skill_id
ORDER BY total DESC
LIMIT 5;


SELECT 
    s.skills,
    sub.total
FROM skills_dim AS s
JOIN (
    SELECT skill_id, COUNT(*) AS total
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY total DESC
    LIMIT 5
) AS sub
ON s.skill_id = sub.skill_id
ORDER BY sub.total DESC;

SELECT company_id, COUNT(*) AS total_jobs
FROM job_postings_fact
GROUP BY company_id
ORDER BY total_jobs DESC;

SELECT 
    c.name,
    com.total_jobs,
    CASE
        WHEN com.total_jobs < 10 THEN 'small'
        WHEN com.total_jobs >= 10 AND com.total_jobs < 50 THEN 'medium'
        ELSE 'large'
    END AS company_size
FROM company_dim AS c
JOIN (
    SELECT company_id, COUNT(*) AS total_jobs
    FROM job_postings_fact
    GROUP BY company_id
    ORDER BY total_jobs DESC
) AS com
ON c.company_id = com.company_id
ORDER BY total_jobs DESC



SELECT 
    sj.skill_id,
    s.skills,
    s.type
FROM job_postings_fact j
LEFT JOIN skills_job_dim AS sj
ON j.job_id = sj.job_id
LEFT JOIN skills_dim AS s
ON sj.skill_id = s.skill_id
WHERE j.salary_year_avg > 70000 AND EXTRACT(MONTH FROM j.job_posted_date) IN (1, 2, 3)
AND EXTRACT(YEAR from j.job_posted_date) = 2023
ORDER BY j.job_posted_date DESC;
