<#import "common/default.ftl" as def>

<@def.page>
    <table>
        <tr>
            <td style="horiz-align: left">
                <div>
                    Add new client:
                </div>
                <form method="post">
                    <input type="text" name="name" placeholder="FullName/Company"/>
                    <input type="text" name="number" placeholder="Phone Number"/>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <button type="submit">Add</button>
                </form>
                <div>
                    Add new Order:
                </div>
                <form method="post" action="/add">
                    <select name="select">
                        <#list clientSel as cS>
                            <option value="${cS.id}">${cS.name}</option>
                        </#list>
                    </select>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="number" step="0.01" name="cost" placeholder="Price"/>
                    <button type="submit">Add</button>
                </form>
            </td>
            <td style="horiz-align: right; vertical-align: top">
                <form action="/logout" method="post">
                    <input type="submit" value="Sign Out"/>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td style="horiz-align: right">
                <form action="/edit/client" method="get">
                    <button type="submit">Edit</button>
                </form>
            </td>
            <td style="horiz-align: right">
                <form action="/edit/order" method="get">
                    <button type="submit">Edit</button>
                </form>
                <!--<a href="/orderFilter?key=">Edit Orders list</a>/!-->
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <th style="vertical-align: top">
                <div>
                    Clients list
                </div>
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
                    </tr>
                    <#list clients as clients>
                    <tr>
                        <td>${clients.id}</td>
                        <td>${clients.name}</td>
                        <td>${clients.number}</td>
                    </tr>
                    </#list>
                </table>
            </th>
            <th style="vertical-align: top">
                <div>
                    Orders list
                </div>
                <table>
                    <tr>
                        <th>
                            Id
                        </th>
                        <th>
                            Name/Company
                        </th>
                        <th>
                            Date of Order
                        </th>
                        <th>
                            Price
                        </th>
                    </tr>
                    <#list orders as orders>
                    <tr>
                        <td>${orders.id}</td>
                        <td>${orders.clientFullName}</td>
                        <td>${orders.date}</td>
                        <td>${orders.price}</td>
                    </tr>
                    </#list>
                </table>
            </th>
        </tr>
    </table>
</@def.page>

