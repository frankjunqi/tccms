package net.tngou.jdbc;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;




/**
 *  	数据库管理
 * @author 陈磊 
 * @since 2012/11/06 
 *      参考 Oschina  http://www.oschina.net/
 */
public class DBManager 
{
	
	private final static Logger log = LoggerFactory.getLogger(DBManager.class);
	private final static ThreadLocal<Connection> conns = new ThreadLocal<Connection>();
	private static DataSource dataSource;
	private static boolean show_sql = false;
	
	/**
	 * 初始化
	 */
	static 
	{	
		        initDataSource();
	    }

	/**
	 *  	初始话连接池
	 * @param dbProperties
	 * @param show_sql 
	 */
	private final static void initDataSource() 
	{
		
		try {
			Configuration dbProperties=null;
			
			

				
				Parameters params = new Parameters();
				FileBasedConfigurationBuilder<PropertiesConfiguration> builder =
				    new FileBasedConfigurationBuilder<PropertiesConfiguration>(PropertiesConfiguration.class)
				    .configure(params.properties()
				        .setFileName("jdbc.properties"));	//那么这个文件会自动在下面几个地方被搜寻：当前目录 、用户主目录 、classpath
				dbProperties=builder.getConfiguration();
			
				Map<String, String> cp_props = new HashMap<String, String>();//使用cp_props做临时的配置文件的存储
				
				Iterator<String> iterable = dbProperties.getKeys();//取得配置文件中的key
				//遍历赋值  dbProperties ——》cp_props
				while (iterable.hasNext()) 
					{
							String skey=iterable.next();
							if(skey.startsWith("jdbc."))//只赋值jdbc. 开始的
							{
								   String name = skey.substring(5);
								   cp_props.put(name, dbProperties.getString(skey));	
								   if("show_sql".equalsIgnoreCase(name))
								       {
								     show_sql = "true".equalsIgnoreCase((String) dbProperties.getProperty(skey));
								        }	
							 }
					}
				
				//从配置文件中对取使用的链接池
				// Class.forName(cp_props.getProperty("driverClassName"));//加载驱动，由于在web发布时不能自动加载
				dataSource = (DataSource)Class.forName(cp_props.get("datasource")).newInstance();
				 
				 //				if(dataSource.getClass().getName().indexOf("c3p0")>0)
//				{
//				                //Disable JMX in C3P0
//						System.setProperty("com.mchange.v2.c3p0.management.ManagementCoordinator",
//						"com.mchange.v2.c3p0.management.NullManagementCoordinator");	
//						
//				  }
			
					log.info("使用  DataSource : " + dataSource.getClass().getName());
				 BeanUtils.populate(dataSource, cp_props);//把配置文件的值封装到dataSource
				
				 Connection conn = getConnection();//测试链接
				 DatabaseMetaData mdm = conn.getMetaData();
				 log.info("Connected to " + mdm.getDatabaseProductName() +
				                              " " + mdm.getDatabaseProductVersion());
				 closeConnection();//关闭链接
			

		} catch (Exception  e) 
		{
			log.error("数据库链接失败！\n");
				e.printStackTrace();
		}
		
		
	}

	/**
	 * 关闭链接
	 */
	public final static void closeConnection() {
		Connection conn = conns.get();
		 try {
		        if(conn != null && !conn.isClosed()){
		            conn.setAutoCommit(true);
		            conn.close();
		            }
		   } catch (SQLException e) {
		       log.error("不能关闭链接!!! ", e);
		        }
		   conns.set(null);
	
		   //EhCacheEngine.stop();//再关闭二级缓存
	}

	/**
	 * 断开连接池
	 */

		public final static void closeDataSource() {
			try {
				      dataSource.getClass().getMethod("close").invoke(dataSource);
				   } catch (NoSuchMethodException e){
				   } catch (Exception e) {
				       log.error("Unabled to destroy DataSource!!! ", e);
				
				   }

		
	}

		/**
		 * 	取得链接
		 * @return
		 * @throws SQLException
		 */
		public final static Connection getConnection() throws SQLException {
			 Connection conn = conns.get();
			 if(conn ==null || conn.isClosed())
			 {
			  conn = dataSource.getConnection();
			   conns.set(conn);
			 }
			 return (show_sql && !Proxy.isProxyClass(conn.getClass()))?
			               new _DebugConnection(conn).getConnection():conn;

		 }


		/**
		 *  用于跟踪执行的SQL语句
		 * @author 陈磊
		 *
		 */
		static class _DebugConnection implements InvocationHandler {

			    private final static Logger log = LoggerFactory.getLogger(_DebugConnection.class);
			    private Connection conn = null;
			    public _DebugConnection(Connection conn) 
					        {
					
					            this.conn = conn;
					
					        }
		      
			    public Connection getConnection() 
			       		{
			         return (Connection) Proxy.newProxyInstance(conn.getClass().getClassLoader(),
			                         conn.getClass().getInterfaces(), this);
			       		}

			    @Override
				public Object invoke(Object proxy, Method m, Object[] args) throws Throwable 
			  			{
			          try {
			                  String method = m.getName();
			                  if("prepareStatement".equals(method) || "createStatement".equals(method))
			                            log.info("[SQL] >>> " + args[0]);             
			                     return m.invoke(conn, args);
			                } catch (InvocationTargetException e)
			                							{
			                 throw e.getTargetException();
			                							}
			  			}
		            
		    }

		 
	
	
}
