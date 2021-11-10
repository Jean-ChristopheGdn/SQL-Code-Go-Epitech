SELECT COUNT(id) as 'Number of members', FLOOR(AVG(YEAR(CURDATE())-YEAR(birthdate))) as 'Average age' FROM profiles;

