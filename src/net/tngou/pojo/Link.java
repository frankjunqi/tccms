package net.tngou.pojo;







/**
 *  
 * @author  www.tngou.net
 *
 */
public class Link extends POJO {


	private String name  	;	//   	
	private String url 	;	//   
	private int seq;
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
