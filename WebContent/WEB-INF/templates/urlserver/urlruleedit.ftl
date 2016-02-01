<#include "headerleftmenu.ftl">
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
<#--<section class="content-header">
    <h1>
        Page Header
        <small>Optional description</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
    </ol>
</section>-->


    <!-- Main content -->
    <section class="content">
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3 class="box-title">Urlrule Edit</h3>
            </div>

            <div class="box-body">
                <form id="urlruleedit" name="urlruleedit" class="form-horizontal" role="form" method="post"
                      action="">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlrule Id</label>
                        <input name="id" type="text" class="form-control select2" style="width: 20%;"
                               value="${urlrule.id}"
                               placeholder="Enter ..." readonly></input>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否对外开放</label>
                        <label>
                            <input id="urlshow" name="urlshow" type="text" class="minimal" value="${urlrule.urlshow}"
                                   hidden="hidden">
                            <input id="urlshowcheck" name="urlshowcheck" type="checkbox" class="minimal"
                                   onclick="checkUrlShow();">
                            <span class="badge bg-yellow">是否对外开放</span>
                        </label>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">项目名称</label>
                        <select id="projectname" name="projectname" class="form-control select2" style="width: 20%;">
                        <#list projectlist as item>
                            <option value="${item.projectname}|${item.id}">${item.projectname}</option>
                        </#list>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则协议前缀</label>
                        <input id="urlprotocol" name="urlprotocol" type="text" class="form-control" style="width: 35%;"
                               placeholder="http://shouji.17u.cn/XXX/XXX... or tctclient://XXX/XXX... Enter....."
                               value="${urlrule.urlprotocol}">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">页面</label>
                        <textarea id="urlfunctionname" name="urlfunctionname" class="form-control" rows="1"
                                  style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urlfunctionname}</textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则版本支持</label>
                        <textarea id="urlroletips" name="urlroletips" class="form-control" rows="1" style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urlroletips}</textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则描述</label>
                        <textarea id="urldesc" name="urldesc" class="form-control" rows="3" style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urldesc}</textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Android Activity</label>
                        <input id="androidactivity" name="androidactivity" type="text" class="form-control"
                               style="width: 20%;"
                               placeholder="XXXActivity Enter ..." value="${urlrule.androidactivity}">
                        <label class="col-sm-2 control-label">iOS Controller</label>
                        <input id="ioscontrolname" name="ioscontrolname" type="text" class="form-control"
                               style="width: 20%;"
                               placeholder="XXXController Enter ..." value="${urlrule.ioscontrolname}">
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则参数说明</label>
                        <table id="urlparametertable" style="width: 58%;" border='1' cellspacing="1"
                               class="table table-bordered ">
                            <tr>
                                <th style="width: 20%">
                                    参数key
                                </th>
                                <th style="width: 20%">
                                    参数value
                                </th>
                                <th style="width: 20%">
                                    参数说明
                                </th>
                                <th style="width: 20%">
                                    是否必填:1: 必填；否则0
                                </th>
                                <th style="width: 20%">
                                    参数版本信息
                                </th>
                                <th style="width: 10%">
                                    操作
                                </th>
                            </tr>
                        </table>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
                        <input id="urlparameter" name="urlparameter" hidden="hidden" value='${urlrule.urlparameter}'/>
                        <input type="button" value="添加参数" class="box-body col-sm-2 btn btn-info"
                               onclick="addRow(new Paramte());"
                               style="width: 140px;"/>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">拦截器添加</label>

                        <input id="urlinterceptor" name="urlinterceptor" style="width: 0px; height: 0px;"
                               value='${urlrule.urlinterceptor}'/>

                        <div class="box-body col-sm-2" style="width: 60%;">
                            <!-- Minimal style -->
                        <#list interceptorlist as item>
                            <label>
                                <input id="iterceptorgroup" name="iterceptorgroup" type="checkbox"
                                       value="${item.id}+${item.interceptorname}" class="minimal"
                                       onclick="checkIterceptor()">
                                <a target="_blank"
                                   href="${Domain.base}/urlserver/interceptor/getInterceporDetailById/${item.id}">
                                    <span class="badge bg-light-blue">${item.interceptorname}</span>
                                </a>
                            </label>
                        </#list>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则示例链接</label>
                        <textarea id="urldemo" name="urldemo" class="form-control" rows="3" style="width: 35%;"
                                  placeholder="http://shouji.17u.cn/... or tctclient:... Enter.....">${urlrule.urldemo}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div id="urldemoimg" style="height: 200px;">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则备注信息</label>
                        <textarea id="urlremark" name="urlremark" class="form-control" rows="4" style="width: 35%;"
                                  placeholder="规则Android & iOS 对接人  AND  版本说明  AND　特殊说明　等 Enter ...">${urlrule.urlremark}</textarea>

                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">创建时间</label>
                        <textarea id="createtime" name="createtime" class="form-control" rows="1"
                                  style="width: 35%;"
                                  placeholder="Enter ..." readonly>${urlrule.createtime!"null"}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">创建人</label>
                        <textarea id="createauthor" name="createauthor" class="form-control" rows="1"
                                  style="width: 35%;"
                                  placeholder="Enter ..." readonly>${urlrule.createauthor!"null"}</textarea>
                    </div>

                    <div class="box-footer">
                        <button type="button" class="btn btn-primary"
                                onclick='handleParamtes("${Domain.base}/urlserver/urlrule/editUrlrule")'>Update
                        </button>
                    </div>

                </form>
            </div>

        <#--</form>-->
        </div>
        <!-- /.box-body -->
