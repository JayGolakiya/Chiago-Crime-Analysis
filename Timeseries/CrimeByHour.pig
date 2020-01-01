crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray,nu:chararray,ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

select = FOREACH crime GENERATE ID,PrimaryType,FLATTEN(STRSPLIT(Date,' ',3)) AS (Date:chararray,Time:chararray,Ampm:chararray),Year;

select1 = FOREACH select GENERATE ID,PrimaryType,Date,FLATTEN(STRSPLIT(Time,':',3)) AS (Hour:chararray,Min:chararray,Sec:chararray),Ampm,Year;

select2 = FOREACH select1 GENERATE CONCAT(Hour,Ampm) AS (HA:chararray),1 as no;

grps = GROUP select2 BY HA;

count = FOREACH grps GENERATE group,SUM(select2.no);

dump count

STORE count INTO '/user/data/CrimeByHour' using PigStorage(',');


