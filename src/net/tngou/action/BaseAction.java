package net.tngou.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.io.Writer;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;











import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tngou.entity.Domain;
import net.tngou.enums.CookieEnum;
import net.tngou.http.HttpRequest;
import net.tngou.http.HttpResponse;
import net.tngou.jdbc.DBManager;
import net.tngou.jdbc.OrderType;
import net.tngou.pojo.Info;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.pojo.User;
import net.tngou.service.MenuService;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedBuilderParametersImpl;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.apache.commons.configuration2.io.FileHandler;
import org.apache.commons.configuration2.io.FileLocatorUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 所有的action类的父类
 * @author 陈磊
 *
 */
public  abstract class BaseAction  
{

	private static final Logger log= LoggerFactory.getLogger(BaseAction.class);
	@SuppressWarnings("rawtypes")
	private static Class[] NO_ARGS_CLASS = new Class[0];
	private static Object[] NO_ARGS_OBJECT = new Object[0];
	protected HttpRequest request;
	protected HttpResponse response;
	protected ServletContext context;
	protected HttpSession session;
	protected Configuration cfg; 
	protected Map<String, Object> root = new HashMap<String, Object>();
	protected String tngou_id=null;
	protected static final String Prefix=POJO.DABASE+"_";
	/**
	 * 初始化
	 * @param request
	 * @param response
	 * @throws ConfigurationException 
	 */
	public void init(HttpRequest request, HttpResponse response)  {
		this.request = request;
		this.response = response;
		this.context = request.getServletContext(); //3.0
		this.session = request.getSession();
		tngou_id=_GetCookieID(request);
		
		cfg = new Configuration(Configuration.getVersion());
		 
		try {
		
		    //加载并设置freemarker.properties  
			FileBasedBuilderParametersImpl builder =
				    new FileBasedBuilderParametersImpl()
				        .setFileName("freemarker.properties");
	      FileHandler header = builder.getFileHandler();
	      InputStream inputStream = new FileInputStream(FileLocatorUtils.fileFromURL(header.getURL()));
		  cfg.setSettings(inputStream);
		   
			
		     
			
		} catch (  IOException | TemplateException e) {
			// TODO Auto-generated catch block
			log.error("读取配置文件freemarker.properties错误！");
			e.printStackTrace();
		}
	
		cfg.setServletContextForTemplateLoading(
				context, "WEB-INF/templates");
		cfg.setDefaultEncoding("UTF-8");
		
		
	}
	
	/**
	 * 执行的类
	 * @throws ServletException
	 * @throws IOException
	 */
	public  void run() 
	{
			String action = request.getAction();
		
			//aop调用 执行 action 方法
					try {
						this.getClass().getMethod(action, NO_ARGS_CLASS).invoke(this, NO_ARGS_OBJECT);
					} catch (Exception e) {
						log.error("{} 类中 没有实现 {}方法 \n" + e,this.getClass(),action);
						run_404();//返回500
						e.printStackTrace();
					}finally
					{
						DBManager.closeConnection();//关闭数据库连接
					}
				

	};
	
	public  void run(String action) 
	{
			//String action = request.getAction();
		
			//aop调用 执行 action 方法
					try {
						this.getClass().getMethod(action, NO_ARGS_CLASS).invoke(this, NO_ARGS_OBJECT);
					} catch (Exception e) {
						log.error("{} 类中 没有实现 {}方法 \n" + e,this.getClass(),action);
						run_404();//返回500
						e.printStackTrace();
					}finally
					{
						DBManager.closeConnection();//关闭数据库连接
					}
				

	};
	
	protected void destroy()
	{
		
	}
	
	/**
	 * 默认执行的方法
	 * @throws ServletException
	 * @throws IOException
	 */
	public void execute() throws ServletException, IOException 
	{
		log.error("{} 类中 没有继承 execute() 方法 \n" ,this.getClass());
		

	}
	
