<#include "header.ftl">

<!-- 文化&新闻动态 -->
<div class="wrapper col4">
    <div id="container" class="clear">
        <div id="compayprofiles" class="clear">
            <!-- 文化动态 -->
            <div class="company_content">
                <h2>公司信息&团队${about.address}</h2>

                <div id="companyprofile_hpage_slider">
                    <!-- 代码动态添加 -->
                    <div class="item"><a href="12"><img style="width: 940px; height: 320px;"
                                                        src="${Domain.base}/images/pics/1.jpg"/></a></div>
                    <div class="item"><a href="12"><img style="width: 940px; height: 320px;"
                                                        src="${Domain.base}/images/pics/1.jpg"/></a></div>
                </div>
                <!-- 代码根据id动态修改显示数据 -->
                <h2 id="cluture_title">Project Name Goes Here${about.address}</h2>

                <p id="cluture_type"></p>

                <p id="cluture_desc"></p>

                <!--<p class="readmore"><a id="cluture_url" href="" target="_blank"><strong>查看详情 &raquo;</strong></a></p>-->
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var flashvars = {};
            flashvars.cssSource = "${Domain.base}/scripts/piecemaker/piecemaker.css";
            flashvars.xmlSource = "${Domain.base}/scripts/piecemaker/piecemaker.xml";
            var params = {};
            params.play = "false";
            params.menu = "false";
            params.scale = "showall";
            params.wmode = "transparent";
            params.allowfullscreen = "true";
            params.allowscriptaccess = "sameDomain";
            params.allownetworking = "all";
            swfobject.embedSWF('${Domain.base}/scripts/piecemaker/piecemaker.swf', 'piecemaker', '960', '430', '10', null, flashvars, params, null);
            initCompanyProfileBanner();
        });
        /**
         * 公司简介的banner
         * @param newsList
         */
        function initCompanyProfileBanner() {
            $('#companyprofile_hpage_slider').after('<div id="fsn"><ul id="fs_pagination">').cycle({
                timeout: 1000, // milliseconds between slide transitions (0 to disable auto advance)
                fx: 'fade', // choose a transition type, ex: fade, scrollUp, shuffle, etc...
                pager: '#fs_pagination', // selector for element to use as pager container
                pause: 1, // true to enable "pause on hover"
                after: function (currSlideElement, nextSlideElement, options, forwardFlag) {
                    // banner滑动事件index
                    //alert('s' + newsList[options.currSlide]);
                    // 根据id的显示数据
                    alert("hello world.");
                    $('#cluture_title').text(${about.address});
                    //$('#cluture_type').html("<strong>类型:</strong>" + newsList[options.currSlide].typelx);
                    //$('#cluture_desc').text(newsList[options.currSlide].desc);
                    // 获取公司简介信息
                    // clickShowCompanyProfile();
                    // 赋值a标签href
                    //$('#cluture_url').attr('href', (newsList[options.currSlide].newsId));
                },
                pauseOnPagerHover: 0 // true to pause when hovering over pager link
            });
        }
        ;
    </script>
</div>
<#include "footer.ftl">