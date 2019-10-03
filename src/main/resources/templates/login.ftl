<#import "common/auth.ftl" as auth>

<@auth.auth "/login", "Login page", "/registration", "Register now", "Sign In">
<#if Session?? && Session.SPRING_SECURITY_LAST_EXEPTION??>
    <div class="alert alert-danger">
        ${Session.SPRING_SECURITY_LAST_EXEPTION.message}
    </div>
</#if>
</@auth.auth>