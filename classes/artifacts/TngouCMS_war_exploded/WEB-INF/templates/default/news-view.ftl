<#include "header.ftl">

<div class="wrapper col4">
    <div id="container" class="clear">
        <h1 id="news_title">${news.title}</h1>
        <!--新闻详情信息数据-->
        <div><img src="${Domain.base}/images/demo/avatar.gif" width="32px" height="32px"
                  alt=""/> &raquo &raquo &raquo发布时间：<span id="news_author">${news.time?string("yyyy-MM-dd")}</span>
            &raquo &raquo &raquo浏览：<span
                    id="news_original">${news.count}</span></div>
        <div id="news_content" style="margin-top: 40px">
        ${news.message}
        <#if last??>
            <ul class="page">上一篇：<a href="${Domain.base}/news/${last.id}">${last.title}</a></ul>
        </#if>
        <#if next??>

            <ul class="page">下一篇：<a href="${Domain.base}/news/${next.id}">${next.title}</a></ul>
        </#if>
        </div>
        <div class="clear"></div>
    </div>


<#--<div id="main">
    <div id="right">
        <div id="cont" class="yaheis">
            <ul class="title">${news.title}</ul>
            <ul class="time">发布时间：${news.time?string("yyyy-MM-dd")}&nbsp;&nbsp;&nbsp;&nbsp;浏览：${news.count}

            </ul>
            <ul class="text">
            ${news.message}
            </ul>
        <#if last??>
            <ul class="page">上一篇：<a href="${Domain.base}/news/${last.id}">${last.title}</a></ul>
        </#if>
        <#if next??>

            <ul class="page">下一篇：<a href="${Domain.base}/news/${next.id}">${next.title}</a></ul>
        </#if>
        </div>
    </div>
    <div class="clear"></div>
</div>-->
</div>
<#include "footer.ftl">