package net.tngou.action;

import java.io.IOException;














import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;















import net.tngou.http.HttpRequest;
import net.tngou.http.HttpResponse;
import net.tngou.http.RequestContext;
import net.tngou.http.ResponseContext;
import net.tngou.jdbc.DBManager;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;





/**
 * Servlet的接口 默认的URL :servlet/*<br>
 * 同时也可以配置文件 如：<br >
 * 
 *  <br >
 * <servlet><br >
 *   <servlet-name>servlet</servlet-name><br >
 *   <servlet-class>net.tngou.action.ServletAction</servlet-class><br >
 *   <init-param><br >
 *   <param-name>module</param-name><br >
 *   <param-value>module.properties</param-value><br >
 *   </init-param><br >
 *   <!-- 是否使用 异步处理  默认是false 不使用-->
 *   <async-supported>true</async-supported><br >
 *   <multipart-config></multipart-config><br >
 * </servlet><br >
 * <br >
 * <br >
  * <servlet-mapping><br >
 *   <servlet-name>servlet</servlet-name><br >
 *   <url-pattern>/action/*</url-pattern><br >
 * </servlet-mapping><br >
 * <br >
 * @author 陈磊
 *
 */
@WebServlet(urlPatterns= "/action/*",
	initParams={@WebInitParam(name="package",value = "net.tngou.action")})
public class ServletAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger log= LoggerFactory.getLogger(ServletAction.class);
	private static String packages ;//action的路径包
	
	
	/**
	 * 初始化,主要是完成module的内存加载<br>
	 * 从配置文件中读取module对于类
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		
		packages= config.getInitParameter("package");
		
		 
		super.init();
	}
	
	
  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp)
		  throws ServletException, IOException{
	  
	 
	 
	  
	  HttpRequest request=new RequestContext(req);
	  HttpResponse response = new ResponseContext(resp);
	  
//	 if (!_isIstall()) {//没有安装转移到安装页面	
//		  String url = request.basePath()+"install/index.html";
//		  response.sendRedirect(url );
//		  return;
//	  }
	  
	 String module= request.getModule();//取得调用类
	 String action= request.getAction();  //取得调方法
	 BaseAction baseAction = _retrieveModule(module); //初始调用类
	 if (baseAction==null) 
	 {
		 //没有找到Module 返回404
		response.sendError(HttpServletResponse.SC_NOT_FOUND);//返回404
		return ;
	 }
	 	
	baseAction.init(request, response); //初始化baseAction
	
	if (StringUtils.isNotEmpty(action))
	{
		baseAction.run(); //执行
	}
	else //默认执行
	{
		try {
			baseAction.execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBManager.closeConnection(); //释放数据库连接到连接池中
		}
		
	}
	
	
	
  }
  
  
  /**
   * 销毁
   */
  @Override
  public void destroy() {
	  	log.debug("destroy");
		super.destroy();
	}

  
  
  /**
   * 通过类的名称 ，返回名称对于的对象。如果没有找到该对象，返回NULL
   * @param moduleClass 类的名称 如：test.action.TestAction
   * @return 返回 Object对象
   */
  private  BaseAction _retrieveModule(String module) 
  {
	 
	 
	  module=StringUtils.capitalize(module+"Action");//module后添加Action 并且把第一个字母转为大写
	  String moduleClass=packages+"."+module;
	  //com.mykaoyan.action.TestAction

		try {
				BaseAction baseAction;
				baseAction = (BaseAction) Class.forName(moduleClass).newInstance();
				return baseAction;
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			
				log.error("没有对用的{}类",moduleClass);
				
				e.printStackTrace();
			}
			
		
		return null;
	
  }
  
 
  
  /**
   * 判断是否安装 安装返回true 没有安装返回 false
   * @return
   */
//  private boolean _isIstall()
//  {
//	  boolean install = false;
//	  try {
//		 PropertiesConfiguration dbProperties = new PropertiesConfiguration("jdbc.properties");
//		 dbProperties.setReloadingStrategy(new FileChangedReloadingStrategy());
//		 install  = dbProperties.getBoolean("install");
//		} catch (ConfigurationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	  return install;
//  }

  

}
