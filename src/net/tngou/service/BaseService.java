package net.tngou.service;

import java.io.File;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.tngou.cache.CacheEngine;
import net.tngou.cache.EhCacheEngine;
import net.tngou.entity.Domain;
import net.tngou.entity.PageUtil;
import net.tngou.jdbc.OrderType;
import net.tngou.pojo.POJO;
import net.tngou.util.Inflector;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.fluent.Configurations;
import org.apache.commons.configuration2.ex.ConfigurationException;
import org.apache.commons.lang3.StringUtils;





public class BaseService 
{
	
	protected static CacheEngine cacheEngine =new  EhCacheEngine().getInstance();
	
	
	/**
	 * 取得page
	 * @param page
	 * @param size
	 * @param pojo
	 * @return
	 */
	public PageUtil getPage(int page,int size,POJO pojo) {
			String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getPage_p"+page+"_s"+size;
			PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
			if(pageUtil==null)
			{
				pageUtil=new PageUtil(pojo.list(page, size),page,size,pojo.totalCount());
				cacheEngine.add(fullyQualifiedName, key, pageUtil);
			}
			return pageUtil;
			
		}
		
		public PageUtil getPage(int page,int size,String type,OrderType order,POJO pojo) {
			String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getPage_p"+page+"_s"+size+"_t"+type+"_o"+order.toString();
			PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
			if(pageUtil==null)
			{
				pageUtil=new PageUtil(pojo.list(page, size, type, order),page,size,pojo.totalCount());
				cacheEngine.add(fullyQualifiedName, key, pageUtil);
			}
			return pageUtil;
			
		}
		
		public PageUtil getPage(int page,int size,String filter,POJO pojo) {
			
			String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getPage_p"+page+"_s"+size+"_f"+filter;
			PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
			if(pageUtil==null)
			{
				
				pageUtil=new PageUtil(pojo.list(filter, page, size),page,size,pojo.totalCount(filter));
				cacheEngine.add(fullyQualifiedName, key, pageUtil);
			}
			return pageUtil;
			
			
		}
       public PageUtil getPage(int page,int size,String filter,String type,OrderType order,POJO pojo) {
	
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getPage_p"+page+"_s"+size+"_f"+filter+"_o"+order;
			PageUtil pageUtil = (PageUtil) cacheEngine.get(fullyQualifiedName, key);
			if(pageUtil==null)
			{
				
				pageUtil=new PageUtil(pojo.list(filter, page, size,type, order),page,size,pojo.totalCount(filter));
				cacheEngine.add(fullyQualifiedName, key, pageUtil);
			}
			return pageUtil;
			
		}
       
      
       
       
       public List<? extends POJO> getList(POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_all";
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list();
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
       public List<? extends POJO> getList(String type,OrderType orderType,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_t"+type+"_o"+orderType.toString();
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(type,orderType);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
       public List<? extends POJO> getList(String filter,String type,OrderType orderType,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_f"+filter+"_t"+type+"_o"+orderType.toString();
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(filter,type,orderType);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
       public List<? extends POJO> getList(int page,int size,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_p"+page+"_s"+size;
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(page, size);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
       public List<? extends POJO> getList(int page,int size,String type,OrderType order,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_p"+page+"_s"+size+"_t"+type+"_o"+order.toString();
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(page, size, type, order);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
     
       
       public List<? extends POJO> getList(int page,int size,String filter,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_p"+page+"_s"+size+"_f"+filter;
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(filter, page, size);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
       
       public List<? extends POJO> getList(int page,int size,String filter,String type,OrderType orderType,POJO pojo) {
    	   String fullyQualifiedName = StringUtils.capitalize(Inflector.getInstance().fullyQualifiedName(pojo.getClass()));
			Serializable key="getList_p"+page+"_s"+size+"_f"+filter+"_t"+type+"_o"+orderType.toString();
			@SuppressWarnings("unchecked")
			List<? extends POJO> list = (List<? extends POJO>) cacheEngine.get(fullyQualifiedName, key);
			if(list==null)
			{
				list = pojo.list(filter, page, size, type, orderType);
				cacheEngine.add(fullyQualifiedName, key, list);
			}
    	   return list;
			
	}
     
       
       protected static Domain getDomain()
  	 {
  		 Domain domain= new Domain();
  		 try {
  			 
  			 File propertiesFile = new File("tngou.properties");
  			  Configurations configs = new Configurations();
  			  PropertiesConfiguration daProperties = configs.properties(propertiesFile);
  			
  			Map<String, String> cp_props = new HashMap<String, String>();//使用cp_props做临时的配置文件的存储
  			Iterator<String> iterable = daProperties.getKeys();//取得配置文件中的key
  			while (iterable.hasNext()) {
  				String skey=iterable.next();
  				  cp_props.put(skey, "http://"+daProperties.getProperty(skey)+"");				
  			}
  			BeanUtils.populate(domain, cp_props);//把配置文件的值封装到dataSource
  			
  		} catch (ConfigurationException | IllegalAccessException | InvocationTargetException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}	
  		 return domain;
  	}
  	 
  	 public  static Domain domain = getDomain();
		
     
}
