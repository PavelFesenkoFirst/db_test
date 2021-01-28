select date_creation, count(some_order.id) as 'Количество заказов', sum(some_order.summ_order) as 'Сумма'
from shop.some_order
group by date_creation ;
