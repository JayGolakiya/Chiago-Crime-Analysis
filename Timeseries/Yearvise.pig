crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray, ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

select = FOREACH crime GENERATE Year,1 as no;

grps = GROUP select BY Year;

count = FOREACH grps GENERATE group,SUM(select.no);

dump count;

STORE count INTO '/usr/data/Yearvise2' using PigStorage(',');

