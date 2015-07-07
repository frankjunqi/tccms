<#include "header.ftl">

<#-- <h2>${title}</h2>-->
<#--广告图-->
<div class="home-device">
    <div class="swiper-main">
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper">
            <#list loglist as item>
                <div class="swiper-slide"><img src="${item}"></div>
            </#list>
            </div>
        </div>
    </div>
    <div class="pagination pagination1"></div>
    <a class="arrow-left" href="#"></a>
    <a class="arrow-right" href="#"></a>
</div>
<div class="clear"></div>
<!-- 代码根据id动态修改显示数据 -->
<p id="cluture_desc" style="margin-top: 20px">${description}</p>
<#include "footer.ftl">