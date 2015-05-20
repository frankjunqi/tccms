<#include "header.ftl">

<div id="main_bg">
    <div id="main">

        <div id="newlist">
            <ul class="bg">
                <li class="title yaheis">新闻动态</li>
                <li class="more">
                    <a href="${Domain.base}/news/list"><img src="${Domain.base}/common/default/img/more.gif" width="35"
                                                            height="13"/></a></li>
            </ul>
            <ul class="img">
                <img src="${Domain.base}/common/default/img/newlist_img.gif" width="83" height="81"/>
            </ul>
            <ul class="list yaheis">

            <#list newsPage.list as item>
                <li><a href="${Domain.base}/news/${item.id}" class="a_list" title="${item.title}">${item.title}</a></li>

            </#list>
            </ul>
        </div>

        <div id="prolist">
        <#list productsPage.list as item>
            <a href="${Domain.base}/products/${item.id}" title="${item.title}"><img alt="${item.title}"
                                                                                    src="${item.Img()}"/></a>

        </#list>
        </div>
        <div class="clear"></div>
    </div>


    <div id="Tngou_Links">
        <div id="links" class="bmodule">
            <h3 class="caption">友情链接 + </h3>

            <p>
            <#list link as item>
                <a href="${item.url}" target="_blank">${item.name}</a>
            </#list>
            </p>
        </div>
    </div>
</div>

<#include "footer.ftl">
