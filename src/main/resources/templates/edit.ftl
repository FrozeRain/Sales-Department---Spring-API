<#import "common/default.ftl" as def>
<#import "common/editTemplate.ftl" as edit>

<@def.page>
    <#if isOrder>
        <@edit.editOrder/>
    <#else>
        <@edit.editClient/>
    </#if>
</@def.page>