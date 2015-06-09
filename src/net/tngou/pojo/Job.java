package net.tngou.pojo;


/**
 * @author kjh
 */
public class Job extends POJO {


    private String title;    //  招聘职位title

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    private String des;    //  招聘职位title
    private String desccipiton;    //  招聘职位详细描述

    @Override
    protected boolean isObjectCachedByID() {
        // TODO Auto-generated method stub
        return true;
    }

    public String getDesccipiton() {
        return desccipiton;
    }

    public void setDesccipiton(String desccipiton) {
        this.desccipiton = desccipiton;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
