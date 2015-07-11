<#include "header.ftl">

<div id="main_bg">
  <div id="main">
    <div id="left">
      <div id="sort">
        <ul><div style="background-image:url(${Domain.base}/common/default/img/title_1.gif); height:53px" width="164">
        <span style="position:absolute; margin-top:16px; margin-left:85px; color:#FFF; font-weight:bold; font-size:16px">${map[id+'']!"产品展示"}</span>
          </div>
        </ul>
        <ul class="list">
          
           <#list nav as item>
          
          <a href="${Domain.base}/products/list/${item.id}" class="yaheis <#if item.id=id> now </#if>">
		    <p>${item.name}</p>
            <p class="jt">&nbsp;</p>
          </a>
          </#list>
          
        </ul>
      </div>
            <div id="contact2" class="yaheis">
       <ul class="t1">联系方式</ul>
        <ul class="t2">服务时间：08:00 ~ 17:00</ul>
        <ul class="t2">电话：${info.tel}</ul>
        <ul class="t2">传真：${info.fax}</ul>
         <ul class="t2">邮箱：${info.email}</ul>
         <ul class="t2">地址：${info.address}</ul>
      </div>
    </div>
    <div id="right">
      <div id="sortname">
        <ul class="name yahei">${map[id+'']!"产品展示"}</ul>
        <ul class="ad yaheis"></ul>
        <ul class="lead yaheis"><a href="${Domain.base}">首页</a> - <a href="${Domain.base}/produts">产品展示</a></ul>
        <div class="clear"></div>
      </div>
      <div id="pro_list" class="yaheis">        
        
        <#list page.list as item>
        <ul>
          <li class="pic"><a title="${item.title}" href="${Domain.base}/products/${item.id}"><img src="${item.Img()}" alt="${item.title}"></a></li>
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