<!DOCTYPE html>
<html>

<#include "head.ftl">


<body>

<div style="margin:20px 0;"></div>

<table id="link-dg" class="easyui-datagrid" title="招聘信息列表"
       data-options="rownumbers:true,method:'get',
    toolbar:'#toolbar_link',
    url:'${Domain.base}/manage/jobList/json',
    pagination:true,
    pageSize:20,
    iconCls:'link',

    ">
    <thead>
    <tr>
        <th data-options="field:'ck',checkbox:true"></th>
        <th data-options="field:'id'">ID</th>


        <th data-options="field:'title',width:200">招聘职位</th>
        <th data-options="field:'des',width:760">缩略信息</th>


    </tr>
    </thead>


</table>
<script type="text/javascript">


    function addLink() {
        $('#link-add').dialog('open');
    }

    function editLinkId() {
        var row = $('#link-dg').datagrid('getSelected');
        if (row == null) {
            $.messager.alert("提示！", "请选择需要修改的数据！")
        } else {

            $('#link-update').window({title: row['title'] + "-详情"}).dialog('open');
            // 显示信息在编辑框中
            ueditor.html(row['desccipiton']);
            $('#link-update-f').form('load', row);


        }
    }

    function deleteLinkId() {
        var rows = $('#link-dg').datagrid('getSelections');
        if (rows.length == 0) {
            $.messager.alert("提示！", "请选择需要删除的数据！");

        } else {
            var sid = new Array()   // 封装成数组
            $.each(rows, function (i, item) {
                sid[i] = item['id'];
            });
            $.messager.confirm('提示！', '确认要删除数据ID：' + sid, function (r) {
                if (r) {
                    $.get("${Domain.base}/manage/jobList/delete", {id: sid},
                            function (data) {
                                $('#link-dg').datagrid('reload');
                            });

                }
            });


        }

    }

</script>


<div id="toolbar_link" style="padding:2px 5px;">

    <a href="javascript:addLink()" class="easyui-linkbutton" iconCls="link_add"> 添加 </a>
    &nbsp;|&nbsp;
    <a href="javascript:editLinkId()" class="easyui-linkbutton" iconCls="link_edit"> 编辑 </a>
    &nbsp;|&nbsp;
    <a href="javascript:deleteLinkId()" class="easyui-linkbutton" iconCls="link_delete"> 删除 </a>
</div>


<!-- 添加-->


<div id="link-add" class="easyui-window" title="添加招聘信息" data-options="iconCls:'link_add',closed:true"
     style="width:900px;padding:10px;">

    <div class="easyui-panel">

        <form id="link-add-f" method="post">
            <table cellpadding="5">
                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" name="title" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" name="des" data-options="required:true"></td>
                </tr>

                <tr>
                    <td>详细信息:
                    </td><#--class="easyui-textbox" data-options="required:true",validType:'url'-->
                    <td><textarea id="msg"
                                  style="width:700px;height:280px;"></textarea></td>
                </tr>
                <script>
                    var editor;
                    KindEditor.ready(function (K) {
                        editor = K.create('#msg', {
                            uploadJson: '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
                            fileManagerJson: '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
                            allowFileManager: true,
                            urlType: 'domain',
                            items: [
                                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                        });

                    });
                </script>

            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitFormLinkAdd()">保存</a>

            <script>
                function submitFormLinkAdd() {
                    $('#link-add-f').form('submit', {
                        url: '${Domain.base}/manage/jobList/add',
                        onSubmit: function (param) {
                            param.desccipiton = editor.html();
                            $.messager.alert("提示！", editor.html());
                            // do some check
                            // return false to prevent submit;
                        },
                        success: function (data) {

                            $('#link-add').window('close');
                            $('#link-dg').datagrid('reload');

                        }
                    });
                }

            </script>

        </div>
    </div>


</div>


<div id="link-update" class="easyui-window" data-options="iconCls:'link_edit',closed:true"
     style="width:900px;padding:10px;">

    <div class="easyui-panel">
        <form id="link-update-f" method="post">
            <input name="id" type="hidden">
            <table cellpadding="5">

                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" name="title" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>名称:</td>
                    <td><input class="easyui-textbox" name="des" data-options="required:true"></td>
                </tr>

                <tr>
                    <td>详细信息:
                    </td><#--class="easyui-textbox" name="desccipiton" data-options="required:true",validType:'url'-->
                    <td><textarea id="umsg"
                                  style="width:700px;height:280px;"></textarea></td>
                </tr>


            </table>
        </form>

        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitLinkUpdate()">更新</a>
        </div>
        <script>


            function submitLinkUpdate() {
                $('#link-update-f').form('submit', {
                    url: '${Domain.base}/manage/jobList/edit',
                    onSubmit: function (param) {
                        param.desccipiton = ueditor.html();
                        $('#link-update').window('close');
                        $.messager.progress({title: '请稍后', msg: '数据处理中...'});

                    },
                    success: function (html) {
                        $.messager.progress('close');
                        if (html.length == 0) {
                            $('#link-dg').datagrid('reload');

                        } else {
                            $.messager.alert("提示！", html)
                        }

                    }
                });
            }

        </script>
        <script>
            var ueditor;
            KindEditor.ready(function (K) {
                ueditor = K.create('#umsg', {
                    uploadJson: '${Domain.base}/common/kindeditor/jsp/upload_json.jsp',
                    fileManagerJson: '${Domain.base}/common/kindeditor/jsp/file_manager_json.jsp',
                    allowFileManager: true,
                    urlType: 'domain',
                    items: [
                        'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                        'insertunorderedlist', '|', 'emoticons', 'image', 'link']
                });

            });
        </script>


    </div>

</div>


</body>
</html>