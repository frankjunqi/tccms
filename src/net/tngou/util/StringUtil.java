package net.tngou.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;




public class StringUtil extends org.apache.commons.lang3.StringUtils  {

	
	/**
	 * 
	* @Description: 替换空格 ，半角 、全角
	 */
	 public static String ReplaceBlank(String str) {
		    if (str==null)return str;
	         Pattern p = Pattern.compile("\\s*|\t|\r|\n");
	         Matcher m = p.matcher(str);
	         str = m.replaceAll("");  
		    str= remove(str, "　");
	        str=remove(str, " ");	
	        return str;
	    }
	
}
