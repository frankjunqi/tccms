<#include "header.ftl">

<h1>公司案例</h1>

<div class="gallery clear">
    <ul>
    <#list page.list as item>
        <li><a href="${Domain.base}/products/${item.id}"
               title="${item.title}">
            <img src="${item.Img()}" alt="${item.title}"/></a>
        </li>
    </#list>
    </ul>

<#include "page.ftl">
</div>
<#include "footer.ftl">