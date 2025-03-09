USE QuanLyTourDuLich;

SELECT city.name AS 'City name', COUNT(tour.id) AS 'Number of tours'
FROM city
         JOIN destination d ON city.id = d.city_id
         JOIN tour ON d.id = tour.destination_id
GROUP BY city.id;

SELECT COUNT(id) AS 'So tour'
FROM tour
WHERE start_date BETWEEN '2020-03-01' AND '2020-03-31';

SELECT COUNT(id) AS 'So tour'
FROM tour
WHERE end_date BETWEEN '2020-04-01' AND '2020-04-30';