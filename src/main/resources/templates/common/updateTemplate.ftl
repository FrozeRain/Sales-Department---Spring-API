<#macro updateOrder cS sel>
    <div class="row mt-3">
        <a href="/edit/order">Back</a>
    </div>
    <br>
    <h4>
        Update Order:
    </h4>
    <form action="/edit/order/updateSubmit" method="post">
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="selectName">Name/Company</label>
                <select id="selectName" name="selId" class="form-control">
                    <#if cS??>
                        <#list cS as cS>
                            <option value="${cS.id}">${cS.name}</option>
                        </#list>
                    </#if>
                    <option value="${sel.clientFullId}" selected>${sel.clientFullName}</option>
                </select>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </div>
            <div class="form-group col-md-3">
                <label for="inputDate">Date:</label>
                <input id="inputDate" type="date" name="date" value="${sel.date}" class="form-control">
            </div>
            <div class="form-group col-md-3">
                <label for="inputPrice">Price:</label>
                <input class="form-control" id="inputPrice" type="number" step="0.01" name="price"
                       value="${sel.price?string["#########.00"]?replace(",", ".")}">
            </div>
        </div>
        <div class="form-row">
            <button class="btn btn-primary" type="submit" name="linkId" value="${sel.id}">Save</button>
        </div>
    </form>
</#macro>

<#macro updateClient client>
    <div class="row mt-3">
        <a href="/edit/client">Back</a>
    </div>
    <br>
    <h4>
        Update Client:
    </h4>
    <form action="/edit/client/updateSubmit" method="post">
        <div class="form-row">
            <div class="form-group col-md-3">
                <label for="inputName">Name/Company</label>
                <input class="form-control" id="inputName" type="text" name="name" value="${client.name}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            </div>
            <div class="form-group col-md-3">
                <label for="inputNumber">Number:</label>
                <input class="form-control" id="inputNumber" type="text" name="date" value="${client.number}">
            </div>
        </div>
        <div class="form-row">
            <button class="btn btn-primary" type="submit" name="selId" value="${client.id}">Save</button>
        </div>
    </form>
</#macro>