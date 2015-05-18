
    
<div class="easyui-panel" data-options="region:'west',split:true" style="width:200px;" title="菜单">
<ul id="tree"  class="easyui-tree" data-options="lines: true">
<li data-options="iconCls:'application_side_tree'">
<span ">TngouCMS管理</span>
<ul>
<li data-options="iconCls:'database'" >
<span >数据管理</span>
<ul>
	<li data-options="iconCls:'chart_organisation',url:'${Domain.base}/manage/nav'">
	<span>菜单管理</span>
	</li>
	<li data-options="iconCls:'comments',url:'${Domain.base}/manage/comment'">
	<span>内容管理</span>
	</li>
	<li data-options="iconCls:'link',url:'${Domain.base}/manage/link'">
	<span>友情链接</span>
	</li>
</ul>
</li>
<li data-options="iconCls:'server_connect'">
<span>系统管理</span>
<ul>
<li data-options="iconCls:'user',url:'${Domain.base}/manage/user'">用户信息</li>
<li data-options="iconCls:'cog',url:'${Domain.base}/manage/info'">网站信息</li>

</ul>
</li>




</ul>
</li>
</ul>

<script type="text/javascript">

$('#tree').tree({
	onClick: function(node){
	   var title= node.text;
	   var url=node.url;
	   var iconCls=node.iconCls;
	   if(url!=null)
	   {
	     addTab(title,url,iconCls);
	   }
		
	}
});


   
 
</script>



</div>



    
 