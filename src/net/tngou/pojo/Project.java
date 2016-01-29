package net.tngou.pojo;

/**
 * Created by kjh08490 on 2015/12/31.
 * 项目的实体
 */
public class Project extends POJO {

    private String projectname;//项目名称；
    private String projectremark;//项目参数说明；

    private String createtime;// 创建时间
    private String createauthor;// 创建人
    private String updatetime;// 修改时间
    private String updateauthor;// 修改人

    public String getCreatetime() {
        return createtime;
    }

    public String getCreateauthor() {
        return createauthor;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public String getUpdateauthor() {
        return updateauthor;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public void setCreateauthor(String createauthor) {
        this.createauthor = createauthor;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public void setUpdateauthor(String updateauthor) {
        this.updateauthor = updateauthor;
    }


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
