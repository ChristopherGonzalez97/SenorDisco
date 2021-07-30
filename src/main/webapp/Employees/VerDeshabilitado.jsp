<%-- 
    Document   : VerDeshabilitado
    Created on : 27-11-2020, 14:33:33
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Fabricante"%>
<%@page import="Clases.Producto"%>
<%@page import="Clases.FamiliaProducto"%>
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
    </head>
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
      <link rel="stylesheet" href="../web/css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <link rel="stylesheet" type="text/css" href="../web/css/jquery-ui1.css">
      <link href="../web/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
      <link rel="stylesheet" href="../web/css/flexslider.css" type="text/css" media="screen" />
      <!--stylesheets-->
      <link href="../web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <body>
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
            List<Fabricante> fabricantes= em.createNamedQuery("Fabricante.findAll").getResultList();
            List<Producto> productos= em.createNamedQuery("Producto.findAll").getResultList();
            List<FamiliaProducto> familias= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        %>
        <div class="header-outs" id="home" style="padding-bottom: 13vw;">
         <div class="header-bar">
            <div class="container-fluid">
               <div class="hedder-up row">
                  <div class="col-lg-10 col-md-10 logo-head">
                        <h1>
                            <a class="navbar-brand" href="Modulador.jsp" style="width: 100%;text-align: center;">
                                <img src="../images/Logoasd.png" alt="" style="width: 50%;height: 4em;margin-left: 3em;"/>
                            </a>
                        </h1>
                  </div>
                  <div class="col-lg-2 col-md-2 right-side-cart">
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
      <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
             <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom:0;margin-left: 8px;" onclick="location.href='Productos.jsp'">
                  Volver
          </button>
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Productos</h3>
            <div class="row">
               <div class="side-bar col-lg-3">
                   <div>
                        <button style="width: 100%;margin-bottom:1vw;" class="btn-info" onclick="javascript:location.reload(true)">
                            Refrescar
                         </button> 
                          <button onclick="location.href='AgregarProducto.jsp'" class="btn-info" style="width: 50%;display: inline-block">
                                Agregar nuevo producto
                          </button>
                           <button onclick="location.href='Productos.jsp'" class="btn-info" style="width: 48%;display: inline-block">
                                Ver productos habilitados
                           </button>
                      </div>
               </div>
               <div class="left-ads-display col-lg-9">
                  <div class="row">
                    <%
                        for(Producto pro:productos)
                        {
                            if(pro.getDisponible()==Short.parseShort("0"))
                            {
                                %>
                                    <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                                    <div class="product-toys-info">
                                       <div class="men-pro-item">
                                          <div class="men-thumb-item">
                                             <img src="<%String ul = "data:image/png;base64," + Base64.getEncoder().encodeToString(pro.getImagenList().get(0).getImagen());
                                         out.print(ul);%>" class="img-thumbnail img-fluid" alt="">
                                             <div class="men-cart-pro">
                                                <div class="inner-men-cart-pro">
                                                   <a href="EditarProducto.jsp?id=<% out.println(pro.getIdproducto()); %>" class="link-product-add-cart">Editar producto</a>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="item-info-product">
                                             <div class="info-product-price">
                                                <div class="grid_meta">
                                                   <div class="product_price">
                                                      <h4>
                                                         <a href="EditarProducto.jsp?id=<% out.println(pro.getIdproducto()); %>"><% out.println(pro.getNombre()); %></a>
                                                      </h4>
                                                      <div class="grid-price mt-2">
                                                         <span class="money "><% out.println("$"+pro.getPrecioVenta()); %></span>
                                                      </div>
                                                      <div>
                                                          <button onclick="location.href='AdministrarImagenes.jsp?id=<%=pro.getIdproducto()%>'" class="btn-info" style="width: 50%;display: inline-block">
                                                            Administrar imagenes
                                                          </button>
                                                           <button class="btn-success" onclick="location.href='../HabilitarProducto?id=<%=pro.getIdproducto()%>'" style="width: 48%;display: inline-block">
                                                               Habilitar producto
                                                           </button>
                                                      </div>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="clearfix"></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                               <%}
                        }%>  
                  </div>
               </div>
            </div>
         </div>
     </section>  
    </body>
</html>
