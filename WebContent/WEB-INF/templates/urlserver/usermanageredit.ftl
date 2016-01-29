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
                <h3 class="box-title">Project Add</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form id="interceptoradd" role="form" method="post"
                      action="${Domain.base}/urlserver/usermanager/edit">
                    <div class="form-group">
                        <label>User Id</label>
                        <input name="id" type="text" class="form-control" value="${user.id}" placeholder="Enter ..."
                               style="width: 20%;"
                               readonly></input>
                    </div>
                    <div class="form-group">
                        <label>User Role ${user.role}</label>
                        <select id="role" name="role" class="form-control select2" style="width: 20%;">
                            <option value="0">
                                0--普通用户
                            </option>
                            <option value="1">
                                1--超级用户
                            </option>
                        </select>
                    </div>
                    <!-- text input -->
                    <div class="form-group">
                        <label>User Account</label>
                        <input name="account" type="text" class="form-control" placeholder="Enter ..."
                               style="width: 30%;"
                               value="${user.account}"></input>
                    </div>

                    <div class="form-group">
                        <label>User Email</label>
                        <input name="email" class="form-control" value="${user.email}" placeholder="Enter ..."
                               style="width: 30%;"></input>
                    </div>
                    <div class="form-group">
                        <label>User Password</label>
                        <span class="badge bg-red">修改密码请慎重</span>
                        <input name="password" class="form-control" value="${user.password}" style="width: 30%;"
                               placeholder="Enter ..."></input>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Update</button>
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
        var roleid = ${user.role};
        $("#role option[value='" + roleid + "']").attr("selected", true);
    }
</script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">