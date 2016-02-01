<#include "searchheadermenu.ftl">
<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><b>TC-</b>PRO 规则检索</a>
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>
            <form role="search" method="post" action="${Domain.base}/urlserver/urlrule/search">
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <select id="projectname" name="projectname" class="form-control"
                                    style="width: 180px;margin-top: 8px;">
                            <#list projectlist as item>
                                <#if item??>
                                    <option value="${item.id}">${item.projectname}</option>
                                <#else>
                                    <option value="-1">所有项目</option>
                                </#if>
                            </#list>
                            </select>
                        </li>
                    <#--<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">Link</a></li>-->
                    </ul>
                    <div class="navbar-form navbar-left">
                        <input id="searchkey" name="searchkey" type="text" class="form-control" placeholder="输入页面名称..."
                               value="${searchkey!""}">
                    </div>
                    <div class="navbar-left" style="width: 120px;margin-top: 8px;">
                        <button type="submit" class="btn btn-primary btn-block btn-flat"> 查 询
                        </button>
                    </div>
                </div>
            </form>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>
<!-- Full Width Column -->
<div class="content-wrapper">
    <div class="container">
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
                                    <th style="width: 12%">规则描述</th>
                                    <th style="width: 15%">示例url</th>
                                    <th style="width: 10%">#</th>
                                </tr>
                            <#if urlrulelist??>
                                <#list urlrulelist as item>
                                    <tr>
                                        <td>${item.id}.</td>
                                        <td>
                                            <a target="_blank"
                                               href="${Domain.base}/urlserver/project/getProjectDetailById/${item.projectid}">
                                                <span class="badge bg-light-blue">${item.projectname}</span>
                                            </a>
                                        </td>
                                        <td><strong>${item.urlfunctionname}</strong>
                                        </td>
                                        <td><strong>${item.urlroletips}</strong>
                                        </td>
                                        <td><strong>${item.urldesc}</strong>
                                        </td>
                                        <td>
                                            <div onclick='show_QRImg("${item.urldemo}","urldemoimg${item.id}");'>${item.urldemo}</div>
                                        </td>
                                        <td>
                                            <!-- Navbar Right Menu -->
                                            <ul class="nav">
                                                <!-- User Account Menu -->
                                                <li>
                                                    <a target="_blank"
                                                       style="background-color: transparent; padding: 0px;"
                                                       href="${Domain.base}/urlserver/urlrule/getUrlruleDetailById/${item.id}">
                                                        <span class="badge bg-light-blue">查看详情</span>
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
                            <#else >
                                暂无数据
                            </#if>

                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer clearfix">
                            <ul class="pagination pagination-sm no-margin pull-right">
                            <#if totalpage &gt; 1>
                                <#assign x=1>
                                <#assign mx=totalpage>
                                <#list x..mx as i>
                                <#--<li onclick=""><a href="${Domain.base}/urlserver/urlrule/json?page=${i}">${i}</a></li>-->
                                    <li onclick='change_Page("${Domain.base}/urlserver/urlrule/search?page=${i}")'>
                                        <a>${i}</a>
                                    </li>
                                </#list>
                            </#if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ./wrapper -->
        <script type="text/javascript">
            window.onload = function () {
                // init选中的项目
                var project = "${projectid!"-1"}";
                $("#projectname option[value='" + project + "']").attr("selected", true);
            }
            function change_Page(url) {
                // 获取选中的项目
                var projectname = $("#projectname").val();
                // 获取选择的关键字
                var searchkey = $("#searchkey").val();

                var url = url + "&projectname=" + projectname + "&searchkey=" + searchkey;
                window.location.href = url;
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
    <#include "searchfootermenu.ftl">
