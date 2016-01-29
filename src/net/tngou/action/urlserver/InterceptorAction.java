package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.entity.PageUtil;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Interceptor;
import net.tngou.pojo.POJO;
import net.tngou.pojo.User;
import net.tngou.service.PageService;
import net.tngou.util.DateUtil;
import org.apache.http.util.TextUtils;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的action
 */
public class InterceptorAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        json();
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Interceptor bean = new Interceptor();
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
        root.put("interceptorlist", list);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put(FlagGroup, "interceptor");
        root.put(FlagChild, "interceptorlist");
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptor.ftl", root);
    }

    /**
     * 新增一项：
     * <p>
     * form 表单的控件的name必须是Interceptor对象的属性
     */
    public void add() {
        root.put(FlagGroup, "interceptor");
        root.put(FlagChild, "interceptoradd");
        printFreemarker("urlserver/interceptoradd.ftl", root);
    }

    public void addIntercepor() {
        Interceptor interceptor = (Interceptor) getAsk(new Interceptor());
        interceptor.setCreatetime(DateUtil.toLocalDateTime(new Date()).toString());
        interceptor.setCreateauthor(((User)session.getAttribute("user")).getEmail());
        interceptor.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        interceptor.setUpdateauthor(((User)session.getAttribute("user")).getEmail());

        long id = interceptor.save();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        }
    }

    /**
     * 删除一项
     */
    public void delete() {
        String ids = request.getParameter("id");
        String sql = "DELETE FROM `" + Prefix + "interceptor`  WHERE id=?";
        Object[][] params = new Object[1][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids;
        }
        int[] idss = QueryHelper.batch(sql, params);
        if (idss[0] > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        }
    }

    /**
     * 编辑
     */
    public void editIntercepor() {
        Interceptor bean = (Interceptor) getAsk(new Interceptor());
        // 编辑时候修改信息
        bean.setUpdatetime(DateUtil.toLocalDateTime(new Date()).toString());
        bean.setUpdateauthor(((User)session.getAttribute("user")).getEmail());
        long id = bean.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        }
    }

    public void getInterceporById() {
        String sid = request.getParams()[0];
        Interceptor interceptor = new Interceptor();
        interceptor = interceptor.get(Long.parseLong(sid));
        if (interceptor == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put(FlagGroup, "interceptor");
        root.put(FlagChild, "interceptorlist");
        root.put("interceptor", interceptor);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptoredit.ftl", root);
    }

    public void getInterceporDetailById() {
        String sid = request.getParams()[0];
        Interceptor interceptor = new Interceptor();
        interceptor = interceptor.get(Long.parseLong(sid));
        if (interceptor == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put("interceptor", interceptor);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptordetail.ftl", root);
    }
}
