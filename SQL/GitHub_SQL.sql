CREATE TABLE github_trending_repos (
    owner TEXT,
    repo_name TEXT,
    full_name TEXT,
    description TEXT,
    language VARCHAR(50),
    stars INTEGER,
    forks INTEGER,
    stars_period INTEGER,
    contributors_count INTEGER,
    url TEXT,
    search_language VARCHAR(50),
    timeframe VARCHAR(20),
    scraped_at TIMESTAMP,

    -- for values like 34:14.5

);



select * from github_trending_repos;



-- 📊 GitHub Trending Repositories Analytics
-- Table: github_trending_repos

-- 1️⃣ Top 10 repositories by total stars
SELECT full_name, stars
FROM github_trending_repos
ORDER BY stars DESC
LIMIT 10;


-- 2️⃣ Top 10 repositories by forks
SELECT full_name, forks
FROM github_trending_repos
ORDER BY forks DESC
LIMIT 10;


-- 3️⃣ Top trending repositories by stars gained in period
SELECT full_name, stars_period
FROM github_trending_repos
ORDER BY stars_period DESC
LIMIT 10;


-- 4️⃣ Most popular programming languages
SELECT language, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY language
ORDER BY repo_count DESC;


-- 5️⃣ Average stars per language
SELECT language, ROUND(AVG(stars), 2) AS avg_stars
FROM github_trending_repos
GROUP BY language
ORDER BY avg_stars DESC;


-- 6️⃣ Repositories with highest contributor count
SELECT full_name, contributors_count
FROM github_trending_repos
ORDER BY contributors_count DESC
LIMIT 10;


-- 7️⃣ High-star repositories with low contributors (maintenance risk)
SELECT full_name, stars, contributors_count
FROM github_trending_repos
WHERE stars > 10000 AND contributors_count < 5
ORDER BY stars DESC;


-- 8️⃣ Underrated repositories (low stars, high growth)
SELECT full_name, stars, stars_period
FROM github_trending_repos
WHERE stars < 5000
ORDER BY stars_period DESC
LIMIT 10;


-- 9️⃣ Community engagement score
SELECT full_name,
       (stars + forks + contributors_count) AS engagement_score
FROM github_trending_repos
ORDER BY engagement_score DESC
LIMIT 10;


-- 🔟 Language-wise total stars
SELECT language, SUM(stars) AS total_stars
FROM github_trending_repos
GROUP BY language
ORDER BY total_stars DESC;


-- 1️⃣1️⃣ Top repository per language
SELECT DISTINCT ON (language)
       language, full_name, stars
FROM github_trending_repos
ORDER BY language, stars DESC;


-- 1️⃣2️⃣ Most recently scraped repositories
SELECT full_name, scraped_at
FROM github_trending_repos
ORDER BY scraped_at DESC
LIMIT 10;


-- 1️⃣3️⃣ Timeframe-wise trending analysis
SELECT timeframe, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY timeframe
ORDER BY repo_count DESC;


-- 1️⃣4️⃣ Search language vs actual language mismatch
SELECT search_language, language, COUNT(*) AS repo_count
FROM github_trending_repos
GROUP BY search_language, language
ORDER BY repo_count DESC;


-- 1️⃣5️⃣ Repositories with above-average stars
SELECT full_name, stars
FROM github_trending_repos
WHERE stars > (SELECT AVG(stars) FROM github_trending_repos)
ORDER BY stars DESC;
