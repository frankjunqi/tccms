<#include "header.ftl">

<div id="main_bg">
    <div id="container" class="clear">
        <h1>出版案例</h1>

        <div class="gallery clear">
            <ul>
            <#list page.list as item>
                <li><a href="${Domain.base}/products/${item.id}" rel="prettyPhoto[gallery1]"
                       title="Image 1"><img
                        src="${item.Img()}" alt="${item.title}"/></a></li>
            </#list>
            <#include "page.ftl">
            </ul>
            <div class="clear"></div>
        </div>
        <h1>广告案例</h1>

        <div class="gallery clear">
            <ul>
                <!--<li class="first"><img src="${Domain.base}/images/demo/gallery/572x330.gif" alt=""/></li>-->
                <li><a href="${Domain.base}/images/demo/piecemaker/1.jpg" rel="prettyPhoto[gallery1]"
                       title="Image 1"><img
                        src="${Domain.base}/images/demo/piecemaker/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/5.jpg" rel="prettyPhoto[gallery1]" title="Image 2"><img
                        src="${Domain.base}/images/pics/5.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/4.jpg" rel="prettyPhoto[gallery1]" title="Image 3"><img
                        src="${Domain.base}/images/pics/4.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 5"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 6"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 7"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 8"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 9"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]"
                                     title="Image 10"><img src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 11"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 12"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 13"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 14"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
            </ul>
        </div>
        <h1>摄影案例</h1>

        <div class="gallery clear">
            <ul>
                <!--<li class="first"><img src="${Domain.base}/images/demo/gallery/572x330.gif" alt=""/></li>-->
                <li><a href="${Domain.base}/images/demo/piecemaker/1.jpg" rel="prettyPhoto[gallery1]"
                       title="Image 1"><img
                        src="${Domain.base}/images/demo/piecemaker/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/5.jpg" rel="prettyPhoto[gallery1]" title="Image 2"><img
                        src="${Domain.base}/images/pics/5.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/4.jpg" rel="prettyPhoto[gallery1]" title="Image 3"><img
                        src="${Domain.base}/images/pics/4.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 5"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 6"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 7"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 8"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 9"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]"
                                     title="Image 10"><img src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 11"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 12"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 13"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 14"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
            </ul>
        </div>
        <h1>传播案例</h1>

        <div class="gallery clear">
            <ul>
                <!--<li class="first"><img src="${Domain.base}/images/demo/gallery/572x330.gif" alt=""/></li>-->
                <li><a href="${Domain.base}/images/demo/piecemaker/1.jpg" rel="prettyPhoto[gallery1]"
                       title="Image 1"><img
                        src="${Domain.base}/images/demo/piecemaker/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/5.jpg" rel="prettyPhoto[gallery1]" title="Image 2"><img
                        src="${Domain.base}/images/pics/5.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/4.jpg" rel="prettyPhoto[gallery1]" title="Image 3"><img
                        src="${Domain.base}/images/pics/4.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/1.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/1.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/2.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/2.jpg" alt=""/></a></li>
                <li><a href="${Domain.base}/images/pics/3.jpg" rel="prettyPhoto[gallery1]" title="Image 4"><img
                        src="${Domain.base}/images/pics/3.jpg" alt=""/></a></li>
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 5"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 6"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 7"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 8"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 9"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
                <!--<li class="first"><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]"
                                     title="Image 10"><img src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 11"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 12"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 13"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>
                <li><a href="${Domain.base}/images/demo/gallery/572x330.gif" rel="prettyPhoto[gallery1]" title="Image 14"><img
                        src="${Domain.base}/images/demo/gallery/174x150.gif" alt=""/></a></li>-->
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
<#include "footer.ftl">