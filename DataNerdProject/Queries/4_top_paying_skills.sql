

/*
Question - What are the top skills required for the highest paying Data Engineer jobs?
- Join tables similar to query 3
- 

*/


SELECT 
    skills,
    ROUND(AVG(j.salary_year_avg), 0) AS salary_avg

FROM job_postings_fact j 

INNER JOIN skills_job_dim s ON j.job_id = s.job_id
INNER JOIN skills_dim sd ON s.skill_id = sd.skill_id

WHERE j.job_title_short = 'Data Engineer'
AND j.salary_year_avg IS NOT NULL
-- AND j.job_work_from_home = TRUE

GROUP BY skills

ORDER BY salary_avg DESC

LIMIT 25;



/*
Here is the breakdown of the results of the query we wrote
[
  {
    "skills": "node",
    "salary_avg": "181862"
  },
  {
    "skills": "mongo",
    "salary_avg": "179403"
  },
  {
    "skills": "ggplot2",
    "salary_avg": "176250"
  },
  {
    "skills": "solidity",
    "salary_avg": "166250"
  },
  {
    "skills": "vue",
    "salary_avg": "159375"
  },
  {
    "skills": "codecommit",
    "salary_avg": "155000"
  },
  {
    "skills": "ubuntu",
    "salary_avg": "154455"
  },
  {
    "skills": "clojure",
    "salary_avg": "153663"
  },
  {
    "skills": "cassandra",
    "salary_avg": "150255"
  },
  {
    "skills": "rust",
    "salary_avg": "147771"
  },
  {
    "skills": "drupal",
    "salary_avg": "147500"
  },
  {
    "skills": "perl",
    "salary_avg": "145540"
  },
  {
    "skills": "next.js",
    "salary_avg": "145000"
  },
  {
    "skills": "angular",
    "salary_avg": "143319"
  },
  {
    "skills": "scala",
    "salary_avg": "143161"
  },
  {
    "skills": "kafka",
    "salary_avg": "143086"
  },
  {
    "skills": "gdpr",
    "salary_avg": "142369"
  },
  {
    "skills": "shell",
    "salary_avg": "141725"
  },
  {
    "skills": "macos",
    "salary_avg": "141617"
  },
  {
    "skills": "numpy",
    "salary_avg": "141605"
  },
  {
    "skills": "opencv",
    "salary_avg": "141250"
  },
  {
    "skills": "atlassian",
    "salary_avg": "140644"
  },
  {
    "skills": "ibm cloud",
    "salary_avg": "140547"
  },
  {
    "skills": "splunk",
    "salary_avg": "140156"
  },
  {
    "skills": "kubernetes",
    "salary_avg": "140092"
  }
]

Specialized/niche skills command the highest salaries: Node ($181.9K), MongoDB ($179.4K), and ggplot2 ($176.3K) top the list.
Modern engineering & cloud technologies are strongly represented: Kafka, Kubernetes, Shell, Cassandra, Scala, and IBM Cloud all appear in the top 25, showing the value of scalable data infrastructure skills.
The salary premium isn't limited to traditional DE tools: Skills like Solidity, Vue, Rust, Angular, Next.js, and OpenCV also rank highly, suggesting that broader software-engineering skills can correlate with higher-paying Data Engineer roles.
*/