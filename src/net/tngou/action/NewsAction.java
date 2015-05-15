package net.tngou.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import net.tngou.cache.VisitLogEhCache;
import net.tngou.entity.PageUtil;
import net.tngou.jdbc.OrderType;
import net.tngou.pojo.Info;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Page;
import net.tngou.service.MenuService;
import net.tngou.service.PageService;


public class NewsAction extends BaseAction {
	
	@Override
	public void execute() throws ServletException, IOException {
		
		String sid= request.getParams()[0];
		Page news = new Page();
		news = news.get(Long.parseLong(sid));
		if(news==null){
			run_404();
			return;
		}//如果不存在就返回404页面
		VisitLogEhCache.Add(news.getId(),POJO.DABASE+"_page");//更新阅读数
		String filter="menu="+news.getMenu();
		Page last =news.last(Long.parseLong(sid),filter);//最新
		Page next =news.next(Long.parseLong(sid),filter);//旧的
		root.put("last", last);
		root.put("next", next);
		root.put("news", news);
		MenuService menuService = new MenuService();
		filter="type=2";
		List<? extends POJO> nav = menuService.getList(filter, "seq", OrderType.ASC, new Menu());
		root.put("nav", nav);
		root.put("id", news.getMenu());
		Map<String, String> map = menuService.getMenu();
		root.put("map", map);
		root.put("type",2);
		Info info = _getInfo();
		root.put("title",news.getTitle()+"-"+map.get(news.getMenu()+"")+"-"+ info.getName());
		root.put("keywords", news.getTitle()+"，"+map.get(news.getMenu()+"")+"，"+ info.getName());
		root.put("description", news.getTitle()+"，"+map.get(news.getMenu()+"")+"，"+ info.getName());
		printFreemarker("default/news-view.ftl", root);
	}
	
	public void list() {
		
		String[] params = request.getParams();
		int page= request.getParameter("p")==null?1:Integer.parseInt(request.getParameter("p"));
		
		PageService pageService = new PageService();
		MenuService menuService = new MenuService();
		Info info = _getInfo();
		String filter="type=2";
		List<? extends POJO> nav = menuService.getList(filter, "seq", OrderType.ASC, new Menu());
		root.put("nav", nav);
		Map<String, String> map = menuService.getMenu();
		root.put("map", map);
		if(params==null){
			PageUtil pageutil = pageService.getPage(page, 10, 2);
			root.put("page", pageutil);
			root.put("id", 0);
			root.put("title","新闻资讯-"+ info.getName());
			root.put("keywords", "新闻资讯，"+ info.getName());
			root.put("description", "新闻资讯，"+ info.getName());
		}else
		{
			filter ="menu="+params[0];
			PageUtil pageutil = pageService.getPage(page, 10, filter, new Page());
			root.put("page", pageutil);
			root.put("id", Integer.parseInt(params[0]));
			root.put("title",map.get(params[0])+"-"+ info.getName());
			root.put("keywords", map.get(params[0])+"，"+ info.getName());
			root.put("description", map.get(params[0])+"，"+ info.getName());
		}
		
		
		root.put("type",2);
		printFreemarker("default/news.ftl", root);
		
	}
}
