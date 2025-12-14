CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_name VARCHAR(200) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50),
    SignUp_Date DATE,
    Customer_segment VARCHAR(50) -- Regular, VIP
);
INSERT INTO customer VALUES
(1,'Aditya','aditya@gmail.com','Pune','2023-01-15','Premium'),
(2,'Yukta','yukta@gmail.com','Mumbai','2023-02-10','Regular'),
(3,'Aman','aman@gmail.com','Delhi','2023-02-20','Regular'),
(4,'Neha','neha@gmail.com','Bangalore','2023-03-01','Premium'),
(5,'Kunal','kunal@gmail.com','Pune','2023-03-12','Regular'),
(6,'Sneha','sneha@gmail.com','Hyderabad','2023-03-18','Regular'),
(7,'Rahul','rahul@gmail.com','Mumbai','2023-04-01','Premium'),
(8,'Pooja','pooja@gmail.com','Delhi','2023-04-05','Regular'),
(9,'Arjun','arjun@gmail.com','Chennai','2023-04-10','Regular'),
(10,'Meena','meena@gmail.com','Bangalore','2023-04-15','Premium');

CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(200) NOT NULL,
    Category VARCHAR(200),
    Brand VARCHAR(100),
    Price DECIMAL(10,2) NOT NULL,
    Is_Active TINYINT(1) DEFAULT 1
);
INSERT INTO product VALUES
(101,'iPhone 14','Electronics','Apple',69999,TRUE),
(102,'AirPods','Electronics','Apple',19999,TRUE),
(103,'T-Shirt','Fashion','Puma',1499,TRUE),
(104,'Jeans','Fashion','Levis',2999,TRUE),
(105,'Mixer Grinder','Home Appliances','Philips',4999,FALSE),
(106,'Laptop','Electronics','Dell',59999,TRUE),
(107,'Shoes','Fashion','Nike',3999,TRUE),
(108,'Microwave','Home Appliances','LG',12999,TRUE),
(109,'Smart Watch','Electronics','Samsung',17999,TRUE),
(110,'Backpack','Accessories','Wildcraft',2499,TRUE);

CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATE,
    Order_Status VARCHAR(50), -- Delivered, Cancelled, Returned
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);
INSERT INTO orders VALUES
(1001,1,'2023-04-01','Delivered'),
(1002,2,'2023-04-03','Cancelled'),
(1003,1,'2023-04-10','Delivered'),
(1004,3,'2023-04-12','Delivered'),
(1005,4,'2023-04-15','Delivered'),
(1006,5,'2023-04-18','Returned'),
(1007,7,'2023-04-20','Delivered'),
(1008,8,'2023-04-22','Delivered'),
(1009,9,'2023-04-25','Delivered'),
(1010,1,'2023-04-28','Delivered');

CREATE TABLE Order_Item (
    Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Product_ID INT,
    Quantity INT NOT NULL,
    Item_Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

INSERT INTO order_item VALUES
(1,1001,101,1,69999),
(2,1001,102,1,19999),
(3,1003,103,2,1499),
(4,1004,103,1,1499),
(5,1005,106,1,59999),
(6,1006,104,1,2999),
(7,1007,109,1,17999),
(8,1008,107,2,3999),
(9,1009,110,1,2499),
(10,1010,102,1,19999);


CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

    INSERT INTO payments VALUES
(501,1001,'2023-04-01','Card','Success',89998),
(502,1002,'2023-04-03','UPI','Failed',1499),
(503,1003,'2023-04-10','UPI','Success',2998),
(504,1004,'2023-04-12','Card','Success',1499),
(505,1005,'2023-04-15','NetBanking','Success',59999),
(506,1006,'2023-04-18','Card','Success',2999),
(507,1007,'2023-04-20','UPI','Success',17999),
(508,1008,'2023-04-22','Card','Success',7998),
(509,1009,'2023-04-25','UPI','Success',2499),
(510,1010,'2023-04-28','Card','Success',19999);

    
Create table return_(
	return_id int primary key,
    order_id int,product_id int,
    return_date date ,
    refund_amount decimal(10,2)
    );
    
INSERT INTO return_ VALUES
(1,1006,104,'2023-04-20',2999),
(2,1003,103,'2023-04-18',1499),
(3,1008,107,'2023-04-25',3999),
(4,1005,106,'2023-04-22',59999),
(5,1009,110,'2023-04-27',2499),
(6,1004,103,'2023-04-19',1499),
(7,1007,109,'2023-04-23',17999),
(8,1010,102,'2023-04-30',19999),
(9,1001,102,'2023-04-05',19999),
(10,1001,101,'2023-04-06',69999);
