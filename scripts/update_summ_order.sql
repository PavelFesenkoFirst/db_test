UPDATE shop.some_order
set summ_order = 1
where date_creation <= STR_TO_DATE('16.01.2021, 16:50:45', '%d.%m.%Y, %H:%i:%S');
