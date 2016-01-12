package net.tngou.action.urlserver;

import com.alibaba.fastjson.JSON;
import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.OrderType;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Project;
import net.tngou.pojo.User;
import net.tngou.util.DigestMD;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;


public class UsermanagerAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        list();
    }

    // 获取user list
    public void list() {
        Ask ask = (Ask) getAsk(new Ask());
        User bean = new User();
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
        root.put("userlist", list);
        root.put("totalpage", totalcount % ask.getRows() > 0 ? totalcount / ask.getRows() + 1 : totalcount / ask.getRows());
        root.put("page", ask.getPage());
        root.put(FlagGroup, "user");
        root.put(FlagChild, "userlist");
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/usermanager.ftl", root);
    }

    // 删除user
    public void delete() {
        String ids = request.getParameter("id");
        String sql = "DELETE FROM `" + Prefix + "user`  WHERE id=?";
        Object[][] params = new Object[1][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0) id += ",";
            id += i;
            params[i][0] = ids;
        }
        int[] idss = QueryHelper.batch(sql, params);
        if (idss[0] > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/usermanager/list");
        } else {
            run_404();
        }

    }

    // 更新User
    public void edit() {
        User bean = (User) getAsk(new User());
        User user = new User().get(bean.getId());
        //  查询不到user数据
        if (user == null) {
            run_500();
            return;
        }
        // 正确数据
        if (bean.getPassword().equals(user.getPassword())) {
            bean.setPassword(user.getPassword());
        } else {
            bean.setPassword(DigestMD.MD5(bean.getPassword()));
        }
        long id = bean.update();
        if (id > 0) {
            sendRedirect(getDomain().getBase() + "/urlserver/usermanager/list");
        } else {
            run_500();
        }
    }

    public void getUserById() {
        // String sid = request.getParams()[0];
        String sid = request.getParameter("id");
        User user = new User();
        user = user.get(Long.parseLong(sid));
        if (user == null) {
            run_404();
            return;
        }//如果不存在就返回404页面
        root.put(FlagGroup, "user");
        root.put(FlagChild, "userlist");
        root.put("user", user);
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/usermanageredit.ftl", root);
    }
}
