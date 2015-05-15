package net.tngou.entity;

import java.io.Serializable;

/**
 * 主要是做访问量的统计
 * @author Administrator
 *
 */
public class Visits implements Serializable
{
	private long id;//记录访问内容的ID
	private int count;//记录访问计数
	private String type;//记录访问内容内容，通常用数据库的表来做内容
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
