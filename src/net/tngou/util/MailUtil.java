package net.tngou.util;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLDecoder;

import org.apache.commons.configuration2.FileBasedConfiguration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.apache.commons.io.FileUtils;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class MailUtil {

	private final static Logger log = LoggerFactory.getLogger(MailUtil.class);
	private static String hostname;//主机
	private static String user;//验证的用户名
	private static String password;//验证的密码
	private static String name; //发送者姓名
	private static String from;//发送者邮箱
	private static String subject;//发送主题

	
	static{
		try {
			//module这个文件会自动在下面几个地方被搜寻：当前目录 、用户主目录 、classpath
			Configurations configs = new Configurations();
			File mailFile = new File("mail.properties");
			PropertiesConfiguration conf = configs.properties(mailFile);
			hostname=conf.getString("mail.hostname");
			user=conf.getString("mail.user");
			password=conf.getString("mail.password");
			name=conf.getString("mail.name");
			from=conf.getString("mail.from");
			subject=conf.getString("mail.subject");
		} catch (ConfigurationException e) {
			log.error("读取邮件配置文件出错");
			e.printStackTrace();
		}
		
		
	}
	
	/**
	 * 发送html邮件
	 * @param tomail 接受邮件
	 * @param html 发送的html
	 * @return
	 */
	public static boolean sendHtml(String tomail,String html)
	{
		HtmlEmail email = new HtmlEmail();
		try {
			
			email.setHostName(hostname);
			
			email.setAuthentication(user,password);
			email.addTo(tomail);
			email.setFrom(from, name);
			email.setSubject(subject);
			 email.setCharset("UTF-8");  
			email.setHtmlMsg(html);
			
			email.send();
		} catch (EmailException e) {
			log.error("发送邮件失败");
			e.printStackTrace();
			return false;
		}
		return true;	
	}
	
	
	/**
	 * 
	 * @param tomail 接受邮箱
	 * @param subject 发送的主题
	 * @param html 发送的html
	 * @return
	 */
	public static boolean sendHtml(String tomail,String subject,String html)
	{
		HtmlEmail email = new HtmlEmail();	
		try {
			email.setHostName(hostname);
			email.setAuthentication(user,password);
			email.addTo(tomail);
			email.setFrom(from, name);
			email.setSubject(subject);
			 email.setCharset("UTF-8");  
			email.setHtmlMsg(html);
			email.send();
		} catch (EmailException e) {
			log.error("发送邮件失败{}",tomail);
			e.printStackTrace();
			return false;
		}
		return true;	
	}
	

	public static String ReadActivateMail() {
		
		
		Parameters params = new Parameters();
		@SuppressWarnings({ "rawtypes", "unchecked" })
		FileBasedConfigurationBuilder<?> builder =
			    new FileBasedConfigurationBuilder(FileBasedConfiguration.class)
			    .configure(params.properties()
			        .setFileName("mail/activateMail.html"));
		URL url = builder.getFileHandler().getURL();
		try {
			File file = new File(url.toURI());
			String s = FileUtils.readFileToString(file, "UTF-8");
			return s;
		} catch (URISyntaxException | IOException e) {
		
			e.printStackTrace();
		}
		
		
		return "";
		
		
	}
	
	
	public static String ReadLostPasswordMail() {
		
		Parameters params = new Parameters();
		@SuppressWarnings({ "rawtypes", "unchecked" })
		FileBasedConfigurationBuilder<?> builder =
			    new FileBasedConfigurationBuilder(FileBasedConfiguration.class)
			    .configure(params.properties()
			        .setFileName("mail/lostPasswordMail.html"));
		URL url = builder.getFileHandler().getURL();
		try {
			File file = new File(url.toURI());
			String s = FileUtils.readFileToString(file, "UTF-8");
			return s;
		} catch (URISyntaxException | IOException e) {
		
			e.printStackTrace();
		}
		
		return "";
		
		
	}
	
	/**
	 * @param args
	 * @throws EmailException 
	 * @throws ConfigurationException 
	 * @throws IOException 
	 */
	public static void main(String[] args) throws EmailException, ConfigurationException, IOException 
	{
		
//		String  mail = Thread.currentThread().getContextClassLoader().getResource("").getPath()+"mail/mail.html";
//		mail=URLDecoder.decode(mail, "UTF-8");
//		//
//		
//		File file = new File(mail);

		System.out.println(sendHtml("397713572@qq.com", ReadActivateMail()));
//		System.out.println(sendHtml("2848589497@qq.com", mailhtml));
//		System.out.println(sendHtml("no-reply@yi18.net", mailhtml));
//		System.out.println(sendHtml("yi18@yi18.net", mailhtml));
//		System.out.println(new PropertiesConfiguration("mail/activateMail.html").getFile());
//		System.out.println(sendHtml("mail.yi18.net@gmail.com", mailhtml));
		
		

	}

}
