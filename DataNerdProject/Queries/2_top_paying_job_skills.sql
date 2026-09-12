/*
Question - What are the skills required for highest paying Data Engineer jobs?
- Use the top 10 highest paying Data Engineer jobs from the first query
- Add the skills required for each of these jobs by joining the skills_job_dim and skills_dim tables,
  helping job seekers understand the skills that are in demand for high-paying Data Engineer positions.
*/

WITH top_jobs AS (
    SELECT 
        j.job_id, 
        j.job_title_short, 
        j.salary_year_avg,
        c.name AS company_name

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

    LIMIT 10
)

SELECT 
    top_jobs.*,
    sd.skills 
FROM top_jobs
INNER JOIN skills_job_dim AS s ON top_jobs.job_id = s.job_id
INNER JOIN skills_dim AS sd ON s.skill_id = sd.skill_id
ORDER BY top_jobs.salary_year_avg DESC;


/*
Here is a skill breakdown after analyzing the top 10 highest paying Data Engineer jobs:

Python appeared in 7/10 (70%) of the top-paying Data Engineer jobs.
Spark appeared in 5/10 (50%) of the jobs.
Hadoop, Kafka, and Scala each appeared in 3/10 (30%) of the jobs.
Pandas, PySpark, and NumPy each appeared in 2/10 (20%) of the jobs.
SQL, Kubernetes, and Databricks each appeared in 2/10 (20%) of the jobs.
AWS, Azure, and GCP each appeared in 1/10 (10%) of the jobs.

[
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_name": "Durlston Partners",
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "251000.0",
    "company_name": "Twitch",
    "skills": "pytorch"
  },
  {
    "job_id": 561728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "AI Startup",
    "skills": "azure"
  },
  {
    "job_id": 543728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 595768,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_name": "Signify Technology",
    "skills": "spark"
  },
  {
    "job_id": 204320,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Handshake",
    "skills": "go"
  },
  {
    "job_id": 151972,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "245000.0",
    "company_name": "Movable Ink",
    "skills": "gcp"
  },
  {
    "job_id": 2446,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "sql"
  },
  {
    "job_id": 2446,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "python"
  },
  {
    "job_id": 2446,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "java"
  },
  {
    "job_id": 2446,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "242000.0",
    "company_name": "Meta",
    "skills": "perl"
  }
]
*/