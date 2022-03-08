--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      DATA MODEL
--
-- Date Created : Monday, March 07, 2022 19:16:46
-- Target DBMS : Oracle 19c
--
--Original Text
-- 
-- TABLE: Categories 
--

CREATE TABLE Categories(
    CategoryID      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    CategoryName    NVARCHAR2(15)    NOT NULL,
    Description     NCLOB,
    Picture         BLOB,
    CONSTRAINT PK_Categories PRIMARY KEY (CategoryID)
)
;



-- 
-- TABLE: CustomerCustomerDemo 
--

CREATE TABLE CustomerCustomerDemo(
    CustomerID        NCHAR(5)     NOT NULL,
    CustomerTypeID    NCHAR(10)    NOT NULL,
    CONSTRAINT PK_CustomerCustomerDemo PRIMARY KEY (CustomerID, CustomerTypeID)
)
;



-- 
-- TABLE: CustomerDemographics 
--

CREATE TABLE CustomerDemographics(
    CustomerTypeID    NCHAR(10)    NOT NULL,
    CustomerDesc      NCLOB,
    CONSTRAINT PK_CustomerDemographics PRIMARY KEY (CustomerTypeID)
)
;



-- 
-- TABLE: Customers 
--

CREATE TABLE Customers(
    CustomerID      NCHAR(5)         NOT NULL,
    CompanyName     NVARCHAR2(40)    NOT NULL,
    ContactName     NVARCHAR2(30),
    ContactTitle    NVARCHAR2(30),
    Address         NVARCHAR2(60),
    City            NVARCHAR2(15),
    Region          NVARCHAR2(15),
    PostalCode      NVARCHAR2(10),
    Country         NVARCHAR2(15),
    Phone           NVARCHAR2(24),
    Fax             NVARCHAR2(24),
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerID)
)
;



-- 
-- TABLE: Employees 
--

CREATE TABLE Employees(
    EmployeeID         NUMBER(38, 0)     GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    LastName           NVARCHAR2(20)     NOT NULL,
    FirstName          NVARCHAR2(10)     NOT NULL,
    Title              NVARCHAR2(30),
    TitleOfCourtesy    NVARCHAR2(25),
    BirthDate          TIMESTAMP(6)      
                       CONSTRAINT CK_Birthdate CHECK ([BirthDate] < getdate()),
    HireDate           TIMESTAMP(6),
    Address            NVARCHAR2(60),
    City               NVARCHAR2(15),
    Region             NVARCHAR2(15),
    PostalCode         NVARCHAR2(10),
    Country            NVARCHAR2(15),
    HomePhone          NVARCHAR2(24),
    Extension          NVARCHAR2(4),
    Photo              BLOB,
    Notes              NCLOB,
    ReportsTo          NUMBER(38, 0),
    PhotoPath          NVARCHAR2(255),
    CONSTRAINT PK_Employees PRIMARY KEY (EmployeeID)
)
;



-- 
-- TABLE: EmployeeTerritories 
--

CREATE TABLE EmployeeTerritories(
    EmployeeID     NUMBER(38, 0)    NOT NULL,
    TerritoryID    NVARCHAR2(20)    NOT NULL,
    CONSTRAINT PK_EmployeeTerritories PRIMARY KEY (EmployeeID, TerritoryID)
)
;



-- 
-- TABLE: "Order Details" 
--

CREATE TABLE "Order Details"(
    OrderID        NUMBER(38, 0)    NOT NULL,
    ProductID      NUMBER(38, 0)    NOT NULL,
    ProductName    NVARCHAR2(40)    NOT NULL,
    UnitPrice      NUMBER(19, 2)    DEFAULT 0 NOT NULL
                   CONSTRAINT CK_UnitPrice CHECK ([UnitPrice] >= 0),
    Quantity       SMALLINT         DEFAULT (1) NOT NULL
                   CONSTRAINT CK_Quantity CHECK ([Quantity] > 0),
    Discount       FLOAT(126)       DEFAULT 0 NOT NULL
                   CONSTRAINT CK_Discount CHECK ([Discount] >= 0 and [Discount] <= 1),
    CONSTRAINT PK_Order_Details PRIMARY KEY (OrderID, ProductID, ProductName)
)
;



-- 
-- TABLE: Orders 
--

CREATE TABLE Orders(
    OrderID           NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    CustomerID        NCHAR(5),
    EmployeeID        NUMBER(38, 0),
    OrderDate         TIMESTAMP(6),
    RequiredDate      TIMESTAMP(6),
    ShippedDate       TIMESTAMP(6),
    ShipVia           NUMBER(38, 0),
    Freight           NUMBER(19, 2)    DEFAULT 0,
    ShipName          NVARCHAR2(40),
    ShipAddress       NVARCHAR2(60),
    ShipCity          NVARCHAR2(15),
    ShipRegion        NVARCHAR2(15),
    ShipPostalCode    NVARCHAR2(10),
    ShipCountry       NVARCHAR2(15),
    CONSTRAINT PK_Orders PRIMARY KEY (OrderID)
)
;



