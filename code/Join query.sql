/*管理需求：在仓库3中工作的书店店员需要盘点该仓库中建材类图书的库存*/
/*访问请求表述：需要查询储存在“仓库3”中所有建材类图书的ISBN码、书名、库存量*/
SELECT B.ISBN AS 'ISBN码', B.BookName AS '书名', B.Inventory AS '库存量'
	FROM Book B, StoreHouse S
	WHERE B.Category = '建材' AND B.StHoID = S.StHoID AND S.StoreHouseName = '仓库3';

/*管理需求：书店店员需要对各个仓库中的设计类图书进行盘点*/
/*访问请求表述：需要先先查询所有仓库以及储存在该仓库中的所有设计类图书的书名*/
SELECT S.StoreHouseName AS '仓库名', B.BookName AS '书名'
	FROM StoreHouse S
	LEFT JOIN Book B ON B.StHoID = S.StHoID 
		AND B.Category = '设计';

/*管理需求：书店店员在对各个仓库的书进行盘点之前，需要查询所有书的书名和所在的仓库*/
/*访问请求表述：查询所有图书的书名，以及与该图书有关的仓库的仓库名*/
SELECT S.StoreHouseName AS '仓库名', B.BookName AS '书名'
	FROM StoreHouse S
	RIGHT JOIN Book B ON B.StHoID = S.StHoID;
