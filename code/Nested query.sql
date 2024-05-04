/*管理需求：在仓库3中工作的书店店员需要盘点该仓库中建材类图书的库存*/
/*访问请求表述：需要查询储存在“仓库3”中的所有建材类图书的ISBN码、书名、库存量*/
SELECT B.ISBN AS 'ISBN码', B.BookName AS '书名', B.Inventory AS '库存量'
	FROM Book B
	WHERE B.Category = '建材' 
		AND B.StHoID =
		(SELECT StHoID
			FROM StoreHouse S
			WHERE StoreHouseName = '仓库3');

/*管理需求：为了提高书店的营业利润，书店店长计划对售价高的图书进行推广促销*/
/*访问请求表述：需要查询出售价格高于其所在类别平均售价的图书的书名和售价信息*/
SELECT B1.BookName AS '书名', B1.SellPrice AS '售价'
	FROM Book B1
	WHERE B1.SellPrice >
		(SELECT AVG(B2.SellPrice)
			FROM Book B2
			WHERE B2.Category = B1.Category);

/*管理需求：书店店长年末对供应商进行考评，其中一项指标是供应商供应种类的多少*/
/*访问请求表述：需要查询供应了所有图书的供应商ID、供应商名字*/
SELECT Se.SuppID AS '供应商ID', Se.Name AS '供应商名'
	FROM Supplier Se
	WHERE NOT EXISTS
		(SELECT *
			FROM Book B
			WHERE NOT EXISTS
			(SELECT *
				FROM Supply Sy
				WHERE Sy.SuppID = Se.SuppID AND sy.ISBN = B.ISBN));
