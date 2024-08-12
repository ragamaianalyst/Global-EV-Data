USE Global_EV_Info;

-- Data Cleaning - Global EV Data -- 

SELECT *
FROM global_ev_data;

SELECT *
FROM global_ev_data
WHERE region = 'World';

SELECT *
FROM global_ev_data
WHERE region = 'Rest of the world';

DELETE FROM global_ev_data
WHERE region = 'World';

DELETE FROM global_ev_data
WHERE region = 'Rest of the world';

SELECT region, COUNT(*)
FROM global_ev_data
GROUP BY region;

SELECT parameter, COUNT(*)
FROM global_ev_data
GROUP BY parameter;

-- Data Exploration --

SELECT *
FROM global_ev_data;

SELECT region, COUNT(*)
FROM global_ev_data
WHERE parameter = 'EV stock' 
GROUP BY region;

SELECT region, COUNT(*), AVG(value)
FROM global_ev_data
WHERE parameter = 'EV stock'
AND unit = 'Vehicles' 
GROUP BY region;

SELECT powertrain, COUNT(*)
FROM global_ev_data
GROUP BY powertrain;

SELECT mode, COUNT(*)
FROM global_ev_data
GROUP BY mode;

-- Total EV Sales by Country --
SELECT region, SUM(value) AS total_ev_sales
FROM global_ev_data
WHERE parameter = 'EV sales'
GROUP BY region;

-- Average EV Market Share per Year --
SELECT year, AVG(value)
FROM global_ev_data
WHERE parameter = 'EV stock share'
GROUP BY year
ORDER BY year DESC;

-- Top 5 Countries with Highest EV Market Share in 2023 --
SELECT region, SUM(value) AS market_share
FROM global_ev_data
WHERE parameter = 'EV stock share'
AND year = 2023
GROUP BY region
ORDER BY market_share DESC
LIMIT 5;

-- Total charging points by country --
SELECT region, SUM(value) AS charging_points
FROM global_ev_data
WHERE parameter = 'EV charging points'
GROUP BY region;

-- Yearly Growth of EV Stock in China --
SELECT year, AVG(value) AS stock
FROM global_ev_data
WHERE parameter = 'EV stock'
AND region = 'China'
GROUP BY year
ORDER BY year DESC;

-- Countries with EV Sales Greater than 1 Million --
SELECT region, SUM(value) AS total_ev_sales
FROM global_ev_data
WHERE parameter = 'EV sales'
GROUP BY region
HAVING total_ev_sales > 1000000;
