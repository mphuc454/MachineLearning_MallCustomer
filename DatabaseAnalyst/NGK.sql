create database NGK
use NGK
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL
);
CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Phone VARCHAR(15)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
CREATE TABLE OrderDetail (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
INSERT INTO Category (CategoryID, CategoryName)
VALUES 
(1, N'Nước ngọt'),
(2, N'Nước ép'),
(3, N'Trà'),
(4, N'Cà phê');
INSERT INTO Product (ProductID, ProductName, Price, CategoryID)
VALUES
(1, N'Coca Cola', 10000, 1),
(2, N'Pepsi', 10000, 1),
(3, N'Nước cam', 15000, 2),
(4, N'Nước táo', 15000, 2),
(5, N'Trà sữa', 25000, 3),
(6, N'Trà đào', 20000, 3),
(7, N'Cà phê đen', 18000, 4),
(8, N'Cà phê sữa', 22000, 4);
INSERT INTO Customer (CustomerID, CustomerName, Phone)
VALUES
(1, N'Nguyễn Văn A', '0901111111'),
(2, N'Trần Thị B', '0902222222'),
(3, N'Lê Văn C', '0903333333');
INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 1, '2026-04-03');
INSERT INTO OrderDetail (OrderID, ProductID, Quantity)
VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 3),
(2, 5, 2),
(3, 6, 1),
(3, 8, 2);