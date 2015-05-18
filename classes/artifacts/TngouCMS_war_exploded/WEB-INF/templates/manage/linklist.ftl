    <!DOCTYPE html>
    <html>
  
  <#include "head.ftl">
  
    	
    <body>

    <div style="margin:20px 0;"></div>

    <table id="link-dg" class="easyui-datagrid" title="友情列表" 
    data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_link',
    url:'${Domain.base}/manage/link/json',
    pagination:true,
    pageSize:20,
    iconCls:'link',
 
    ">
    <thead>
    <tr>
    <th data-options="field:'ck',checkbox:true"></th>
    <th data-options="field:'id'">ID</th>
    
	
    
     <th data-options="field:'name',width:200">姓名</th>
    <th data-options="field:'url',width:300">友情链接</th>
     <th data-options="field:'seq'">排序</th>

 

    </tr>
    </thead>
     
   
    </table>
    <script type="text/javascript">
    
    

		
		
	


  function addLink(){ 
	$('#link-add').dialog('open');
   }
    
      function editLinkId()
     {
       var row=$('#link-dg').datagrid('getSelected');
      if(row==null)
      {
          $.messager.alert("提示！","请选择需要修改的数据！")
      }else
      {
      	 
		 $('#link-update').window({title:row['name']+"-详情"}).dialog('open');		
		 $('#link-update-f').form('load',row);
		  
		 
        
      }
     }
    
function deleteLinkId()
{
				var rows=$('#link-dg').datagrid('getSelections');
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
									 $.get("${Domain.base}/manage/link/delete", { id:sid  } ,
								     function(data){
								         $('#link-dg').datagrid('reload');
								     });
						        
									}
								});
			      	 
			   
			      }
				
		}  
    
    </script>
    
  

     
<div  id="toolbar_link" style="padding:2px 5px;">

<a href="javascript:addLink()" class="easyui-linkbutton" iconCls="link_add" > 添加 </a> 
 &nbsp;|&nbsp;
 <a href="javascript:editLinkId()" class="easyui-linkbutton" iconCls="link_edit" > 编辑 </a> 
 &nbsp;||&nbsp;
 <a href="javascript:deleteLinkId()" class="easyui-linkbutton" iconCls="link_delete" > 删除 </a> 
</div>
    
   
  
 
 <!-- 添加-->
   
    
<div id="link-add" class="easyui-window" title="添加友情链接" data-options="iconCls:'link_add',closed:true" style="width:500px;padding:10px;">

<div class="easyui-panel"  >

<form id="link-add-f" method="post" >
<table cellpadding="5">
<tr>
<td>名称:</td>
<td><input class="easyui-textbox"  name="name" data-options="required:true"></td>
</tr>

<tr>
<td>链接:</td>
<td><input class="easyui-textbox"  name="url" data-options="required:true,validType:'url'" style="width:300px;"></td>
</tr>
<tr>
<td>排序:</td>
<td><input name="seq" class="easyui-numberspinner" style="width:80px;" 
 data-options="min:0,max:255,editable:true,value:1"></td>
</tr>



</table>
</form>
<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormLinkAdd()">保存</a>

 <script>
function submitFormLinkAdd(){
	$('#link-add-f').form('submit', {
	url:'${Domain.base}/manage/link/add',
	onSubmit: function(){
		// do some check
		// return false to prevent submit;
	},
	success:function(data){
	
		$('#link-add').window('close');
		$('#link-dg').datagrid('reload');
		
	}
	});
}

</script>

</div>
</div>


</div>   
   


<div id="link-update" class="easyui-window"  data-options="iconCls:'link_edit',closed:true" style="width:620px;padding:10px;">

<div class="easyui-panel"  >
<form id="link-update-f" method="post" >
<input  name="id" type="hidden">
<table cellpadding="5">

<tr>
<td>名称:</td>
<td><input class="easyui-textbox"  name="name" data-options="required:true"></td>
</tr>

<tr>
<td>链接:</td>
<td><input class="easyui-textbox"  name="url" data-options="required:true,validType:'url'" style="width:300px;"></td>
</tr>
<tr>
<td>排序:</td>
<td><input name="seq" class="easyui-numberspinner" style="width:80px;" 
 data-options="min:0,max:255,editable:true,value:1"></td>
</tr>



</table>
</form>

<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitLinkUpdate()">更新</a>
</div>
 <script>
 

 
 
function submitLinkUpdate(){
	$('#link-update-f').form('submit', {
	url:'${Domain.base}/manage/link/edit',
	onSubmit: function(){
	     $('#link-update').window('close');
	     $.messager.progress({title:'请稍后',msg:'数据处理中...'});
		
	},
	success:function(html){
	     $.messager.progress('close');
		if(html.length == 0)
		{
		 $('#link-dg').datagrid('reload');
		
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