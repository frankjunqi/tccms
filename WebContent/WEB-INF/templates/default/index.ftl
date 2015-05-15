
<#include "header.ftl">

<div id="main_bg">
  <div id="main">
  
    <div id="newlist">
      <ul class="bg">
        <li class="title yaheis">新闻动态</li>
        <li class="more">
        <a href="${Domain.base}/news/list"><img src="${Domain.base}/common/default/img/more.gif" width="35" height="13" /></a></li>
      </ul>
      <ul class="img">
        <img src="${Domain.base}/common/default/img/newlist_img.gif" width="83" height="81" />
      </ul>
      <ul class="list yaheis">
        
        <#list newsPage.list as item>
        <li><a href="${Domain.base}/news/${item.id}" class="a_list" title="${item.title}">${item.title}</a></li>
        
         </#list>
      </ul>
    </div>
    
    <div id="prolist">
      <#list productsPage.list as item>
      <a href="${Domain.base}/products/${item.id}" title="${item.title}"><img alt="${item.title}" src="${item.Img()}" /></a>
      
     </#list>
    </div>
    <div id="contact" class="yaheis">
      <ul class="t1">联系方式</ul>
      <ul class="t2">电话：${info.tel}</ul>
      <ul class="t2">传真：${info.fax}</ul>
      <ul class="t2">邮箱：${info.email}</ul>
      <ul class="t2">地址：${info.address}</ul>
      <ul class="t2">服务时间：08:00 ~ 17:00</ul>
    </div>
    <div class="clear"></div>
  </div>
  
  
  <div id="Tngou_Links">
<div id="links" class="bmodule">
<h3 class="caption">友情链接 + </h3>
<p>
<#list link as item>
<a href="${item.url}" target="_blank" >${item.name}</a>
</#list>
<a href="http://www.tngou.net" target="_blank" style="color:#A00;">天狗农业</a>
</p>
</div>


</div>
  
  
</div>

<#include "footer.ftl">
