-- select group_name FROM group_users gu 
-- UNION
-- select sum(summ_order) from some_order so 
-- where id_user BETWEEN 1 and 5



SELECT group_users.group_name,
SUM((
SELECT SUM(order_product.total_price)
    FROM order_product
    JOIN some_order ON (some_order.id = order_product.id_order)
    WHERE some_order.id_user = users.id
    GROUP BY some_order.id_user
)) as Total
FROM users, group_users
WHERE group_users.id = users.group_id 
GROUP BY group_users.group_name;