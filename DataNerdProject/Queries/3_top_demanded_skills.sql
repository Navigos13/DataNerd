/*
Question - What are the skills required for the most in-demand Data Engineer jobs?
- Join tables similar to query 2 
- Identify the top 5 skills required for Data Engineer jobs
- Focus on all job postings
- Why are we doing this? Because it provides valuable insights into the job market for job seekers as well as employers
  looking to hire Data Engineers. By understanding the most sought-after skills, job seekers can tailor their resumes and
  skill development, while employers can better understand the competitive landscape for talent acquisition.
*/



SELECT 
    s.skills,
    COUNT(sj.job_id) AS in_demand_count

FROM job_postings_fact j

LEFT JOIN skills_job_dim AS sj 
ON j.job_id = sj.job_id

LEFT JOIN skills_dim AS s 
ON sj.skill_id = s.skill_id

WHERE 
    j.job_title_short = 'Data Engineer'

GROUP BY 
    s.skills

ORDER BY 
    in_demand_count DESC

LIMIT 5;