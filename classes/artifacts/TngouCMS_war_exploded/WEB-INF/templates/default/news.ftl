<#include "header.ftl">

<h2>新闻动态</h2>
<!--列表数据-->
<div id="portfolio">
<#list page.list as item>
    <ul>
        <li>
            <div class="imgholder">
                <img style="width: 230px; height: 160px;" src="${item.Img()}" alt=""/>
            </div>
            <div class="content">
                <p class="title">${item.title}--${item.time?string("yyyy-MM-dd")}</p>

                <p class="projectdescription">
                ${item.desc}
                </p>

                <p class="readmore"><a
                        href="${Domain.base}/news/${item.id}"><strong>查看详情 &raquo;</strong></a>
                </p></div>
        </li>
    </ul>
</#list>
<#include "page.ftl">
</div>
<div class="clear"></div>
<#include "footer.ftl">