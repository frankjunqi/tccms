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
    <#if issuccess == "success">
        <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4><i class="icon fa fa-check"></i> Alert!</h4>
            Success alert preview. This alert is dismissable.
        </div>
    </#if>
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">拦截器 Table</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 5%">#</th>
                                <th style="width: 20%">拦截器名称</th>
                                <th style="width: 35%">拦截器参数说明</th>
                                <th style="width: 25%">拦截器备注说明</th>
                                <th style="width: 20%">#</th>
                            </tr>
                        <#list interceptorlist as item>
                            <tr>
                                <td>${item.id}.</td>
                                <td><strong>${item.interceptorname}</strong>
                                </td>
                            <#--<td>
                                <div class="progress progress-xs">
                                    <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                                </div>
                            </td>-->
                                <td>${item.interceptorvalue}
                                </td>
                                <td>${item.interceptorremark}</td>
                                <td>
                                    <a id="delete" href="${Domain.base}/urlserver/interceptor/delete?id=${item.id}">
                                        <span class="badge bg-red">Delete</span>
                                    </a>
                                    <a href="${Domain.base}/urlserver/interceptor/getInterceporById/${item.id}">
                                        <span class="badge bg-light-blue">Edit</span>
                                    </a>
                                </td>
                            </tr>
                        </#list>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer clearfix">
                        <ul class="pagination pagination-sm no-margin pull-right">
                            <li><a href="#">&laquo;</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Your Page Content Here -->
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">