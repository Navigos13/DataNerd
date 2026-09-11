/*
Question - What are the top paying Data Engineer jobs?
- Identify the top paying Data Engineer jobs by analyzing the salary information in the job_postings_fact table.
- Exclude job postings where annual salary information is unavailable/null
- Why are we doing this? To understand the salary trends and identify the highest paying Data Engineer positions in the job market.
- Find the name of the company, and the job should be a remote job.
*/


SELECT 
    j.job_id, 
    j.job_title_short, 
    j.salary_year_avg,
    j.job_location,
    c.name AS company_name,
    j.job_title, 
    j.job_schedule_type

FROM job_postings_fact AS j
LEFT JOIN company_dim AS c
ON j.company_id = c.company_id

WHERE
    j.job_title_short = 'Data Engineer'
    AND
    j.salary_year_avg IS NOT NULL
    AND
    j.job_location = 'Anywhere'

ORDER BY j.salary_year_avg DESC

LIMIT 10;