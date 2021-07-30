<%-- 
    Document   : Error403
    Created on : 31-01-2021, 14:49:24
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
    <script type="text/javascript">
        function showMessage()
        {
            setTimeout(() => {document.getElementById("message").style.display="block";},5000);
            setTimeout(() => {document.getElementById("message2").style.display="block";},10000);
        }
    </script>
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
            <p class="perror2">Error 403</p>
            <p class="perror">Acceso restringido</p>
        </div>
        <img class="forbiden" id="message" src="../Imagenes/ErrorIdentificacion.png" alt=""/>
        <img class="forbiden2" id="message2" src="../Imagenes/exit.gif" alt=""/>
    </body>
</html>
