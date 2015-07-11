    <!DOCTYPE html>
    <html>
  
  <#include "head.ftl">
  
    	
    <body>

    <div style="margin:20px 0;"></div>

    <table id="user-dg" class="easyui-datagrid" title="用户列表" 
    data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_user',
    url:'${Domain.base}/manage/user/json',
    pagination:true,
    pageSize:20,
    iconCls:'user',
 
    ">
    <thead>
    <tr>
    <th data-options="field:'ck',checkbox:true"></th>
    <th data-options="field:'id'">ID</th>
    
	
    <th data-options="field:'account',width:200">账号</th>
     <th data-options="field:'name',width:200">姓名</th>
    <th data-options="field:'email',width:300">邮箱</th>
     <th data-options="field:'role'">角色ID</th>

 

    </tr>
    </thead>
     
   
    </table>
    <script type="text/javascript">
    
    

		
		
	


  function addUser(){ 
	$('#user-add').dialog('open');
   }
    
      function editUserId()
     {
       var row=$('#user-dg').datagrid('getSelected');
      if(row==null)
      {
          $.messager.alert("提示！","请选择需要修改的数据！")
      }else
      {
      	 
		 $('#user-update').window({title:row['account']+"-详情"}).dialog('open');		
		 $('#user-update-f').form('load',row);
		  
		 
        
      }
     }
    
function deleteUserId()
{
				var rows=$('#user-dg').datagrid('getSelections');
			      if(rows.length==0)
			      {
			          $.messager.alert("提示！","请选择需要删除的数据！");
			    
			      }else
			      {
			               var sid=new Array()   // 封装成数组  
			      	       $.each(rows, function(i,item){				    
								 sid[i]=item['id'];
						   });
						   	 $.messager.confirm('提示！','确认要删除数据ID：'+sid,function(r){
								if (r){
									 $.get("${Domain.base}/manage/user/delete", { id:sid  } ,
								     function(data){
								         $('#user-dg').datagrid('reload');
								     });
						        
									}
								});
			      	 
			   
			      }
				
		}  
    
    </script>
    
  

     
<div  id="toolbar_user" style="padding:2px 5px;">

<a href="javascript:addUser()" class="easyui-linkbutton" iconCls="user_add" > 添加 </a> 
 &nbsp;|&nbsp;
 <a href="javascript:editUserId()" class="easyui-linkbutton" iconCls="user_edit" > 编辑 </a> 
 &nbsp;||&nbsp;
 <a href="javascript:deleteUserId()" class="easyui-linkbutton" iconCls="user_delete" > 删除 </a> 
</div>
    
   
  
 
 <!-- 添加-->
   
    
<div id="user-add" class="easyui-window" title="添加用户" data-options="iconCls:'user_add',closed:true" style="width:500px;padding:10px;">

<div class="easyui-panel"  >

<form id="user-add-f" method="post" >
<table cellpadding="5">
<tr>
<td>账户:</td>
<td><input class="easyui-textbox" type="text" name="account" data-options="required:true"></td>
</tr>
<tr>
<td>密码:</td>
<td><input class="easyui-textbox" type="password" name="password" data-options="required:true"></td>
</tr>
<tr>
<td>姓名:</td>
<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
</tr>

<tr>
<td >邮箱:</td>
<td><input class="easyui-textbox"  name="email"  data-options="width:300,validType:'email'">
</td>
</tr>

<input  name="role" type="hidden" value="1">


</table>
</form>
<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormUserAdd()">保存</a>

 <script>
function submitFormUserAdd(){
	$('#user-add-f').form('submit', {
	url:'${Domain.base}/manage/user/add',
	onSubmit: function(){
		// do some check
		// return false to prevent submit;
	},
	success:function(data){
	
		$('#user-add').window('close');
		$('#user-dg').datagrid('reload');
		
	}
	});
}

</script>

</div>
</div>


</div>   
   


<div id="user-update" class="easyui-window"  data-options="iconCls:'user_edit',closed:true" style="width:620px;padding:10px;">

<div class="easyui-panel"  >
<form id="user-update-f" method="post" >
<input  name="id" type="hidden">
<table cellpadding="5">

<tr>
<td>账户:</td>
<td><input class="easyui-textbox" type="text" name="account" data-options="required:true"></td>
</tr>
<tr>
<td>密码:</td>
<td><input class="easyui-textbox" type="password" name="password" value=""  > （不填）不修改密码</td>
</tr>
<tr>
<td>姓名:</td>
<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
</tr>

<tr>
<td >邮箱:</td>
<td><input class="easyui-textbox"  name="email"  data-options="width:300,validType:'email'">
</td>
</tr>

<input  name="role" type="hidden" value="1">



</table>
</form>

<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitUserUpdate()">更新</a>
</div>
 <script>
 

 
 
function submitUserUpdate(){
	$('#user-update-f').form('submit', {
	url:'${Domain.base}/manage/user/edit',
	onSubmit: function(){
	     $('#user-update').window('close');
	     $.messager.progress({title:'请稍后',msg:'数据处理中...'});
		
	},
	success:function(html){
	     $.messager.progress('close');
		if(html.length == 0)
		{
		 $('#user-dg').datagrid('reload');
		
		}else
		{
		   $.messager.alert("提示！",html)
		}
		
	}
	});
}

</script>


</div>

</div>
 
    
    
    
    
    
    </body>
    </html>