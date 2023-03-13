raw_data = LOAD '/gamedata/*.EV{A,N}' using PigStorage(',') as (type:chararray,id:chararray,name:chararray);
players_data= filter raw_data by type MATCHES 'start' OR type MATCHES 'sub';
id_name = foreach players_data generate id,name;
distinct_data = DISTINCT id_name;
sorted_data = order distinct_data by id;
store sorted_data INTO '/gamedata/id_player_mapping' using PigStorage(',');

raw_data = LOAD 'D:/Big_DataHadoop_Projects-master/basketball_match_analysis/gamedata/*.EV{A,N}' using PigStorage(',') as (type:chararray,id:chararray,name:chararray);
players_data= filter raw_data by type MATCHES 'start' OR type MATCHES 'sub';
id_name = foreach players_data generate id,name;
distinct_data = DISTINCT id_name;
store distinct_data INTO 'c:/output' using PigStorage(',');