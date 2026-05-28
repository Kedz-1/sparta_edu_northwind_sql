# Northwind db Relationships

##  customers
- customer_id(PK)
- contact_name
- city
- country


## orders
- order_id(PK)
- customer_id(FK) - customers.customer_id
- employee_id(FK) - employees.employee_id
- ship_via(FK) - shippers.shipper_id


## products
- product_id(PK)
- product_name
- category_id(FK) - categories.category_id
- supplier_id(FK) - suppliers.supplier_id
- unit_price
- unit_in_stock
- discontinued
- quantity_per_unit


## order_details
- order_id/product_id(PK)
- order_id(FK) - orders.order_id
- product_id(FK) - products.product_id
- unit_price
- discount
- quantity


