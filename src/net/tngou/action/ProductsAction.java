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

public class ProductsAction extends BaseAction {
	
	@Override
	public void execute() throws ServletException, IOException {
		String sid= request.getParams()[0];
		Page products = new Page();
		products = products.get(Long.parseLong(sid));
		if(products==null){
			run_404();
			return;
		}//如果不存在就返回404页面
		VisitLogEhCache.Add(products.getId(),POJO.DABASE+"_page");//更新阅读数
		MenuService menuService = new MenuService();
		String filter="type=3";
		List<? extends POJO> nav = menuService.getList(filter, "seq", OrderType.ASC, new Menu());
		root.put("nav", nav);
		root.put("id", products.getMenu());
		root.put("products", products);
		Map<String, String> map = menuService.getMenu();
		root.put("map", map);
		root.put("type",3);
		Info info = _getInfo();
		root.put("title",products.getTitle()+"-"+map.get(products.getMenu()+"")+"-"+ info.getName());
		root.put("keywords", products.getTitle()+"，"+map.get(products.getMenu()+"")+"，"+ info.getName());
		root.put("description", products.getTitle()+"，"+map.get(products.getMenu()+"")+"，"+ info.getName());
		
		printFreemarker("default/products-view.ftl", root);
		
	}
	
	public void list() {
		
		String[] params = request.getParams();
		int page= request.getParameter("p")==null?1:Integer.parseInt(request.getParameter("p"));
		PageService pageService = new PageService();
		MenuService menuService = new MenuService();
		String filter="type=3";
		List<? extends POJO> nav = menuService.getList(filter, "seq", OrderType.ASC, new Menu());
		root.put("nav", nav);
		Map<String, String> map = menuService.getMenu();
		root.put("map", map);
		Info info = _getInfo();
		if(params==null){
			PageUtil pageutil = pageService.getPage(page, 8, 3);
			root.put("page", pageutil);
			root.put("id", 0);
			root.put("title","产品服务-"+ info.getName());
			root.put("keywords", "产品服务，"+ info.getName());
			root.put("description", "产品服务，"+ info.getName());
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
		
		root.put("type",3);
		printFreemarker("default/products.ftl", root);
	}
}
