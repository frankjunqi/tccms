package net.tngou.http;


import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import net.tngou.enums.CookieEnum;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class RequestContext extends HttpServletRequestWrapper implements HttpRequest {
   private final static Logger log=LoggerFactory.getLogger(RequestContext.class); 
   private String path;//
	public RequestContext(HttpServletRequest request) {
		super(request);
	}

	/**
	 * 取得真实的ip地址<br>
	 * 由于如果网站通过Apache等类似的代理软件网站就不能取到客户端的真实IP，而是代理服务器的IP<br>
	 * 通过重新改方法，就可以取得真实的客户端IP
	 * 如果ip为空 返回 0.0.0.0
	 */
	@Override
	public String getRemoteAddr()
	{
		// We look if the request is forwarded
		// If it is not call the older function.
        String ip = super.getHeader("x-forwarded-for");
        
        if (ip == null) {
        	ip = super.getRemoteAddr();
        }
        else {
        	// Process the IP to keep the last IP (real ip of the computer on the net)
            StringTokenizer tokenizer = new StringTokenizer(ip, ",");

            // Ignore all tokens, except the last one
            for (int i = 0; i < tokenizer.countTokens() -1 ; i++) {
            	tokenizer.nextElement();
            }
            
            ip = tokenizer.nextToken().trim();
            
            if (ip.equals("")) {
            	ip = "0.0.0.0";
            }
        }
        // If the ip is still null, we put 0.0.0.0 to avoid null values
        if (ip == null) {
        	ip = "0.0.0.0";
        }
        
        return ip;
	}
	
	/**
	 * 重写getParameter方法。主要是处理get方式提交的数据编码问题
	 */

	
	/**
	 * 用于返回请求的方法
	 */
	@Override
	public String getAction() {
		String module_action=this._getModuleAction();
		String action = null;
		if (StringUtils.isNotEmpty(module_action))
		{
			String[] parts= StringUtils.split(module_action, "_");
			if (parts.length>1) 
			{
				action=parts[1];
				if(NumberUtils.isNumber(action))return null;
			}
			else {
				action=null;
				log.error("请求action为空");
			}
		}
		return action;
	}

	
	/**
	 * 用于返回请求的执行类
	 */
	@Override
	public String getModule() {
		String module_action=this._getModuleAction();
		if (StringUtils.isNotEmpty(module_action))
		{
			return StringUtils.split(module_action, "_")[0];
		}
		return null;
	}

	
	/**
	 * 取得Module/Action
	 * Module:请求的类
	 * Action：方法
	 * @return blog_show
	 */
	private String _getModuleAction() 
	{
	
		String path= this.getContextPath();//项目名称
		String uri=this.getRequestURI();//URI  如 action/blog/show
		String module_action=null;
		String[] parts=StringUtils.split(StringUtils.split(uri,"&")[0],"/");
		if(parts.length>3&&StringUtils.isNotEmpty(path)) //如果存在项目名称
		{
			module_action=parts[2]+"_"+parts[3];	// 取mykaoyan/action/test/show 中的test_show
		}else if(parts.length>2&&StringUtils.isEmpty(path)) {
			module_action=parts[1]+"_"+parts[2];	
		}	
		else if(parts.length>2&&StringUtils.isNotEmpty(path)) {
			module_action=parts[2]+"_"+"execute";	
		}	
		else if(parts.length>1&&StringUtils.isEmpty(path)) {
			module_action=parts[1]+"_"+"execute";	
		}	
		return module_action;
	}

	
	/**
	 * 同http中的：<br>
	 * String path = request.getContextPath();<br>
	 *String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 * <br>
	 * <p>
	 * 取得当前工程的URL如： http://127.0.0.1:8080/ape/
	 */
//	@Override
//	public String basePath() {
//		if(this.path!=null) return this.path;
//		return getScheme()+"://"+getServerName()+":"+getServerPort()+getContextPath()+"/";
//	}

	/**
	 * 取得url传入的参数如
	 * action/blog/show/mynote/123   其中的参数就是 mynote 和 123
	 * 这里不管mynote和123 代表什么意思，就只实现取值
	 */
	@Override
	public String[] getParams() {
		String path= this.getContextPath();//项目名称
		String uri=this.getRequestURI();
		String[] parts=StringUtils.split(StringUtils.split(uri,"&")[0],"/");
		if(getAction()!=null)
		{
			if (parts.length>3&&StringUtils.isNotEmpty(path)) 
			{
				parts=ArrayUtils.removeAll(parts,0,1,2,3);
				if(parts.length>0)
					return parts ;
			} else if(parts.length>2)
			{
				parts= ArrayUtils.removeAll(parts, 0,1,2);
				if(parts.length>0)
					return parts ;
			}
		}else
		{
			if (parts.length>2&&StringUtils.isNotEmpty(path)) 
			{
				parts=ArrayUtils.removeAll(parts,0,1,2);
				if(parts.length>0)
					return parts ;
			} else if(parts.length>1)
			{
				parts= ArrayUtils.removeAll(parts, 0,1);
				if(parts.length>0)
					return parts ;
			}
		}
		return null;
		
	
	}

	@Override
	public boolean isSubmit() {
		return this.getParameter("sub")!=null?true:false;
	}

	/**
	 * 判断访问的是否是手机端，是返回true
	 * @return
	 */
	public boolean isMobile() {
		
		
		Cookie[] cookies =this.getCookies();
		if(cookies!=null)
		{
			
		for(Cookie cookie : cookies){
			 if(cookie.getName().equals(CookieEnum.ism.toString()))
			 {
				 String v = cookie.getValue();
				 if(v.equals("cp")) return false;
			 }
		   
		 }
		}
		String accept = this.getHeader("Accept");
		if(accept.indexOf("wap.wml")>0)return true;
		return false;
	}
	
	

}
