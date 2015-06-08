<#include "header.ftl">

<div id="main_bg">
  <div id="main">
    <div id="left">
      <div id="sort">
        <ul><div style="background-image:url(${Domain.base}/common/default/img/title_1.gif); height:53px" width="164">
        <span style="position:absolute; margin-top:16px; margin-left:85px; color:#FFF; font-weight:bold; font-size:16px">${map[about.menu+'']}</span>
          </div>
        </ul>
        <ul class="list">
          
         <#list nav as item>
          
          <a href="${Domain.base}/about/${item.id}" class="yaheis <#if item.id=id> now </#if>">
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
        <ul class="name yahei">${about.title}</ul>
        <ul class="ad yaheis"></ul>
        <ul class="lead yaheis"><a href="/boloka">首页</a> - <a href="/boloka/sub/about-1173.html">关于我们</a> - <a href="/boloka/sub/about-1177.html">联系我们</a></ul>
        <div class="clear"></div>
      </div>
      <div id="cont" class="yaheis">
      
      ${about.message}
      
      </div>
    </div>
  <div class="clear"></div>
  </div>
</div>
<#include "footer.ftl">