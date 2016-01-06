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
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Urlrule Table</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table class="table table-bordered">
                            <tr>
                                <th style="width: 5%">#</th>
                                <th style="width: 20%">项目名称</th>
                                <th style="width: 25%">项目备注说明</th>
                                <th style="width: 20%">#</th>
                            </tr>
                        <#list urlrulelist as item>
                            <tr>
                                <td>${item.id}.</td>
                                <td><strong>${item.projectname}</strong>
                                </td>
                            <#--<td>
                                <div class="progress progress-xs">
                                    <div class="progress-bar progress-bar-danger" style="width: 55%"></div>
                                </div>
                            </td>-->
                                <td>${item.projectremark}</td>
                                <td>
                                    <span class="badge bg-red"
                                          onclick='show_confirm("${Domain.base}/urlserver/urlrule/delete?id=${item.id}")'>Delete</span>
                                    <a href="${Domain.base}/urlserver/urlrule/getUrlruleById/${item.id}">
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
                        <#if totalpage &gt; 1>
                            <#assign x=1>
                            <#assign mx=totalpage>
                            <#list x..mx as i>
                                <li><a href="${Domain.base}/urlserver/urlrule/json?page=${i}">${i}</a></li>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </div>
                <!-- Your Page Content Here -->
            </div>
        </div>
    </section>
    <!-- /.content -->
</div>
<script type="text/javascript">
    function show_confirm(url) {
        var result = confirm('您确定删除吗！');
        if (result) {
            window.location.href = url;
        } else {

        }
    }
</script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">