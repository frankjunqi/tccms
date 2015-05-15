package net.tngou.action.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import com.alibaba.fastjson.JSON;

import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Link;
import net.tngou.pojo.POJO;
import net.tngou.pojo.User;

public class LinkAction extends BaseAction{

	
	@Override
	public void execute() throws ServletException, IOException {
		
		 
		 printFreemarker("manage/linklist.ftl", root);
	}
	
	public void json() {
		Ask ask = (Ask) getAsk(new Ask());
		Link bean = new Link();	
		int total = bean.totalCount();
		List<? extends POJO> list = bean.list( ask.getPage(), ask.getRows());
		String json = JSON.toJSONString(list);
		printJson(toJsonP(json, total));
	}
	
	public void add() {
		
		Link link = (Link) getAsk(new Link());
		link.save();
	}
	
	public void delete()
	{
		
		String[] ids=request.getParameterValues("id[]");
		String sql="DELETE FROM `"+Prefix+"link`  WHERE id=?";
		Object[][] params = new Object[ids.length][1];
		String id="";
		for (int i = 0; i < params.length; i++) {
			if(i!=0) id+=",";
			id+=i;
			params[i][0]=ids[i];
		}
		QueryHelper.batch(sql, params );
		
		
		printJson("{\"msg\":\""+id+"\"}");
		
	}
	
	public void edit() {
		
		Link bean= (Link) getAsk(new Link());
		
		long id = bean.update();
		printJson("修改成功！");
	}
}
