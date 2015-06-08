package net.tngou.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;

import net.tngou.cache.VisitLogEhCache;
import net.tngou.jdbc.OrderType;
import net.tngou.pojo.Info;
import net.tngou.pojo.Menu;
import net.tngou.pojo.POJO;
import net.tngou.pojo.Page;
import net.tngou.service.MenuService;
import net.tngou.util.JsoupUtil;

public class AboutAction extends BaseAction {

    @Override
    public void execute() throws ServletException, IOException {
        Info info = _getInfo();
        root.put("about", info);
        System.out.print(info.getName() + "");
        root.put("title", String.valueOf(info.getName()));
        root.put("loglist", JsoupUtil.Images(String.valueOf(info.getLogo())));
        root.put("description", String.valueOf(info.getImg()));
        printFreemarker("default/about.ftl", root);
    }
}
