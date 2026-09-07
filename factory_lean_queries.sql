SELECT 
    SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS Availability
FROM factory_production_data;

SELECT 
    SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS Performance
FROM factory_production_data;

SELECT SUM(`Good Units`)/SUM(`Total Units Produced`) as Quality
FROM factory_production_data;

SELECT  SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS Availability,
		 SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS Performance,
          SUM(`Good Units`)/SUM(`Total Units Produced`) as Quality,
          (SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
    * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
    * (SUM(`Good Units`) / SUM(`Total Units Produced`)) AS OEE
FROM factory_production_data;



SELECT (SUM(`Scrap Units`)/SUM(`Total Units Produced`)*100) AS Scrap_Rate
FROM factory_production_data;

SELECT SUM(`Total Units Produced` - `Defective Units`)/ SUM(`Total Units Produced`) as First_Pass_Yield 
FROM factory_production_data;

SELECT SUM(`On Time Delivery` = 'Yes') / COUNT(*) * 100 AS On_Time_Delivery
FROM factory_production_data;

SELECT AVG(DATEDIFF(`Actual Delivery`,`Order Date`)) AS Lead_Time
FROM factory_production_data;


SELECT
    SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS availability,
    SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS performance,
    SUM(`Good Units`) / SUM(`Total Units Produced`) AS quality,
    ROUND((SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
        * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
        * (SUM(`Good Units`) / SUM(`Total Units Produced`)),3) AS OEE,
    SUM(`Scrap Units`) / SUM(`Total Units Produced`) * 100 AS scrap_rate,
    SUM(`Total Units Produced` - `Defective Units`) / SUM(`Total Units Produced`) AS FPY,
    SUM(`On Time Delivery` = 'Yes') / COUNT(*) * 100 AS OTD,
    AVG(DATEDIFF(`Actual Delivery`, `Order Date`)) AS avg_lead_time
FROM factory_production_data;

SELECT `Machine` ,
SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS availability,
    SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS performance,
    SUM(`Good Units`) / SUM(`Total Units Produced`) AS quality,
    ROUND((SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
        * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
        * (SUM(`Good Units`) / SUM(`Total Units Produced`)),3) AS OEE,
    SUM(`Scrap Units`) / SUM(`Total Units Produced`) * 100 AS scrap_rate,
    SUM(`Total Units Produced` - `Defective Units`) / SUM(`Total Units Produced`) AS FPY,
    SUM(`On Time Delivery` = 'Yes') / COUNT(*) * 100 AS OTD,
    AVG(DATEDIFF(`Actual Delivery`, `Order Date`)) AS avg_lead_time
    FROM factory_production_data
    GROUP BY `Machine`
    ORDER BY OEE ASC;
    
    SELECT `Downtime Reason`,
       SUM(`Downtime (min)`) AS total_downtime,
       COUNT(*) AS occurrences
FROM factory_production_data
WHERE `Downtime Reason` <> 'None'
GROUP BY `Downtime Reason`
ORDER BY total_downtime DESC;

SELECT `Line`,
SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS availability,
    SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS performance,
    SUM(`Good Units`) / SUM(`Total Units Produced`) AS quality,
    ROUND((SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
        * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
        * (SUM(`Good Units`) / SUM(`Total Units Produced`)),3) AS OEE,
    SUM(`Scrap Units`) / SUM(`Total Units Produced`) * 100 AS scrap_rate,
    SUM(`Total Units Produced` - `Defective Units`) / SUM(`Total Units Produced`) AS FPY,
    SUM(`On Time Delivery` = 'Yes') / COUNT(*) * 100 AS OTD,
    AVG(DATEDIFF(`Actual Delivery`, `Order Date`)) AS avg_lead_time
FROM factory_production_data
GROUP BY `Line`
ORDER BY OEE ASC;

SELECT `Shift`,
SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`) AS availability,
    SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60) AS performance,
    SUM(`Good Units`) / SUM(`Total Units Produced`) AS quality,
    ROUND((SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
        * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
        * (SUM(`Good Units`) / SUM(`Total Units Produced`)),3) AS OEE,
    SUM(`Scrap Units`) / SUM(`Total Units Produced`) * 100 AS scrap_rate,
    SUM(`Total Units Produced` - `Defective Units`) / SUM(`Total Units Produced`) AS FPY,
    SUM(`On Time Delivery` = 'Yes') / COUNT(*) * 100 AS OTD,
    AVG(DATEDIFF(`Actual Delivery`, `Order Date`)) AS avg_lead_time
FROM factory_production_data
GROUP BY `Shift`
ORDER BY OEE ASC;

SELECT 
    YEARWEEK(`Date`) AS year_week,
    ROUND(SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`), 3) AS availability,
    ROUND(SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60), 3) AS performance,
    ROUND(SUM(`Good Units`) / SUM(`Total Units Produced`), 3) AS quality,
    ROUND(
        (SUM(`Run Time (min)`) / SUM(`Planned Production Time (min)`))
        * (SUM(`Total Units Produced` * `Ideal Cycle Time (sec)`) / SUM(`Run Time (min)` * 60))
        * (SUM(`Good Units`) / SUM(`Total Units Produced`))
    , 3) AS OEE
FROM factory_production_data
GROUP BY YEARWEEK(`Date`)
ORDER BY year_week ASC;
