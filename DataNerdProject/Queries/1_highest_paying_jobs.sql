/*
Question - What are the top paying Data Engineer jobs?
- Identify the top paying Data Engineer jobs by analyzing the salary information in the job_postings_fact table.
- Exclude job postings where annual salary information is unavailable/null
- Why are we doing this? To understand the salary trends and identify the highest paying Data Engineer positions in the job market.
*/


SELECT 
    job_id, 
    job_title_short, 
    salary_year_avg,
    job_location, 
    job_title, 
    job_schedule_type

FROM job_postings_fact

WHERE
    job_title_short = 'Data Engineer'
    AND
    salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC

LIMIT 10;