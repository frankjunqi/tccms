package net.tngou.action.manage;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import net.tngou.action.client.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Page;
import net.tngou.service.MenuService;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class CommentAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {

        printFreemarker("manage/comment.ftl", root);
    }

    public void add() {

        Page bean = (Page) getAsk(new Page());
        long id = bean.save();
        printJson("{\"id\":" + id + "}");
    }

    public void menujson() {

        Menu bean = new Menu();
        String filter = "type>0";
        List<? extends POJO> list = bean.list(filter, 1, Integer.MAX_VALUE);

        String json = JSON.toJSONString(list);
        printJson(json);

    }

    public void delete() {

        String[] ids = request.getParameterValues("id[]");
        String sql = "DELETE FROM `" + Prefix + "page`  WHERE id=?";
        Object[][] params = new Object[ids.length][1];
        String id = "";
        for (int i = 0; i < params.length; i++) {
            if (i != 0)
                id += ",";
            id += i;
            params[i][0] = ids[i];
        }
        QueryHelper.batch(sql, params);

        printJson("{\"msg\":\"" + id + "\"}");

    }

    public void edit() {

        Page bean = (Page) getAsk(new Page());

        long id = bean.update();
        // printJson("修改成功！");
    }

    public void json() {

        Ask ask = (Ask) getAsk(new Ask());

        Page bean = new Page();
        int total = bean.totalCount();
        List<Page> list = (List<Page>) bean.list(ask.getPage(), ask.getRows());

        MenuService menuService = new MenuService();
        Map<String, String> map = menuService.getMenu();
        JSONArray jsonArray = new JSONArray();
        for (int i = 0, j = list.size(); i < j; i++) {
            JSONObject jo = (JSONObject) JSON.toJSON(list.get(i));
            if (map.get(list.get(i).getMenu() + "") != null) {
                jo.put("menuName", map.get(list.get(i).getMenu() + ""));
            } else {
                jo.put("menuName", " ");
            }

            jsonArray.add(jo);
        }

        String json = jsonArray.toJSONString();
        printJson(toJsonP(json, total));

    }
}
