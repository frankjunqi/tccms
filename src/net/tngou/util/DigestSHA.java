package net.tngou.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;



import org.apache.commons.codec.digest.DigestUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 摘要的SHA系列加密 SHA1 SHA224 SHA256 SHA384 SHA512 和SHA1文件加密
 * @author 陈磊
 * @version 2012/8/11
 *
 */
public class DigestSHA {

	private static final Logger logger = LoggerFactory.getLogger(DigestSHA.class);
	public static String SHA1(String data)
	{
		if (data==null) 
		{
			return null;
		}
//	
		return DigestUtils.sha1Hex(data);
		
	}
	public static String SHA1(File file)
	{
		
		if (file==null) 
		{
			return null;
		}
		String r =null;
		try {
			FileInputStream input = new FileInputStream(file);
			r= DigestUtils.sha1Hex(input);
			input.close();
		} catch (IOException e) {
			logger.error("{}文件SHA1加密错误", file.getName());
			e.printStackTrace();
		}
		
		
		return r;
	}
	
	
	public static String SHA224(String data)
	{
		if (data==null) 
		{
			return null;
		}
		Security.addProvider(new BouncyCastleProvider());
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-224");
			byte[] b = md.digest(data.getBytes());	
			return new String(Hex.encode(b));
			
		} catch (NoSuchAlgorithmException e) {
			logger.error("{}SHA-224加密错误", data);
			e.printStackTrace();
		} 
		return data;
		
	}
	public static String SHA256(String data)
	{
		if (data==null) 
		{
			return null;
		}
		
		return DigestUtils.sha256Hex(data);
		
	}
	public static String SHA384(String data)
	{
		if (data==null) 
		{
			return null;
		}
//		byte[] b = DigestUtils.sha384(data);
		return DigestUtils.sha384Hex(data);
		
	}
	public static String SHA512(String data)
	{
		if (data==null) 
		{
			return null;
		}
//		byte[] b = DigestUtils.sha512(data);
		return DigestUtils.sha512Hex(data);
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stu
		String s="mylove!";
		System.out.println(SHA1(s));
		System.out.println(SHA224(s));
		System.out.println(SHA256(s));
		System.out.println(SHA384(s));
		System.out.println(SHA512(s));
		//System.out.println(SHA1(new File("G://软件备份/eclipse-jee-juno-win32.zip")));
		
	}

}
