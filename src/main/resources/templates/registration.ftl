<#import "common/auth.ftl" as auth>

<@auth.auth "/registration", "Add new User", "/login", "Back", "Register">
    <h3 style="text-align: center; color: brown">
        ${message}
    </h3>
</@auth.auth>

