<#macro editOrder>
    <h1>Order Filter by Name/Company</h1>
    <a href="/main">Back</a><br>
    <form action="/edit/order" method="get">
        <input type="text" name="filter" placeholder="Search" value="${filter}"/>
        <button type="submit">Search</button>
    </form>
    <br>
    <table>
        <tr>
            <th>
                Id
            </th>
            <th>
                Name/Company
            </th>
            <th>
                Date
            </th>
            <th>
                Price
            </th>
            <th>
            </th>
            <th>
            </th>
        </tr>
        <#list orders as or>
        <tr>
            <td>${or.id}</td>
            <td>${or.clientFullName}</td>
            <td>${or.date}</td>
            <td>${or.price}</td>
            <td>
                <form method="get" action="/edit/order/update">
                    <button style="background-color: cornflowerblue; border: cadetblue" type="submit" name="id" value="${or.id}">Edit</button>
                </form>
            </td>
            <td>
                <form method="get" action="/edit/order/delete">
                    <button style="background-color: red; border: brown" type="submit" name="id" value="${or.id}">X</button>
                </form>
            </td>
        </tr>
        </#list>
    </table>
</#macro>

<#macro editClient>
    <h1>Client Filter by Name/Company</h1>
    <a href="/main">Back</a><br>
    <form action="/edit/client" method="get">
        <input type="text" name="filter" placeholder="Search" value="${filter}"/>
        <button type="submit">Search</button>
    </form>
    <br>
    <table>
        <tr>
            <th>
                Id
            </th>
            <th>
                Name/Company
            </th>
            <th>
                Phone number
            </th>
            <th>

            </th>
        </tr>
        <#list clients as cl>
        <tr>
            <td>${cl.id}</td>
            <td>${cl.name}</td>
            <td>${cl.number}</td>
            <td>
                <form action="/edit/client/update" method="get">
                    <button style="background-color: cornflowerblue; border: cadetblue" type="submit" name="id" value="${cl.id}">Edit</button>
                </form>
            </td>
        </tr>
        </#list>
    </table>
</#macro>