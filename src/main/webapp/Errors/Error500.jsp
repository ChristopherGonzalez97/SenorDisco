<%-- 
    Document   : Error500
    Created on : 31-01-2021, 18:22:16
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>JSP Page</title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="../web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="../web/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!--Shoping cart-->
      <link rel="stylesheet" href="../web/css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <!--checkout-->
      <link rel="stylesheet" type="text/css" href="../web/css/checkout.css">
      <!--//checkout-->
      <!--stylesheets-->
      <link href="../web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    </head>
    <body class="FondoError" onload="showMessage()">
        <div class="header-outs" id="home" style="padding-bottom: 10vw;">
         <div class="header-bar">
            <div class="container-fluid">
                <div class="hedder-up row" style="text-align: center;">
                   <h1 style="width: 100%;">
                        <a class="navbar-brand" href="../index.jsp">
                            <img src="../images/Logoasd.png" alt="" style="width: 80%"/>
                        </a>
                    </h1>
               </div>
            </div>
         </div>
        </div> 
        <div>
            <%
              try{}
              catch(Exception e)
              {
                System.out.println(e.getMessage());    
                }
            %>
            <p class="perror2">Error 500</p>
            <p class="perror">Error interno del servidor</p>
            <p class="perror">
                contactese con el administrador
            </p>
        </div>
    </body>
</html>
