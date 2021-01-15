
-- Product
ALTER TABLE ProductCost DROP COLUMN version;

-- CREATE INDEX idx_ProductCost_lookup ON ProductCost(Product_ProductID);
-- CREATE INDEX idx_ProductCost_tk ON ProductCost(CostID);

ALTER TABLE ProductCost ADD CONSTRAINT fk_ProductCost_Product1 FOREIGN KEY (Product_ProductID) REFERENCES Product(ProductID);


-- Time
CREATE INDEX idx_Time_pk ON Time(TimeID);
CREATE INDEX Day ON Time(Day);
CREATE INDEX Week ON Time(Week);
CREATE INDEX Month ON Time(Month);
CREATE INDEX Season ON Time(Season);
CREATE INDEX Year ON Time(Year);
CREATE INDEX Quarter ON Time(Quarter);


-- Store
CREATE INDEX idx_Store_pk ON Store(StoreID);
CREATE INDEX PostCode ON Store(PostCode);


-- Employee
CREATE INDEX idx_Employee_pk ON Employee(EmployeeID);
CREATE INDEX Code ON Employee(Code);

-- Customer

CREATE INDEX CustomerNumber ON Customer(CustomerNumber);
CREATE INDEX AgeGroup ON Customer(AgeGroup);

ALTER TABLE Address DROP COLUMN date_from;
ALTER TABLE Address DROP COLUMN date_to;
ALTER TABLE Address DROP COLUMN version;

-- CREATE INDEX idx_Address_lookup ON Address(Customer_CustomerID);
-- CREATE INDEX idx_Address_tk ON Address(AddressID);

ALTER TABLE Address ADD CONSTRAINT fk_Address_Customer1_idx FOREIGN KEY (Customer_CustomerID) REFERENCES Customer(CustomerID);


-- Sale
ALTER TABLE Sale DROP COLUMN Date;

CREATE INDEX fk_Product_Product1_idx ON Sale(Product_ProductID);
CREATE INDEX fk_Time_Time1_idx ON Sale(Time_TimeID);
CREATE INDEX fk_Store_Store1_idx ON Sale(Store_StoreID);
CREATE INDEX fk_Employee_Employee1_idx ON Sale(Employee_EmployeeID);
CREATE INDEX fk_Sale_Customer1_idx ON Sale(Customer_CustomerID);

CREATE INDEX OrderID ON Sale(OrderID);
CREATE INDEX Quantity ON Sale(Quantity);
CREATE INDEX SalePrice ON Sale(SalePrice);
CREATE INDEX Cost ON Sale(Cost);
CREATE INDEX Margin ON Sale(Margin);

ALTER TABLE Sale ADD CONSTRAINT fk_Sale_Product1 FOREIGN KEY (Product_ProductID) REFERENCES Product(ProductID);
ALTER TABLE Sale ADD CONSTRAINT fk_Sale_Time1 FOREIGN KEY (Time_TimeID) REFERENCES Time(TimeID);
ALTER TABLE Sale ADD CONSTRAINT fk_Sale_Store1 FOREIGN KEY (Store_StoreID) REFERENCES Store(StoreID);
ALTER TABLE Sale ADD CONSTRAINT fk_Sale_Employee1 FOREIGN KEY (Employee_EmployeeID) REFERENCES Employee(EmployeeID);
ALTER TABLE Sale ADD CONSTRAINT fk_Sale_Customer1 FOREIGN KEY (Customer_CustomerID) REFERENCES Customer(CustomerID);

-- EmployeeSale
CREATE INDEX fk_EmployeeSale_Time1_idx ON EmployeeSale(Time_TimeID);
CREATE INDEX fk_EmployeeSale_Employee1_idx ON EmployeeSale(Employee_EmployeeID);
CREATE INDEX NumberOfSales ON EmployeeSale(NumberOfSales);
CREATE INDEX TotalSale ON EmployeeSale(TotalSale);
CREATE INDEX TotalCommission ON EmployeeSale(TotalCommission);


ALTER TABLE Sale ADD CONSTRAINT fk_EmployeeSale_Time1 FOREIGN KEY (Time_TimeID) REFERENCES Time(TimeID);
ALTER TABLE Sale ADD CONSTRAINT fk_EmployeeSale_Employee1 FOREIGN KEY (Employee_EmployeeID) REFERENCES Employee(EmployeeID);

