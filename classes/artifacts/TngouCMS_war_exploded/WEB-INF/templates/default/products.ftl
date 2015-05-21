<#include "header.ftl">

<div id="main_bg">
    <div id="main">
        <div id="right">
            <div id="pro_list" class="yaheis">
            <#list page.list as item>
                <ul>
                    <li class="pic"><a title="${item.title}" href="${Domain.base}/products/${item.id}">
                        <img src="${item.Img()}" alt="${item.title}"></a></li>
                    <li class="text">${item.title}</li>
                </ul>
            </#list>
            <#include "page.ftl">
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<#include "footer.ftl">