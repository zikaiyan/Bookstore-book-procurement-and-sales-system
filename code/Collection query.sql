/*管理需求：书店店长想查看书店现有的所有英语和数学类图书的基本信息*/
/*访问请求表述：查找图书类别为"英语"和"数学"的图书的ISBN码、书名、类别*/
SELECT B.ISBN AS 'ISBN码', B.BookName AS '书名', B.Category AS '类别'
	FROM Book B
	WHERE B.Category = '英语'
UNION
SELECT B.ISBN AS 'ISBN码', B.BookName AS '书名', B.Category AS '类别'
	FROM Book B
	WHERE B.Category = '数学';

/*管理需求：ISBN码为0000000000001和0000000000009的图书同时需要采购，让一家供货商来供货能够降低物流成本。因此，书店店长想查找过往是否有同时供应过这两款图书的供应商*/
/*访问请求表述：查找既供应了ISBN码为0000000000001的图书，也供应了ISBN码为0000000000009的图书的供应商的供应商ID、供应商名*/
SELECT Se.SuppID, Se.Name
	FROM Supplier Se, Supply Sy
	WHERE Se.SuppID = Sy.SuppID AND Sy.ISBN = '0000000000001'
INTERSECT
SELECT Se.SuppID, Se.Name
	FROM Supplier Se, Supply Sy
	WHERE Se.SuppID = Sy.SuppID AND Sy.ISBN = '0000000000009';

/*管理需求：由于ISBN码为0000000000009的图书存在大量印刷错误，所有供应此书的供货商因为需要重新印刷和运输而暂停了包括其他书在内的所有图书的供货服务。为了能够正常采购ISBN码为0000000000001的图书而不影响销售，书店店长想查找所有曾经供应过ISBN码为0000000000001的图书，但是没有供应过ISBN码为0000000000009的图书的供应商，进而问他们是否能够正常供应。*/
/*访问请求表述：需要查找供应了ISBN码为0000000000001的图书，但没有供应ISBN码为0000000000009的图书的供应商的供应商ID、供应商名*/
SELECT Se.SuppID, Se.Name
	FROM Supplier Se, Supply Sy
	WHERE Se.SuppID = Sy.SuppID AND Sy.ISBN = '0000000000001'
EXCEPT
SELECT Se.SuppID, Se.Name
	FROM Supplier Se, Supply Sy
	WHERE Se.SuppID = Sy.SuppID AND Sy.ISBN = '0000000000009';
