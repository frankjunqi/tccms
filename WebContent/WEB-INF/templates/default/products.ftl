<#include "header.ftl">

<h1>公司案例</h1>

<div class="gallery clear">
    <ul>
    <#list page.list as item>
        <li><a href="${Domain.base}/products/${item.id}" rel="prettyPhoto[gallery]"
               title="Image 1">
            <img src="${item.Img()}" alt="${item.title}"/></a></li>
    </#list>
    </ul>

<#--<!--效果开始&ndash;&gt;
<div class="mod_gallerylist">
    <ul>
    <#list page.list as item>
        <li>
            <div class="layout_default">
                <p class="info"><span class="date"></span> <span class="author"></span></p>

                <div class="image_container">
                    <a href="${Domain.base}/products/${item.id} " rel="lightbox[ostec]" title=""> <img
                            src="${item.Img()}" alt=""> </a>
                </div>
            </div>
        </li>
    </#list>
    </ul>
</div>-->
<#include "page.ftl">
</div>
<#include "footer.ftl">