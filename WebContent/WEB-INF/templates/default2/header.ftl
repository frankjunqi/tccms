<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${title}</title>
<meta name="keywords" content="${keywords}" />
<meta name="description" content="${description}" />
<link rel="icon" href="${Domain.base}/common/upload/favicon.ico" type="image/x-icon" />

<link rel="stylesheet" type="text/css" href="${Domain.base}/common/default/layout.css" />
</head>
<body>

<div id="top_bg">
  <div id="menu">
    <ul class="logo"><a href="${Domain.base}"><img src="${info.Logo()!Domain.base+"common/upload/logo.gif"}" /></a></ul>
    <ul class="title">
    
    <a  <#if type==0>class="now" </#if> href="${Domain.base}">   
      
        <span class="ch">首页</span>
</a>
      <#list menu as item>
      <a  <#if item.type==type>class="now" </#if>  href="
       <#switch item.type>
        <#case 1>
        <#if item.url=="">
         ${Domain.base}/about/${item.id}
        <#else>
            ${item.url}
        </#if>
              
         <#break>
         <#case 2>
              ${Domain.base}/news/list
         <#break>
          <#case 3>
              ${Domain.base}/products/list
         <#break>
       </#switch>
      ">
     
        <span class="ch">${item.name}</span>
      </a>
      </#list>
      
      
    </ul>
  </div>
</div>
<div id="flash_bg">
  <div id="flash" class="imgPlayer">
<#list info.Img() as item>
    <img src="${item}" />
    </#list>
  </div>
</div>