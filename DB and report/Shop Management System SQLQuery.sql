CREATE DATABASE StockMS;

CREATE TABLE Customer (
	Customer_ID INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(255),
	contact_no VARCHAR(255),
	addresss VARCHAR(255),
	pass VARCHAR(255),
	email VARCHAR(255) UNIQUE,
	RegistraionDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP  
);

CREATE TABLE Admin (
	admin_ID INT PRIMARY KEY IDENTITY(0,100),
	pass VARCHAR(255),
	email VARCHAR(255) UNIQUE
);


CREATE TABLE Store(
	StoreID INT PRIMARY KEY IDENTITY(50000,1),
	StoreName VARCHAR(255),
	CITY VARCHAR(255),
	Address VARCHAR(255)
	
);

CREATE TABLE PRODUCT(
	Pro_ID INT PRIMARY KEY IDENTITY(1,33),
	Pro_name VARCHAR(255),
	Pro_price INT

);

CREATE TABLE ProductStock(
	Pro_ID INT ,
	StoreID INT,
	Quantity INT
);

CREATE TABLE Invoice(
	InvoiceNumber INT PRIMARY KEY IDENTITY(1666,344),
	amount INT,
	OrderItem TEXT,
	OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE OrderList(
	OrderID INT PRIMARY KEY IDENTITY(8888,8),
	CustomerEmail VARCHAR(255),
	InvoiceNumber INT,
	Statuss VARCHAR(255) DEFAULT 'Not Delivered'

);














SELECT TOP 1 Pro_ID FROM PRODUCT ORDER BY Pro_ID DESC;


SELECT p.Pro_ID AS ID,Pro_name AS Name,Pro_price AS Price, StoreName AS Store, Quantity FROM PRODUCT p
JOIN ProductStock ps ON ps.Pro_ID = p.Pro_ID
JOIN Store s ON s.StoreID = ps.StoreID;

INSERT INTO Admin (email, pass) VALUES ('xian@xian.com','xian');

SELECT SUM(Pro_price - 10) FROM PRODUCT
WHERE Pro_ID = 1; 

UPDATE PRODUCT SET Pro_price = Pro_price + 100
WHERE Pro_ID = 1; 

SELECT ol.OrderID AS ORDER_No, c.name AS NAME, c.contact_no AS Number, c.addresss AS Address,
ol.InvoiceNumber, i.amount AS BILL, ol.Statuss AS Status, i.OrderDate AS Date
 FROM OrderList ol
JOIN Invoice i ON i.InvoiceNumber = ol.InvoiceNumber
JOIN Customer c ON c.email = ol.CustomerEmail;