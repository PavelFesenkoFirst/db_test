UPDATE shop.products
SET name_p = 'new_name_product', price = 100, in_stock = 0, id_category = 2
where shop.products.id  = 2;