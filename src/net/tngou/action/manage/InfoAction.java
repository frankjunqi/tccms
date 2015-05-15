package net.tngou.action.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import com.alibaba.fastjson.JSON;

import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Info;
import net.tngou.pojo.Link;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;

public class InfoAction extends BaseAction{

	
	@Override
	public void execute() throws ServletException, IOException {
		
	
		 printFreemarker("manage/info.ftl", root);
	}
	
	public void add() {
		
		Info bean= (Info) getAsk(new Info());	
		long id = bean.save();
		printJson("{\"id\":"+id+"}");
	}
	
	
	
	
	public void edit() {
		
		Info bean= (Info) getAsk(new Info());
		
		long id = bean.update();
//		printJson("修改成功！");
	}
	
	
	public void json() {
		
		Ask ask = (Ask) getAsk( new Ask());
		
		Info bean = new Info();
		int total = bean.totalCount();
		List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows());
		String json = JSON.toJSONString(list);
		printJson(toJsonP(json, total));
		
		
	}
}
