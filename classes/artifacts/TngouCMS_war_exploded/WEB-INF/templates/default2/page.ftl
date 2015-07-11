
<#if page.totalpage &gt; 1> 
	<#assign x=1>
	<#assign mx=page.totalpage>
	
	<#if page.page &gt; 5>
		<#assign x=page.page-3>
	</#if>
	<#assign mx=page.page+5>
	<#if mx &gt;page.totalpage >
		<#assign mx=page.totalpage>
	</#if>
  <div id="page" class="black-red clear page">
          <#if page.page!=1>
          <span ><a href="?p=${page.page-1}"> &lt; </a></span> 
          	</#if>
    <#if page.page &gt; 5>
    <a href="?p=1">1</a>
	</#if>

<#list x..mx as i>
	<#if i==page.page><span class="current">${i}</span><#else>	 <a href="?p=${i}">${i}</li></#if>
	
	</#list>

	
		<#if page.page!=page.totalpage>
    		 <a   href="?p=${page.page+1}">&gt;</a>
		</#if>      

 </div>
</#if> 