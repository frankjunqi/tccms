package net.tngou.action.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSON;

import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.POJO;
import net.tngou.pojo.User;
import net.tngou.util.DigestMD;


public class UserAction extends BaseAction{

	
	@Override
	public void execute() throws ServletException, IOException {
		
		 printFreemarker("manage/userlist.ftl", root);
	}
	
	public void json() {
		Ask ask = (Ask) getAsk(new Ask());
		User bean = new User();	
//		String filter="role="+ask.getId();
		int total = bean.totalCount();
		List<? extends POJO> list = bean.list( ask.getPage(), ask.getRows());
		String json = JSON.toJSONString(list);
		printJson(toJsonP(json, total));
	}
	
	public void add() {
		
		User user = (User) getAsk(new User());
		user.setPassword(DigestMD.MD5(user.getPassword()));
		user.save();
	}
	
	public void delete()
	{
		
		String[] ids=request.getParameterValues("id[]");
		String sql="DELETE FROM `"+Prefix+"user`  WHERE id=?";
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
		
		User bean= (User) getAsk(new User());
		if(StringUtils.isEmpty(bean.getPassword()))
		{
			User user = new User().get(bean.getId());
			bean.setPassword(user.getPassword());
		}else
		{
			bean.setPassword(DigestMD.MD5(bean.getPassword()));
		}
		long id = bean.update();
		printJson("修改成功！");
	}
}
