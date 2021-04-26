-- write your queries here
SELECT * FROM owners  LEFT JOIN vehicles  ON owners.id = vehicles.owner_id;

 SELECT first_name, last_name, count(vehicles.owner_id) AS number_cars FROM owners
 JOIN  vehicles 
    ON owners.id = vehicles.owner_id
 GROUP BY (first_name, last_name)
 ORDER BY  first_name;


 SELECT first_name, last_name, ROUND(AVG(vehicles.price)) AS average_price,  count(vehicles.owner_id)  FROM owners
JOIN  vehicles   ON owners.id = vehicles.owner_id
GROUP BY (first_name, last_name)
HAVING AVG(price)  > 10000 AND COUNT(owner_id) > 1
ORDER BY  first_name