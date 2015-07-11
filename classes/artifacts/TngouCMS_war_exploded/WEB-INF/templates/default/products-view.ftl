<#include "header.ftl">
<h3>标题:<strong></strong><span>${products.title}</span></h3>
<#--效果开始-->
<div class="gallery clear">
    <ul>
    <#list imagelist as item>
        <li>
            <a href="${item}" rel="lightbox[ostec]"
               title="Image 1">
                <img src="${item}" alt="${item}"/></a></li>
    </#list>
    </ul>
</div>
<div class="clear"></div>
<#include "footer.ftl">