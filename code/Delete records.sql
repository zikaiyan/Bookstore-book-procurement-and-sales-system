/*管理需求：由于书店刚开业资金投入较大，而买下的店面中的备用仓库暂时用不到，故书店店长将其出售给别人*/
/*访问请求表述：在数据库中需要删除备用仓库的信息*/
DELETE FROM StoreHouse
WHERE StoreHouseName = '备用仓库';
