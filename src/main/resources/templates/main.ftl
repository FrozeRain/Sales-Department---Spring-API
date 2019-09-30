<#import "common/default.ftl" as def>

<@def.page>
    <div class="row">
        <div class="col">
            <h4>
                Add new Client
            </h4>
            <form method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Full Name/Company</label>
                        <input class="form-control" type="text" name="name" placeholder="Full Name/Company"
                               id="inputName"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputPhone">Phone Number</label>
                        <input class="form-control" type="text" name="number" placeholder="Phone Number"
                               id="inputPhone"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </div>
                </div>
                <div class="form-row">
                    <button class="btn btn-primary" type="submit">Add</button>
                </div>
            </form>
        </div>
        <div class="col">
            <h4>
                Add new Order
            </h4>
            <form method="post" action="/add">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="selectName">Name/Company</label>
                        <select name="select" id="selectName" class="form-control">
                            <#list clientSel as cS>
                                <option value="${cS.id}">${cS.name}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="inputPrice">Price</label>
                        <input type="number" step="0.01" name="cost" placeholder="Price" id="inputPrice"
                               class="form-control"/>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </div>
                </div>
                <div class="form-row">
                    <button class="btn btn-primary" type="submit">Add</button>
                </div>
            </form>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col">
            <div class="form-row">
                <form action="/edit/client" method="get">
                    <button class="btn btn-primary mb-2" type="submit">Edit</button>
                </form>
                <div class="ml-3">
                    <h5>
                        Client list
                    </h5>
                </div>
            </div>
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
                </tr>
                </thead>
                <tbody>
                <#list clients as clients>
                    <tr>
                        <th scope="row">${clients.id}</th>
                        <td>${clients.name}</td>
                        <td>${clients.number}</td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
        <div class="col">
            <div class="form-row">
                <form action="/edit/order" method="get">
                    <button class="btn btn-primary mb-2" type="submit">Edit</button>
                </form>
                <div class="ml-3">
                    <h5>
                        Order list
                    </h5>
                </div>
            </div>
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
                        Date of Order
                    </th>
                    <th scope="col">
                        Price
                    </th>
                </tr>
                </thead>
                <tbody>
                <#list orders as orders>
                    <tr>
                        <th scope="row">${orders.id}</th>
                        <td>${orders.clientFullName}</td>
                        <td>${orders.date}</td>
                        <td>${orders.price}</td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
</@def.page>

