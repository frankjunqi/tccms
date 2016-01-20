<#include "headerleftmenu.ftl">
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            Page Header
            <small>Optional description</small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
            <li class="active">Here</li>
        </ol>
    </section>


    <!-- Main content -->
    <section class="content">
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3 class="box-title">Url规则添加</h3>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
                <form id="urlruleadd" name="urlruleadd" class="form-horizontal" role="form" method="post" action="">
                    <!-- text input -->
                <#--<div class="form-group">
                    <label class="col-sm-2 control-label">projectid Text</label>
                    <input name="projectid" type="text" class="form-control" style="width: 20%;"
                           placeholder="Enter ...">
                </div>-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否对外开放</label>
                        <label>
                            <input id="urlshow" name="urlshow" type="text" class="minimal" value="0" hidden="hidden">
                            <input id="urlshowcheck" name="urlshowcheck" type="checkbox" class="minimal" value="0"
                                   onclick="checkUrlShow();">
                            <span class="badge bg-yellow">是否对外开放</span>
                        </label>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-2 control-label">项目名称</label>
                        <select name="projectname" class="form-control select2" style="width: 20%;">
                        <#list projectlist as item>
                            <option value="${item.projectname}|${item.id}">${item.projectname}</option>
                        </#list>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则协议前缀</label>
                        <input id="urlprotocol" name="urlprotocol" type="text" class="form-control" style="width: 35%;"
                               placeholder="http://shouji.17u.cn/XXX/XXX... or tctclient://XXX/XXX... Enter.....">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">页面</label>
                        <textarea id="urlfunctionname" name="urlfunctionname" class="form-control" rows="1"
                                  style="width: 35%;"
                                  placeholder="Enter ..."></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则版本支持</label>
                        <textarea id="urlroletips" name="urlroletips" class="form-control" rows="1" style="width: 35%;"
                                  placeholder="Enter ..."></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则描述</label>
                        <textarea id="urldesc" name="urldesc" class="form-control" rows="3" style="width: 35%;"
                                  placeholder="Enter ..."></textarea>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Android Activity</label>
                        <input id="androidactivity" name="androidactivity" type="text" class="form-control"
                               style="width: 20%;"
                               placeholder="XXXActivity Enter ...">
                        <label class="col-sm-2 control-label">iOS Controller</label>
                        <input id="ioscontrolname" name="ioscontrolname" type="text" class="form-control"
                               style="width: 20%;"
                               placeholder="XXXController Enter ...">
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
                        <input id="urlparameter" name="urlparameter" hidden="hidden"/>
                        <input type="button" value="添加参数" class="box-body col-sm-2 btn btn-info" onclick="addRow();"
                               style="width: 140px; "/>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">拦截器添加</label>

                        <input id="urlinterceptor" name="urlinterceptor" style="width: 0px; height: 0px;"/>

                        <div class="box-body col-sm-2" style="width: 60%;">
                            <!-- Minimal style -->
                        <#list interceptorlist as item>
                            <label>
                                <input name="iterceptorgroup" type="checkbox"
                                       value="${item.id}+${item.interceptorname}" class="minimal"
                                       onclick="checkIterceptor()">
                                <span class="badge bg-light-blue">${item.interceptorname}</span>
                            </label>
                        </#list>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则示例链接</label>
                        <textarea id="urldemo" name="urldemo" class="form-control" rows="3" style="width: 35%;"
                                  placeholder="http://shouji.17u.cn/... or tctclient:... Enter....."></textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div id="urldemoimg" style="height: 200px;"></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则备注信息</label>
                        <textarea id="urlremark" name="urlremark" class="form-control" rows="4" style="width: 35%;"
                                  placeholder="规则Android & iOS 对接人  AND  版本说明  AND　特殊说明　等 Enter ..."></textarea>

                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-primary"
                                onclick='handleParamtes("${Domain.base}/urlserver/urlrule/addUrlrule")'>Submit
                        </button>
                    </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
    <!-- /.content -->
</div>
<script>

    // 处理二维码的信息
    window.onload = function () {
        var qrcode = new QRCode(document.getElementById("urldemoimg"), {
            width: 196,//设置宽高
            height: 196
        });
        qrcode.makeCode("");
        document.getElementById("urldemo").onchange = function () {
            qrcode.makeCode(document.getElementById("urldemo").value);
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

        // 如果size==0默认define一个
        if (iterceptorlist.length == 0) {
            var iterceptor = new Iterceptor("", "");
            iterceptorlist.push(iterceptor);
        }

        // 将list进行json序列化
        var submitServerInterceporStr = JSON.stringify(iterceptorlist);
        // 提交到后台的数据
        $('#urlinterceptor').attr("value", submitServerInterceporStr);

    }

    // 定义list保存序列
    var arrayObj = new Array();

    // add 参数的列表row
    function addRow() {
        var rowLength = document.getElementById("urlparametertable").rows.length;
        arrayObj.push(rowLength);
        var newTR = document.getElementById("urlparametertable").insertRow(rowLength);
        var newNameTD = newTR.insertCell(0);
        newNameTD.innerHTML = "<input name='key' id='key' type='text'/>";
        var newNameTD = newTR.insertCell(1);
        newNameTD.innerHTML = "<input name='value' id='value' type='text'/>";
        var newNameTD = newTR.insertCell(2);
        newNameTD.innerHTML = "<input name='remark' id='remark' type='text'/>";
        var newNameTD = newTR.insertCell(3);
        newNameTD.innerHTML = "<input name='ismust' id='ismust' type='text'/>";
        var newNameTD = newTR.insertCell(4);
        newNameTD.innerHTML = "<input name='version' id='version' type='text'/>";
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
        $("#urlruleadd").attr("action", actionname).submit();
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