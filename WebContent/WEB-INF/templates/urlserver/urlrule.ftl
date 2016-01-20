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
                                <th style="width: 8%">项目名称</th>
                                <th style="width: 8%">页面</th>
                                <th style="width: 8%">规则版本支持</th>
                                <th style="width: 15%">示例url</th>
                                <th style="width: 10%">#</th>
                            </tr>
                        <#list urlrulelist as item>
                            <tr>
                                <td>${item.id}.</td>
                                <td><strong>${item.projectname}</strong>
                                </td>
                                <td><strong>${item.urlfunctionname}</strong>
                                </td>
                                <td><strong>${item.urlroletips}</strong>
                                </td>
                                <td>
                                    <div onclick='show_QRImg("${item.urldemo}","urldemoimg${item.id}");'>${item.urldemo}</div>
                                </td>
                                <td>
                                    <!-- Navbar Right Menu -->
                                    <ul class="nav">
                                        <!-- User Account Menu -->
                                        <li>
                                            <span class="badge bg-red"
                                                  onclick='show_confirm("${Domain.base}/urlserver/urlrule/delete?id=${item.id}")'>Delete</span>
                                        </li>
                                        <li>
                                            <a style="background-color: transparent; padding: 0px;"
                                               href="${Domain.base}/urlserver/urlrule/getUrlruleById/${item.id}">
                                                <span class="badge bg-light-blue">Edit</span>
                                            </a>
                                        </li>
                                        <li>
                                            <!-- Menu Toggle Button -->
                                            <a data-toggle="dropdown"
                                               style="background-color: transparent; padding: 0px;"
                                               onclick='show_QRImg("${item.urldemo}","urldemoimg${item.id}");'>
                                                <!-- The user image in the navbar-->
                                                        <span id="userShow1"
                                                              class="badge bg-yellow">查看二维码进行扫描</span>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <!-- The user image in the menu -->
                                                <li class="user-header">
                                                    <div id="urldemoimg${item.id}"
                                                         style="height: 210px;width: 210px; padding: 6px;">
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
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

    function show_QRImg(urlStr, urldivid) {
        $("#" + urldivid).empty();
        var qrcode = new QRCode(document.getElementById(urldivid), {
            width: 196,//设置宽高
            height: 196
        });
        qrcode.makeCode(urlStr);
    }

</script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">