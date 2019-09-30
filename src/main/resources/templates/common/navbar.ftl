<#assign
context = Session.SPRING_SECURITY_CONTEXT??
>

<#if context>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    <#--isAdmin = user.hasAdminRole()-->
    name = user.getUsername()
    >
<#else>
    <#assign
    name = ""
    isAdmin = false
    >
</#if>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Sales Department CMS</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/main">Home</a>
            </li>
        </ul>

        <div class="navbar-text mr-2">${name}</div>
        <form action="/logout" method="post">
            <button class="btn btn-primary" type="submit">Sing Out</button>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        </form>
    </div>
</nav>