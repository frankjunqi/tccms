package net.tngou.quartz;

import java.util.Date;

import net.tngou.cache.VisitLogEhCache;
import net.tngou.jdbc.DBManager;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class VisitlogJob implements Job {
	private static Logger _log = LoggerFactory.getLogger(VisitlogJob.class);
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		_log.info("执行作业： "+context.getJobDetail().getKey() +"  执行时间："+new Date()+"********************************");
		VisitLogEhCache.Update();
	
		DBManager.closeConnection();
		//DBManager.closeDataSource();
	}
	
}
