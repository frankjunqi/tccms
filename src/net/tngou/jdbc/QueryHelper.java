package net.tngou.jdbc;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;






import net.tngou.cache.CacheEngine;
import net.tngou.cache.EhCacheEngine;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang.ArrayUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;





/**
 *  	数据库查询助手
 * @author 陈磊
 * @since 2012/11/07 
 *      参考 Oschina  http://www.oschina.net/
 */

public class QueryHelper 
{
	private final static Logger log = LoggerFactory.getLogger(QueryHelper.class);		
	private final static QueryRunner _g_runner = new QueryRunner();
	private static CacheEngine cacheEngine =new  EhCacheEngine().getInstance();
	 @SuppressWarnings("rawtypes")
	 
	private final static ScalarHandler _g_scaleHandler = new ScalarHandler(){
		         @Override
				public Object handle(ResultSet rs) throws SQLException {
		             Object obj = super.handle(rs);
		             if(obj instanceof BigInteger)
		                 return ((BigInteger)obj).longValue();
		             return obj;
		         }      
	
		     };
		 @SuppressWarnings("rawtypes")
		private final static ColumnListHandler _g_columnListHandler = new ColumnListHandler()
		 {
		    	         @Override
		    	         protected Object handleRow(ResultSet rs) throws SQLException {
		    	             Object obj = super.handleRow(rs);
		    	             if(obj instanceof BigInteger)
		    	                 return ((BigInteger)obj).longValue();
		    	
		    	             return obj;
		    	         }       };


	
	/**
	 *  读取某个对象
	 * @param beanClass   对象的class
	 * @param sql    执行的sql select × from user where name = ？
	 * @param params 传入参数
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> T read(Class<T> beanClass, String sql, Object...params) 
	{
		  try {
				return (T)_g_runner.query(_getConnection(), sql, _IsPrimitive(beanClass)?_g_scaleHandler:new BeanHandler(beanClass), params);
		   } catch (SQLException e) 
			{
			   			   	
					DBManager.closeConnection();
					e.printStackTrace();
					return null;
			}
				
		}

	@SuppressWarnings("unchecked")
	public static <T> T read_cache(String fullyQualifiedName, String key,Class<T> beanClass, String sql, Object...params) 
	{
		T obj = (T)cacheEngine.get(fullyQualifiedName, key);
		if(obj == null){
					obj = read(beanClass, sql, params);
		}
		cacheEngine.add(fullyQualifiedName, key, obj);
		return obj;	
		  }

	/**
	 *  	对象查询
	 * @param beanClass
	 * @param sql
	 * @param params
	 * @return
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static <T> List<T> query(Class<T> beanClass, String sql, Object...params)
	{  
		  try {
				return (List<T>)_g_runner.query(_getConnection(), sql, _IsPrimitive(beanClass)?_g_columnListHandler:new BeanListHandler(beanClass), params);
			} catch (SQLException e) {	
				DBManager.closeConnection();
				e.printStackTrace();
				return null;
			
			}
		
		 }
	@SuppressWarnings("unchecked")
	public static <T> List<T> query_cache(String fullyQualifiedName, String key,Class<T> beanClass, String sql, Object...params)
	{  
		List<T> obj = (List<T>)cacheEngine.get(fullyQualifiedName, key);
		if(obj == null){
			obj = query(beanClass, sql, params);
		}
		cacheEngine.add(fullyQualifiedName, key, obj);
		return obj;	
  }
	
	
	/**
	 * 	分页查询
	 * @param beanClass
	 * @param sql
	 * @param page
	 * @param count
	 * @param params
	 * @return
	 */
	public static <T> List<T> query_slice(Class<T> beanClass, String sql, int page, int count, Object...params) 
	{
		        if(page < 0 || count < 0)

		            throw new IllegalArgumentException("Illegal parameter of 'page' or 'count', Must be positive.");
		        int from = (page - 1) * count;
		        count = (count > 0) ? count : Integer.MAX_VALUE;
		        return query(beanClass, sql + " LIMIT ?,?", ArrayUtils.addAll(params, new Integer[]{from,count}));     
		    }
	
	@SuppressWarnings("unchecked")
	public static <T> List<T> query_slice_cache(String fullyQualifiedName, String key,int cache_obj_count,Class<T> beanClass, String sql, int page, int count, Object...params) {

		List<T> objs = (List<T>)cacheEngine.get(fullyQualifiedName, key);
		if(objs == null) {
			objs = query_slice( beanClass, sql, 1, cache_obj_count, params);
			cacheEngine.add(fullyQualifiedName, key, objs);
		}
		if(objs == null || objs.size()==0)
			return objs;
		int from = (page - 1) * count;
		if(from < 0)
			return null;
		if((from+count) > cache_obj_count)//超出缓存的范围
			return query_slice(beanClass, sql, page, count, params);
		int end = Math.min(from + count, objs.size());
		if(from >= end)
			return null;
		return objs.subList(from, end);    
    }
	
	
	/**
	 * 执行统计查询语句，语句的执行结果必须只返回一个数值
	 * @param sql
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static long stat(String sql, Object...params) {
		        try{
		            Number num = (Number)_g_runner.query(_getConnection(), sql, _g_scaleHandler, params);
		            return (num!=null)?num.longValue():-1;
		        }catch(SQLException e){
		        	
		        	DBManager.closeConnection();
					e.printStackTrace();
					
					return 0;
		        }
		    }
	
	public static long stat_cache(String fullyQualifiedName, String key,String sql, Object...params) {
		Number value = (Number) cacheEngine.get(fullyQualifiedName, key);
		if (value==null) 
		{
			value =stat(sql, params);
			cacheEngine.add(fullyQualifiedName, key, value);
		}
			return value.longValue();

    }

	
	/**
	 * 执行INSERT/UPDATE/DELETE语句
	 * @param sql
	 * @param params
	 * @return
	 */
	public static int update(String sql, Object...params) {
		        try{
		            return _g_runner.update(_getConnection(), sql, params);
		        }catch(SQLException e){
		        	DBManager.closeConnection();
					e.printStackTrace();
		          	return 0;
		        }
		    }

	/**
	 * 批量执行指定的SQL语句
	 * @param sql
	 * @param params
	 * @return
	 */
	 public static int[] batch(String sql, Object[][] params) {
		         try{
		             return _g_runner.batch(_getConnection(), sql, params);
		         }catch(SQLException e){
		        	 DBManager.closeConnection();
					e.printStackTrace();
			         return null ;
		         }
		     }



	
	
	
	
	
	
	
	/**
	 *  判断类
	 * @param cls
	 * @return
	 */
	private final static boolean _IsPrimitive(Class<?> cls) 
	{
		        return cls.isPrimitive() || PrimitiveClasses.contains(cls) ;
	}
		
		     

	/**
	 * 基础内
	 */
	@SuppressWarnings("serial")
	private final static List<Class<?>> PrimitiveClasses = new ArrayList<Class<?>>()
			{{
		        add(Long.class);
		        add(Integer.class);
		        add(String.class);
		        add(java.util.Date.class);
		        add(java.sql.Date.class);
		        add(java.sql.Timestamp.class);
		    }};

	
	/**
	 * 取得s数据库链接
	 * @return
	 */
	private static Connection _getConnection()
	{
		 try {
			return Configurations.getConnection();
		} catch (SQLException e)
		{
			log.error("不能取得数据库链接{}", e.getMessage());
			return null;
		}
	}
}

