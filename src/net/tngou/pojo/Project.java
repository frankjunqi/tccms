package net.tngou.pojo;

/**
 * Created by kjh08490 on 2015/12/31.
 * 项目的实体
 */
public class Project extends POJO {

    private String projectname;//项目名称；
    private String projectremark;//项目参数说明；

    public String getProjectname() {
        return projectname;
    }

    public String getProjectremark() {
        return projectremark;
    }

    public void setProjectremark(String projectremark) {
        this.projectremark = projectremark;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }
}
