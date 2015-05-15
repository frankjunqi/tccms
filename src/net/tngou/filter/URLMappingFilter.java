package net.tngou.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tngou.http.*;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 此过滤器负责对编码进行自动处理，以及执行URL映射规则
 */
@WebFilter(urlPatterns="/*",
initParams={@WebInitParam(name="ignore",value = "/common,/action,/manage"),
		@WebInitParam(name="ignoreExts",value = "ico,css,js,jpg,gif,png,bmp,doc,xls,pdf,txt,html,htm,zip,rar,jsp,json,apk,swf")})
public class URLMappingFilter implements Filter {
	private final static Logger log= LoggerFactory.getLogger(URLMappingFilter.class);
	private List<String> ignoreURIs = new ArrayList<String>();
	private List<String> ignoreExts = new ArrayList<String>();


	/**
	 * @see Filter#destroy()
	 */
	
	public void destroy() {
		
	}

	
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException 
	{
	
		HttpRequest request=new RequestContext((HttpServletRequest) servletRequest);
		HttpResponse response = new ResponseContext((HttpServletResponse) servletResponse);
		request.setCharacterEncoding("UTF-8"); //设设置编码 
		String req_uri = request.getRequestURI();
		
		//项目名跳转
		if(req_uri.equals(request.getContextPath()+"/"))
		{		
			request.getRequestDispatcher("/action/index/execute").forward(request, response);
	        return ;
		}
		if(req_uri.startsWith(request.getContextPath()))
		{
			req_uri=req_uri.replaceFirst(request.getContextPath(), "");
		}
		
		//过滤URL后缀
		for(String ignoreExt : ignoreExts){
				if(req_uri.endsWith(ignoreExt)){
				     chain.doFilter(request, response);
				             return ;
				}
			}		
		//过滤URL前缀
		for(String ignoreURI : ignoreURIs){
		     if(req_uri.startsWith(ignoreURI)){
		    	 		chain.doFilter(request, response);
		    	 		return ;
		                }
		            }
		 
		String vm = null;
		
		vm = "/action"+req_uri;
		
		String[] spart = StringUtils.split(vm, "/");
		if(spart.length==2)
			vm=vm+"/execute";//如果没有指定方法，默认调用execute方法
		
		
		
		request.getRequestDispatcher(vm).forward(request, response);
		//chain.doFilter(request, response);
		
	}

	
	
	public void init(FilterConfig fConfig) throws ServletException 
	{
		//某些URL前缀不予处理（例如 /img/***）
		String ignores = fConfig.getInitParameter("ignore");
		 if(ignores != null)
		 for(String ig : StringUtils.split(ignores, ','))
			 ignoreURIs.add(ig.trim());

		//某些URL扩展名不予处理（例如 *.jpg）
		 ignores = fConfig.getInitParameter("ignoreExts");
		 if(ignores != null)
		    for(String ig : StringUtils.split(ignores, ','))
		             ignoreExts.add('.'+ig.trim());
		 log.info("正常启动Filter过滤器！");

	}
	
	

}