-- 
-- TABLE: Products 
--

CREATE TABLE Products(
    ProductID          NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    ProductName        NVARCHAR2(40)    NOT NULL,
    SupplierID         NUMBER(38, 0),
    CategoryID         NUMBER(38, 0),
    QuantityPerUnit    NVARCHAR2(20),
    UnitPrice          NUMBER(19, 2)    DEFAULT 0 
                       CONSTRAINT CK_Products_UnitPrice CHECK ([UnitPrice] >= 0),
    UnitsInStock       SMALLINT         DEFAULT (0) 
                       CONSTRAINT CK_UnitsInStock CHECK ([UnitsInStock] >= 0),
    UnitsOnOrder       SMALLINT         DEFAULT (0) 
                       CONSTRAINT CK_UnitsOnOrder CHECK ([UnitsOnOrder] >= 0),
    ReorderLevel       SMALLINT         DEFAULT (0) 
                       CONSTRAINT CK_ReorderLevel CHECK ([ReorderLevel] >= 0),
    Discontinued       NUMBER(1, 0)     DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Products PRIMARY KEY (ProductID, ProductName)
)
;



-- 
-- TABLE: Region 
--

CREATE TABLE Region(
    RegionID             NUMBER(38, 0)    NOT NULL,
    RegionDescription    NCHAR(50)        NOT NULL,
    CONSTRAINT PK_Region PRIMARY KEY (RegionID)
)
;



-- 
-- TABLE: Shippers 
--

CREATE TABLE Shippers(
    ShipperID      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    CompanyName    NVARCHAR2(40)    NOT NULL,
    Phone          NVARCHAR2(24),
    CONSTRAINT PK_Shippers PRIMARY KEY (ShipperID)
)
;



-- 
-- TABLE: Suppliers 
--

CREATE TABLE Suppliers(
    SupplierID      NUMBER(38, 0)    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1 NOCYCLE),
    CompanyName     NVARCHAR2(40)    NOT NULL,
    ContactName     NVARCHAR2(30),
    ContactTitle    NVARCHAR2(30),
    Address         NVARCHAR2(60),
    City            NVARCHAR2(15),
    Region          NVARCHAR2(15),
    PostalCode      NVARCHAR2(10),
    Country         NVARCHAR2(15),
    Phone           NVARCHAR2(24),
    Fax             NVARCHAR2(24),
    HomePage        NCLOB,
    CONSTRAINT PK_Suppliers PRIMARY KEY (SupplierID)
)
;



-- 
-- TABLE: Territories 
--

CREATE TABLE Territories(
    TerritoryID             NVARCHAR2(20)    NOT NULL,
    TerritoryDescription    NCHAR(50)        NOT NULL,
    RegionID                NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK_Territories PRIMARY KEY (TerritoryID)
)
;



-- 
-- TABLE: CustomerCustomerDemo 
--

ALTER TABLE CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo 
    FOREIGN KEY (CustomerTypeID)
    REFERENCES CustomerDemographics(CustomerTypeID)
;

ALTER TABLE CustomerCustomerDemo ADD CONSTRAINT FK_CustomerCustomerDemo_Customers 
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
;


-- 
-- TABLE: Employees 
--

ALTER TABLE Employees ADD CONSTRAINT FK_Employees_Employees 
    FOREIGN KEY (ReportsTo)
    REFERENCES Employees(EmployeeID)
;


-- 
-- TABLE: EmployeeTerritories 
--

ALTER TABLE EmployeeTerritories ADD CONSTRAINT FK_EmployeeTerritories_Employees 
    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID)
;

ALTER TABLE EmployeeTerritories ADD CONSTRAINT FK_EmployeeTerritories_Territories 
    FOREIGN KEY (TerritoryID)
    REFERENCES Territories(TerritoryID)
;


-- 
-- TABLE: "Order Details" 
--

ALTER TABLE "Order Details" ADD CONSTRAINT FK_Order_Details_Orders 
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
;

ALTER TABLE "Order Details" ADD CONSTRAINT FK_Order_Details_Products 
    FOREIGN KEY (ProductID, ProductName)
    REFERENCES Products(ProductID, ProductName)
;


-- 
-- TABLE: Orders 
--

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customers 
    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
;

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Employees 
    FOREIGN KEY (EmployeeID)
    REFERENCES Employees(EmployeeID)
;

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Shippers 
    FOREIGN KEY (ShipVia)
    REFERENCES Shippers(ShipperID)
;


-- 
-- TABLE: Products 
--

ALTER TABLE Products ADD CONSTRAINT FK_Products_Categories 
    FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID)
;

ALTER TABLE Products ADD CONSTRAINT FK_Products_Suppliers 
    FOREIGN KEY (SupplierID)
    REFERENCES Suppliers(SupplierID)
;


-- 
-- TABLE: Territories 
--

ALTER TABLE Territories ADD CONSTRAINT FK_Territories_Region 
    FOREIGN KEY (RegionID)
    REFERENCES Region(RegionID)
;


