<#include "header.ftl">


<div class="wrapper col4">
    <div id="container" class="clear">
        <h1>新闻动态</h1>
        <!--列表数据-->
        <div id="portfolio">
        <#list page.list as item>
            <ul>
                <li>
                    <div class="imgholder">
                        <img style="width: 230px; height: 160px;" src="${Domain.base}/images/pics/1.jpg" alt=""/>
                    </div>
                    <div class="content">
                        <p class="title">怀初心，再出发/2013“天工奖”典藏集付梓发行${item.time?string("yyyy-MM-dd")}</p>

                        <p class="projectdescription">
                            如果你关注过星巴克，大概还记得07年芮成钢一篇题为《请星巴克从故宫里出去》的博客所引发的新闻事件。不久后星巴克退出故宫，取而代之的是国产咖啡品牌。从某个层面上看，这一事件反映了国人对民族文化以及国产品牌复兴的期待。
                        </p>

                        <p class="readmore"><a
                                href="${Domain.base}/news/${item.id}"><strong>查看详情 &raquo;</strong></a>
                        </p></div>
                </li>
            </ul>
        </#list>
        <#include "page.ftl">
        </div>
        <!-- 页码的设置 -->
    <#--<div class="pagination">
        <ul>
            <li class="prev"><a href="javascript:void(0)">&laquo; 前一页</a></li>
            <li><a href="javascript:void(0)">1</a></li>
            <li><a href="javascript:void(0)">2</a></li>
            <li class="splitter">&hellip;</li>
            <li><a href="javascript:void(0)">6</a></li>
            <li class="current">7</li>
            <li><a href="javascript:void(0)">8</a></li>
            <li><a href="javascript:void(0)">9</a></li>
            <li class="splitter">&hellip;</li>
            <li><a href="javascript:void(0)">14</a></li>
            <li><a href="javascript:void(0)">15</a></li>
            <li class="next"><a href="javascript:void(0)">下一页 &raquo;</a></li>
        </ul>
    </div>-->
        <div class="clear"></div>
    </div>
</div>
<#include "footer.ftl">