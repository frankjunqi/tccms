package net.tngou.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import net.tngou.cache.VisitLogEhCache;
import net.tngou.jdbc.OrderType;
import net.tngou.pojo.Info;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Page;
import net.tngou.service.MenuService;

public class AboutAction extends BaseAction {
	
	@Override
	public void execute() throws ServletException, IOException {
		String sid= request.getParams()[0];
		
		Page about = new Page();
		
		String filter = "menu="+sid;
		List<Page> list = (List<Page>) about.list(filter , 1, 1);
		if(list.isEmpty()||list.size()==0)
		{
			run_404();
			return;
		}//如果不存在就返回404页面
		about = list.get(0);
		VisitLogEhCache.Add(about.getId(),POJO.DABASE+"_page");//更新阅读数
		MenuService menuService = new MenuService();
		 filter="type=1";
		List<? extends POJO> nav = menuService.getList(filter, "seq", OrderType.ASC, new Menu());
		root.put("nav", nav);
		root.put("id", about.getMenu());
		Map<String, String> map = menuService.getMenu();
		root.put("map", map);
		root.put("about", about);
		root.put("type",1);
		Info info = _getInfo();
		root.put("title",about.getTitle()+"-"+ info.getName());
		root.put("keywords", about.getTitle()+"-"+ info.getName());
		root.put("description", about.getTitle()+"-"+ info.getName());
		
		printFreemarker("default/about.ftl", root);
	}
}
