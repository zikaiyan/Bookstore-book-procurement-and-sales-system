/*对用户书店店员定义局部视图*/
GO
CREATE SCHEMA OperatorSchema AUTHORIZATION U书店店员1;
GO

CREATE VIEW StoreHouse_Operator (StHoID, StoreHouseName, Area)
AS
SELECT StHoID, StoreHouseName, Area
FROM StoreHouse;
GO

CREATE VIEW Deliveryman_Operator (DeliID, Name, AdminID)
AS
SELECT DeliID, Name, AdminID
FROM Deliveryman;
GO

CREATE VIEW Book_Operator (ISBN, BookName, Category, Author, Publisher, PubDate, Discount, SellPrice, PurchasePrice, StHoID ,Inventory)
AS
SELECT ISBN, BookName, Category, Author, Publisher, PubDate, Discount, SellPrice, PurchasePrice, StHoID ,Inventory
FROM Book;
GO

CREATE VIEW Combined_Orders_Operator (OrderID, ISBN, OrderQuantity, OrderDate, DeliveryAddress, CustID, DeliID)
AS
SELECT Os.OrderID, ISBN, OrderQuantity, OrderDate, DeliveryAddress, CustID, DeliID
FROM Orders Os, OrderElem Oe
WHERE Os.OrderID = Oe.OrderID;
GO

CREATE VIEW Supply_Operator (SuppID, ISBN, SuppDate, SupplyQuantity)
AS
SELECT SuppID, ISBN, SuppDate, SupplyQuantity
FROM Supply;
GO

CREATE VIEW Operator_Operator1 (OperID, Name, Password, AdminID, StHoID)
AS
SELECT OperID, Name, Password, AdminID, StHoID
FROM Operator
WHERE OperID = '001';
GO
