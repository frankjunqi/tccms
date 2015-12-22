package net.tngou.action.manage;

import net.tngou.action.BaseAction;

import javax.servlet.ServletException;
import java.io.IOException;

public class IndexAction extends BaseAction {


    @Override
    public void execute() throws ServletException, IOException {
        // TODO Auto-generated method stub
        root.put("title", "骏燕文化管理服务平台");
        root.put("keywords", "骏燕文化管理服务平台 骏燕文化后台管理系统");
        root.put("description", "骏燕文化管理服务平台 骏燕文化后台管理系统 做最好的农业服务管理");
        root.put("menu", "home");
        printFreemarker("manage/index.ftl", root);
    }
}
