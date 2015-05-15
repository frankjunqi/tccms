package net.tngou.util;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.Security;
import java.util.Date;

import org.apache.commons.codec.digest.DigestUtils;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.util.encoders.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 用于摘要的MD系列 加密 MD2 MD4 MD5 同时还有MD5 对文件校验
 * @author 陈磊
 * @version 2012/8/11
 *
 */
public class DigestMD {

	private static final Logger logger = LoggerFactory.getLogger(DigestMD.class);
	
	public static String MD2(String data)
	{
		if (data==null) 
		{
			return null;
		}
		
		try {
			
			MessageDigest 	md = MessageDigest.getInstance("MD2");
			byte[] b = md.digest(data.getBytes());	
			return new String(Hex.encode(b));
			
		} catch (NoSuchAlgorithmException e) {
			logger.error("{}MD2加密错误", data);
			e.printStackTrace();
		} 
		
		return data;
		
	}
	
	/**
	 * MD4 加密 用于bouncy castle
	 * @param data
	 * @return
	 */
	public static String MD4(String data)
	{
		if (data==null) 
		{
			return null;
		}
		Security.addProvider(new BouncyCastleProvider());
		try {
			MessageDigest md = MessageDigest.getInstance("MD4");
			byte[] b = md.digest(data.getBytes());
			return new String(Hex.encode(b));
		} catch (NoSuchAlgorithmException e) {
			logger.error("{}MD4加密错误", data);
			e.printStackTrace();
		} 
		return data;
		
	}
	
	/**
	 * MD5摘要 用的是commons codec 的MD5
	 * @param data
	 * @return
	 */
	public static String MD5(String data)
	{
		if (data==null) 
		{
			return null;
		}
		//byte[] b= DigestUtils.md5(data);
		return DigestUtils.md5Hex(data);
		
	}
	
	/**
	 * MD5摘要 用的是commons codec 的MD5
	 * @param data
	 * @return
	 */
	public static String MD5(File file) 
	{
		Date st = new Date();
		if (file==null)
		{
			return null;
		}
		
			 String r =null; 
			try {
				FileInputStream  input = new FileInputStream(file);
				r=DigestUtils.md5Hex(input);
				input.close(); 
			} catch (IOException e) {
				logger.error("{}文件MD5加密错误", file.getName());
				e.printStackTrace();
			}
			
		 
		return r;
	}
	
	
	
	
	/**
	 * @param args
	 * @throws NoSuchAlgorithmException 
	 */
	public static void main(String[] args) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		String s="mylove!";
		System.out.println(MD2(s));
		System.out.println(MD4(s));
		System.out.println(MD5(s));
		byte[] b = DigestUtils.md5(s);
		System.err.println(DigestUtils.md5Hex(s));
//		File f= new File("G://软件备份/ext-4.1.1-gpl.zip") ;
//		System.out.println(MD5(f));
		//System.out.println(MD51(f));
		
		
		

	}

}
