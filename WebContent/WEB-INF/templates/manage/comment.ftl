    <!DOCTYPE html>
    <html>
  
  <#include "head.ftl">
  
    	
    <body>

    <div style="margin:20px 0;"></div>

    <table id="comment-dg" class="easyui-datagrid" title="菜单列表" 
    data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_comment',
    url:'${Domain.base}/manage/comment/json',
    pagination:true,
    pageSize:20,
    iconCls:'comment',
 
    ">
    <thead>
    <tr>
    <th data-options="field:'ck',checkbox:true"></th>
    <th data-options="field:'id'">ID</th>
    
	
    <th data-options="field:'title',width:200"> 标题</th>
    <th data-options="field:'menuName',width:200">分类</th>
  
     <th data-options="field:'message',width:200,hidden:true">内容</th>
    <th data-options="field:'count',width:300">访问量</th>
     <th data-options="field:'time',width:130,align:'center',
			formatter: function(value,row,index){
			 var date = new Date(value);
			 return format(date);	
			}">时间</th>

 

    </tr>
    </thead>
     
   
    </table>
    <script type="text/javascript">
    
    

		

   function format(time){
 

	var year = time.getFullYear();
	var month = time.getMonth()+1;
	month = month<10?'0'+month:month;
	var date = time.getDate();
     var   hour= time.getHours();
    
   	return year+"-"+month+"-"+date+" "+hour+":"+time.getMinutes()+":"+time.getSeconds();
 
 }		
	


  function addComment(){ 
	$('#comment-add').dialog('open');
   }
    
      function editCommentId()
     {
       var row=$('#comment-dg').datagrid('getSelected');
      if(row==null)
      {
          $.messager.alert("提示！","请选择需要修改的数据！")
      }else
      {
      	 
		 $('#comment-update').window({title:row['title']+"-详情"}).dialog('open');         ueditor.html(row['message']);
		 	
		 $('#comment-update-f').form('load',row);
		  
		 
        
      }
     }
    
function deleteCommentId()
{
				var rows=$('#comment-dg').datagrid('getSelections');
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
									 $.get("${Domain.base}/manage/comment/delete", { id:sid  } ,
								     function(data){
								         $('#comment-dg').datagrid('reload');
								     });
						        
									}
								});
			      	 
			   
			      }
				
		}  
    
    
    
 
		
	
    
    </script>
    

     
<div  id="toolbar_comment" style="padding:2px 5px;">

<a href="javascript:addComment()" class="easyui-linkbutton" iconCls="comment_add" > 添加 </a> 
 &nbsp;|&nbsp;
 <a href="javascript:editCommentId()" class="easyui-linkbutton" iconCls="comment_edit" > 编辑 </a> 
 &nbsp;||&nbsp;
 <a href="javascript:deleteCommentId()" class="easyui-linkbutton" iconCls="comment_delete" > 删除 </a> 
</div>
    
   
  
 
 <!-- 添加-->
   
    
<div id="comment-add" class="easyui-window" title="添加信息" data-options="iconCls:'comment_add',closed:true" style="width:900px;padding:10px;">

<div class="easyui-panel"  >

<form id="comment-add-f" method="post" >
<table cellpadding="5">
<tr>
<td>标题:</td>
<td><input class="easyui-textbox" type="text" name="title" style="width:280px;"  data-options="required:true"></td>
</tr>
<tr>
<td>分类:</td>
<td><input  class="easyui-combobox" name="menu"  data-options="valueField:'id',textField:'name',url:'${Domain.base}/manage/comment/menujson'">
     如果为顶级，就不需要选择！</td>
</tr>
<tr>
<td>内容:</td>
<td><textarea   id="msg" style="width:700px;height:280px;"></textarea></td>
</tr>

<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('#msg', {
					uploadJson : '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true,
					urlType:'domain',
					items :[
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
				
			});
		</script> 




</table>
</form>
<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormCommontAdd()">保存</a>

 <script>
function submitFormCommontAdd(){

	$('#comment-add-f').form('submit', {
	url:'${Domain.base}/manage/comment/add',
	onSubmit: function(param){
		param.message = editor.html();
		// do some check
		// return false to prevent submit;
	},
	success:function(data){
	
		$('#comment-add').window('close');
		$('#comment-dg').datagrid('reload');
		
	}
	});
}

</script>

</div>
</div>


</div>   
   


<div id="comment-update" class="easyui-window"  data-options="iconCls:'comment_edit',closed:true" style="width:900px;padding:10px;">

<div class="easyui-panel"  >
<form id="comment-update-f" method="post" >
<input  name="id" type="hidden">
<table cellpadding="5">

<tr>
<td>标题:</td>
<td><input class="easyui-textbox" type="text" name="title" style="width:280px;"  data-options="required:true"></td>
</tr>
<tr>
<td>分类:</td>
<td><input  class="easyui-combobox" name="menu"  data-options="valueField:'id',textField:'name',url:'${Domain.base}/manage/comment/menujson'">
     如果为顶级，就不需要选择！</td>
</tr>
<tr>
<td>内容:</td>
<td><textarea   id="umsg" style="width:700px;height:280px;"></textarea></td>
</tr>

<script>
			var ueditor;
			KindEditor.ready(function(K) {
				ueditor = K.create('#umsg', {
					uploadJson : '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
					fileManagerJson : '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
					allowFileManager : true,
					urlType:'domain',
					items :[
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
				
			});
		</script> 



</table>
</form>

<div style="text-align:center;padding:5px">
<a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitCommentUpdate()">更新</a>
</div>
 <script>
 

 
 
function submitCommentUpdate(){
	$('#comment-update-f').form('submit', {
	url:'${Domain.base}/manage/comment/edit',
	onSubmit: function(param){
         param.message = ueditor.html();
	     $('#comment-update').window('close');
	     $.messager.progress({title:'请稍后',msg:'数据处理中...'});
		
	},
	success:function(html){
	     $.messager.progress('close');
		if(html.length == 0)
		{
		 $('#comment-dg').datagrid('reload');
		
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
    
    
        

		 
    