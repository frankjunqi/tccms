package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Interceptor;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Project;
import net.tngou.pojo.User;
import net.tngou.util.DateUtil;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的action
 */
public class ProjectAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        root.put(FlagGroup, "project");
        root.put(FlagChild, "projectlist");
        // 1. 得到list
        Ask ask = (Ask) getAsk(new Ask());
        Project bean = new Project();
        ask.setPage(1);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(), "id", OrderType.ASC);
        root.put("projectlist", list);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/project.ftl", root);
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Project bean = new Project();
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
        root.put("projectlist", list);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put(FlagGroup, "project");
        root.put(FlagChild, "projectlist");
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/project.ftl", root);
    }

    /**
     * 新增一项：
     * <p>
     * form 表单的控件的name必须是Interceptor对象的属性
     */
    public void add() {
        root.put(FlagGroup, "project");
        root.put(FlagChild, "projectadd");
        printFreemarker("urlserver/projectadd.ftl", root);
    }

    public void addProject() {
        Project project = (Project) getAsk(new Project());
        project.setCreatetime(DateUtil.toLocalDateTime(new Date()).toString());
        project.setCreateauthor(((User)session.getAttribute("user")).getEmail());
        project.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        project.setUpdateauthor(((User)session.getAttribute("user")).getEmail());
        long id = project.save();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        }
    }

    /**
     * 删除一项
     */
    public void delete() {
        String ids = request.getParameter("id");
        String sql = "DELETE FROM `" + Prefix + "project`  WHERE id=?";
        Object[][] params = new Object[1][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids;
        }
        int[] idss = QueryHelper.batch(sql, params);
        if (idss[0] > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        }
    }

    /**
     * 编辑
     */
    public void editProject() {
        Project bean = (Project) getAsk(new Project());
        // 编辑时候修改信息
        bean.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        bean.setUpdateauthor(((User)session.getAttribute("user")).getEmail());
        long id = bean.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/project/json");
        }
    }

    public void getProjectById() {
        String sid = request.getParams()[0];
        Project project = new Project();
        project = project.get(Long.parseLong(sid));
        if (project == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put(FlagGroup, "project");
        root.put(FlagChild, "projectlist");
        root.put("project", project);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/projectedit.ftl", root);
    }

    public void getProjectDetailById() {
        String sid = request.getParams()[0];
        Project project = new Project();
        project = project.get(Long.parseLong(sid));
        if (project == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put("project", project);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/projectdetail.ftl", root);
    }
}
