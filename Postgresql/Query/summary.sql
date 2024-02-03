CREATE TABLE summary_table AS
SELECT COUNT(re.rental_id) rental_count
, addr.address
, CASE
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 0 THEN 'Sunday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 1 THEN 'Monday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 2 THEN 'Tuesday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 3 THEN 'Wednesday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 4 THEN 'Thursday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 5 THEN 'Friday'
    WHEN EXTRACT(dow FROM (re.rental_data AT TIME ZONE 'UTC')) = 6 THEN 'Saturday'
END AS day_of_week
FROM rental re
LEFT JOIN staff stf ON stf.staff_id = re.staff_id
LEFT JOIN store str ON str.store_id = stf.store_id
LEFT JOIN address addr ON addr.address_id = str.address_id
GROUP BY day_of_week
, addr.address
ORDER BY addr.address
, rental_count DESC;