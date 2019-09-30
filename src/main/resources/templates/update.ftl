<#import "common/default.ftl" as def>
<#import "common/updateTemplate.ftl" as update>
<#setting date_format="yyyy-MM-dd">
<#--<#setting number_format="#########.00">-->

<@def.page>
    <#if isOrder>
        <@update.updateOrder clientSel, sel/>
    <#else>
        <@update.updateClient client/>
    </#if>
</@def.page>

