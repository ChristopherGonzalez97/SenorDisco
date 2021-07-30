<%-- 
    Document   : Mensaje
    Created on : 02-05-2020, 14:56:50
    Author     : Christopher
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="msn">
    <head>
        <%
           HttpSession s = request.getSession();
           String mensaje=s.getAttribute("MensajePagina").toString();
            String url = s.getAttribute("url").toString();
        %>
        <title>Redireccionando</title>
        <link href="../web/css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="refresh" content="4;URL=<%= url %>"/>
    </head>
    <body class="msn">
        <div class="msj">
            <%
                out.println(mensaje);
            %>
        </div>        
    </body>
</html>