</div>
</section>
<!-- /.content -->
</div>
<script>
    window.onload = function () {
        // init处理二维码
        var qrcode = new QRCode(document.getElementById("urldemoimg"), {
            width: 196,//设置宽高
            height: 196
        });
        qrcode.makeCode("${urlrule.urldemo}");
        // change 事件
        document.getElementById("urldemo").onchange = function () {
            qrcode.makeCode(document.getElementById("urldemo").value);
        }

        // init是否对外开放的选中
        if ("${urlrule.urlshow}" == "1") {
            $('#urlshowcheck').attr("checked", true);
        } else {
            $('#urlshowcheck').attr("checked", false);
        }

        // init选中的项目
        var project = "${urlrule.projectname}" + "|" + "${urlrule.projectid}";
        $("#projectname option[value='" + project + "']").attr("selected", true);

        // init处理参数列表
        var urlparameter = new Array();
        urlparameter = ${urlrule.urlparameter};
        for (var i = 0; i < urlparameter.length; i++) {
            addRow(urlparameter[i]);
        }

        // init处理拦截器
        var urlinterceptor = new Array();
        urlinterceptor = ${urlrule.urlinterceptor};
        for (var i = 0; i < urlinterceptor.length; i++) {
            initInterceptorChecked(urlinterceptor[i].iterceptorid, urlinterceptor[i].iterceptorname);
        }

    }

    // 默认拦截器的勾选
    function initInterceptorChecked(iterceptorid, iterceptorname) {
        $("input[name='iterceptorgroup']").each(function () {
            if ($(this).val() == iterceptorid + "+" + iterceptorname) {
                $(this).attr("checked", true);
            }
        });
    }


    // 处理urlshow checkbox的选中与未选中的状态的赋值
    function checkUrlShow() {
        if ($('input[name="urlshowcheck"]').prop("checked")) {
            $('#urlshow').attr("value", "1");
        }
        else {
            $('#urlshow').attr("value", "0");
        }
    }

    // 遍历获取checkbox的list的选中的值
    function checkIterceptor() {
        // 提交到接口的数据
        //var submitServerInterceporStr = "";
        $('#urlinterceptor').attr("value", "");
        // 拦截器list
        var iterceptorlist = new Array();
        // 显示获取选中项
        $("input[name='iterceptorgroup']:checked").each(function () {
            // htmlItemStr = htmlItemStr + "<span class='badge bg-green' style='margin-right: 8px;'>" + $(this).val() + "</span>";
            //submitServerInterceporStr = submitServerInterceporStr + $(this).val() + "|";
            var splits = $(this).val().split("+");
            var iterceptor = new Iterceptor(splits[0], splits[1]);
            iterceptorlist.push(iterceptor);
        });
        // 将list进行json序列化

        // 如果size==0默认define一个
        if (iterceptorlist.length == 0) {
            var iterceptor = new Iterceptor("", "");
            iterceptorlist.push(iterceptor);
        }


        var submitServerInterceporStr = JSON.stringify(iterceptorlist);
        // 提交到后台的数据
        $('#urlinterceptor').attr("value", submitServerInterceporStr);

    }
    // 参数列表的初始化
    // 定义list保存序列
    var arrayObj = new Array();

    // add 参数的列表row
    function addRow(paramte) {
        var rowLength = document.getElementById("urlparametertable").rows.length;
        arrayObj.push(rowLength);
        var newTR = document.getElementById("urlparametertable").insertRow(rowLength);
        var newNameTD = newTR.insertCell(0);
        newNameTD.innerHTML = "<input name='key' id='key' type='text' value='" + paramte.key + "'/>";
        var newNameTD = newTR.insertCell(1);
        newNameTD.innerHTML = "<input name='value' id='value' type='text' value='" + paramte.value + "'/>";
        var newNameTD = newTR.insertCell(2);
        newNameTD.innerHTML = "<input name='remark' id='remark' type='text' value='" + paramte.remark + "'/>";
        var newNameTD = newTR.insertCell(3);
        newNameTD.innerHTML = "<input name='ismust' id='ismust' type='text' value='" + paramte.ismust + "'/>";
        var newNameTD = newTR.insertCell(4);
        newNameTD.innerHTML = "<input name='version' id='version' type='text' value='" + paramte.version + "'/>";
        var newNameTD = newTR.insertCell(5);
        newNameTD.innerHTML = "<span class='badge bg-light-blue' onclick='removeRow(" + rowLength + ")'>Delete</span>";
    }

    //  处理参数的removed的操作
    function removeRow(indexItem) {
        //document.getElementById("testTable").insertRow(document.getElementById("testTable").rows.length);
        for (var i = 0; i <= arrayObj.length - 1; i++) {
            if (indexItem == arrayObj[i]) {
                document.getElementById("urlparametertable").deleteRow(i + 1);
                arrayObj.splice(i, 1);
                break;
            }
        }

    }

    // 获取参数的列表
    function handleParamtes(actionname) {
        // 校验参数
        if (!checkInput()) {
            return;
        }

        //  key的数据源
        var keylist = new Array();
        $("input[name='key']").each(function () {
            keylist.push($(this).val());
        });

        // value的数据源
        var valuelist = new Array();
        $("input[name='value']").each(function () {
            valuelist.push($(this).val());
        });

        // remark的数据源
        var remarklist = new Array();
        $("input[name='remark']").each(function () {
            remarklist.push($(this).val());
        });
        // ismust的数据源
        var ismustlist = new Array();
        $("input[name='ismust']").each(function () {
            ismustlist.push($(this).val());
        });

        // version的数据源
        var versionlist = new Array();
        $("input[name='version']").each(function () {
            versionlist.push($(this).val());
        });

        // 对象list
        var parameterlist = new Array();
        for (var i = 0; i < keylist.length; i++) {
            var paramte = new Paramte(keylist[i], valuelist[i], remarklist[i], ismustlist[i], versionlist[i]);
            parameterlist.push(paramte);
        }
        // 如果size==0默认出一个define
        if (parameterlist.length == 0) {
            var paramte = new Paramte("", "", "", "", "");
            parameterlist.push(paramte);
        }

        // 将list进行json序列化
        var urlparameter = JSON.stringify(parameterlist);
        $('#urlparameter').attr("value", urlparameter);


        // 执行action
        $("#urlruleedit").attr("action", actionname).submit();
    }

    // 做表单的验证
    function checkInput() {
        if ($("#urlprotocol").val() == "") {
            alert("URl规则的协议不能为null");
            return false;
        }
        if ($("#urldesc").val() == "") {
            alert("URl规则的描述信息不能为null");
            return false;
        }
        if ($("#urlroletips").val() == "") {
            alert("URl规则的重要提示不能为null");
            return false;
        }
        if ($("#androidactivity").val() == "") {
            alert("URl规则的Activity页面不能为null");
            return false;
        }
        if ($("#ioscontrolname").val() == "") {
            alert("URl规则的iOS Controler不能为null");
            return false;
        }
        if ($("#urldemo").val() == "") {
            alert("URl规则Demo不能为null");
            return false;
        }
        if ($("#urlremark").val() == "") {
            alert("URl规则备注不能为null");
            return false;
        }
        return true;
    }


</script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">