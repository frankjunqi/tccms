package net.tngou.util;

import java.util.ArrayList;
import java.util.List;



import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;

public class JsoupUtil 
{
	/**
	 * 把html过滤掉html，生成text
	 * @param html
	 * @return
	 */
	public static String Text(String html) {
		return Jsoup.clean(html, new Whitelist());//过滤html,生存TEXT
		
	}
	
	/**
	 * 取全部图片
	 * @return
	 */
	public static List<String> Images(String html) {
			
		List<String> list = new ArrayList<String>();
		//从词条中取得一张图片
				Document doc= Jsoup.parse(html);
				Elements imgs = doc.select("img");
				for(int i=0;i<imgs.size();i++){
					  Element img = imgs.get(i);
						String src = img.attr("abs:src");
						
						//File file = new File(request.getSession().getServletContext().getRealPath("../"));
						list.add(src);//	
				}
		return list;
		
	}
	/**
	 * 取得第一张图片
	 * @param html
	 * @return
	 */
	public static String Image(String html) {
		
		//从词条中取得一张图片
				Document doc= Jsoup.parse(html);
				Elements imgs = doc.select("img");
				for(int i=0;i<imgs.size();){
					  Element img = imgs.get(i);
						String src = img.attr("abs:src");
						
						//File file = new File(request.getSession().getServletContext().getRealPath("../"));
						return src;//
				}
				return null;
		
		
	}
	
	public static String RImage(String html) {
		
		//从词条中取得一张图片
				Document doc= Jsoup.parse(html);
			
				//Whitelist whitelist = new Whitelist();
				//whitelist.addTags( "a" ,"href","b", "blockquote"," br"," code", "dd", "dl", "dt"," em"," i", "li", "ol","p"," pre"," q"," small"," strike", "strong", "sub", "sup"," u", "ul","br","div");
				/*
				 *  a, b, blockquote, br, cite, code, dd, dl, dt, em, i, li, ol, p, pre, q, small, strike, strong, sub, sup, u, ul
				 */
				String summary=Jsoup.clean( doc.toString(), Whitelist.basic());
				
				return summary;
		
		
	}
	
//	public static List<Link> Links(String html) {
//		
//		Document doc= Jsoup.parse(html);
//		List<Link> list = new ArrayList<Link>();
//		if(doc!=null)
//		{
//			Elements as = doc.select("a[href]");
//		  for (Element link : as) {
//			  Link url  =new Link();
//			  url.setText(link.text());
//		      url.setUrl(link.attr("abs:href"));
//		      url.setTitle(link.attr("title"));
//			  list.add(url);
//			  
//	        }
//		}
//		return list;
//	}
	
	
	public static void main(String[] args) {
		String sql ="<div ><a href=\"http://www.yi18.net/\" >医药吧首页<a></div>";
		System.out.println(RImage(sql));
	}
	
}
