select count(title) as 'Number of movies', prod_year as 'Year of production' from movies where prod_year != 0 group by prod_year desc;
