<#macro updateOrder cS sel>
    <form action="/edit/order" method="get">
        <button type="submit">Back</button>
    </form>
    <br>
    <fieldset style="width: min-content">
        <legend>
            Update Order:
        </legend>
        <form action="/edit/order/updateSubmit" method="post">
            <table style="width: min-content">
                <tr>
                    <td style="text-align: right">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        Name/Company
                    </td>
                    <td style="text-align: left">
                        <select name="selId">
                            <#list cS as cS>
                                <option value="${cS.id}">${cS.name}</option>
                            </#list>
                            <option value="${sel.clientFullId}" selected>${sel.clientFullName}</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        Date:
                    </td>
                    <td style="text-align: left">
                        <input type="date" name="date" value="${sel.date}">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        Price:
                    </td>
                    <td>
                        <input type="number" step="0.01" name="price"
                               value="${sel.price?string["#########.00"]?replace(",", ".")}">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button type="submit" name="linkId" value="${sel.id}">Save</button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
</#macro>

<#macro updateClient client>
    <form action="/edit/client" method="get">
        <button type="submit">Back</button>
    </form>
    <br>
    <fieldset style="width: min-content">
        <legend>
            Update Client:
        </legend>
        <form action="/edit/client/updateSubmit" method="post">
            <table style="width: min-content">
                <tr>
                    <td style="text-align: right">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        Name/Company
                    </td>
                    <td style="text-align: left">
                        <input type="text" name="name" value="${client.name}">
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        Number:
                    </td>
                    <td style="text-align: left">
                        <input type="text" name="date" value="${client.number}">
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button type="submit" name="selId" value="${client.id}">Save</button>
                    </td>
                </tr>
            </table>
        </form>
    </fieldset>
</#macro>