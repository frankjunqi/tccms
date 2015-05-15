package net.tngou.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;







import net.tngou.quartz.JobManager;

import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;





/**
 * Web应用的监听 可用于初始化 和 关闭
 * @author 陈磊
 * @since 2012/8/10
 *
 */
@WebListener
public class SCListener implements ServletContextListener
{

	private static Logger _log = LoggerFactory.getLogger(SCListener.class);
	
	public void contextDestroyed(ServletContextEvent event) 
	{
		try {
			JobManager.shutdown();
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	
	public void contextInitialized(ServletContextEvent event) 
	{
		_log.info("正常启动ServletContextListener监听器");
		JobManager jobManager = new JobManager();
		try {
			jobManager.run();
//			LogUtil.save("系统日志", "爬虫系统开启！整个爬虫系统处于正常的运行状态！", LogEnum.run);
		} catch (SchedulerException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
