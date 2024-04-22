--1/--
CREATE TABLE customer (
customer_id VARCHAR2(20) Primary key,
customer_name VARCHAR2(20),
customer_tel Number(8)
);

CREATE TABLE Product(
product_id VARCHAR2(20) Primary key, 
product_name VARCHAR2(20) NOT NULL,
price Number(20) Check (price>0)
);
CREATE TABLE Orders (
customer_id VARCHAR2(20) FOREIGN KEY REFERENCES customer (customer_id),
product_id VARCHAR2(20) FOREIGN KEY REFERENCES Product (product_id),
--product_id CONSTRAINT fk_id FOREIGN KEY  REFERENCES Product (product_id),--
quantity Number(20),
total_amount Number(20),

)

--2/--
--a/--
ALTER TABLE Product add Category VARCHAR2(20);
--b/--
ALTER TABLE Orders add OrderDate  DATE DEFAULT SYSDATE;


--3/--
INSERT INTO customer (customer_id,customer_name,customer_tel) VALUES ('C01', 'ALI', 71321009);
INSERT INTO customer (customer_id,customer_name,customer_tel) VALUES ('C02', 'ASMA', 77345823);

INSERT INTO Product (product_id,product_name,price,Category) VALUES ('P01', 'Samsung Galaxy s20', 3299, 'Smartphone');
INSERT INTO Product (product_id,product_name,price,Category) VALUES ('P02', 'Asus Notebook', 4599, 'PC');

INSERT INTO orders (customer_id,product_id,OrderDate,quantity,total_amount) VALUES ('C01', 'P02',NULL, 2, 9198);
INSERT INTO orders (customer_id,product_id,OrderDate,quantity,total_amount) VALUES ('C02', 'P01',28/05/2020, 1, 3299);

--4/--

Select * from customer;
SELECT product_name, Category FROM Product WHERE price BETWEEN 5000 AND 10000;
Select * from Product order by price desc;
Select product_id from orders, SUM (quantity) as total_quantity,
AVG (total_amount) as average_amount,
MAX (total_amount) as max_amount,
MIN (total_amount) as min_amount;

Select COUNT (product_id) as total_orders from orders;


Select customer_id from orders having count (order_id) > 2;

Select EXTRACT (MONTH from OrderDate) as month,SUM(quantity) as total_quantity from orders where EXTRACT (YEAR from OrderDate) = 2020;


Select p.product_name,c.customer_name,o.OrderDate from orders o join product p on o.product_id = p.product_id join customer c on o.customer_id = c.customer_id;
Select * from orders where orderDate >= ADDmonths (SYSDATE, -3) and orderDate < ADDmonths (SYSDATE, -2);
Select  c.customer_id from customers c LEFT JOIN orders o on c.customer_id = o.customer_id where o.customer_id is NULL;