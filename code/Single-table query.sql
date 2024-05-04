/*管理需求：书店店长计划增加书店中建材类图书的图书种类*/
/*访问请求表述：需要查询已有的分类为“建材”的所有书目的ISBN码、书名、作者*/
SELECT ISBN AS 'ISBN码', BookName AS '书名', Author AS '作者'
	FROM Book B
	WHERE B.Category = '建材';