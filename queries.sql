-- Find the total number of crimes recorded in the CRIME table
SELECT DISTINCT count(*) from Chicago_Crime_Data;

-- List community areas with per capita income less than 11000.
SELECT COMMUNITY_AREA_NAME from Census_Data where PER_CAPITA_INCOME<11000;

-- List all case numbers for crimes involving minors?
SELECT CASE_NUMBER from Chicago_Crime_Data WHERE upper(PRIMARY_TYPE) like "%MINOR" OR UPPER(DESCRIPTION) like "%MINOR%";

-- List all kidnapping crimes involving a child?(children are not considered minors
-- for the purposes of crime analysis)
SELECT CASE_NUMBER,DESCRIPTION from Chicago_Crime_Data WHERE UPPER(PRIMARY_TYPE) like "%KIDNAPPING%" group by UPPER(PRimary_Type)like "%CHILD%";

-- What kind of crimes were recorded at schools?
SELECT PRIMARY_TYPE,DESCRIPTION,LOCATION_DESCRIPTION from Chicago_Crime_Data WHERE lower(LOCATION_DESCRIPTION) like "%school%";

-- List the average safety score for all types of schools.
SELECT ElementaryMiddleorHighSchool, avg(SAFETY_SCORE) as AVERAGE from Chicago_Public_Schools group by ElementaryMiddleorHighSchool;

-- List 5 community areas with highest % of households below poverty line.
SELECT COMMUNITY_AREA_NAME,PERCENTHOUSEHOLDSBELOWPOVERTY from Census_Data order by PERCENTHOUSEHOLDSBELOWPOVERTY DESC LIMIT 5;

--  Which community area(number) is most crime prone?
select COMMUNITY_AREA_NUMBER ,count(COMMUNITY_AREA_NUMBER)AS Frequency from Chicago_Crime_Data group by COMMUNITY_AREA_NUMBER order by count(COMMUNITY_AREA_NUMBER)DESC LIMIT 1;

-- Use a sub-query to find the name of the community area with highest hardship index
SELECT COMMUNITY_AREA_NAME from Census_Data where HARDSHIP_INDEX=(SELECT max(HARDSHIP_INDEX) from Census_Data);

-- Use a sub-query to determine the Community Area Name with most number
-- of crimes?
SELECT COMMUNITY_AREA_NAME FROM Census_Data where COMMUNITY_AREA_NUMBER=(Select CCD.community_area_number from Chicago_Crime_Data as CCD group by CCD.COMMUNITY_AREA_NUMBER order by count(CCD.COMMunity_area_number));