package net.tngou.action.urlserver;

import com.alibaba.fastjson.JSON;
import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Interceptor;
import net.tngou.pojo.Job;
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
        // 处理拦截器列表数据
        // 1. 查询page

        // 2. 得到list
        Ask ask = (Ask) getAsk(new Ask());
        Interceptor bean = new Interceptor();
        int total = bean.totalCount();
        System.out.print("total = " + total);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows(),"id", OrderType.ASC);
        root.put("interceptorlist",list);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/index.ftl", root);
    }

    public void json() {
        Ask ask = (Ask) getAsk(new Ask());
        Interceptor bean = new Interceptor();
        int total = bean.totalCount();
        System.out.print("total = " + total);
        List<? extends POJO> list = bean.list(ask.getPage(), ask.getRows());
        String json = JSON.toJSONString(list);
        printJson(toJsonP(json, total));
    }

    /**
     * 新增一项：
     * <p>
     * form 表单的控件的name必须是Interceptor对象的属性
     */
    public void add() {
        Interceptor interceptor = (Interceptor) getAsk(new Interceptor());
        interceptor.save();
    }

    /**
     * 删除一项
     */
    public void delete() {
        String[] ids = request.getParameterValues("id[]");
        String sql = "DELETE FROM `" + Prefix + "job`  WHERE id=?";
        Object[][] params = new Object[ids.length][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids[i];
        }
        QueryHelper.batch(sql, params);
        printJson("{\"msg\":\"" + id + "\"}");
    }

    /**
     * 编辑
     */
    public void edit() {
        Interceptor bean = (Interceptor) getAsk(new Job());
        long id = bean.update();
        printJson("修改成功！");
    }
}
