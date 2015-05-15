package net.tngou.util;



import net.tngou.pojo.POJO;

import org.apache.commons.lang.StringUtils;





/**
 * 变形器
 * @author 陈磊
 *
 */
public class Inflector 
{
   
   public static Inflector  getInstance()
		{
			  return  new Inflector();
		   }
   		
   		/**
   		 *   取得类的名称
    * @param cl 类
    * @return 类的名称
    	*/
   public String tableize(Class<? extends POJO> cl)
	   {
	  // String[] cls = StringUtils.split(cl.getName(), ".");
			return  StringUtils.lowerCase(cl.getSimpleName());
	   	}
   
   public String fullyQualifiedName(Class<? extends POJO> cl)
   {
  // String[] cls = StringUtils.split(cl.getName(), ".");
		return  StringUtils.lowerCase(cl.getSimpleName())+"_List";
   	}

   public static void main(String[] args) {
	   				System.out.println(Inflector.getInstance().tableize(POJO.class));
   		}
}
