SELECT shop.users.name, shop.some_order.summ_order from shop.users
left join shop.some_order on shop.some_order.id_user = shop.users.id
