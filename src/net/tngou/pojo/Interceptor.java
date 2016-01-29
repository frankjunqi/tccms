package net.tngou.pojo;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的实体
 */
public class Interceptor extends POJO {

    private String interceptorname;//拦截器名称；
    private String interceptorvalue;//拦截器参数说明；
    private String interceptorremark;//拦截器备注说明；

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

    public String getInterceptorname() {
        return interceptorname;
    }

    public String getInterceptorvalue() {
        return interceptorvalue;
    }

    public String getInterceptorremark() {
        return interceptorremark;
    }

    public void setInterceptorname(String interceptorname) {
        this.interceptorname = interceptorname;
    }

    public void setInterceptorvalue(String interceptorvalue) {
        this.interceptorvalue = interceptorvalue;
    }

    public void setInterceptorremark(String interceptorremark) {
        this.interceptorremark = interceptorremark;
    }

}
