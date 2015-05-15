package net.tngou.entity;

import java.io.Serializable;



public class Ask  implements Serializable
{
	 private long id;
	 private String callback;//Jsonp返回数据
	 private int rows = 20;//显示大小
	 private int page =1;//当前页
	 private int start=1;//开始条数
	 private String keyword; //关键字
	 private String type;//请求类型
	 
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCallback() {
		return callback;
	}
	public void setCallback(String callback) {
		this.callback = callback;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	 
	 
	 
}
