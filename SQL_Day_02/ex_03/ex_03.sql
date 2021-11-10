select floor as 'Floor number', sum(seats) as 'Total number of seats', count(room_number) as 'Total number of rooms' from rooms group by floor order by sum(seats) asc;
