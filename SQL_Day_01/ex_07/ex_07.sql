select name as 'Name of the most expensive subscription', price as 'Price' from subscriptions where price = (select max(price) from subscriptions);
