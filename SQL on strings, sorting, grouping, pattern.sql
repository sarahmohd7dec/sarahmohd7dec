select * from indian_startup_funding;
-- Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
SELECT sum(amountinusd)from indian_startup_funding where CityLocation like "bengaluru";
-- Write SQL query to sort the table by startup name DESC
select * from indian_startup_funding order by StartupName desc;
-- Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
-- AmountinUSD>380000
select sum(amountinusd) from indian_startup_funding where CityLocation like "bengaluru" and AmountinUSD>380000;
-- Write SQL query to get all CityLocations that has an AmountinUSD >380000
select CityLocation from indian_startup_funding where AmountinUSD>380000;
-- Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
select DISTINCT CityLocation from indian_startup_funding where AmountinUSD>380000;

--  Write SQL query to get all StartupNames where AmountinUSD<380000
select StartupName from indian_startup_funding where AmountinUSD<380000;
-- - Write SQL query to sort the output from the previous question DESC
select StartupName from indian_startup_funding where AmountinUSD<380000 order by StartupName desc;
-- Write SQL query to get the City location that has the maximum funding amount
select CityLocation from indian_startup_funding where AmountinUSD=(select max(AmountinUSD) from indian_startup_funding);
-- Write SQL query to get the total funding AmountinUSD for each IndustryVertical
select upper(IndustryVertical),sum(AmountinUSD) from indian_startup_funding group by upper(IndustryVertical);
-- Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with 
-- letter “A”
SELECT IndustryVertical,sum(amountinUsd) from indian_startup_funding group by IndustryVertical HAVING upper(IndustryVertical) like "A%";
-- 0r
select IndustryVertical, sum(AmountinUSD) from indian_startup_funding
where upper(industryvertical) like 'A%'
group by IndustryVertical
order by IndustryVertical desc;
--  Write SQL query to count all the start_ups in the Education field
select DISTINCT count(StartupName)from indian_startup_funding where IndustryVertical like "%Education%";
-- Write SQL query to count all the start_Ups in the E-Commerce field
select count(StartupName)from indian_startup_funding where upper(IndustryVertical) like "E%COMM%";
-- Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals
-- “Bengaluru”
SELECT count(StartupName)from indian_startup_funding where upper(IndustryVertical) like "E%COMM%" and upper(CityLocation) like "BENGALURU";
-- For each Industry Vertical find the total funding amount
select upper(IndustryVertical)as Industry,sum(AmountinUSD)as TotalFund from indian_startup_funding  group by upper(IndustryVertical);
-- For each Industry Vertical find the total funding amount as “Total_fund” and the average
-- amount as “Avg_Fund”.
SELECT upper(IndustryVertical)as Industry,sum(AmountinUSD)as TotalFund,avg(AmountinUSD)as Avg_Fund from indian_startup_funding  group by upper(IndustryVertical);
-- Write SQL query to get the minimum value of funding for the “Uniphore” start_up
SELECT min(AmountinUSD) from indian_startup_funding where StartupName like "Uniphore";
--  Write SQL query to get the length of the city location names
select CityLocation, length(CityLocation) from indian_startup_funding;
--  Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
select(CASE WHEN CAST(AmountinUSD AS INT)>380000 THEN upper(StartupName) ELSE StartupName END)a ,AmountinUSD from indian_startup_funding order by StartupName;
-- Write SQL query to select distinct industry vertical names, knowing that names are mix of 
-- lowercase and uppercase values
select distinct upper(IndustryVertical) from indian_startup_funding order by IndustryVertical;




