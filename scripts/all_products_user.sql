
select name_p from shop.products 
left join shop.order_product on shop.order_product.id = shop.products.id 
where id_order in (SELECT id from shop.some_order where id_user = 1);