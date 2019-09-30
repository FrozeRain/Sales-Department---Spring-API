<#macro auth path, tittle, link, linkT, bName>
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>SalesDep CMS</title>
        <style type="text/css">
            table {
                width: 500px;
                border-collapse: collapse;
                border: 1px solid gray;
                border-spacing: 20px;
                margin: auto;
            }

            td {
                width: 50%;
                padding: 20px;
            }
        </style>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">

    </head>
    <body>
    <div class="container">
        <h2 style="text-align: center">${tittle}</h2>
        <form action="${path}" method="post">
            <table>
                <tr>
                    <td style="text-align: right">
                        User Name:
                    </td>
                    <td>
                        <label><input type="text" name="username"/> </label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        Password:
                    </td>
                    <td>
                        <label><input type="password" name="password"/> </label>
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <a href="${link}">${linkT}</a>
                    </td>
                    <td>
                        <input type="submit" value="${bName}"/>
                    </td>
                </tr>
            </table>
        </form>
        <#nested>
    </div>
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    </body>
    </html>
</#macro>