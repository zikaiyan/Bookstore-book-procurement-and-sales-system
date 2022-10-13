/*业务规则：书店店长需要定期对图书的库存进行检查，对于库存量小于10的图书需要及时补货*/
/*定义存储过程inventory_proc，执行该过程可以输出当前所有仓库内所有库存量小于10的图书的ISBN码、书名、库存量*/
/*游标的作用：游标用于对图书记录进行逐行检查，当检索到库存量小于10的行的时候，将该记录中的图书名、ISBN码、库存量三个数据分别赋值给三个变量进行输出*/
CREATE PROCEDURE inventory_Proc
AS
BEGIN
	DECLARE @isbn char(13), @bookname nvarchar(100), @inventory nvarchar(10);
	DECLARE b_cursor CURSOR FOR
		SELECT ISBN, BookName, Inventory FROM Book
		WHERE Inventory < 10;
	OPEN b_cursor;
	FETCH NEXT FROM b_cursor INTO @isbn, @bookname, @inventory;
	WHILE @@FETCH_STATUS = 0
		BEGIN
			PRINT'ISBN码：'+@isbn+'；书名：'+@bookname+'；库存量：'+@inventory;
			FETCH NEXT FROM b_cursor INTO @isbn, @bookname, @inventory;
		END
	CLOSE b_cursor;
	DEALLOCATE b_cursor;
END
GO
