package net.tngou.pojo;







/**
 *  会员信息
 * @author www.tngou.net
 *
 */
public class User extends POJO {


	private String account 	;	//   	登录帐号 
	private String email 	;	//   	邮箱 
	private String password 	;	// 	  	密码 
	private String name="" 	;	// 	  	用户名称
	private int role ;	// 	用户权限，0：普通用户，1：管理员；-1:未激活；-2：黑名单 
  	
	@Override
	protected boolean isObjectCachedByID() {
		// TODO Auto-generated method stub
		return true;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	
	
	
}
