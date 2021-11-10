select name, title from genres inner join movies on genres.id = movies.genre_id where name IN (select name from genres where id IN (8,13));
