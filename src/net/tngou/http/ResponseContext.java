package net.tngou.http;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import net.tngou.enums.CookieEnum;



public class ResponseContext extends HttpServletResponseWrapper implements HttpResponse {

	public ResponseContext(HttpServletResponse response) {
		super(response);
		// TODO Auto-generated constructor stub
	}
	
	 
	
	public void addMCookie(String hkey) 
	{
		int maxAge = 1800;//30分钟
		Cookie cookie = new Cookie(CookieEnum.ism.toString(), hkey);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/");
//		cookie.setDomain(".yi18.net");//域名cookie
		this.addCookie(cookie);
	
		
	}

	/**
	 * 永久，365天
	 */
	@Override
	public void addAutoLoginCookie(String hkey) 
	{

		Cookie cookie = new Cookie(CookieEnum.access_token.toString(), hkey);
		cookie.setPath("/");
//		cookie.setDomain(".yi18.net");//域名cookie
		this.addCookie(cookie);
	
		
	}
	
	/**
	 * 制定时间
	 */
	public void addAutoLoginCookie(int time,String hkey) 
	{
		int maxAge = time;
		Cookie cookie = new Cookie(CookieEnum.access_token.toString(), hkey);
		cookie.setMaxAge(maxAge);
		cookie.setPath("/"); //设置保存的目录，这里要看在什么目录下保存cookie
//		cookie.setDomain(".yi18.net");// 设置域名
		this.addCookie(cookie);
	
		
	}

	@Override
	public void removeAutoLoginCookie() {
		
		Cookie cookie = new Cookie(CookieEnum.access_token.toString(), null);
		cookie.setMaxAge(-1);
		cookie.setPath("/");
//		cookie.setDomain(".yi18.net");//域名cookie
		this.addCookie(cookie);
	}



	@Override
	public void addCookie(String key, String value) {
		
		Cookie cookie = new Cookie(key, value);
		cookie.setPath("/");
//		cookie.setDomain(".yi18.net");//域名cookie
		this.addCookie(cookie);
		
	}

	
	


}
