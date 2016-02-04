package net.tngou.action.urlserver;

import net.tngou.action.client.BaseAction;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.User;
import net.tngou.util.DigestMD;

import javax.servlet.ServletException;
import java.io.IOException;


public class MarkdownAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        root.put(FlagGroup, "markdown");
        root.put(FlagChild, "markdown");
        // 3. 得到页码的请求链接
        printFreemarker("urlserver/markdownadd.ftl", root);
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
