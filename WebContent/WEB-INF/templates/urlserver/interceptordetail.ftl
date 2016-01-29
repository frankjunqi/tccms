<#include "searchheadermenu.ftl">
<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand"><b>TC</b>PRO -- 拦截器详情</a>
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
                    <h3 class="box-title">Interceptor detail</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <form id="interceptoradd" role="form">
                        <div class="form-group">
                            <label>InterceptorName Id</label>
                            <input name="id" type="text" class="form-control" value="${interceptor.id}"
                                   placeholder="Enter ..." readonly></input>
                        </div>
                        <!-- text input -->
                        <div class="form-group">
                            <label>InterceptorName Text</label>
                            <input name="interceptorname" type="text" class="form-control" placeholder="Enter ..."
                                   value="${interceptor.interceptorname}"></input>
                        </div>

                        <!-- textarea -->
                        <div class="form-group">
                            <label>InterceptorValue Textarea</label>
                        <textarea name="interceptorvalue" class="form-control" rows="3"
                                  placeholder="Enter ...">${interceptor.interceptorvalue}</textarea>
                        </div>
                        <div class="form-group">
                            <label>interceptorremark Textarea</label>
                        <textarea name="interceptorremark" class="form-control" rows="8"
                                  placeholder="Enter ...">${interceptor.interceptorremark}</textarea>
                        </div>

                        <div class="form-group">
                            <label>Interceptor createtime</label>
                            <input name="createtime" type="text" class="form-control" value="${interceptor.createtime!"null"}"
                                   placeholder="Enter ..." readonly></input>
                        </div>
                        <div class="form-group">
                            <label>Interceptor createauthor</label>
                            <input name="createauthor" type="text" class="form-control" value="${interceptor.createauthor!"null"}"
                                   placeholder="Enter ..." readonly></input>
                        </div>

                        <div class="form-group">
                            <label>Interceptor updatetime</label>
                            <input name="updatetime" type="text" class="form-control" value="${interceptor.updatetime!"null"}"
                                   placeholder="Enter ..." readonly></input>
                        </div>
                        <div class="form-group">
                            <label>Interceptor updateauthor</label>
                            <input name="updateauthor" type="text" class="form-control" value="${interceptor.updateauthor!"null"}"
                                   placeholder="Enter ..." readonly></input>
                        </div>



                    </form>
                </div>
                <!-- /.box-body -->
            </div>
        </section>
        <!-- /.content -->
    </div>
</div>
<script>

</script>
<!-- /.content-wrapper -->
<#include "searchfootermenu.ftl">