<#include "headerleftmenu.ftl">
<link href="${Domain.base}/likedown/dist/css/likedown.min.css" rel="stylesheet">
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content">
        <div class="box box-warning">
            <div class="box-header with-border">
                <h3 class="box-title">Markdown Add</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <form id="projectadd" role="form" method="post"
                      action="${Domain.base}/urlserver/project/addProject">
                    <!-- text input -->

                    <div class="form-group">
                        <label>Projectremark Textarea</label>

                        <div id="wmd-editor" class="wmd-editor live-mode" data-type="likedown">
                            <div id="wmd-button-bar" class="wmd-button-bar"></div>
                            <div class="wmd-input-box">
                                <textarea id="wmd-input" class="wmd-input form-control"></textarea>
                            </div>
                            <div class="wmd-line"></div>
                            <div class="wmd-preview-box">
                                <div id="wmd-preview" class="wmd-preview likedown"></div>
                            </div>
                        </div>
                        <div class="modal fade modal-insert-link">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">插入链接</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i
                                                    class="glyphicon glyphicon-globe"></i></span>
                                            <input id="input-insert-link" type="text" class="col-sm-5 form-control"
                                                   placeholder='http://example.com/'/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                                        <a href="#" class="btn btn-primary action-insert-link"
                                           data-dismiss="modal">插入</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade modal-insert-image">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button>
                                        <h4 class="modal-title">插入图片</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                            <input id="input-insert-image" type="text" class="col-sm-5 form-control"
                                                   placeholder='http://example.com/image.jpg'/>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <a href="#" class="btn btn-default" data-dismiss="modal">取消</a>
                                        <a href="#" class="btn btn-primary action-insert-image"
                                           data-dismiss="modal">插入</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
            <!-- /.box-body -->
        </div>
    </section>
    <!-- /.content -->
</div>
<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/underscore.js/1.8.3/underscore-min.js"></script>
<script src="http://cdn.bootcss.com/raphael/2.1.4/raphael-min.js"></script>
<script src="http://cdn.bootcss.com/js-sequence-diagrams/1.0.6/sequence-diagram-min.js"></script>
<script src="http://cdn.bootcss.com/highlight.js/8.6/highlight.min.js"></script>
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML"></script>
<script src="${Domain.base}/likedown/libs/Markdown.Converter.js"></script>
<script src="${Domain.base}/likedown/libs/Markdown.Editor.js"></script>
<script src="${Domain.base}/likedown/libs/Markdown.Extra.js"></script>
<script src="${Domain.base}/likedown/libs/Markdown.MathJax.js"></script>
<script src="${Domain.base}/likedown/libs/Markdown.Toc.js"></script>
<script src="${Domain.base}/likedown/libs/mathjax.config.js"></script>
<script src="${Domain.base}/likedown/libs/flowchart-1.4.0.js"></script>
<script src="${Domain.base}/likedown/dist/js/likedown.min.js"></script>
<!-- /.content-wrapper -->
<#include "footermenu.ftl">