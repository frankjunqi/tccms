package net.tngou.service;

import java.io.Serializable;

import net.tngou.dao.PageDao;
import net.tngou.entity.PageUtil;


public class PageService extends BaseService {

	public PageUtil getPage(int page,int size,int type) {
		String fullyQualifiedName = "Page";
		Serializable key="getPage_p"+page+"_s"+size+"_t"+type;
		PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
		if(pageUtil==null)
		{
			PageDao pageDao = new PageDao();
			pageUtil=new PageUtil(pageDao.getPage(type, page, size),page,size,pageDao.getPage(type));
			cacheEngine.add(fullyQualifiedName, key, pageUtil);
		}
		return pageUtil;
		
	}
	
	
}
