<#include "header.ftl">


<!-- 代码 开始 -->
<section class="hashTabber-sandstone-wrapper">
    <ol class="hashTabber-nav hashTabber-sandstone" data-hashtabber-id="dinosaurs"
        data-hashtabber-default="${defaultid}">
    <#list list as item>
        <li data-hashtabber-pair="${item.id}" class="">
            <a href="#${item.id}">${item.title}</a>
        </li>
    </#list>
    </ol>
    <ol class="hashTabber-data hashTabber-sandstone" data-hashtabber-id="dinosaurs">
    <#list list as item>
        <li data-hashtabber-pair="${item.id}" class="">
            <article>
                <h3>${item.title}</h3>

                <p id="joinourteam_content">${item.desccipiton}</p>
            </article>
        </li>
    </#list>
    </ol>
</section>
<script>
    var tabber = new HashTabber();
    tabber.run();

    function clickChooseLiuchengJob() {
        var html = "备注：</br>" + "1、您可以通过在线填写简历来申请您应聘的职位；</br>" +
                "2、您也可以将简历发送至邮箱：junyanwenhua@sina.com，邮件主题请标明申请的职位名称。</br>" +
                "温馨提示：发送邮件时请将#换成@</br>" + "<img src='${Domain.base}/images/jobsliucheng.png'></br>";
        $("#joinourteam_content").html(html);
    }
</script>
<!-- 代码 结束 -->
<#include "footer.ftl">