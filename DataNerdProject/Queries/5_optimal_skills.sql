/*
Question - What are the most optimal skills to learn
- Identify skills in high demand with high paying Data Engineering jobs
- Find jobs that are remote
*/

WITH Skill_demand AS (
    SELECT 
        sj.skill_id,
        sd.skills,
        COUNT(sj.job_id) AS in_demand_count

    FROM job_postings_fact j

    INNER JOIN skills_job_dim sj
        ON j.job_id = sj.job_id

    INNER JOIN skills_dim sd
        ON sj.skill_id = sd.skill_id

    WHERE j.job_title_short = 'Data Engineer'
      AND j.job_location LIKE 'India'
      AND j.salary_year_avg IS NOT NULL

    GROUP BY 
        sj.skill_id,
        sd.skills
),

average_salary AS (
    SELECT 
        sj.skill_id,
        sd.skills,
        ROUND(AVG(j.salary_year_avg), 0) AS salary_avg

    FROM job_postings_fact j

    INNER JOIN skills_job_dim sj
        ON j.job_id = sj.job_id

    INNER JOIN skills_dim sd
        ON sj.skill_id = sd.skill_id

    WHERE j.job_title_short = 'Data Engineer'
      AND j.salary_year_avg IS NOT NULL
      AND j.job_work_from_home = TRUE

    GROUP BY 
        sj.skill_id,
        sd.skills
)

SELECT 
    skill_demand.skill_id,
    skill_demand.skills,
    skill_demand.in_demand_count,
    average_salary.salary_avg

FROM skill_demand

INNER JOIN average_salary
    ON skill_demand.skill_id = average_salary.skill_id

-- WHERE in_demand_count > 10
ORDER BY in_demand_count DESC, 
         salary_avg DESC

LIMIT 25;