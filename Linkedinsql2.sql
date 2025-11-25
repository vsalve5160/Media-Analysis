create database linkedin;
use linkedin;
show tables;
select * from linkedin_data;


-- KPI
SELECT CONCAT(ROUND(SUM(Views) / 1000000, 0), ' M') AS Total_Views,
CONCAT(ROUND(SUM(Comments) / 1000, 0), ' K') AS Total_Comments,
CONCAT(ROUND(SUM(Reposts) / 1000, 0), ' K') AS Total_Reposts,
CONCAT(ROUND(SUM(Reactions) / 1000, 0), ' K') AS Total_Reactions FROM linkedin_data;

-- 1. Most engagement posts
SELECT `PostDescription`, `Engagement Rate`
FROM linkedin_data
ORDER BY `Engagement Rate` DESC
LIMIT 3;

-- 2. Best days to post
SELECT `Day Of Week`, AVG(`Engagement Rate`) AS Avg_Engagement
FROM linkedin_data
GROUP BY `Day Of Week`
ORDER BY Avg_Engagement DESC
LIMIT 3;

-- 3. post performming by topic
SELECT `PostTopic`, AVG(`Engagement Rate`) AS Avg_Engagement
FROM linkedin_data
GROUP BY `PostTopic`
ORDER BY Avg_Engagement DESC
LIMIT 3;

-- 4. Month wise followers
SELECT DATE_FORMAT(`ï»¿PostDate`, '%M') AS Month_Name, MAX(Followers) AS Month_Followers
FROM linkedin_data
GROUP BY MONTH(`ï»¿PostDate`), Month_Name
ORDER BY MONTH(`ï»¿PostDate`);

-- 5. Week wise comments
SELECT `Day Of Week`, SUM(Comments) AS Total_Comments
FROM linkedin_data
GROUP BY `Day Of Week`
ORDER BY FIELD(`Day Of Week`,
 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

-- 6. Topic wise reposts
SELECT `PostTopic`, SUM(Reposts) AS Total_Reposts
FROM linkedin_data
GROUP BY `PostTopic`
ORDER BY Total_Reposts DESC;

-- 7. Post length VS Engagement rate
SELECT YEAR(`ï»¿PostDate`) AS Year, SUM(`PostLength`) AS Total_Post_Length,
    SUM(`Engagement Rate`) AS Total_Engagement_Rate
FROM linkedin_data
GROUP BY Year
ORDER BY Year;

SELECT MONTH(`ï»¿PostDate`) AS Month_Number, DATE_FORMAT(`ï»¿PostDate`, '%M') AS Month_Name,
    Sum(`PostLength`) AS Post_Length,
    Sum(`Engagement Rate`) AS Engagement_Rate
FROM linkedin_data
GROUP BY Month_Number, Month_Name
ORDER BY Month_Number;

-- 8. Week wise views
SELECT `Day Of Week`, SUM(Views) AS Total_Views
FROM linkedin_data
GROUP BY `Day Of Week`
ORDER BY FIELD(`Day Of Week`,
 'Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');








select count(views) from linkedin_data;












