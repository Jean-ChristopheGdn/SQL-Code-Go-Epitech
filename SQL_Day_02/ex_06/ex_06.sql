select title as 'Movie title', datediff(curdate(), release_date) as 'Number of days passed' from movies where release_date != 0;
