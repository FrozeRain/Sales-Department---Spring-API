<#macro editOrder>
    <div class="row">
        <h1>Order Filter by Name/Company</h1>
    </div>
    <div class="row mt-3">
        <a href="/main">Back</a>
    </div>
    <div class="row mt-3">
        <form class="form-inline" action="/edit/order" method="get">
            <input  class="form-control" type="text" name="filter" placeholder="Search" value="${filter}"/>
            <button class="btn btn-primary ml-2" type="submit">Browse</button>
        </form>
    </div>
    <div class="row mt-3">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">
                    Id
                </th>
                <th scope="col">
                    Name/Company
                </th>
                <th scope="col">
                    Date
                </th>
                <th scope="col">
                    Price
                </th>
                <th scope="col">
                </th>
                <th scope="col">
                </th>
            </tr>
            </thead>
            <tbody>
            <#list orders as or>
                <tr>
                    <th scope="row">${or.id}</th>
                    <td>${or.clientFullName}</td>
                    <td>${or.date}</td>
                    <td>${or.price}</td>
                    <td>
                        <form method="get" action="/edit/order/update">
                            <button class="btn btn-primary" type="submit" name="id"
                                    value="${or.id}">Edit
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="get" action="/edit/order/delete">
                            <button class="btn btn-primary" style="background-color: red; border: brown" type="submit"
                                    name="id"
                                    value="${or.id}">
                                X
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</#macro>

<#macro editClient>
    <div class="row">
        <h1>Client Filter by Name/Company</h1>
    </div>
    <div class="row mt-3">
        <a href="/main">Back</a>
    </div>
    <div class="row mt-3">
        <form class="form-inline" action="/edit/client" method="get">
            <input class="form-control" type="text" name="filter" placeholder="Search" value="${filter}"/>
            <button class="btn btn-primary ml-2" type="submit">Browse</button>
        </form>
    </div>
    <div class="row mt-3">
        <table class="table">
            <thead class="thead-dark">
            <tr>
                <th scope="col">
                    Id
                </th>
                <th scope="col">
                    Name/Company
                </th>
                <th scope="col">
                    Phone number
                </th>
                <th scope="col">

                </th>
            </tr>
            </thead>
            <tbody>
            <#list clients as cl>
                <tr>
                    <th scope="row">${cl.id}</th>
                    <td>${cl.name}</td>
                    <td>${cl.number}</td>
                    <td>
                        <form action="/edit/client/update" method="get">
                            <button class="btn btn-primary" type="submit" name="id"
                                    value="${cl.id}">Edit
                            </button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>
</#macro>