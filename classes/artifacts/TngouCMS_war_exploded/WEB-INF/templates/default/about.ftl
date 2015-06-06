<#include "header.ftl">

<div class="wrapper col4">
    <div id="container" class="clear">
        <div id="compayprofiles" class="clear">
            <div class="company_content">
                <h2>${title}</h2>

                <div class="wrapper col3">
                <#--广告图-->
                    <div id="container" class="clear">
                        <div class="home-device"><a class="arrow-left" href="#"></a> <a class="arrow-right"
                                                                                        href="#"></a>

                            <div class="swiper-main">
                                <div class="swiper-container swiper1">
                                    <div class="swiper-wrapper">
                                        <div class="swiper-slide"><img src="${Domain.base}/images/1.jpg"></div>
                                        <div class="swiper-slide"><img src="${Domain.base}/images/1.jpg"></div>
                                        <div class="swiper-slide"><img src="${Domain.base}/images/1.jpg"></div>
                                        <div class="swiper-slide"><img src="${Domain.base}/images/1.jpg"></div>
                                        <div class="swiper-slide">
                                            <div class="content-slide">
                                                <h2 style="margin-top: 0;">触屏手机幻灯片代码</h2>

                                                <p>这里地方的幻灯片是可以自己定义一个内容网页幻灯！</p>
                                            </div>
                                            <div class="content-slide cs-1">
                                                <p style="margin: 0;">触屏手机幻灯片代码.</p>
                                            </div>
                                            <div class="content-slide cs-2">
                                                <p style="margin: 0;">触屏手机幻灯片代码.</p>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pagination pagination1"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!-- 代码根据id动态修改显示数据 -->
                <p id="cluture_desc" style="margin-top: 20px">${description}</p>

            </div>
        </div>
    </div>

</div>
<#include "footer.ftl">