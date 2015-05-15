package net.tngou.jdbc;

import java.sql.Connection;
import java.sql.SQLException;




/**
 * 系统的基本配置 
 * @author 陈磊
 *
 */
public class Configurations 
{

	/**
	 *  取得数据库链接
	 * @return 数据库链接
	 * @throws SQLException
	 */
	public static Connection getConnection() throws SQLException 
	{
			return DBManager.getConnection();
		
	}
	
	/**
	 * 链接回收
	 */
	public static void closeConnection() 
	{
			DBManager.closeConnection();
	}
	
}
