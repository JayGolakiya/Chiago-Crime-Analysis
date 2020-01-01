crime = LOAD '/usr/data/input/CrimeData.csv' using PigStorage(',') as (ID:chararray, CaseNumber:chararray, Date:chararray, Block:chararray, IUCR:chararray, PrimaryType:chararray, Description:chararray, LocationDescription:chararray, Arrest:chararray, Domestic:chararray, Beat:chararray, District:chararray, Ward:chararray, CommArea:chararray, FBICode:chararray, XCoordinate:chararray, YCoordinate:chararray, Year:long, UpdatedOn:chararray, Latitude:chararray, Longitude:chararray,Location:chararray, HistoricalWards:chararray, ZipCodes:chararray, CommAreas:chararray, censusTracts:chararray, Wards:chararray, BoundriesZipCodes:chararray, PoliceDistricts:chararray, PoliceBeats:chararray);

filter_data = FILTER crime BY PrimaryType=='OBSCENITY';

select = FOREACH filter_data GENERATE Year,1 as no;

grps = GROUP select BY Year;

final_data = FOREACH grps GENERATE group,SUM(select.no);

dump final_data;

STORE final_data INTO '/usr/data/Obscenity' using PigStorage(',');
