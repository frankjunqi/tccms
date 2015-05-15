
package net.tngou.cache;

import java.io.Serializable;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.config.CacheConfiguration;




/**
 *  缓存
 * @author 陈磊
 *
 */
public class EhCacheEngine implements CacheEngine
{

	private static final Logger log = LoggerFactory.getLogger(EhCacheEngine.class);
	private static CacheManager manager;
	

	 
	 public EhCacheEngine() {
		 manager =CacheManager.getInstance();
	}

	 /**
	  * 关闭
	  */
	public  void stop() {
		
		if (manager != null) {
			manager.shutdown();
			 manager = null;
		}
	}

//	public static void add(Serializable key, Object value) {
//		if (log.isDebugEnabled()) {
//			log.debug("Caching " + value + " with key " + key);
//		}
//		add(key, value);
//	}
	
	
	/**
	 * 添加cache中的key
	 * @param fullyQualifiedName
	 * @param key
	 * @param value
	 */
	public  void add(String fullyQualifiedName, Serializable key, Object value) {
		if (!_cacheExists(fullyQualifiedName,key)) 
		{
			return;
		}
		Cache cache = manager.getCache(fullyQualifiedName);
		Element element = new Element(key, (Serializable)value);
		cache.put(element);
	}

	/**
	 *  	取得ehcache.xml 中的cache中的key的值
	 * @param fullyQualifiedName
	 * @param key
	 * @return
	 */
	public  Object get(String fullyQualifiedName, Serializable key) {
		try {
		
			if (!_cacheExists(fullyQualifiedName,key)) 
			{
				return null;
			}
			Cache cache = manager.getCache(fullyQualifiedName);
			Element element = cache.get(key);
			if (element != null) {
				return element.getObjectValue();
			} 
			
			return null;
		} catch (CacheException ce) {
			log.error("EhCache could not be shutdown", ce);
			throw new RuntimeException(ce);
		}
	}

	
	/**
	 *  取得ehcache.xml 中的cache
	 * @param fullyQualifiedName  cache名称
	 * @return
	 */
	public  Object get(String fullyQualifiedName) {
		if (!_cacheExists(fullyQualifiedName)) //如果不存在，创建新的cache
		{
		 return null;
		}
		Cache cache = manager.getCache(fullyQualifiedName);
		return cache;
	}

	/**
	 * 取得cache名称中的对象 Element
	 * @param fullyQualifiedName
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public   Collection<Element> getValues(String fullyQualifiedName) 
	{
		try {
			if (!_cacheExists(fullyQualifiedName))
			{
				manager.addCache(fullyQualifiedName);
				return new ArrayList<Element>();
			}
			Cache cache = manager.getCache(fullyQualifiedName);
			List<Element> values = new ArrayList<Element>(cache.getSize());
			List keys = cache.getKeys();
			
			for (Iterator iter = keys.iterator(); iter.hasNext(); ) {
				values.add(cache.get((Serializable)iter.next()));
			}

			return values;
		} catch (CacheException ce) {
			log.error("EhCache could not be shutdown", ce);
			throw new RuntimeException(ce);
		}
	}

	/**
	 * 移除cache中的key
	 * @param fullyQualifiedName
	 * @param key
	 */
	public   void remove(String fullyQualifiedName, Serializable key) 
	{
		if (_cacheExists(fullyQualifiedName, key)) {
			Cache cache = manager.getCache(fullyQualifiedName);
			if (cache != null) 
			{
				cache.remove(key);
			}
		}
		
	}

	/**
	 * 移除cache的所以key的值
	 * @param fullyQualifiedName
	 * @param key
	 */
	public   void remove(String fullyQualifiedName) {
//		if (_cacheExists(fullyQualifiedName)) 
//		{
//			manager.removeCache(fullyQualifiedName);
//		}
		
		if (_cacheExists(fullyQualifiedName)) {
			Cache cache = manager.getCache(fullyQualifiedName);
			if (cache != null) 
			{
				cache.removeAll();
			}
		}
	}
	
	/**
	 * 是否存在cache
	 * @param fullyQualifiedName
	 * @return
	 */
	public  boolean _cacheExists(String fullyQualifiedName) 
	{
		if (fullyQualifiedName!=null)
		{
			if (manager.cacheExists(fullyQualifiedName)) 
			{
				return true;
			}
		}
		return false;
	}
	/**
	 * 是否存在cache 和key
	 * @param fullyQualifiedName
	 * @param key
	 * @return
	 */
	public   boolean _cacheExists(String fullyQualifiedName,Serializable key) 
	{
		if (fullyQualifiedName!=null&&key!=null)
		{
			
			if (manager.cacheExists(fullyQualifiedName)) 
			{
				return true;
			}
		}
		return false;
	}
	
	


}
