/**
 * Created by kjh08490 on 2016/1/14.
 */
// 参数对象
function Paramte(key, value, remark, ismust, version) {
    this.key = key;
    this.value = value;
    this.remark = remark;
    this.ismust = ismust;
    this.version = version;
}

// 拦截器的对象
function Iterceptor(iterceptorid, iterceptorname) {
    this.iterceptorid = iterceptorid;
    this.iterceptorname = iterceptorname;
}