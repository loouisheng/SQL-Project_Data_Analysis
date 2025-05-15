/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact 
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25


/*
Here's a quick analysis of the trends in the top-paying skills for data analysts, based on the data you provided:

Key Trends and Insights:

High-Paying Programming Languages: Programming languages tend to command higher salaries. 'Swift' and 'Golang' are at the top, indicating strong demand and potentially a smaller supply of professionals with these skills.

Specialized Languages: Some specialized languages like 'Scala', 'Go', and 'Crystal' also have high average salaries. This suggests that expertise in these languages is valuable, possibly due to their use in specific industries or complex applications.

Core Data Analysis Languages: While still well-compensated, core data analysis languages like 'R' and 'Python' appear slightly lower on the list compared to some of the more general-purpose or specialized programming languages. This might reflect their wider adoption, which could balance out supply and demand.

Database Skills: 'NoSQL' and 'T-SQL' are present, highlighting the importance of database management and querying skills in data analyst roles.

Web Development Skills: 'JavaScript' and 'HTML' are on the list, suggesting that some data analyst roles may benefit from or require web development knowledge.

Legacy Technologies: Some older technologies like 'SAS', 'Matlab', 'Pascal', 'VBA' are still present, indicating that there are niches where these skills are still valuable, though generally towards the lower end of the top 25.

Emerging Technologies: The presence of 'GenAI' shows that skills in generative AI are starting to command high salaries, reflecting the growing importance of AI in data analysis.

Scripting and Shell Scripting: 'Shell', 'Bash', and 'PowerShell' are included, emphasizing the value of scripting and automation skills for data analysts.

Compiled Languages: 'C' and 'C++' are also on the list, indicating that strong foundations in compiled languages are still valuable.
*/