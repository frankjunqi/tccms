package net.tngou.http;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

public interface HttpRequest extends HttpServletRequest {

	
	
	public String getAction();
	public String getModule();
	public String[] getParams();
	public boolean isSubmit();
	public boolean isMobile();
	//public ServletContext getServletContext();
}
