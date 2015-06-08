<#include "header.ftl">

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
<#include "footer.ftl">