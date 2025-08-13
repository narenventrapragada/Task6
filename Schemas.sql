create table customer_shopping_data(
	invoice_no varchar(10),
	customer_id varchar(10), 
	gender varchar(6),
	age int,
	category varchar(15),
	quantity int, 
	price numeric, 
	payment_method varchar(15), 
	invoice_date date, 
	shopping_mall varchar(40)
) ;

select * from customer_shopping_data;

-- Data Validation (Ensuring data is clean)

select invoice_no,length(invoice_no),length(trim(invoice_no))
from customer_shopping_data
where length(invoice_no) <> length(trim(invoice_no));

select customer_id,length(customer_id),length(trim(customer_id))
from customer_shopping_data
where length(customer_id) <> length(trim(customer_id));

select gender,length(gender),length(trim(gender))
from customer_shopping_data
where length(gender) <> length(trim(gender));

select gender,length(gender),length(trim(gender))
from customer_shopping_data
where length(gender) <> length(trim(gender));

select min(age),max(age) from customer_shopping_data ;

select category,length(category),length(trim(category))
from customer_shopping_data
where length(category) <> length(trim(category));

select min(quantity),max(quantity) from customer_shopping_data ;

select min(price),max(price) from customer_shopping_data ;

select payment_method,length(payment_method),length(trim(payment_method))
from customer_shopping_data
where length(payment_method) <> length(trim(payment_method));

select shopping_mall,length(shopping_mall),length(trim(shopping_mall))
from customer_shopping_data
where length(shopping_mall) <> length(trim(shopping_mall));






