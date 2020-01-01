crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray,nu:chararray,ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

select = FOREACH crime GENERATE PrimaryType,Arrest;

grps = GROUP select BY (PrimaryType,Arrest);

final_data = FOREACH grps GENERATE group,COUNT(select) as c;

STORE final_data INTO '/user/data/PrimaryTypeArrest' using PigStorage(',');
