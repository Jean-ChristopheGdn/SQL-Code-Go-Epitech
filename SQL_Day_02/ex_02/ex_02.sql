select zipcode as 'Zip codes' from  profiles group by zipcode having count(zipcode) > 1 order by zipcode asc;
