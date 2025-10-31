-- 1. combine the menu_items table and order_detail tables into a single table.
SELECT*
FROM menu_items
SELECT*
FROM order_details;
SELECT*
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id; 

-- 2. what were the least and most ordered item? what categories were they in?
SELECT item_name, category, count(order_details_id) AS num_purches
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purches DESC;

-- 3. what were the top 5 orders that spent the most money
SELECT order_id, sum(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5; 
-- 4. view the details of the heighest spend order. what insights can you gather from them
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
-- 5. view the details of the top 5 heighest spend orders. what insights can you gather from them 
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
     ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;
'440','192.15'
'2075','191.05'
'1957','190.10'
'330','189.70'
'2675','185.10'

