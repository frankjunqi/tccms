    <!DOCTYPE html>
    <html>
  
  <#include "head.ftl">
  
    	
    <body>

    <div style="margin:20px 0;"></div>

    <table id="info-dg" class="easyui-datagrid" title="网站配置" 
    data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_info',
    url:'${Domain.base}/manage/info/json',
    pagination:true,
    pageSize:20,
    iconCls:'cog',
 
    ">
    <thead>
    <tr>
    <th data-options="field:'ck',checkbox:true"></th>
    <th data-options="field:'id'">ID</th>
    
	
    <th data-options="field:'name',width:200">名称</th>
     <th data-options="field:'icp',width:100">ICP备案</th>
    <th data-options="field:'tel',width:100">电话</th>
    <th data-options="field:'fax',width:100">传真</th>
   <th data-options="field:'email',width:100">邮箱</th>
   <th data-options="field:'address',width:100">地址</th>
 

    </tr>
    </thead>
     
   
    </table>
    <script type="text/javascript">
    
    

		
		
	


  
    
      function editUserId()
     {
       var row=$('#info-dg').datagrid('getSelected');
      if(row==null)
      {
          $.messager.alert("提示！","请选择需要修改的数据！")
      }else
      {
      	 
		 $('#info-update').window({title:row['name']+"-详情"}).dialog('open');
		  logo.html(row['logo']);
		   img.html(row['img']);		
		 $('#info-update-f').form('load',row);
		  
		 
        
      }
     }
    

    
    </script>
    
  

     
<div  id="toolbar_info" style="padding:2px 5px;">

  &nbsp;&nbsp;|&nbsp;
 <a href="javascript:editUserId()" class="easyui-linkbutton" iconCls="cog_edit" > 编辑 </a> 

</div>
    
   
  
 
  
   


<div id="info-update" class="easyui-window"  data-options="iconCls:'cog_edit',closed:true" style="width:620px;padding:10px;">

<div class="easyui-panel"  >
<form id="info-update-f" method="post" >
<input  name="id" type="hidden">
<table cellpadding="5">

<tr>
<td>名称:</td>
<td><input class="easyui-textbox" type="text" name="name" data-options="required:true"></td>
</tr>

<tr>
<td>ICP备案:</td>
<td><input class="easyui-textbox" type="text" name="icp" data-options="required:true"></td>
</tr>
<tr>
<td >电话:</td>
<td><input class="easyui-textbox"  name="tel"  data-options="width:300">
</td>
</tr>
<tr>
<td >传真:</td>
<td><input class="easyui-textbox"  name="fax"  data-options="width:300">
</td>
</tr>
<tr>
<td >邮箱:</td>
<td><input class="easyui-textbox"  name="email"  data-options="width:300,validType:'email'">
</td>
</tr>
<tr>
<td >地址:</td>
<td><input class="easyui-textbox"  name="address"  data-options="width:300">
</td>
</tr>
<tr>
<td >LOGO:</td>
<td><textarea   id="logo" style="width:400px;height:80px;"></textarea>
</td>
</tr>

<tr>
<td >图片:</td>
<td><textarea   id="img" style="width:400px;height:80px;"></textarea>
</td>
</tr>
<script>
			var logo;
			KindEditor.ready(function(K) {
				logo = K.create('#logo', {
					uploadJson : '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true,
					urlType:'domain',
					minWidth:'400px',
					minHeight:'50x',
					items :[ 'image']
				});
				
			});
           var img;
			KindEditor.ready(function(K) {
				img = K.create('#img', {
					uploadJson : '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true,
					urlType:'domain',
					minWidth:'400px',
					minHeight:'50x',
					items :[
						'image']
				});
				
			});
		</script> 

</table>
</form>

<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitInfoUpdate()">更新</a>
</div>
 <script>
 

 
 
function submitInfoUpdate(){
	$('#info-update-f').form('submit', {
	url:'${Domain.base}/manage/info/edit',
	onSubmit: function(param){
	    param.logo = logo.html();
	    param.img = img.html();
	     $('#info-update').window('close');
	     $.messager.progress({title:'请稍后',msg:'数据处理中...'});
		
	},
	success:function(html){
	     $.messager.progress('close');
		if(html.length == 0)
		{
		 $('#info-dg').datagrid('reload');
		
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