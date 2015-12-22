package net.tngou.action.manage;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import net.tngou.action.BaseAction;
import net.tngou.entity.Ask;
import net.tngou.jdbc.QueryHelper;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.service.MenuService;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NavAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {

        printFreemarker("manage/nav.ftl", root);
    }

    public void json() {

        Ask ask = (Ask) getAsk(new Ask());

        Menu bean = new Menu();
        int total = bean.totalCount();
        List<Menu> list = (List<Menu>) bean.list(ask.getPage(), ask.getRows());
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

    public void menujson() {

        Menu bean = new Menu();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("menu", 0);
        List<? extends POJO> list = bean.list(map);
        String json = JSON.toJSONString(list);
        printJson(json);

    }

    public void add() {

        Menu bean = (Menu) getAsk(new Menu());
        long id = bean.save();
        printJson("{\"id\":" + id + "}");
    }

    public void delete() {

        String[] ids = request.getParameterValues("id[]");
        String sql = "DELETE FROM `" + Prefix + "menu`  WHERE id=?";
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

        Menu bean = (Menu) getAsk(new Menu());

        long id = bean.update();
        printJson("修改成功！");
    }

}
