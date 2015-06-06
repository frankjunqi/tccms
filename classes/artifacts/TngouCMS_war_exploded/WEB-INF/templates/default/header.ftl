<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xml:lang="EN" lang="EN" dir="ltr">
<head>
    <title>骏燕文化</title>
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="imagetoolbar" content="no"/>
    <link rel="stylesheet" href="${Domain.base}/styles/layout.css" type="text/css"/>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery.defaultvalue.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery.scrollTo-min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/idangerous.swiper.scrollbar-1.2.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/idangerous.swiper-1.9.1.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/swiper-demos.js"></script>
    <!-- 初始化提交信息-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fullname, #validemail, #message").defaultvalue("姓名", "Email Address", "Message");
            $('#shout a').click(function () {
                var to = $(this).attr('href');
                $.scrollTo(to, 1200);
                return false;
            });
            $('a.topOfPage').click(function () {
                $.scrollTo(0, 1200);
                return false;
            });
            $("#tabcontainer").tabs({
                event: "click"
            });
        });
    </script>
</head>
<body id="top">
<!--top search-->
<div class="wrapper col1">
    <div id="topbar" class="clear">
        <form action="#" method="post" id="search">
            <fieldset>
                <legend>Site Search</legend>
                <input type="text" value="Search Our Website&hellip;"
                       onfocus="this.value=(this.value=='Search Our Website&hellip;')? '' : this.value ;"/>
                <input type="image" id="go" src="${Domain.base}/images/search.gif" alt="Search"/>
            </fieldset>
        </form>
    </div>
</div>
<!-- 导航栏 -->
<div class="wrapper col2">
    <div id="header" class="clear">
        <div class="fl_left">
            <a href="${Domain.base}"><img src="${Domain.base}/images/logo_white.jpg" alt=""
                                          style="width: 280px;height: 52px; text-align: center"/></a>
        </div>
        <div id="topnav">
            <ul>
                <li><a href="${Domain.base}/joblist">招聘</a></li>
                <li><a href="${Domain.base}/news/list">新闻动态</a></li>
            <#--<li><a href="gallery.html">动态</a></li>-->
                <li><a href="${Domain.base}/products/list">案例</a></li>
                <li><a href="${Domain.base}/about/">简介</a></li>
                <li class="active"><a href="${Domain.base}">首页</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="wrapper col4">
    <div id="container" class="clear">