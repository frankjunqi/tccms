package net.tngou.enums;

public class UserEnum 
{
	
	/**
	 *  用户使用状态
	 * @author 陈磊
	 *
	 */
	public enum Use_Status
	{
			IsUse(1),NoUse(0),Delete(-1);//可用 ，不可用
		 	private int value;
		  private Use_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	

	
	/**
	 * 是否显示QQ号码
	 * @author 陈磊
	 *
	 */
	public enum QQ_Status
	{
			IsShow(1),NoShow(0);
		 	private int value;
		  private QQ_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	
	/**
	 * 是否显示电话号码
	 * @author 陈磊
	 *
	 */
	public enum Phone_Status
	{
			IsShow(1),NoShow(0);
		 	private int value;
		  private Phone_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	
	/**
	 * 是否显示邮箱
	 * @author 陈磊
	 *
	 */
	public enum Mail_Status
	{
			IsShow(1),NoShow(0);
		 	private int value;
		  private Mail_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	
	
	/**
	 * 性别状态
	 * @author 陈磊
	 *
	 */
	public enum Sex_Status
	{
			Man(1),Woman(0);
		 	private int value;
		  private Sex_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	
	/**
	 * 用户角色
	 * @author 陈磊
	 *
	 */
	public enum Role_Status
	{
			Admin(1),User(0);
		 	private int value;
		  private Role_Status(int value) {
			   this.value = value;
			}
		  public int getValue()
		  	{
			  return this.value;
		  	}
	}
	
}


