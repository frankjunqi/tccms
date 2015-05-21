<#include "header.ftl">

<div id="main_bg">
    <div id="main">
        <div id="right">
            <div id="sortname">
                <ul class="lead yaheis"><a href="${Domain.base}">首页</a> - <a
                        href="${Domain.base}/products/list">产品展示</a> - <a
                        href="${Domain.base}/products/list/${products.id}">${map[products.menu+'']}</a></ul>
                <div class="clear"></div>
            </div>
            <div id="pro_cont" class="yaheis">

                <div class="detail">
                    <ul><strong>产品名称</strong>&nbsp;&nbsp;&nbsp;<span>${products.title}</span></ul>
                    <ul>
                    ${products.message}
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<#include "footer.ftl">