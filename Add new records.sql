/*管理需求：ID为00014的顾客想要下一个订单，该订单中包含ISBN码为0000000000023的图书1本以及ISBN码为0000000000025的图书2本*/
/*访问请求表述：新增一个订单，同时新增两个订单明细*/
INSERT INTO Orders
(OrderID, DeliveryAddress, CustID)
VALUES('0000000003', '江苏省常州市天宁区聚和家园8幢乙单元1102室', '00014');

INSERT INTO OrderElem
(OrderID, ISBN, OrderQuantity)
VALUES('0000000003', '0000000000023', 1);

INSERT INTO OrderElem
(OrderID, ISBN, OrderQuantity)
VALUES('0000000003', '0000000000025', 2);


