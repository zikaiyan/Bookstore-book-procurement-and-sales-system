/*业务规则：书店开业时的打折大促销吸引了不少顾客来买书，随着规模不断扩大，书店店长考虑适当减少打折力度，以提高整体利润*/
/*事务处理逻辑描述：将所有设计类图书的折扣力度减少1折（Disount值增加0.1）。修改后，若折设计类图书中有扣大于9折的（Disount值超过0.9），则撤销事务;若未大于，提交事务。（该操作由书店店长通知书店店员进行执行）*/
BEGIN TRANSACTION
USE SellingBook
UPDATE Book SET Discount = Discount + 0.1
WHERE Category = '设计'
IF (SELECT MAX(Discount) FROM Book
WHERE Category = '设计') > 0.9
BEGIN
PRINT 'Transaction rollback back!'
ROLLBACK TRANSACTION
END ELSE
BEGIN
PRINT 'Transaction committed!' COMMIT TRANSACTION
END;
