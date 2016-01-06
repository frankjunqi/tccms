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
                <h3 class="box-title">Urlrule Add</h3>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
                <form class="form-horizontal" id="urlruleadd" role="form" method="post"
                      action="${Domain.base}/urlserver/urlrule/addUrlrule">
                    <!-- text input -->
                <#--<div class="form-group">
                    <label class="col-sm-2 control-label">projectid Text</label>
                    <input name="projectid" type="text" class="form-control" style="width: 20%;"
                           placeholder="Enter ...">
                </div>-->
                    <div class="form-group">
                        <label class="col-sm-2 control-label">projectname Text</label>
                        <select name="projectname" class="form-control select2" style="width: 20%;">
                        <#list projectlist as item>
                            <option value="${item.projectname}|${item.id}">${item.projectname}</option>
                        </#list>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlfunctionname Text</label>
                        <input name="urlfunctionname" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlroletips Text</label>
                        <input name="urlroletips" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">androidactivity Text</label>
                        <input name="androidactivity" type="text" class="form-control" style="width: 20%;"
                               placeholder="Enter ...">
                        <label class="col-sm-2 control-label">ioscontrolname Text</label>
                        <input name="ioscontrolname" type="text" class="form-control" style="width: 20%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlprotocol Text</label>
                        <input name="urlprotocol" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urldesc Text</label>
                        <input name="urldesc" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlparameter Text</label>
                        <input name="urlparameter" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlinterceptor Text</label>
                        <input name="urlinterceptor" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlinterceptor Text</label>

                        <div class="box-body">
                            <!-- Minimal style -->
                            <!-- checkbox -->
                            <div class="form-group">
                            <#list interceptorlist as item>
                                <label>
                                    <input type="checkbox" class="minimal">
                                    <span class="badge bg-light-blue">${item.interceptorname} + ${item.id}</span>
                                </label>
                            </#list>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlshow Text</label>
                        <input name="urlshow" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urldemo Text</label>
                        <input id="urldemostr" name="urldemo" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urldemo Pic</label>

                        <div id="urldemoimg" style="width: 30%;height: 200px;"></div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlremark Text</label>
                        <input name="urlremark" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">urlupdatetime Text</label>
                        <input name="urlupdatetime" type="text" class="form-control" style="width: 30%;"
                               placeholder="Enter ...">
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Projectremark Textarea</label>
                        <textarea name="projectremark" class="form-control" rows="8" style="width: 30%;"
                                  placeholder="Enter ..."></textarea>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
    <!-- /.content -->
</div>
<script>
    window.onload = function () {
        var qrcode = new QRCode(document.getElementById("urldemoimg"), {
            width: 196,//设置宽高
            height: 196
        });
        qrcode.makeCode("");
        document.getElementById("urldemostr").onchange = function () {
            qrcode.makeCode(document.getElementById("urldemostr").value);
        }
    }

</script>

<!-- /.content-wrapper -->
<#include "footermenu.ftl">