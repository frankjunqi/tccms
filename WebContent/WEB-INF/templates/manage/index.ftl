<#include "header.ftl">



<#include "menu.ftl">



<div id="tab" data-options="region:'center'" style="height:auto" class="easyui-tabs">


    <div title="首页" style="padding:10px;" data-options="iconCls:'application_home'">
        <p style="font-size:18px;">欢迎使用TC内容管理系统! </p>

        <div style="margin:40px 0;"></div>
        <b>功能特点：</b>

        <div style="margin:20px 0;"></div>
        <ul style="font-size:14px;">

            <br>
            <li>该系统实现一键式部署，安装简单、方便。</li>
            <li>软件免费、开源，方便二次开发。</li>
            <li>为微小企业实现简单的企业网站与运维成本。</li>
            <li>系统时刻刻自动化设计，方便企业网站的个性化设计。</li>
            <li>系统支持多中页面模板，让网站有不同风格。</li>
            <li>该系统相对其他CMS系统来说，功能简单、操作方便。</li>
            <li><strong><a href="${Domain.base}" target="_blank">default</a>.<a href="${Domain.base}/manage"
                                                                                target="_blank">manage</a>.<a
                    href="${Domain.base}/urlserver/urlrule/search" target="_blank">urlserver</a>.</strong></li>

            <br>

    </div>


</div>


<div style="margin:20px 0;"></div>

<script type="text/javascript">

    function addTab(title, url, iconCls) {

// 通过标题来判定 该tab是否出现 如果出现，就选择该tab
        if ($("#tab").tabs("exists", title)) {
            $("#tab").tabs("select", title);
        } else {
            // 新添加tab
            //var iframe = document.createElement("iframe");
            //iframe.style="width:100%;height:100%;";
            //iframe.frameborder="0";
            //iframe.scrolling="no";
            // iframe.src = url;


            $('#tab').tabs('add', {
                title: title,
                //href:url,
                content: '<iframe scrolling="no" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>',
                //content:iframe,
                iconCls: iconCls,
                closable: true
            });
        }
    }


</script>





<#include "footer.ftl">