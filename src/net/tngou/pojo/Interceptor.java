package net.tngou.pojo;

/**
 * Created by kjh08490 on 2015/12/31.
 * 拦截器的实体
 */
public class Interceptor extends POJO {

    private String interceptorname;//拦截器名称；
    private String interceptorvalue;//拦截器参数说明；
    private String interceptorremark;//拦截器备注说明；

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
