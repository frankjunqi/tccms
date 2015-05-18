    <!DOCTYPE html>
    <html>
  
  <#include "head.ftl">
  
    	
    <body>

    <div style="margin:20px 0;"></div>

    <table id="nav-dg" class="easyui-datagrid" title="菜单列表" 
    data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_nav',
    url:'${Domain.base}/manage/nav/json',
    pagination:true,
    pageSize:20,
    iconCls:'chart_organisation',
 
    ">
    <thead>
    <tr>
    <th data-options="field:'ck',checkbox:true"></th>
    <th data-options="field:'id'">ID</th>
    
	
    <th data-options="field:'name',width:200">名称</th>
     <th data-options="field:'type',width:200,
			formatter: function(value,row,index){
			if(value==-1)return '隐藏导航';
			 if(value==1)return '链接导航';	
			 if(value==2)return '资讯导航';	
			 if(value==3)return '产品导航';	
			 return '~';
			}">类型</th>
			
		<th data-options="field:'menuName'">上级导航</th>	
    <th data-options="field:'menu',width:200,hidden:true">上级导航</th>
     <th data-options="field:'seq'">排序</th>
 <th data-options="field:'url',width:300">超链接</th>
 

    </tr>
    </thead>
     
   
    </table>
    <script type="text/javascript">
    
    

		
		
	


  function addNav(){ 
	$('#nav-add').dialog('open');
   }
    
 
    
function editNavId()
     {
       var row=$('#nav-dg').datagrid('getSelected');
      if(row==null)
      {
          $.messager.alert("提示！","请选择需要修改的数据！")
      }else
      {
      	 
		 $('#nav-update').window({title:row['name']+"-详情"}).dialog('open');		
		 $('#nav-update-f').form('load',row);
		  
		 
        
      }
     }

    
    </script>
    
  

     
<div  id="toolbar_nav" style="padding:2px 5px;">

<a href="javascript:addNav()" class="easyui-linkbutton" iconCls="basket_add" > 添加 </a> 
 &nbsp;|&nbsp;
 <a href="javascript:editNavId()" class="easyui-linkbutton" iconCls="basket_edit" > 编辑 </a> 

</div>
    
   
  
 
 <!-- 添加-->
   
    
<div id="nav-add" class="easyui-window" title="添加用户" data-options="iconCls:'basket_add',closed:true" style="width:500px;padding:10px;">

<div class="easyui-panel"  >

<form id="nav-add-f" method="post" >
<table cellpadding="5">
<tr>
<td>名称:</td>
<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
</tr>
<tr>
<td>类型:</td>
<td><select class="easyui-combobox" type="text" name="type" data-options="required:true">

<option value="-1">隐藏导航</option>
<option value="1">链接导航</option>
<option value="2">资讯导航</option>
<option value="3">产品导航</option>
</select>
</td>
</tr>
<tr>
<tr>
<td>上级:</td>
<td><input  class="easyui-combobox" name="menu"  data-options="valueField:'id',textField:'name',url:'${Domain.base}/manage/nav/menujson'">
     如果为顶级，就不需要选择！</td>
</tr>
<tr>
<tr>
<td>排序:</td>
<td><input name="seq" class="easyui-numberspinner" style="width:80px;" 
 data-options="min:0,max:255,editable:true,value:1"></td>
</tr>

<tr>
<td>链接:</td>
<td><input class="easyui-textbox"  name="url" data-options="validType:'url'" style="width:250px;">
当菜单类型为超链接才填写
</td>
</tr>



</table>
</form>
<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormNavAdd()">保存</a>

 <script>
function submitFormNavAdd(){
	$('#nav-add-f').form('submit', {
	url:'${Domain.base}/manage/nav/add',
	onSubmit: function(){
		// do some check
		// return false to prevent submit;
	},
	success:function(data){
	
		$('#nav-add').window('close');
		$('#nav-dg').datagrid('reload');
		
	}
	});
}

</script>

</div>
</div>


</div>   
   


<div id="nav-update" class="easyui-window"  data-options="iconCls:'user_edit',closed:true" style="width:620px;padding:10px;">

<div class="easyui-panel"  >
<form id="nav-update-f" method="post" >
<input  name="id" type="hidden">
<table cellpadding="5">

<tr>
<td>名称:</td>
<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
</tr>
<tr>
<td>类型:</td>
<td><select class="easyui-combobox" type="text" name="type" data-options="required:true">

<option value="-1">隐藏导航</option>
<option value="1">链接导航</option>
<option value="2">资讯导航</option>
<option value="3">产品导航</option>
</select>
</td>
</tr>
<tr>
<tr>
<td>上级:</td>
<td><input  class="easyui-combobox" name="menu"  data-options="valueField:'id',textField:'name',url:'${Domain.base}/manage/nav/menujson'">
     如果为顶级，就不需要选择！</td>
</tr>
<tr>
<tr>
<td>排序:</td>
<td><input name="seq" class="easyui-numberspinner" style="width:80px;" 
 data-options="min:0,max:255,editable:true,value:1"></td>
</tr>

<tr>
<td>链接:</td>
<td><input class="easyui-textbox"  name="url" data-options="validType:'url'" style="width:250px;">
当菜单类型为超链接才填写
</td>
</tr>




</table>
</form>

<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitNavUpdate()">更新</a>
</div>
 <script>
 

 
 
function submitNavUpdate(){
	$('#nav-update-f').form('submit', {
	url:'${Domain.base}/manage/nav/edit',
	onSubmit: function(){
	     $('#nav-update').window('close');
	     $.messager.progress({title:'请稍后',msg:'数据处理中...'});
		
	},
	success:function(html){
	     $.messager.progress('close');
		if(html.length == 0)
		{
		   $('#nav-dg').datagrid('reload');
		
		}else
		{
		   $.messager.alert("提示！",html);
		   $('#nav-dg').datagrid('reload');
		   
		}
		
	}
	});
}

</script>


</div>

</div>
 
    
    
    
    
    
    </body>
    </html>