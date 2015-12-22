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
    <link rel="stylesheet" href="${Domain.base}/styles/lrtk.css" type="text/css"/>
    <link rel="stylesheet" href="${Domain.base}/styles/main.css" type="text/css"/>
    <script type="text/javascript" src="${Domain.base}/scripts/hashtabber.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery-1.6.3.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery.defaultvalue.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery-ui-1.8.13.custom.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/jquery.scrollTo-min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/idangerous.swiper.scrollbar-1.2.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/idangerous.swiper-1.9.1.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/swiper-demos.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/mootools-core.js"></script>
    <script type="text/javascript" src="${Domain.base}/scripts/mediabox.js"></script>
    <style type="text/css">
        * {
            padding: 0;
            margin: 0
        }

        #mbOverlay {
            position: fixed;
            z-index: 9998;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #000;
            cursor: pointer;
        }

        #mbOverlay.mbOverlayFF {
            background: transparent url(80.png) repeat;
        }

        #mbOverlay.mbOverlayIE {
            position: absolute;
        }

        #mbCenter {
            height: 557px;
            position: absolute;
            z-index: 9999;
            left: 50%;
            background-color: #fff;
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
            -moz-box-shadow: 0 10px 40px rgba(0, 0, 0, 0.70);
            -webkit-box-shadow: 0 10px 40px rgba(0, 0, 0, 0.70);
        }

        #mbCenter.mbLoading {
            background: #fff url(${Domain.base}/images/icon/WhiteLoading.gif) no-repeat center;
            -moz-box-shadow: none;
            -webkit-box-shadow: none;
        }

        #mbImage {
            left: 0;
            top: 0;
            font-family: Myriad, Verdana, Arial, Helvetica, sans-serif;
            line-height: 20px;
            font-size: 12px;
            color: #fff;
            text-align: left;
            background-position: center center;
            background-repeat: no-repeat;
            padding: 10px;
        }

        #mbImage a, #mbImage a:link, #mbImage a:visited {
            color: #ddd;
        }

        #mbImage a:hover, #mbImage a:active {
            color: #fff;
        }

        #mbBottom {
            min-height: 20px;
            font-family: Myriad, Verdana, Arial, Helvetica, sans-serif;
            line-height: 20px;
            font-size: 12px;
            color: #999;
            text-align: left;
            padding: 0 10px 10px;
        }

        #mbTitle {
            display: inline;
            color: #999;
            font-weight: bold;
            line-height: 20px;
            font-size: 12px;
        }

        #mbNumber {
            background: url(${Domain.base}/images/mbNumber_bg.gif) no-repeat center;
            display: inline;
            color: #C00;
            line-height: 26px;
            font-size: 12px;
            position: absolute;
            bottom: 10px;
            right: 10px;
            text-align: center;
            width: 65px;
            height: 26px;
        }

        #mbCaption {
            display: block;
            color: #999;
            line-height: 14px;
            font-size: 10px;
        }

        #mbPrevLink, #mbNextLink, #mbCloseLink {
            display: block;
            float: right;
            height: 20px;
            margin: 0;
            outline: none;
        }

        #mbPrevLink {
            width: 32px;
            height: 100px;
            background: transparent url(${Domain.base}/images/icon/CustomBlackPrevious.gif) no-repeat center;
            position: absolute;
            top: 38%;
            left: -32px;
        }

        #mbNextLink {
            width: 32px;
            height: 100px;
            background: transparent url(${Domain.base}/images/icon/CustomBlackNext.gif) no-repeat center;
            position: absolute;
            top: 38%;
            right: -32px;
        }

        #mbCloseLink {
            width: 24px;
            background: transparent url(${Domain.base}/images/icon/CustomBlackClose.gif) no-repeat center;
            position: absolute;
            top: 10px;
            right: 10px;
        }

        #mbError {
            position: relative;
            font-family: Myriad, Verdana, Arial, Helvetica, sans-serif;
            line-height: 20px;
            font-size: 12px;
            color: #fff;
            text-align: center;
            border: 10px solid #700;
            padding: 10px 10px 10px;
            margin: 20px;
            -moz-border-radius: 5px;
            -webkit-border-radius: 5px;
        }

        #mbError a, #mbError a:link, #mbError a:visited, #mbError a:hover, #mbError a:active {
            color: #d00;
            font-weight: bold;
            text-decoration: underline;
        }

        .layout_default {
            float: left;
            margin: 5px
        }

        .mod_gallerylist {
            width: 1020px;
            margin: 0 auto
        }

        .meta {
            font-size: 12px;
            text-align: center;
        }

        .image_container img {
            border: 1px solid #CCC;
            padding: 2px
        }

        .meta a {
            color: #333;
            text-decoration: none
        }
    </style>
    <script type="text/javascript">
        Mediabox.scanPage = function () {
            var links = $$("a").filter(function (el) {
                return el.rel && el.rel.test(/^lightbox/i);
            });
            $$(links).mediabox({/* Put custom options here */}, null, function (el) {
                var rel0 = this.rel.replace(/[[]|]/gi, " ");
                var relsize = rel0.split(" ");
                return (this == el) || ((this.rel.length > 8) && el.rel.match(relsize[1]));
            });
        };
        window.addEvent("domready", Mediabox.scanPage);
    </script>
    <!-- 初始化提交信息-->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#fullname, #validemail, #message").defaultvalue("Full Name", "Email Address", "Message");
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
                <input type="image" id="go" src="${Domain.base}/images/icon/search.gif" alt="Search"/>
            </fieldset>
        </form>
    </div>
</div>
<!-- 导航栏 -->
<div class="wrapper col2">
    <div id="header" class="clear">
        <div class="fl_left">
            <a href="${Domain.base}"><img src="${Domain.base}/images/icon/logo_white.jpg" alt=""
                                          style="width: 280px;height: 52px; text-align: center"/></a>
        </div>
        <div id="topnav">
            <ul>
                <li><a href="${Domain.base}/joblist">招聘</a></li>
                <li><a href="${Domain.base}/news/list">新闻动态</a></li>
            <#--<li class="active"><a href="gallery.html">动态</a></li>-->
                <li><a href="${Domain.base}/products/list">案例</a></li>
                <li><a href="${Domain.base}/about/">简介</a></li>
                <li><a href="${Domain.base}">首页</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="wrapper col4">
    <div id="container" class="clear">