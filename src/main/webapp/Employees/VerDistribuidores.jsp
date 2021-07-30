<%-- 
    Document   : VerDistribuidores
    Created on : 19-01-2021, 19:56:19
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.Distribuidor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
     <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      <!--//meta tags ends here-->
      <!--booststrap-->
      <link href="../web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="../web/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!-- For Clients slider -->
      <link rel="stylesheet" href="../web/css/flexslider.css" type="text/css" media="all" />
      <!--flexs slider-->
      <link href="../web/css/JiSlider.css" rel="stylesheet">
      <!--Shoping cart-->
      <link rel="stylesheet" href="../web/css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <!--stylesheets-->
      <link href="../web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
      </script>
      <!--//meta tags ends here-->
      <!--booststrap-->
      <link href="../web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="../web/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!--Shoping cart-->
      <link rel="stylesheet" href="../web/css/shop.css" type="text/css" >
      <!--//Shoping cart-->
      <link rel="stylesheet" type="text/css" href="../web/css/jquery-ui1.css">
      <link href="../web/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' >
      <link rel="stylesheet" href="../web/css/flexslider.css" type="text/css" media="screen" >
      <!--stylesheets-->
      <link href="../web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
</head>
        <%
            HttpSession s = request.getSession();
            try{
                if(s.getAttribute("Usuario")==null)
                {
                    throw new Exception();
                }
                else{
                   Cliente cli =(Cliente) s.getAttribute("Usuario");
                    if(!cli.getUsuarioIdusuario().Role())
                    {
                        throw new Exception();
                    }
                }
            }catch(Exception e)
            {
                response.sendRedirect("../Errors/Error403.jsp");
            }
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            List<Distribuidor> distribuidores= new ArrayList();
            distribuidores=em.createNamedQuery("Distribuidor.findAll").getResultList();
        %>
    <body>
       <div class="header-outs" id="home" >
         <div class="header-bar">
            <div class="container-fluid">
               <div class="hedder-up row">
                  <div class="col-lg-3 col-md-3 logo-head">
                        <h1>
                            <a class="navbar-brand" href="index.html">
                                <img src="../images/Logoasd.png" alt="" style="width: 100%"/>
                            </a>
                        </h1>
                  </div>
                   <!--Colocar Servlts de buscar-->
                  <div class="col-lg-5 col-md-6 search-right">
                     <form class="form-inline my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Buscar">
                        <button class="btn" type="submit">Buscar</button>
                     </form>
                  </div>
                  <div class="col-lg-4 col-md-3 right-side-cart">
                     <div class="cart-icons">
                        <ul>
                           <li>
                              <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
         </div>
        </div>
        <section class="banner-bottom Verp-roducto">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Distribuidores</h3>
            <div class="contact-list-grid">
                <button type="button" onclick="location.href='DistribuidoresDeshabilitados.jsp'" class="btn btn-block  sent-butnn">Ver distribuidores  deshabilitados</button>
            </div>
            <%
                if(s.getAttribute("resultadoError")!=null)
                {%>
                <h3 id="error">
                    <% out.println(s.getAttribute("resultadoError")); %>
                </h3>
                <%
                    s.removeAttribute("resultadoError");}
            %>
               <div class="left-ads-display col-lg-12">  
                   <div class="row">
                    <%
                        for(Distribuidor dis:distribuidores)
                        {if(dis.getCliente().getUsuarioIdusuario().getHabilitado()==Short.parseShort("1")){
                            %>
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                 <img src="../Imagenes/Silueta.png" class="img-thumbnail img-fluid" alt=""/>
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="DatosDistribuidor.jsp?id=<% out.println(dis.getClienteRutCliente()); %>" class="link-product-add-cart">Ver distribuidor</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Nombre:<% out.println(dis.getNombre());%>
                                  </div>
                                  <div class="info-contact-agile">
                                      Rut:<% out.println(dis.getClienteRutCliente());%>
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                                           <%}}
                                           %>  
                  </div>
               </div>
            </div>
         </div>
     </section>
    </body>
</html>
