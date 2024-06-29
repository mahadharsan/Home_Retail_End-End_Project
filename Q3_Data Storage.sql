create database onki;
use onki;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductPrice DECIMAL,
    ProductName VARCHAR(100)
);

CREATE TABLE Stores (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Location VARCHAR(100),
    Ratings INT
);

CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    SalesDate DATE,
    Revenue DECIMAL,
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    StoreID INT,
    InventoryDate DATE,
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID)
);

CREATE TABLE SalesDetails (
    SalesID INT,
    ProductID INT,
    QuantitySold INT,
    Amount DECIMAL,
    PRIMARY KEY (SalesID, ProductID),
    FOREIGN KEY (SalesID) REFERENCES Sales(SalesID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE InventoryDetails (
    InventoryID INT,
    ProductID INT,
    Quantity_in_stock INT,
    PRIMARY KEY (InventoryID, ProductID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
