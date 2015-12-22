package net.tngou.action;

import net.tngou.pojo.Info;
import net.tngou.util.JsoupUtil;

import javax.servlet.ServletException;
import java.io.IOException;

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
