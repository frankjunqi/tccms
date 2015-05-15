package net.tngou.service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.tngou.pojo.Menu;



public class MenuService extends BaseService {

	
	public Map<String, String> getMenu() {
		
		Serializable key="getMenu";
		String fullyQualifiedName="Menu";
		Map<String, String> map=(Map<String, String>) cacheEngine.get(fullyQualifiedName, key);		
		if(map!=null)return map;		
		Map<String, String> msn = new HashMap<String, String>();	
		Menu bean = new Menu();
			List<Menu> list = (List<Menu>) bean.list();
			 list.forEach(e->{
				 msn.put(e.getId()+"", e.getName());
			 });
			 cacheEngine.add(fullyQualifiedName, key, msn);							 
		 return msn;
		
	}
}
