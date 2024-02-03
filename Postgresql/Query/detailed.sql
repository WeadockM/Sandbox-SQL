SELECT re.rental_id
, addr.address
, EXTRACT(dow FROM (re.rental_date AT TIME ZONE 'UTC')) day_of_week
FROM rental re
LEFT JOIN staff stf ON stf.staff_id = re.staff_id
LEFT JOIN store str ON str.store_id = stf.store_id
LEFT JOIN address addr ON addr.address_id = str.address_id