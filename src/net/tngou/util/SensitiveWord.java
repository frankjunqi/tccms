package net.tngou.util;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;



import org.apache.commons.configuration2.FileBasedConfiguration;
import org.apache.commons.configuration2.builder.FileBasedConfigurationBuilder;
import org.apache.commons.configuration2.builder.fluent.Parameters;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.LineIterator;
import org.apache.commons.lang.StringUtils;

/**
 * 敏感字词
 * @author 陈磊
 * @date 2014-08-04
 */
public class SensitiveWord {

	private static File wordfilter =null;
	  static
	  {
		  Parameters params = new Parameters();
			@SuppressWarnings({ "rawtypes", "unchecked" })
			FileBasedConfigurationBuilder<?> builder =
				    new FileBasedConfigurationBuilder(FileBasedConfiguration.class)
				    .configure(params.properties()
				        .setFileName("wordfilter.txt"));
			URL url = builder.getFileHandler().getURL();
			try {
				wordfilter = new File(url.toURI());
			} catch (URISyntaxException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
	  }
	private static long lastModified = 0L;
	private static List<String> words = new ArrayList<String>();
	
	private static void _CheckReload(){
		if(wordfilter.lastModified() > lastModified){
			synchronized(SensitiveWord.class){
				try{
					lastModified = wordfilter.lastModified();
					LineIterator lines = FileUtils.lineIterator(wordfilter, "utf-8");
					while(lines.hasNext()){
						String line = lines.nextLine();
						if(StringUtils.isNotBlank(line))
							words.add(StringUtils.trim(line).toLowerCase());
					}
				}catch(IOException e){
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 检查敏感字内容
	 * @param contents
	 */
	public static String Check(String...contents) {
		if(!wordfilter.exists())
			return null;
		_CheckReload();
		for(String word : words){
			for(String content : contents)
				if(content!=null && content.indexOf(word) >= 0)
					return word;
		}
		return null;
	}
	
	public static List<String> List() {
		_CheckReload();
		return words;
	}
	
	public static void Add(String word) throws IOException {
		word = word.toLowerCase();
		if(!words.contains(word)){
			words.add(word);
			FileUtils.writeLines(wordfilter, "UTF-8", words);
			lastModified = wordfilter.lastModified();
		}
	}

	public static void Delete(String word) throws IOException {
		word = word.toLowerCase();
		words.remove(word);
		FileUtils.writeLines(wordfilter, "UTF-8", words);
		lastModified = wordfilter.lastModified();
	}
	
	
//	public static void main(String[] args) {
//		System.err.println(Check("自己找枪|1"));
//	}
	
}
