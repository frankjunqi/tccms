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
                <h3 class="box-title">Urlrule Edit</h3>
            </div>

            <div class="box-body">
                <form id="urlruleadd" name="urlruleadd" class="form-horizontal" role="form" method="post"
                      action="${Domain.base}/urlserver/urlrule/editUrlrule">
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
                        <select name="projectname" class="form-control select2" style="width: 20%;">
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
                        <label class="col-sm-2 control-label">规则描述</label>
                        <textarea id="urldesc" name="urldesc" class="form-control" rows="3" style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urldesc}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则页面功能</label>
                        <textarea id="urlfunctionname" name="urlfunctionname" class="form-control" rows="2"
                                  style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urlfunctionname}</textarea>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">规则重要提示</label>
                        <textarea id="urlroletips" name="urlroletips" class="form-control" rows="2" style="width: 35%;"
                                  placeholder="Enter ...">${urlrule.urlroletips}</textarea>
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
                        <label class="col-sm-2 control-label">规则参数说明${urlrule.urlparameter}</label>
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
                               style="width: 140px;"/>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">拦截器添加</label>

                        <div id="showurlinterceptor" class="box-body col-sm-2"
                             style="width: 60%;"></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>
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
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
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
        // 处理二维码
        var qrcode = new QRCode(document.getElementById("urldemoimg"), {
            width: 196,//设置宽高
            height: 196
        });
        qrcode.makeCode("${urlrule.urldemo}");
        // change 事件
        document.getElementById("urldemo").onchange = function () {
            qrcode.makeCode(document.getElementById("urldemo").value);
        }

        // 是否对外开放的选中
        if ("${urlrule.urlshow}" == "1") {
            $('#urlshowcheck').attr("checked", true);
        } else {
            $('#urlshowcheck').attr("checked", false);
        }


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
        // 显示选中html
        var htmlItemStr = "";

        // 提交到接口的数据
        var submitServerInterceporStr = "";
        $('#urlinterceptor').attr("value", "");

        // 显示获取选中项
        $('#showurlinterceptor').html("");
        $("input[name='iterceptorgroup']:checked").each(function () {
            htmlItemStr = htmlItemStr + "<span class='badge bg-green' style='margin-right: 8px;'>" + $(this).val() + "</span>";
            submitServerInterceporStr = submitServerInterceporStr + $(this).val() + "|";
        });
        $('#showurlinterceptor').html(htmlItemStr);

        // 提交到后台的数据
        $('#urlinterceptor').attr("value", submitServerInterceporStr);
    }

    // 参数列表的初始化

</script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">