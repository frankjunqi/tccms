package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.*;
import net.tngou.util.DateUtil;
import org.apache.http.util.TextUtils;

import javax.servlet.ServletException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.net.URLDecoder.decode;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的action
 */
public class UrlruleAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        json();
    }

    public void json() throws UnsupportedEncodingException {
        // 项目的list
        request.setCharacterEncoding("utf-8");
        Project project = new Project();
        List<? extends POJO> projectlist = project.list("id", OrderType.ASC);
        projectlist.add(0, null);
        root.put("projectlist", projectlist);

        // 获取page
        Ask ask = (Ask) getAsk(new Ask());
        Urlrule bean = new Urlrule();
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

        // 2. 保存select的字符
        Map<String, Object> map = new HashMap<>();

        // 3. 获取projectid searchkey
        String projectnameid = request.getParameter("projectname");
        if (TextUtils.isEmpty(projectnameid)) {

        } else if ("-1".equals(projectnameid)) {

        } else {
            map.put("projectid", projectnameid);
        }

        // 编码出现问题的时候，需要去设置tomcat的编码问题
        /*<Connector port="80" protocol="HTTP/1.1"
        connectionTimeout="20000"
        redirectPort="8443" URIEncoding="UTF-8" />*/
        String searchkey = request.getParameter("searchkey");
        if (!TextUtils.isEmpty(searchkey)) {
            map.put("urlfunctionname", "%" + searchkey + "%");
        }

        // 查询count
        int totalcount = bean.totalCount(map);

        // 查询list数据
        List<? extends POJO> list = bean.list(map, ask.getPage(), ask.getRows(), "id", OrderType.DESC);
        root.put("urlrulelist", list);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put(FlagGroup, "urlrule");
        root.put(FlagChild, "urlrulelist");

        // 选中的项目以及搜索的关键字
        root.put("projectid", projectnameid);
        root.put("searchkey", searchkey);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/urlrule.ftl", root);
    }


    /**
     * 对外公开的url的搜索页面
     */
    public void search() {
        // 项目的list
        Project project = new Project();
        List<? extends POJO> projectlist = project.list("id", OrderType.ASC);
        projectlist.add(0, null);
        root.put("projectlist", projectlist);

        // 获取page
        Ask ask = (Ask) getAsk(new Ask());
        Urlrule bean = new Urlrule();
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

        // 2. 保存select的字符
        Map<String, Object> map = new HashMap<>();
        // 1. 获取projectid searchkey
        String projectnameid = request.getParameter("projectname");
        if (TextUtils.isEmpty(projectnameid)) {

        } else if ("-1".equals(projectnameid)) {

        } else {
            map.put("projectid", projectnameid);
        }
        String searchkey = request.getParameter("searchkey");
        if (!TextUtils.isEmpty(searchkey)) {
            map.put("urlfunctionname", "%" + searchkey + "%");
        }
        // 默认选取可对外开放的规则
        map.put("urlshow", "1");

        // 查询count
        int totalcount = bean.totalCount(map);

        List<? extends POJO> list = bean.list(map, ask.getPage(), ask.getRows(), "id", OrderType.DESC);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put("urlrulelist", list);
        root.put("projectid", projectnameid);
        root.put("searchkey", searchkey);
        printFreemarker("urlserver/search.ftl", root);
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
        urlrule.setCreatetime(DateUtil.toLocalDateTime(new Date()).toString());
        urlrule.setCreateauthor(((User)session.getAttribute("user")).getEmail());
        urlrule.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        urlrule.setUpdateauthor(((User)session.getAttribute("user")).getEmail());

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
        Urlrule urlrule = (Urlrule) getAsk(new Urlrule());
        String projectnameid = urlrule.getProjectname();
        // 处理projectname & Projectid
        String[] splits = projectnameid.split("\\|");
        urlrule.setProjectname(splits[0]);
        urlrule.setProjectid(splits[1]);

        // 编辑时候修改信息
        urlrule.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        urlrule.setUrlupdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        urlrule.setUpdateauthor(((User) session.getAttribute("user")).getEmail());

        long id = urlrule.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/urlrule/json");
        } else {
            run_500();
        }
    }

    public void getUrlruleById() {
        String sid = request.getParams()[0];
        // 项目的list
        Project bean = new Project();
        List<? extends POJO> list = bean.list("id", OrderType.ASC);
        root.put("projectlist", list);

        // 拦截器的list
        Interceptor intercepor = new Interceptor();
        List<? extends POJO> interceporlist = intercepor.list("id", OrderType.ASC);
        root.put("interceptorlist", interceporlist);

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

    public void getUrlruleDetailById() {
        String sid = request.getParams()[0];
        // 项目的list
        Project bean = new Project();
        List<? extends POJO> list = bean.list("id", OrderType.ASC);
        root.put("projectlist", list);

        // 拦截器的list
        Interceptor intercepor = new Interceptor();
        List<? extends POJO> interceporlist = intercepor.list("id", OrderType.ASC);
        root.put("interceptorlist", interceporlist);

        Urlrule urlrule = new Urlrule();
        urlrule = urlrule.get(Long.parseLong(sid));
        if (urlrule == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put("urlrule", urlrule);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/urlruledetail.ftl", root);
    }
}
