/*管理需求：仓库1中的书店店员需要对仓库1中图书的摆放情况进行整理，首先需要知道仓库1中共有几款图书，以便存储货架的预先划分*/
/*访问请求表述：需要查询储存在仓库1中的所有书目的款式数*/
SELECT COUNT(*) AS '仓库1中的所有书目的款式数'
	FROM Book B, StoreHouse S
	WHERE B.StHoID = S.StHoID AND S.StoreHouseName = '仓库1';

/*管理需求：书店店长想要查看目前已经下达的订单的基本信息，以便对销售情况进行预测*/
/*访问请求表述：需要查询每个订单的订单号、订单日期、顾客名以及该订单的总价格*/
SELECT Os.OrderID AS '订单号', Os.OrderDate AS '订货日期', C.Name AS '顾客名', SUM(B.SellPrice * B.Discount * Oe.OrderQuantity) AS '订单总价'
	FROM Orders Os, OrderElem Oe, Customer C, Book B
	WHERE Os.OrderID = Oe.OrderID AND Oe.ISBN = B.ISBN AND Os.CustID = C.CustID
	GROUP BY Os.OrderID, Os.OrderDate, C.Name;

/*管理需求：书店店长想提高书店的营业利润，计划对售价价高的几类书进行推销*/
/*访问请求表述：需要查询每类图书的平均销售价格，并按种类分别输出，按照价格降序输出*/
SELECT B.Category AS '种类', AVG(B.SellPrice) AS '平均价格'
	FROM Book B
	GROUP BY B.Category
	ORDER BY AVG(B.SellPrice) DESC;

/*管理需求：同上的目的，为了提高书店的营业利润，书店店长打算主推售价最高的图书*/
/*访问请求表述：查询所有书目中进价最高的书目的ISBN码、书名、进价、售价*/
SELECT B1.ISBN AS 'ISBN码', B1.BookName AS '书名', B1.PurchasePrice AS '进价', B1.SellPrice AS '售价'
	FROM Book B1
	WHERE B1.PurchasePrice =
		(SELECT MAX(B2.PurchasePrice)
			FROM Book B2);

/*管理需求：书店店长打算对书店内售价较低的图书与其他图书进行捆绑销售，以增加客单价，减少单独购买此类图书导致的书店过多的物流配送费用的支出*/
/*访问请求表述：查询所有书目中进价最低的书目的ISBN码、书名、进价、售价*/
SELECT B1.ISBN AS 'ISBN码', B1.BookName AS '书名', B1.PurchasePrice AS '进价', B1.SellPrice AS '售价'
	FROM Book B1
	WHERE B1.PurchasePrice =
		(SELECT MIN(B2.PurchasePrice)
			FROM Book B2);
