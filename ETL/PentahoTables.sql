
CREATE TABLE Product
(
  ProductID INT NOT NULL PRIMARY KEY
, PartNumber VARCHAR(20)
, Description VARCHAR(100)
)
;


CREATE TABLE ProductCost
(
  CostID INT NOT NULL PRIMARY KEY
, Product_ProductID INT
, UnitCost DECIMAL(5,2)
, version INT
, ValidFromDate DATE
, ValidUntilDate DATE
, IsCurrentCost BOOLEAN
)
;CREATE INDEX idx_ProductCost_lookup ON ProductCost(Product_ProductID)
;
CREATE INDEX idx_ProductCost_tk ON ProductCost(CostID)
;


CREATE TABLE Time
(
  TimeID INT
, Day TINYINT
, Week VARCHAR(10)
, Month VARCHAR(10)
, Season VARCHAR(10)
, Quarter TINYINT
, Year MEDIUMINT
)
;


CREATE TABLE Store
(
  StoreID INT
, Description VARCHAR(10)
, Street VARCHAR(50)
, Suburb VARCHAR(20)
, State VARCHAR(10)
, PostCode VARCHAR(4)
)
;


CREATE TABLE Employee
(
  EmployeeID INT
, Code VARCHAR(2)
, LastName VARCHAR(20)
, FirstName VARCHAR(20)
, Commission DECIMAL(2,2)
, WorkingStore TINYINT
)
;


CREATE TABLE Customer
(
  CustomerID INT NOT NULL PRIMARY KEY
, CustomerNumber VARCHAR(10)
, FirstName VARCHAR(20)
, LastName VARCHAR(20)
, AgeGroup TINYINT
, NominatedStore TINYINT
)
;


CREATE TABLE Address
(
  AddressID INT NOT NULL PRIMARY KEY
, Customer_CustomerID INT
, Postcode VARCHAR(5)
, ValidUntilDate DATE
, IsCurrentAddress BOOLEAN
, version INT
, date_from DATE
, date_to DATE
)
;CREATE INDEX idx_Address_lookup ON Address(Customer_CustomerID)
;
CREATE INDEX idx_Address_tk ON Address(AddressID)
;


CREATE TABLE Sale
(
  SaleLineID INT NOT NULL PRIMARY KEY
, OrderID INT
, Line INT
, Date DATE
, Product_ProductID INT
, Time_TimeID INT
, Store_StoreID INT
, Customer_CustomerID INT
, Employee_EmployeeID INT
, Quantity SMALLINT
, SalePrice DECIMAL(5,2)
, Cost DECIMAL(5,2)
, Margin DECIMAL(5,2)
)
;

CREATE TABLE EmployeeSale
(
  EmployeeSaleID INT
, Time_TimeID INT
, Employee_EmployeeID INT
, NumberOfSales TINYINT
, TotalSale DECIMAL(7,2)
, TotalCommission DECIMAL(7,2)
)
;

