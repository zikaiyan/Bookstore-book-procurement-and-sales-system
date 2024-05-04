
/*以书店店员表Operator的名字Name为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Operator_Name ON Operator(Name);


/*以供货商表Supplier的名字Name为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Suppier_Name ON Supplier(Name);


/*以图书配送员表Deliveryman的名字Name为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Deliveryman_Name ON Deliveryman(Name);


/*以顾客表Customer的名字Name为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Customer_Name ON Customer(Name);
/*以顾客表Customer的身份证号Idnumber为索引键创建唯一索引，索引顺序为升序*/
CREATE UNIQUE INDEX Sindex_Customer_Idnumber ON Customer(Idnumber);
/*以顾客表Customer的电话号码Telephone为第一索引键、电子邮箱Email为第二索引键，创建唯一索引，索引顺序为升序*/
CREATE UNIQUE INDEX Sindex_Customer_Telephone_Email ON Customer(Telephone, Email);
/*以顾客表Customer的地址Address为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Customer_Address ON Customer(Address);


/*以仓库表StoreHouse的名字StoreHouseName为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_StoreHouse_StoreHouseName ON StoreHouse(StoreHouseName);
/*以仓库表StoreHouse的面积Area为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_StoreHouse_Area ON StoreHouse(Area DESC);


/*以图书表Book的类别Category为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Book_Category ON Book(Category);
/*以图书表Book的作者Author为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Book_Author ON Book(Author);
/*以图书表Book的出版社Publisher为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Book_Publisher ON Book(Publisher);
/*以图书表Book的出版时间PubDate为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_Book_PubDate ON Book(PubDate DESC);
/*以图书表Book的折扣售价SellPrice为第一索引键、折扣Discount为第二索引键，创建索引，第一索引顺序为降序，第二索引键索引顺序为升序*/
CREATE INDEX Sindex_Book_SellPrice_Discount ON Book(SellPrice DESC, Discount);
/*以图书表Book的进价PurchasePrice为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_Book_PurchasePrice ON Book(PurchasePrice DESC);
/*以图书表Book的库存量Inventory为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_Book_Inventory ON Book(Inventory DESC);


/*以订单表Orders的订单日期OrderDate为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_Orders_OrderDate ON Orders(OrderDate DESC);


/*以订单明细表OrderElem的订单号OrderID为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_OrderElem_OrderID ON OrderElem(OrderID);
/*以订单明细表OrderElem的订购量OrderQuantity为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_OrderElem_OrderQuantity ON OrderElem(OrderQuantity DESC);


/*以供应表Supply的供应商号SuppID为索引键创建索引，索引顺序为升序*/
CREATE INDEX Sindex_Supply_SuppID ON Supply(SuppID);
/*以供应表Supply的供应量SupplyQuantity为索引键创建索引，索引顺序为降序*/
CREATE INDEX Sindex_Supply_SupplyQuantity ON Supply(SupplyQuantity);