	/**
	 * 跳转后浏览器地址栏变化<br>
	 * <p>
	 * 传值出去的话，只能在url中带parameter或者放在session中，无法使用request.setAttribute来传递。<br> 
	 * @param url 重定向访问的路径  http://127.0.0.1:8080/ape/index.html
	 */
	protected void sendRedirect(String url)
	{
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			log.error("访问的URL{}不存在！\n"+e,url);
			run_404();
			e.printStackTrace();
		}
		return;
	}
	
	/**
	 * Servlet页面跳转的路径是相对路径。forward方式只能跳转到本web应用中的页面上。
	 *<br>
	 *	跳转后浏览器地址栏不会变化。
	 *<br>
	 *使用这种方式跳转，传值可以使用三种方法：url中带parameter，session，request.setAttribute
	 *
	 * @param uri 跳转的相对路径 如：input.jsp
	 */
	public void forward(String uri) {
		
		
			try {
				request.getRequestDispatcher(uri).forward(request, response);
			} catch (ServletException | IOException e) {
				run_500();//返回500
				e.printStackTrace();
			} 
			
		
		return;
	}
	
	
	/**
	 * text/html 格式的返回
	 * @param html 显示的html
	 */
	protected void printHtml(String html) 
	{
		try {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(html);
		} catch (IOException e) {
			log.error("显示text/html{}报错\n"+e,html);
			run_500();//返回500
			e.printStackTrace();
			
		}
		return;
	}
	
	/**
	 * application/json 格式的返回json
	 * @param json 返回的json
	 */
	protected void printJson(String json) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(json);
		} catch (IOException e) {
			log.error("返回application/json{}报错\n"+e,json);
			run_500();//返回500
			e.printStackTrace();
		}
		return;
	}
	
	/**
	 *    通过Freemarker方式显示
	 * @param ftl ftl文件
	 * @param root 数据
	 */
 protected void printFreemarker(String ftl,Map<String,Object> root)
  {
	 
	//HttpSession session = new SessionContext( request);

	 root.put("Domain", getDomain());
	 if(root.get("session_id")==null) root.put("session_id", tngou_id); 
	 if(root.get("user")==null) root.put("user", session.getAttribute("user"));
	 if(root.get("info")==null) root.put("info", _getInfo());
	 if(root.get("menu")==null) root.put("menu", _getMenu());
	 //设置默认信息
	 if(root.get("title")==null)  root.put("title", "天狗");
	 if(root.get("keywords")==null)  root.put("keywords", "");
	 if(root.get("description")==null)  root.put("description", "");
	 if(root.get("author")==null)  root.put("author", "tngou.com");
	 if(root.get("type")==null) root.put("type",0);
	 
	 
	 try {
		Template  t = cfg.getTemplate(ftl);
		t.setEncoding("UTF-8");
		response.setContentType("text/html; charset=" + t.getEncoding());
		Writer out = response.getWriter();
		t.process(root, out);
	
	} catch (IOException | TemplateException  e) {
		log.error("通过Freemarker文件{}错误",ftl);
		run_500();//返回500
		e.printStackTrace();

	}
      
  }
 
 


 public String _GetCookieID( HttpRequest request) {
	 Cookie[] cookies = request.getCookies();//这样便可以获取一个cookie数组
	 
	 if(cookies==null)
		 return null;
	 
	 for(Cookie cookie : cookies){
		 if(cookie.getName().equals(CookieEnum.access_token.toString()))
		 {
			 return cookie.getValue();
		 }
	   
	 }
	return null;
}
 
 
 /**
  * 500页面
  */
	 public void run_500() {
		 try {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR );
			response.setCharacterEncoding("UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//返回500
	}
 
	 /**
	  * 404页面
	  */
	 public void run_404() {
		 try {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			response.setCharacterEncoding("UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 
	 /**
	  * 403页面
	  */
	 public void run_403() {
			
		 try {
			response.sendError(HttpServletResponse.SC_FORBIDDEN );
			response.setCharacterEncoding("UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }

	 protected Serializable getAsk( Serializable ask)
		{
			Map<String, ? extends Object> map = request.getParameterMap();
			
	
			try {
				BeanUtils.populate(ask, map);
			} catch (IllegalAccessException | InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		
			return ask;
		}
	 
	 
	 protected Domain getDomain()
	 {
		 Domain domain= new Domain();
		 try {
			 
			 Parameters params = new Parameters();
				FileBasedConfigurationBuilder<PropertiesConfiguration> builder =
				    new FileBasedConfigurationBuilder<PropertiesConfiguration>(PropertiesConfiguration.class)
				    .configure(params.properties()
				        .setFileName("tngou.properties"));	//那么这个文件会自动在下面几个地方被搜寻：当前目录 、用户主目录 、classpath
				PropertiesConfiguration properties = builder.getConfiguration();
			

			Map<String, String> cp_props =new HashMap<String, String>();//使用cp_props做临时的配置文件的存储
			Iterator<String> iterable = properties.getKeys();//取得配置文件中的key
			while (iterable.hasNext()) {
				String skey=iterable.next();
				  cp_props.put(skey, request.getScheme()+"://"+properties.getString(skey));				
			}
			BeanUtils.populate(domain, cp_props);//把配置文件的值封装到dataSource
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		 return domain;
	}
	 
	 protected boolean _islogin()
	 {
		 if(tngou_id==null)  return false;
		User user = (User) session.getAttribute(tngou_id);
		 if(user!=null)return true;
		 return false;
		 
	 }
	 
	 /**
	  * 404页面
	  */
	 public void run_false() {
		
		 String json="{\"success\": false}";
	
		printJson( json);
	}
	 
	
		
		public String toJsonP(String json,int total)
		{
			
			json="{\"total\":"+total+",\"rows\":"+json+"}";
			
			return json;
		}
	 
		
		protected Info _getInfo()  {
			Parameters params = new Parameters();
			FileBasedConfigurationBuilder<PropertiesConfiguration> builder =
			    new FileBasedConfigurationBuilder<PropertiesConfiguration>(PropertiesConfiguration.class)
			    .configure(params.properties()
			        .setFileName("config.properties"));	//那么这个文件会自动在下面几个地方被搜寻：当前目录 、用户主目录 、classpath
			
			try {
				PropertiesConfiguration properties = builder.getConfiguration();
				int id = properties.getInt("info.id");
				Info bean = new Info();
				return bean.get(id);
			} catch (ConfigurationException e) {
				
				e.printStackTrace();
				return null;
			}
			
			
		}
		
		
		protected List<Menu> _getMenu()  {
		
			MenuService menuService = new MenuService();
			
			String filter="	type >-1 AND menu=0";
			List<Menu> list = (List<Menu>) menuService.getList(filter, "seq", OrderType.ASC, new Menu());
			return list;
		}
	
}
