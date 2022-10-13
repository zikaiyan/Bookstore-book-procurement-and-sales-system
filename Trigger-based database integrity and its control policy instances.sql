/*业务规则：由于书店刚开张，部分图书打折力度很大。但为了保证基本的收入，书店店长规定图书的销售折扣不能低于1折*/
/*触发器控制逻辑的表述：定义一个触发器，为图书表BOOK定义完整性规则“图书出售折扣不得低于1折（Discount>=0.1）”。该触发器在书店店员登记新入库的图书以及修改现有图书的信息时候被触发*/
CREATE TRIGGER Insert_Or_Update_Discount ON Book
	INSTEAD OF INSERT, UPDATE 
	AS
	IF EXISTS (SELECT * FROM inserted WHERE inserted.Discount < 0.1)
		BEGIN
			PRINT 'The value of "Discount" should be no less than 0.1!'
			ROLLBACK TRANSACTION
		END
	Return;
