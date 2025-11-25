create database google;
use google;
show tables;
select * from google_data1;


-- KPI
SELECT CONCAT(ROUND(SUM(Ad_Impressions) / 1000000, 0), ' M') AS Impressions,
       CONCAT(ROUND(SUM(ad_clicks) / 1000000, 1), ' M') AS Clicks,
       ROUND(SUM(`ctr %`), 2) AS `CTR %`,
       CONCAT(ROUND(SUM(ad_cost_usd) / 1000000, 2), 'M') AS total_cost,
       SUM(ad_conversions) AS Conversions,
       CONCAT(ROUND(SUM(`cost per click`) / 1000, 2), ' M') AS `CPC %`,
       CONCAT(ROUND(SUM(`cost per conversion`) / 1000, 2), ' M') AS Cost_per_conversion,
       CONCAT(ROUND(SUM(roas) / 1000, 2), ' M') AS ROAS,
       CONCAT(ROUND(SUM(ad_conversion_value) / 1000, 2), ' M') AS Conversion_value
       from google_data1;
       
-- 10. Yearwise CTR(Click through rate)
SELECT Year, ROUND(sum(`CTR %`), 2) AS `CTR_%`
FROM google_data1
GROUP BY Year
ORDER BY Year;

-- 11. Yearwise cost per conversion
SELECT Year, ROUND(sum(`Cost per Conversion`), 2) AS `Cost_per_Conversion`
FROM google_data1
GROUP BY Year
ORDER BY Year;

-- 12. Monthwise CTR
SELECT `Month Name` AS Month, ROUND(SUM(`CTR %`), 2) AS `CTR_%`
FROM google_data1
GROUP BY `Month Name`
ORDER BY STR_TO_DATE(`Month Name`, '%M');

-- 13. Quarterwise Ad Conversions & Conversion Rate
SELECT CONCAT('Q', Quarter) AS Quarter, SUM(ad_conversions) AS `Ad Conversions`,
    ROUND(Sum(`Conversion Rate %`), 2) AS `Conversion_Rate_%`
FROM google_data1
GROUP BY Quarter
ORDER BY Quarter;


select count(ad_group_id) from google_data1;