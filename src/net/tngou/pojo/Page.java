package net.tngou.pojo;

import java.sql.Timestamp;
import java.util.Date;

import net.tngou.util.JsoupUtil;







/**
 *  
 * @author  www.tngou.net
 *
 */
public class Page extends POJO {


	private String title  	;	//   	
	private String message 	;	//  
	private int menu;
	private int count;
	private String img;
	private Timestamp time = new Timestamp(new Date().getTime());
	
	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}


	


	public Timestamp getTime() {
		return time;
	}


	public void setTime(Timestamp time) {
		this.time = time;
	}


	@Override
	protected boolean isObjectCachedByID() {
		// TODO Auto-generated method stub
		return true;
	}


	public int getMenu() {
		return menu;
	}


	public void setMenu(int menu) {
		this.menu = menu;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}
	

	
	public String Img() {
		return JsoupUtil.Image(message);
		
		
	}
	
	
	
	
}
