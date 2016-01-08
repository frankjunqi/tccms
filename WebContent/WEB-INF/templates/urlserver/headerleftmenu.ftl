<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Url规则 | 拦截器</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="${Domain.base}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${Domain.base}/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="${Domain.base}/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="${Domain.base}/plugins/iCheck/all.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="${Domain.base}/plugins/iCheck/all.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Pace style -->
    <link rel="stylesheet" href="${Domain.base}/plugins/pace/pace.min.css">

    <!-- REQUIRED JS SCRIPTS -->
    <!-- jQuery 2.1.4 -->
    <script src="${Domain.base}/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="${Domain.base}/bootstrap/js/bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="${Domain.base}/dist/js/app.min.js"></script>
    <!-- PACE -->
    <script src="${Domain.base}/plugins/pace/pace.min.js"></script>
    <!-- Qrcode -->
    <script src="${Domain.base}/scripts/qrcode.js"></script>
    <![endif]-->
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>T</b>C-P</span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>TC</b>-PRO</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                            <img src="${Domain.base}/common/icon/logo.png" class="user-image" alt="User Image">
                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">Alexander Pierce</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                                <img src="${Domain.base}/common/icon/logo.png" class="img-circle"
                                     alt="User Image">

                                <p>
                                    Alexander Pierce - Web Developer
                                    <small>Member since Nov. 2012</small>
                                </p>
                            </li>
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="#" class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="#" class="btn btn-default btn-flat">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar user panel (optional) -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${Domain.base}/common/icon/logo.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>Alexander Pierce</p>
                    <!-- Status -->
                    <a><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <!-- search form (Optional) -->
            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
                </div>
            </form>
            <!-- /.search form -->

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">Url Rule</li>
                <!-- Optionally, you can add icons to the links -->
                <li <#if FlagGroup == "interceptor">class="treeview active"<#else >class="treeview "</#if>>
                    <a href="#"><i class="fa fa-link"></i> <span>Interceptor</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li <#if FlagChild == "interceptorlist">class="active"</#if>><a
                                href="${Domain.base}/urlserver/interceptor/json">Interceptor List</a></li>
                        <li <#if FlagChild == "interceptoradd">class="active"</#if>><a
                                href="${Domain.base}/urlserver/interceptor/add">Interceptor Add</a></li>
                    </ul>
                </li>
                <li <#if FlagGroup == "project">class="treeview active"<#else >class="treeview "</#if>>
                    <a href="#"><i class="fa fa-link"></i> <span>Project</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li <#if FlagChild == "projectlist">class="active"</#if>><a
                                href="${Domain.base}/urlserver/project/json">Project List</a></li>
                        <li <#if FlagChild == "projectadd">class="active"</#if>><a
                                href="${Domain.base}/urlserver/project/add">Project Add</a></li>
                    </ul>
                </li>
                <li <#if FlagGroup == "urlrule">class="treeview active"<#else >class="treeview "</#if>>
                    <a href="#"><i class="fa fa-link"></i> <span>Urlrule</span> <i
                            class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        <li <#if FlagChild == "urlrulelist">class="active"</#if>><a
                                href="${Domain.base}/urlserver/urlrule/json">UrlRule List</a></li>
                        <li <#if FlagChild == "urlruleadd">class="active"</#if>><a
                                href="${Domain.base}/urlserver/urlrule/add">UrlRule Add</a></li>
                    </ul>
                </li>

                <li><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li>
                <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

