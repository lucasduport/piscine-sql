SELECT 
    nexus_stores.receipts.purchase_date,
     nexus_stores.receipts.first_name, 
     nexus_stores.receipts.last_name,
     nexus_stores.receipts.email,
     nexus_stores.products.name, 
     nexus_stores.products.price, 
     nexus_stores.products.category
FROM nexus_stores.receipts,  nexus_stores.products,  nexus_stores.receipt_items
WHERE nexus_stores.receipt_items.product_id = nexus_stores.products.id
AND nexus_stores.receipt_items.receipt_id  = nexus_stores.receipts.id
AND nexus_stores.products.name ILIKE '%apple%'
AND nexus_stores.receipts.email SIMILAR TO 's(a|e)m[a-z]{3,6}\_w[a-z]{6}[0-9]*@roger\_[a-z]+.[a-z]{3}';

