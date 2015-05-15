package net.tngou.util;

import java.util.Date;

import org.apache.commons.configuration2.io.FileLocator;
import org.apache.commons.configuration2.io.FileLocator.FileLocatorBuilder;
import org.apache.commons.configuration2.io.FileLocatorUtils;

public class OAuthUtil {

	
	/**
	 * 生成  Access_token
	 * 实现 SHA224加密 返回    56个十六进制的字符
	 * @param account
	 * @param password
	 * @return
	 */
	public static String Access_token(String account,String password) {
		String access_token=DigestMD.MD5(account+password);
		return access_token.replaceFirst("c", "l");
	}
	
	/**
	 * 取得Refresh_token 返回64位的字符集
	 * @param account
	 * @return
	 */
	public static String Refresh_token(String email) {
		String refresh_token=DigestSHA.SHA224(email+new Date().hashCode());
		
		return refresh_token.replaceFirst("c", "l");
	}
	
	public static void main(String[] args) {
		//System.err.println(Refresh_token("admin").length());
		
		FileLocator locator = FileLocatorUtils.fileLocator()
			    
			     .fileName("ehcache.xml")
			     .create();
		
		System.err.println(locator.getBasePath());
	}
}
