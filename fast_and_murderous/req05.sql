SELECT receipt_id,  nexus_stores.products.name, quantity, price
FROM nexus_stores.receipt_items,  nexus_stores.products
WHERE  nexus_stores.receipt_items.product_id =  nexus_stores.products.id
AND quantity > 10
AND  name ILIKE '%apple%';
