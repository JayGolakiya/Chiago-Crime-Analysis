crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray,nu:chararray,ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

select = FOREACH crime GENERATE ID,PrimaryType,FLATTEN(STRSPLIT(Date,' ',3)) AS (Date:chararray,Time:chararray,Ampm:chararray),Year;

select1 = FOREACH select GENERATE ID,PrimaryType,FLATTEN(STRSPLIT(Date,'/',3)) AS (MM:chararray,DD,chararray,YY,chararray),Time,Ampm,Year;


select2 = FOREACH select1 GENERATE DD,1 as no;

grps = GROUP select2 BY DD;

count = FOREACH grps GENERATE group,SUM(select2.no);

STORE count INTO '/user/data/CrimeByDay' using PigStorage(',');

