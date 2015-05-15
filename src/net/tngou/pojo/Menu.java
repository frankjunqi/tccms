package net.tngou.pojo;







/**
 *  
 * @author  www.tngou.net
 *
 */
public class Menu extends POJO {


	private String name  	;	//   	
	private int type 	;	//   
	private int menu 	;	//
	private String url 	;	//
	private int seq 	;	//
	
	@Override
	protected boolean isObjectCachedByID() {
		// TODO Auto-generated method stub
		return true;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getMenu() {
		return menu;
	}

	public void setMenu(int menu) {
		this.menu = menu;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	

	
	
	
	
}
