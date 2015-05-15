package net.tngou.pojo;

import java.util.List;

import net.tngou.util.JsoupUtil;







/**
 *  
 * @author www.tngou.net
 *
 */
public class Info extends POJO {


	private String name 	;	//   
	private String logo 	;	//  
	private String img 	;	//   
	private String icp 	;	//   
	private String tel 	;	//   
	private String fax 	;	//  
	private String email 	;	//   
	private String address 	;	//  
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

 
	
	@Override
	protected boolean isObjectCachedByID() {
		// TODO Auto-generated method stub
		return true;
	}

	public String getIcp() {
		return icp;
	}

	public void setIcp(String icp) {
		this.icp = icp;
	}

	
	
	public String Logo() {
     	 
     	return JsoupUtil.Image(logo);
	}
	
	public List<String> Img() {
    	 
     	return JsoupUtil.Images(img);
	}
}
