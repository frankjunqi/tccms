
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>TngouCMS后台管理</title>
    <link rel="stylesheet" type="text/css" href="${Domain.base}/common/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${Domain.base}/common/easyui/themes/icon.css">

    <script type="text/javascript" src="${Domain.base}/common/easyui/jquery.min.js"></script>
    <script type="text/javascript" src="${Domain.base}/common/easyui/jquery.easyui.min.js"></script>
     <script type="text/javascript" src="${Domain.base}/common/easyui/locale/easyui-lang-zh_CN.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="${Domain.base}/common/upload/favicon.ico" />

    </head>
    <body class="easyui-layout">

   
    <div data-options="region:'north'" style="height:100px">
  
<div id="headerDiv" style="margin:10px 0;">
<table style="width:100%;height:100%;table-layout:fixed;">
<tr>
<td width="360px" height="60px"><a href="http://www.tngou.net/open/tngoucms" target="_blank"><img height="60" style="border:0" src="${Domain.base}/common/upload/tngoucms-logo.png"></img></a> 
<span style="font-size:18px;">天狗内容管理系统</span></td>
<td align="right"  class="loginInfo" >
<br>
<div id="todayDate"></div>


</td>
<td width="380px" align="right" style="padding-right:5px;" >
<br>

<span style="padding:3px 10px 0px 18px;" data-options="iconCls:'user'"  >

<a  class="easyui-linkbutton" data-options="iconCls:'user',plain:true" href="#" >  <span id="userShow"  ></span> 
</a>
- <span id="sayHelloSpan"></span>  
</span>

<span   ><a  class="easyui-linkbutton" data-options="iconCls:'user_go',plain:true" href="${Domain.base}/login/exit">退出</a></span>

<span   ><a target="_blank"  class="easyui-linkbutton" data-options="iconCls:'house',plain:true" href="${Domain.base}">回到首页</a></span>

</td>
</tr>
</table>
</div> 

  

    </div>
    
    
    <script type="text/javascript">
    
    
$(document).ready(function(){
  // 在这里写你的代码...





<#if user??>	

	$("#userShow").text('${user.account}');
	
<#else>
 window.location.href="${Domain.base}/login";
</#if>
$("#sayHelloSpan").text(sayHello());
$("#todayDate").html(getToday());

});
    
    
    /**
* 分时问候
*/
function sayHello(){
var hour = new Date().getHours();
var hello = '';
if(hour < 6){
hello='凌晨好';
}else if(hour < 9){
hello='早上好';
}else if(hour < 12){
hello='上午好';
}else if(hour < 14){
hello='中午好';
}else if(hour < 17){
hello='下午好';
}else if(hour < 19){
hello='傍晚好';
}else if(hour < 22){
hello='晚上好';
}else{
hello='夜里好';
}
return hello;
}
/**
* 获得当天日期和星期
*/
function getToday(){
WEEK_DATA_CN=["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
var today=new Date();
var year = today.getFullYear();
var month = today.getMonth()+1;
month = month<10?'0'+month:month;
var date = today.getDate();
date = date<10?'0'+date:date;
var day = WEEK_DATA_CN[today.getDay()];
return year+"年"+month+"月"+date+"日 "+day;
}






</script>