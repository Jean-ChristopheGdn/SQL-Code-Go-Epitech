select min_duration as "Duration of the shortest movie." from movies where min_duration != "NULL" or "0" order by min_duration asc limit 1;
