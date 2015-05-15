package net.tngou.cache;

import java.io.Serializable;
import java.util.Collection;

import net.sf.ehcache.Element;

import org.apache.commons.configuration2.Configuration;
import org.apache.commons.configuration2.PropertiesConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.configuration2.ex.ConfigurationException;

public interface CacheEngine {

	
	public  void stop() ;
	public  void add(String fullyQualifiedName, Serializable key, Object value);
	public  Object get(String fullyQualifiedName, Serializable key);
	public  Object get(String fullyQualifiedName);
	public  void remove(String fullyQualifiedName, Serializable key) ;
	public  void remove(String fullyQualifiedName) ;
	public  Collection<Element> getValues(String fullyQualifiedName) ;
	
	public  default CacheEngine getInstance(){
		
		try {
			Configuration confing=null;
			Parameters params = new Parameters();
			FileBasedConfigurationBuilder<PropertiesConfiguration> builder =
			    new FileBasedConfigurationBuilder<PropertiesConfiguration>(PropertiesConfiguration.class)
			    .configure(params.properties()
			        .setFileName("jdbc.properties"));	//那么这个文件会自动在下面几个地方被搜寻：当前目录 、用户主目录 、classpath
			confing=builder.getConfiguration();
		
			return (CacheEngine) Class.forName(CacheEngine.class.getPackage().getName()+"."+confing.getString("cache")).newInstance();
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException | ConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return new EhCacheEngine();
	}
}
