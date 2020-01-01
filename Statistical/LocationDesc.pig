crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray, ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

select = FOREACH crime GENERATE LocationDescription,1 as no;

grps = GROUP select BY LocationDescription;

final_data = FOREACH grps GENERATE group,SUM(select.no);

STORE final_data INTO '/usr/data/LocationDesc' using PigStorage(',');
