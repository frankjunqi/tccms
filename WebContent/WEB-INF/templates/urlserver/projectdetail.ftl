<#include "searchheadermenu.ftl">
<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><b>TC</b>PRO -- 项目详情</a>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
</header>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="container">
        <!-- Main content -->
        <section class="content">
            <div class="box box-warning">
                <div class="box-header with-border">
                    <h3 class="box-title">Project Detail</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="interceptoradd" role="form">
                        <div class="form-group">
                            <label>Project Id</label>
                            <input name="id" type="text" class="form-control" value="${project.id}"
                                   placeholder="Enter ..." readonly></input>
                        </div>
                        <!-- text input -->
                        <div class="form-group">
                            <label>Project Text</label>
                            <input name="projectname" type="text" class="form-control" placeholder="Enter ..."
                                   value="${project.projectname}"></input>
                        </div>

                        <div class="form-group">
                            <label>projectremark Textarea</label>
                        <textarea name="projectremark" class="form-control" rows="8"
                                  placeholder="Enter ...">${project.projectremark}</textarea>
                        </div>
                    </form>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<!-- /.content-wrapper -->
<#include "searchfootermenu.ftl">