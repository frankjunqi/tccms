package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Interceptor;
import net.tngou.pojo.POJO;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的action
 */
public class InterceptorAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        root.put(FlagGroup, "Interceptor");
        root.put(FlagChild, "Interceptorlist");
        root.put("issuccess", "");
        // 处理拦截器列表数据
        // 1. 查询page

        // 2. 得到list
        Ask ask = (Ask) getAsk(new Ask());
        Interceptor bean = new Interceptor();
        int total = bean.totalCount();
        System.out.print("total = " + total);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(), "id", OrderType.ASC);
        root.put("interceptorlist", list);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptor.ftl", root);
    }

    public void json() {
        String success = "";
        try {
            success = request.getParams()[0];
        } catch (Exception e) {
            success = "";
        }
        Ask ask = (Ask) getAsk(new Ask());
        Interceptor bean = new Interceptor();
        int total = bean.totalCount();
        System.out.print("total = " + total);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(), "id", OrderType.ASC);
        root.put("interceptorlist", list);
        root.put(FlagGroup, "Interceptor");
        root.put(FlagChild, "Interceptorlist");
        root.put("issuccess", success);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptor.ftl", root);
    }

    /**
     * 新增一项：
     * <p>
     * form 表单的控件的name必须是Interceptor对象的属性
     */
    public void add() {
        root.put(FlagGroup, "Interceptor");
        root.put(FlagChild, "Interceptoradd");
        printFreemarker("urlserver/interceptoradd.ftl", root);
    }

    public void addIntercepor() {
        Interceptor interceptor = (Interceptor) getAsk(new Interceptor());
        long id = interceptor.save();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json" + "/success");
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
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json" + "/success");
        } else {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json");
        }
    }

    /**
     * 编辑
     */
    public void editIntercepor() {
        Interceptor bean = (Interceptor) getAsk(new Interceptor());
        long id = bean.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/interceptor/json" + "/success");
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
        root.put(FlagGroup, "Interceptor");
        root.put(FlagChild, "Interceptorlist");
        root.put("interceptor", interceptor);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/interceptoredit.ftl", root);
    }
}
