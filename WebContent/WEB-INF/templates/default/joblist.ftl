<#include "header.ftl">

<!-- 招聘 -->
<div class="wrapper col4" xmlns="http://www.w3.org/1999/html">
    <div id="container" class="clear">
        <div id="joinourteam" class="clear">
            <!-- 职位名称 -->

            <div class="jobtitle">
                <h2 class="title" onclick="clickChooseLiuchengJob()">JOIN US</h2>
                <ul>
                <#list list as item>
                    <li onclick="clickChooseItemJob('${item.title}')">${item.title}</li>
                </#list>
                </ul>
            </div>
            <!-- 新闻动态 -->
            <div class="content">
                <p id="joinourteam_content" class="projectdescription">
                    备注：</br>
                    1、您可以通过在线填写简历来申请您应聘的职位；</br>
                    2、您也可以将简历发送至邮箱：junyanwenhua@sina.com，邮件主题请标明申请的职位名称。</br>
                    温馨提示：发送邮件时请将#换成@</br>
                    <img src="${Domain.base}/images/jobsliucheng.png"></br>
                </p>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function clickChooseItemJob(item) {
        alert(item);
//        $("#joinourteam_content").html(desccipiton);
    }

    function clickChooseLiuchengJob() {
        var html = "备注：</br>" + "1、您可以通过在线填写简历来申请您应聘的职位；</br>" +
                "2、您也可以将简历发送至邮箱：junyanwenhua@sina.com，邮件主题请标明申请的职位名称。</br>" +
                "温馨提示：发送邮件时请将#换成@</br>" + "<img src='${Domain.base}/images/jobsliucheng.png'></br>";
        $("#joinourteam_content").html(html);
    }
</script>
<#include "footer.ftl">