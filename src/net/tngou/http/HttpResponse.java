package net.tngou.http;

import javax.servlet.http.HttpServletResponse;

public interface HttpResponse extends HttpServletResponse {
	
	
	public void addAutoLoginCookie(String hkey) ;
	public void addAutoLoginCookie(int time,String hkey) ;
	public void removeAutoLoginCookie() ;
	public void addMCookie(String hkey) ;
	
	public void addCookie(String key,String value);
	
}
