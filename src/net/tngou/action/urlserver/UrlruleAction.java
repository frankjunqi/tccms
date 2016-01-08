package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Interceptor;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Project;
import net.tngou.pojo.Urlrule;
import net.tngou.util.DateUtil;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的action
 */
public class UrlruleAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        root.put(FlagGroup, "urlrule");
        root.put(FlagChild, "urlrulelist");
        // 1. 得到list
        Ask ask = (Ask) getAsk(new Ask());
        Urlrule bean = new Urlrule();
        ask.setPage(1);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(), "id", OrderType.ASC);
        root.put("urlrulelist", list);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/urlrule.ftl", root);
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Urlrule bean = new Urlrule();
        // 查询count
        int totalcount = bean.totalCount();
        // 1. 获取page
        String page = request.getParameter("page");
        if (page == null || "".equals(page)) {
            page = "1";
        }
        try {
            ask.setPage(Integer.valueOf(page));
        } catch (Exception e) {
            ask.setPage(1);
        }
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(), "id", OrderType.ASC);
        root.put("urlrulelist", list);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put(FlagGroup, "urlrule");
        root.put(FlagChild, "urlrulelist");
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/urlrule.ftl", root);
    }

    /**
     * 新增一项：
     * <p>
     * form 表单的控件的name必须是Interceptor对象的属性
     */
    public void add() {
        // 项目的list
        Project bean = new Project();
        List<? extends POJO> list = bean.list("id", OrderType.ASC);
        root.put("projectlist", list);

        // 拦截器的list
        Interceptor intercepor = new Interceptor();
        List<? extends POJO> interceporlist = intercepor.list("id", OrderType.ASC);
        root.put("interceptorlist", interceporlist);

        // 默认选中
        root.put(FlagGroup, "urlrule");
        root.put(FlagChild, "urlruleadd");

        printFreemarker("urlserver/urlruleadd.ftl", root);
    }

    public void addUrlrule() {
        Urlrule urlrule = (Urlrule) getAsk(new Urlrule());
        String projectnameid = urlrule.getProjectname();
        // 处理projectname & Projectid
        String[] splits = projectnameid.split("\\|");
        urlrule.setProjectname(splits[0]);
        urlrule.setProjectid(splits[1]);

        // 新增的时间
        urlrule.setUrlupdatetime(DateUtil.toLocalDateTime(new Date()).toString());

        long id = urlrule.save();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        } else {
            run_404();
        }
    }

    /**
     * 删除一项
     */
    public void delete() {
        String ids = request.getParameter("id");
        String sql = "DELETE FROM `" + Prefix + "urlrule`  WHERE id=?";
        Object[][] params = new Object[1][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids;
        }
        int[] idss = QueryHelper.batch(sql, params);
        if (idss[0] > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        }
    }

    /**
     * 编辑
     */
    public void editUrlrule() {
        Urlrule bean = (Urlrule) getAsk(new Urlrule());
        long id = bean.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        }
    }

    public void getUrlruleById() {
        String sid = request.getParams()[0];
        Urlrule urlrule = new Urlrule();
        urlrule = urlrule.get(Long.parseLong(sid));
        if (urlrule == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put(FlagGroup, "urlrule");
        root.put(FlagChild, "urlrulelist");
        root.put("urlrule", urlrule);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/urlruleedit.ftl", root);
    }
}
