create database facebook;
use facebook;
show tables;
select * from facebook_data;


-- KPI
SELECT CONCAT(ROUND(SUM(`Total Cost (Expression)`) / 10000, 2), 'M') AS Total_Cost,
ROUND(SUM(`Total Page Likes (Expression)`), 0) AS Total_Page_Likes,
ROUND(SUM(`Total Post Reactions (Expression)`), 0) AS Total_Post_Interactions,
CONCAT(ROUND(SUM(`Total People Reached (Expression)`) / 1000000, 2), 'M') AS Total_People_Reached,
CONCAT(ROUND(SUM(`Total Impressions (Expression)`) / 1000000, 2), 'M') AS Total_Impressions,
ROUND(SUM(`Total Link Clicks (Expression)`), 0) AS Total_Link_Clicks from facebook_data;

-- 1. Marketing performance
SELECT
    DATE_FORMAT(ReportDate, '%b') AS Month,
    ROUND(SUM(`Total Cost (Expression)`), 2) AS Total_Cost,
    ROUND(SUM(`Total Impressions (Expression)`), 0) AS Impressions,
    ROUND(SUM(`Total People Reached (Expression)`), 0) AS Reach
FROM facebook_data
GROUP BY DATE_FORMAT(ReportDate, '%b')
ORDER BY MIN(ReportDate);

-- 2. Top 5 AD set by roas
SELECT`Ad Set Name`,
    ROUND(SUM(`Total Website Purchases Value (Expression)`) / NULLIF(SUM(`Total Cost (Expression)`), 0), 2) AS ROAS
FROM facebook_data
GROUP BY `Ad Set Name`
ORDER BY ROAS DESC
LIMIT 5;

-- 3. Daily Performance
SELECT
    ReportDate,
    ROUND(SUM(`Total Cost (Expression)`), 2) AS TotalCost,
    ROUND(SUM(`Total Website Leads (Expression)`) / NULLIF(SUM(`Total Link Clicks (Expression)`), 0) * 100, 2) AS ConversionRate
FROM facebook_data
GROUP BY ReportDate
ORDER BY ReportDate;

-- 4. Age group wise social interactions
SELECT `Age Group`,
    ROUND(SUM(`Total Social Interactions (Expression)`), 0) AS TotalSocialInteractions
FROM facebook_data
GROUP BY `Age Group`
ORDER BY TotalSocialInteractions DESC;

-- 5. Cost VS Roas
SELECT
    ROUND(SUM(`Total Cost (Expression)`), 2) AS TotalCost,
    ROUND(SUM(`Total Website Purchases Value (Expression)`) / NULLIF(SUM(`Total Cost (Expression)`), 0), 2) AS ROAS
FROM facebook_data;



SELECT `Campaign Name`,
    ROUND(SUM(`Total Cost (Expression)`), 2) AS TotalCost,
    ROUND(SUM(`Total Impressions (Expression)`), 0) AS TotalImpressions,
    ROUND(SUM(`Total Link Clicks (Expression)`), 0) AS TotalLinkClicks,
    ROUND(SUM(`Total Website Leads (Expression)`), 0) AS TotalLeads,
    ROUND(SUM(`Total Website Purchases (Expression)`), 0) AS TotalPurchases,
    ROUND(SUM(`Total Website Purchases Value (Expression)`), 2) AS PurchaseValue,
    ROUND(SUM(`Total Website Purchases Value (Expression)`) / NULLIF(SUM(`Total Cost (Expression)`), 0), 2) AS ROAS
FROM facebook_data
GROUP BY `Campaign Name`
ORDER BY ROAS DESC;

select count(gender) from facebook_data;