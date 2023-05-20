create database customer_order;
-- SQL Queires
 
create table customer(
	customer_id int primary key,
    customer_name varchar(255),
    city_id int,
    first_order_date date
);

create table headquarters(
	city_id int primary key,
    city_name varchar(100),
    headquarter_addr varchar(255),
    state varchar(100),
    time time
);

create table items (
	item_id int primary key,
	description varchar(255),
    size decimal(10, 2),
    weight decimal(10, 2),
    unit_price decimal(10, 2),
    time time
);

create table mail_order_customers(
	customer_id int primary key,
    post_address varchar(255),
    time time,
    foreign key (customer_id) references customer(customer_id) on delete cascade
);

create table ordered_item (
	order_no int,
    item_id int,
    quantity_ordered int,
    ordered_price decimal(10, 2),
    time time,
    primary key (order_no, item_id),
    foreign key (order_no) references orders(order_no) on delete cascade,
	foreign key (item_id) references items(item_id) on delete cascade
);

create table orders (
	order_no int primary key,
    order_date date,
    customer_id int
);

create table stored_items (
	store_id int,
    item_id int,
    quantity_held int,
    time time,
    primary key (store_id, item_id),
    foreign key (store_id) references stores(store_id) on delete cascade,
	foreign key (item_id) references items(item_id) on delete cascade
);



create table stores (
	store_id int primary key,
    city_id int,
    phone varchar(10),
    time time,
    foreign key (city_id) references headquarters(city_id) on delete cascade
);

create table walk_in_customers(
	customer_id int primary key,
    tourism_guide varchar(255),
    time time,
    foreign key (customer_id) references customer(customer_id) on delete cascade
);


-- OLAP Queries

select stores.store_id, city_name, state, phone, description, size, weight, unit_price from stores join headquarters on stores.city_id = headquarters.city_id join stored_items on stored_items.store_id = stores.store_id join items on stored_items.item_id = items.item_id 
where stored_items.item_id=1;



INSERT INTO customer (customer_id, customer_name, city_id, first_order_date) 
VALUES 
    (1, 'John', 1, '2022-01-01'),
    (2, 'Jane', 2, '2022-02-15'),
    (3, 'Bob', 1, '2022-03-10'),
    (4, 'Alice', 3, '2022-04-20'),
    (5, 'David', 2, '2022-05-05'); 
    
 select * from customer;  
   
INSERT INTO headquarters (city_id, city_name, headquarter_addr, state, time) 
VALUES 
    (1, 'New York City', '123 Main St', 'New York', '12:30:00'),
    (2, 'Los Angeles', '456 Broadway', 'California', '14:45:00'),
    (3, 'Chicago', '789 Fifth Ave', 'Illinois', '10:15:00');
    
INSERT INTO items (item_id, description, size, weight, unit_price, time) 
VALUES 
    (1, 'T-shirt', 15.5, 0.25, 20.99, '09:00:00'),
    (2, 'Jeans', 32.0, 0.8, 50.00, '10:30:00'),
    (3, 'Shoes', 10.0, 1.2, 80.00, '11:45:00');
    
INSERT INTO mail_order_customers (customer_id, post_address, time) 
VALUES 
    (1, '123 Main St, New York City, NY', '14:30:00'),
    (3, '5678 Elm St, Chicago, IL', '15:45:00'),
    (5, '910 Maple Ave, Los Angeles, CA', '16:30:00');

INSERT INTO orders (order_no, order_date, customer_id) 
VALUES 
    (1, '2022-01-02', 1),
    (2, '2022-02-16', 2),
    (3, '2022-03-11', 3),
    (4, '2022-04-21', 4),
    (5, '2022-05-06', 5);

INSERT INTO ordered_item (order_no, item_id, quantity_ordered, ordered_price, time) 
VALUES 
    (1, 1, 2, 41.98, '09:30:00'),
    (1, 2, 1, 50.00, '09:30:00'),
    (2, 2, 3, 150.00, '12:00:00'),
    (3, 3, 1, 80.00, '13:30:00'),
    (4, 1, 3, 62.97, '14:45:00');

    
INSERT INTO stores (store_id, city_id, phone, time) 
VALUES 
    (1, 1, '9767546754', '09:00:00'),
    (2, 2, '8976543234', '10:15:00'),
    (3, 3, '6543234567','10:30:00');
