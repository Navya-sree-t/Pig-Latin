raw_data = LOAD 'c:/protest/gamedata/*.EV{A,N}' using PigStorage(',') as (type:chararray,id:chararray,name:chararray);
players_data= filter raw_data by type MATCHES 'start' OR type MATCHES 'sub';
id_name = foreach players_data generate id,name;
store id_name into 'output1';
--distinct_data = DISTINCT id_name;
allids = foreach id_name generate id as allid;   -- tmatch total match played
dump allids;
store allids into 'output2';
allnames = foreach id_name generate name as pname;   -- tmatch total match played
dump allnames;
store allnames into 'output3';