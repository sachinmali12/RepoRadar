4321# 📊 RepoRadar — GitHub Trending Repository Analytics 🚀

RepoRadar is an **end-to-end data analytics project** that analyzes **GitHub trending repositories** to uncover insights about ⭐ popularity, 📈 growth trends, 💻 programming language adoption, and 🧑‍💻 community engagement.

The project demonstrates real-world analytics skills using **Python (Pandas)**, **PostgreSQL (SQL)**, and **Power BI** to transform raw data into actionable insights and interactive dashboards.

---

## 🎯 Project Objectives
- Identify the most popular GitHub repositories using stars and forks
- Analyze trending repositories based on stars gained over time
- Understand programming language popularity and impact
- Evaluate community engagement using contributor metrics
- Build an interactive Power BI dashboard for insights visualization

---

## 📂 Dataset
- Source: Kaggle (GitHub Trending Repositories)
- Format: CSV
- Scope: Repository metadata, popularity metrics, growth indicators, and contribution details

---

## 🛠 Tech Stack
- 📁 Dataset — From kaggle 
- 🐍 Python (Pandas, NumPy) — Data cleaning & analysis  
- 🗄️ PostgreSQL — SQL analytics & querying  
- 📊 Power BI — Interactive dashboards & storytelling  


---



## 📊 RepoRadar – Power BI Dashboards

### 🟦 Page 1: Overview
- Total Repositories, Stars, Forks, Contributors
- Top 10 repositories by stars
- Repository summary table with filters


<p align="center">
  <img src="Power%20BI/img1.jpg" alt="RepoRadar Overview Dashboard" width="900"/>
</p>

---

### 🟩 Page 2: Language Insights
- Repository count by programming language
- Total stars by language
- Average stars per language


<p align="center">
  <img src="Power%20BI/img2.jpg" alt="RepoRadar Overview Dashboard" width="900"/>
</p>

---

## 🧮 SQL Analytics Questions & Queries


1️⃣ Top 10 repositories by total stars
```sql
SELECT full_name, stars
FROM github_trending_repos
ORDER BY stars DESC
LIMIT 10;
```


2️⃣ Top 10 repositories by forks
```sql
SELECT full_name, forks
FROM github_trending_repos
ORDER BY forks DESC
LIMIT 10;
```
3️⃣ Top trending repositories by stars gained in period
```sql
SELECT full_name, stars_period
FROM github_trending_repos
ORDER BY stars_period DESC
LIMIT 10;
```
4️⃣ Most popular programming languages
```sql
SELECT language, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY language
ORDER BY repo_count DESC;
```
5️⃣ Average stars per language
```sql
SELECT language, ROUND(AVG(stars), 2) AS avg_stars
FROM github_trending_repos
GROUP BY language
ORDER BY avg_stars DESC;
```
6️⃣ Repositories with highest contributor count
```sql
SELECT full_name, contributors_count
FROM github_trending_repos
ORDER BY contributors_count DESC
LIMIT 10;
```
7️⃣ High-star repositories with low contributors (maintenance risk)
```sql
SELECT full_name, stars, contributors_count
FROM github_trending_repos
WHERE stars > 10000 AND contributors_count < 5
ORDER BY stars DESC;
```
8️⃣ Underrated repositories (low stars, high growth)
```sql
SELECT full_name, stars, stars_period
FROM github_trending_repos
WHERE stars < 5000
ORDER BY stars_period DESC
LIMIT 10;
```
9️⃣ Community engagement score
```sql
SELECT full_name,
       (stars + forks + contributors_count) AS engagement_score
FROM github_trending_repos
ORDER BY engagement_score DESC
LIMIT 10;
```
🔟 Language-wise total stars
```sql
SELECT language, SUM(stars) AS total_stars
FROM github_trending_repos
GROUP BY language
ORDER BY total_stars DESC;
```
1️⃣1️⃣ Top repository per language
```sql
SELECT DISTINCT ON (language)
       language, full_name, stars
FROM github_trending_repos
ORDER BY language, stars DESC;
```
1️⃣2️⃣ Most recently scraped repositories
```sql
SELECT full_name, scraped_at
FROM github_trending_repos
ORDER BY scraped_at DESC
LIMIT 10;
```
1️⃣3️⃣ Timeframe-wise trending analysis
```sql
SELECT timeframe, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY timeframe
ORDER BY repo_count DESC;
```
1️⃣4️⃣ Search language vs actual language mismatch
```sql
SELECT search_language, language, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY search_language, language
ORDER BY repo_count DESC;
```

1️⃣5️⃣ Repositories with above-average stars
```sql
SELECT full_name, stars
FROM github_trending_repos
WHERE stars > (SELECT AVG(stars) FROM github_trending_repos)
ORDER BY stars DESC;
```





## 🔍 Findings & Insights

- A small number of repositories account for a large share of total GitHub stars, indicating winner-takes-most popularity.
- JavaScript and Python dominate trending repositories in terms of count and total stars.
- Some repositories show high star growth within a short timeframe, highlighting fast-rising open-source projects.
- Several high-star repositories have low contributor counts, which may indicate potential maintenance risks.
- Community engagement is strongly correlated with stars and forks, showing active developer interest.

## 📊 Dashboard Explanation

The insights generated using SQL queries are visualized using an interactive Power BI dashboard with three pages:

- **Overview:** High-level metrics such as total repositories, stars, forks, and contributors.
- **Language Insights:** Comparison of programming languages based on repository count and popularity.
- **Trending & Community:** Analysis of star growth, contributor involvement, and engagement patterns.

The dashboard allows users to filter data by language and timeframe for deeper exploration.


## 💡 Business Use Cases

- Helps developers identify trending open-source projects to contribute to.
- Assists recruiters in spotting high-impact repositories and active communities.
- Enables data analysts to study open-source ecosystem trends.
- Provides insights into language adoption and project growth patterns.


## 🚀 Future Improvements

- Integrate GitHub API for real-time data updates.
- Add issue and pull request analysis.
- Perform time-series analysis on repository growth.
- Automate dashboard refresh using scheduled pipelines.


## 🏁 Conclusion

RepoRadar demonstrates an end-to-end data analytics workflow using Pandas, PostgreSQL, and Power BI. 
The project highlights how structured data analysis and visualization can uncover meaningful insights 
from open-source repository data.
