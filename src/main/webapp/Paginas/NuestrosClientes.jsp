<%-- 
    Document   : NuestrosClientes
    Created on : 10-05-2021, 16:39:29
    Author     : pc
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Clases.Grupo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cliente"%>
<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Producto"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuestros clientes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <script type="text/javascript">
        function ValidacionCategoria()
        {
             var categoria = document.forms["FormCategoria"]["txtCategoria"].value;
             if(categoria=="Seleccione una categoria")
            {
                document.forms["FormCategoria"]["txtCategoria"].style.borderColor = "red";
                alert('Seleccione una de las categorias');
                return false;
            }
        }
        function ValidacionOrdenar()
        {
             var categoria = document.forms["formOrdenar"]["txtOrden"].value;
             if(categoria=="Seleccione una opcion")
            {
                document.forms["formOrdenar"]["txtOrden"].style.borderColor = "red";
                alert('Seleccione uno de los filtros');
                return false;
            }
        }
    </script>
    <%
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        HttpSession s = request.getSession();
    %>  
    <head>
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
        <div class="header-outs" id="home">
         <div class="header-bar">
            <div class="container-fluid">
               <div class="hedder-up row">
                  <div class="col-lg-3 col-md-3 logo-head">
                        <h1>
                            <a class="navbar-brand" href="../index.jsp">
                                <img src="../images/Logoasd.png" alt="" style="width: 100%"/>
                            </a>
                        </h1>
                  </div>
                   <!--Colocar Servlts de buscar-->
                  <div class="col-lg-5 col-md-6 search-right">
                     <form action="../Buscar" method="Post" class="form-inline my-lg-0">
                         <input class="form-control mr-sm-2" type="search" name="txtBuscar" placeholder="Buscar">
                        <button class="btn" type="submit">Buscar</button>
                     </form>
                  </div>
                  <div class="col-lg-4 col-md-3 right-side-cart">
                     <div class="cart-icons">
                        <ul>
                           <li>
                              <button type="button" data-toggle="modal" data-target="#exampleModal"> <span class="far fa-user"></span></button>
                           </li>
                           <li class="toyscart toyscart2 cart cart box_1">
                              <form action="#" method="post" class="last">
                                 <input type="hidden" name="cmd" value="_cart">
                                 <input type="hidden" name="display" value="1">
                                 <button class="top_toys_cart" type="submit" name="submit" value="">
                                 <span class="fas fa-cart-arrow-down"></span>
                                 </button>
                              </form>
                           </li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <nav class="navbar navbar-expand-lg navbar-light">
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                  <ul class="navbar-nav ">
                     <li class="nav-item">
                        <a class="nav-link" href="../index.jsp">Inicio<span class="sr-only">(current)</span></a>
                     </li>
                     <li class="nav-item">
                        <a href="Historia.jsp" class="nav-link">Historia</a>
                     </li>
                      <li class="nav-item">
                        <a href="BuscarCompra.jsp" class="nav-link">Buscar compra</a>
                     </li>
                      <li class="nav-item">
                        <a href="NuestrosClientes.jsp" class="nav-link">Nuestros clientes</a>
                     </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Productos
                        </a>
                         <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                           <%
                               for(FamiliaProducto fp:familia)
                            {%>
                            <a class="nav-link1" href="../CategoriasMenu?id=<%=fp.getNombre()%>" style="padding: 0">
                                <div class="nav-link1">
                                <% out.println(fp.getNombre()); %>
                                </div>
                            </a>
                            <%}%>                            
                        </div>
                     </li>
                  </ul>
               </div>
            </nav>
         </div>
        </div> 
         <section class="banner-bottom Verp-roducto">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Tiendas asociadas</h3>
               <div class="left-ads-display col-lg-12">  
                   <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/APunto.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/carnespremiumpucon/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Carnes Premium Pucón
                                  </div>
                                  <div class="info-contact-agile">
                                       Region IX, Pucon, Av Bernardo Ohiggins 774 Local 1101 
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/APunto.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/carnespremiumtemuco/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Carnes Premium Temuco
                                  </div>
                                  <div class="info-contact-agile">
                                        Region IX, Temuco, Av Pablo Neruda 02025 Local 5 
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/BodegaDelAsador.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/labodegadelasador/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      La bodega del asador
                                  </div>
                                  <div class="info-contact-agile">
                                      Region RM, Talagante, Balmaceda 7022 Local 8
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/BoutiqueDeCarnes.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/boutiqueprocarnelaserena/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Boutique ProCarne
                                  </div>
                                  <div class="info-contact-agile">
                                      Region IV, La Serena, Av. Cuatro Esquinas Strip Center Portal Cerro Grande Local 110
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/CarnesDelSur.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/cortesdelsurchile/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Cortes del sur
                                  </div>
                                  <div class="info-contact-agile">
                                      Region VI, Rancagua, Los litres 450 
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/CarnesPremiuimReñaca.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/carnespremiumrenaca/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Carnes premium Reñaca
                                  </div>
                                  <div class="info-contact-agile">
                                      Region V, Viña del Mar, Avenida Borgoño 14650 local 7 
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/CarnesPremiuimSanPedro.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/carnespremiumsanpedro/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Carnes premium San Pedro
                                  </div>
                                  <div class="info-contact-agile">
                                      Region VIII, San Pedro de la paz, Camino el Venado 1380 Local 4  
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/DelValleAlSur.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="www.delsuralosvalles.cl" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Del sur al valle
                                  </div>
                                  <div class="info-contact-agile">
                                      Region RM, Pudahuel, Av El Canal 19591 Stripcenter Punto Vivo 
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/ElMarmoleo.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/marmoleopremium/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      El marmoleo
                                  </div>
                                  <div class="info-contact-agile">
                                      Region V, Quillota, Blanco Encalada #456 Local 1
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/EmporioParrillero.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/emporio_del_parrillero/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Emporio parrillero
                                  </div>
                                  <div class="info-contact-agile">
                                      Region II , Antofagasta, San Martin 2372, Local 2 Boulevard Villa Tralhuén
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/EntreCortes.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/entrecortes.sv/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Entre cortes
                                  </div>
                                  <div class="info-contact-agile">
                                      Region VI ,San Vicente ,Luis Ibañez 230
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/LaCarniceria.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/lacarniceriapremium/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      La carniceria
                                  </div>
                                  <div class="info-contact-agile">
                                      Region Metropolitana, Calera de tango,Camino Lonquen Norte Paradero 1, Parcela 3 Local A, Espacio los Girasoles
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/RinconDelAsador.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/rincondelasador_410/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Rincon del asador
                                  </div>
                                  <div class="info-contact-agile">
                                      Region VI, Rancagua ,Av. Cachapoal 410
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Tiendas/TierraYMar.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/sabores_tierraymar/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Tierra y mar
                                  </div>
                                  <div class="info-contact-agile">
                                      Region Metropolitana, Talagante, Balmaceda 7022 Local 2
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                     </div>       
                  </div>
               </div>
             <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Ecommerces asociados</h3>
             <div class="left-ads-display col-lg-12">  
                 <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Ecommerce/Mercadolibre.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://listado.mercadolibre.cl/_CustId_723782339" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Mercado libre
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Ecommerce/Market.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.facebook.com/andres.ignacio.568089" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Facebook Marketplace
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Ecommerce/OutletDelAsador.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://outletdelasador.cl/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Outlet del Asador
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Ecommerce/Paparrilleros.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://paparrilleros.cl/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Paparrilleros
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                 </div>
             </div>
             <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Restaurantes asociados</h3>
             <div class="left-ads-display col-lg-12">  
                 <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/Amali.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/amalu_sushi/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Amalu Sushi
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/AntojitoPeru.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/antojito.peru/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Antojito Peru
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/DateUnGusto.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/dateungusto_mariscostragos/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Date un gusto
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/DeliWok.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/deliwok_chile/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      DeliWok
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/FuenteVicuña.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/fuentevicuna/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Fuente Vicuña
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/MarCentral.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/marcentral.maitencillo/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Mar central
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/MrChau.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://mrchau.cl/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Mr. Chau
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/NanFang.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://restaurantnanfang.cl/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      NanFang
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/Pukara.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/pukara_/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Pukara
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/Saboresdeasia.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/kaothai_cl/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Sabores de Asia
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/SantoCardumen.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/santo_cardumen/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Santo cardumen
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/Tatum.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/tatun_sabores_del_inca/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Tatum
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/ThaiOnWheels.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/thai_on_wheels/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Thai on wheels
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/TukTuk.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/tuktukcocinaycafe/?hl=es" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Tuk Tuk
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/ValleDelInca.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://www.instagram.com/polleriavalledelinca/" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Valle del inca
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/WokThai.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://z-p42.www.instagram.com/woktothai/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Wok Thai
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                        <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                  <img src="../Imagenes/Restaurantes/WokThisWay.png" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="https://z-p42.www.instagram.com/wokthisway.cl/?hl=es-la" class="link-product-add-cart">Ir a sus redes</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                  <div class="info-contact-agile">
                                      Wok this way
                                  </div>
                                 <div class="clearfix"></div>
                              </div>
                           </div>
                        </div>
                        </div>    
                 </div>
             </div>
            </div>
     </section>                 
                        
       <section class="sub-below-address py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <h3 class="title clr text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Contactenos</h3>
            <div class="icons mt-4 text-center">
               <ul>
                  <li><a href="https://www.instagram.com/elsenordelosdiscos/"><span class="fab fa-instagram"></span></a></li>
                  <li><a onclick="location.href='https://wa.me/56995503346?text=Quiero%20un%20agendamiento'"><span class="fab fa-whatsapp"></span></a></li>
               </ul>
            </div>
         </div>
      </section>
      <footer class="py-lg-4 py-md-3 py-sm-3 py-3 text-center">
         <div class="copy-agile-right">
            <p> 
               © 2020 El señor de los discos. All Rights Reserved 
            </p>
         </div>
      </footer>
      <!-- //footer -->
      <!-- Modal 1-->
      <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <%
             if(s.getAttribute("Usuario")==null)
             {%>
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                       <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Inicio de sesion</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                          </button>
                       </div>
                       <div class="modal-body">
                          <div class="register-form">
                             <form action="../IniciarSesion" method="post">
                                <div class="fields-grid">
                                   <div class="styled-input">
                                      <input type="email" placeholder="Email" name="txtCorreo" required="">
                                   </div>
                                   <div class="styled-input">
                                      <input type="password" placeholder="Contraseña" name="txtPass" required="">
                                   </div>
                                    <div class="g-recaptcha" data-sitekey="6LeVfbMaAAAAAORJ7Zqzh3FypKqM-FRw4mHGH9BA" data-callback="modalEnableBtn"></div>
                                    <div>
                                        <a href="RecuperarPass.jsp" class="link">
                                            ¿Olvidaste tu contraseña?
                                        </a>
                                    </div>
                                    <button type="submit" class="btn subscrib-btnn" id="modalEnviar" disabled>Ingresar</button>
                                   <button onclick="location.href='RegistrarCliente.jsp'" type="button" class="btn subscrib-btnn">Registrarse</button>
                                </div>
                             </form>
                          </div>
                       </div>
                       <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                       </div>
                    </div>
                </div>
             <%}else{
                Cliente cli= new Cliente();
                cli= (Cliente)s.getAttribute("Usuario");
             %>
             <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title" id="exampleModalLabel">Bienvenido <% out.println(cli.getPersona().getNombre());  %></h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">
                   <table>
                       <tr>
                           <td>
                               <button onclick="location.href='EditarCliente.jsp'" class="btn-lg btn-dark">
                                   Editar datos del perfil
                               </button>
                               <button class="btn-lg btn-dark" onclick="location.href='HistorialCompras.jsp'" >
                                   Historial de compras
                               </button>
                           </td>
                       </tr>
                   </table>
               </div>
               <div class="modal-footer">
                   <button class="btn btn-secondary" onclick="location.href='../CerrarSesion'" >Cerrar sesion</button>
               </div>
            </div>
         </div>
                <%}
         %>
          
      </div>             
       <script src="web/js/bootstrap.min.js"></script>
      <script 
          src="https://www.google.com/recaptcha/api.js">
      </script>    
       <!-- //Modal 1-->
      <!--jQuery-->
      <script src="../web/js/jquery-2.2.3.min.js"></script>
      <!-- newsletter modal -->
      <!-- cart-js -->
      <!-- //cart-js -->
      <!-- price range (top products) -->
      <!-- //price range (top products) -->
      <!-- single -->
      <script src="../web/js/imagezoom.js"></script>
      <!-- single -->
      <!-- script for responsive tabs -->
      <script src='../web/js/jquery-2.2.3.min.js'></script>
      <!--//js working-->
      <!-- cart-js -->
      <script src="../web/js/minicart.js"></script>
      <script>
         toys.render();
         
         toys.cart.on('toys_checkout', function (evt) {
         	var items, len, i;
         
         	if (this.subtotal() > 0) {
         		items = this.items();
         
         		for (i = 0, len = items.length; i < len; i++) {}
         	}
         });
      </script>
      <!-- //cart-js -->
      <!--responsiveslides banner-->
      <script src="../web/js/responsiveslides.min.js"></script>
      <script>
         // You can also use "$(window).load(function() {"
         $(function () {
         	// Slideshow 4
         	$("#slider4").responsiveSlides({
         		auto: true,
         		pager:false,
         		nav:true ,
         		speed: 900,
         		namespace: "callbacks",
         		before: function () {
         			$('.events').append("<li>before event fired.</li>");
         		},
         		after: function () {
         			$('.events').append("<li>after event fired.</li>");
         		}
         	});
         
         });
      </script>
      <!--// responsiveslides banner-->	 
      <!--slider flexisel -->
      <script src="../web/js/jquery.flexisel.js"></script>
      <script>
         $(window).load(function() {
         	$("#flexiselDemo1").flexisel({
         		visibleItems: 3,
         		animationSpeed: 3000,
         		autoPlay:true,
         		autoPlaySpeed: 2000,    		
         		pauseOnHover: true,
                        clone:true,
         		enableResponsiveBreakpoints: true,
         		responsiveBreakpoints: { 
         			portrait: { 
         				changePoint:480,
         				visibleItems: 1
         			}, 
         			landscape: { 
         				changePoint:640,
         				visibleItems:2
         			},
         			tablet: { 
         				changePoint:768,
         				visibleItems: 2
         			}
         		}
         	});
         	
         });
      </script>
      <script src="../web/js/easy-responsive-tabs.js"></script>
      <script>
         $(document).ready(function () {
         	$('#horizontalTab').easyResponsiveTabs({
         		type: 'default', //Types: default, vertical, accordion           
         		width: 'auto', //auto or any width like 600px
         		fit: true, // 100% fit in a container
         		closed: 'accordion', // Start closed if in accordion view
         		activate: function (event) { // Callback function if tab is switched
         			var $tab = $(this);
         			var $info = $('#tabInfo');
         			var $name = $('span', $info);
         			$name.text($tab.text());
         			$info.show();
         		}
         	});
         	$('#verticalTab').easyResponsiveTabs({
         		type: 'vertical',
         		width: 'auto',
         		fit: true
         	});
         });
      </script>
      <!-- FlexSlider -->
      <script src="../web/js/jquery.flexslider.js"></script>
      <script>
         // Can also be used with $(document).ready()
         $(window).load(function () {
         	$('.flexslider1').flexslider({
         		animation: "slide",
         		controlNav: "thumbnails"
         	});
         });
      </script>
      <!-- //FlexSlider-->
      <!-- start-smoth-scrolling -->
      <script src="../web/js/move-top.js"></script>
      <script src="../web/js/easing.js"></script>
      <script>
         jQuery(document).ready(function ($) {
         	$(".scroll").click(function (event) {
         		event.preventDefault();
         		$('html,body').animate({
         			scrollTop: $(this.hash).offset().top
         		}, 900);
         	});
         });
      </script>
      <!-- start-smoth-scrolling -->
      <!-- here stars scrolling icon -->
      <script>
         $(document).ready(function () {
         
         	var defaults = {
         		containerID: 'toTop', // fading element id
         		containerHoverID: 'toTopHover', // fading element hover id
         		scrollSpeed: 1200,
         		easingType: 'linear'
         	};
         
         
         	$().UItoTop({
         		easingType: 'easeOutQuart'
         	});
         
         });
      </script>
      <!-- //here ends scrolling icon -->
      <!-- //smooth-scrolling-of-move-up -->
      <!--bootstrap working-->
      <script src="../web/js/bootstrap.min.js"></script>
      <!-- //bootstrap working--> 
       <script src="../web/js/responsiveslides.min.js"></script>
      <script>
         // You can also use "$(window).load(function() {"
         $(function () {
         	// Slideshow 4
         	$("#slider4").responsiveSlides({
         		auto: true,
         		pager:false,
         		nav:true ,
         		speed: 900,
         		namespace: "callbacks",
         		before: function () {
         			$('.events').append("<li>before event fired.</li>");
         		},
         		after: function () {
         			$('.events').append("<li>after event fired.</li>");
         		}
         	});
         
         });
      </script>
      <!--// responsiveslides banner-->	 
      <!--slider flexisel -->
      <script src="../web/js/jquery.flexisel.js"></script>
      <script>
         $(window).load(function() {
         	$("#flexiselDemo1").flexisel({
         		visibleItems: 3,
         		animationSpeed: 3000,
         		autoPlay:true,
         		autoPlaySpeed: 2000,    		
         		pauseOnHover: true,
                        clone:true,
         		enableResponsiveBreakpoints: true,
         		responsiveBreakpoints: { 
         			portrait: { 
         				changePoint:480,
         				visibleItems: 1
         			}, 
         			landscape: { 
         				changePoint:640,
         				visibleItems:2
         			},
         			tablet: { 
         				changePoint:768,
         				visibleItems: 2
         			}
         		}
         	});
         	
         });
      </script>
      <!-- //slider flexisel -->
      <!-- start-smoth-scrolling -->
      <script src="../web/js/move-top.js"></script>
      <script src="../web/js/easing.js"></script>
      <script>
         jQuery(document).ready(function ($) {
         	$(".scroll").click(function (event) {
         		event.preventDefault();
         		$('html,body').animate({
         			scrollTop: $(this.hash).offset().top
         		}, 900);
         	});
         });
      </script>
      <!-- start-smoth-scrolling -->
      <!-- here stars scrolling icon -->
      <script>
         $(document).ready(function () {
         
         	var defaults = {
         		containerID: 'toTop', // fading element id
         		containerHoverID: 'toTopHover', // fading element hover id
         		scrollSpeed: 1200,
         		easingType: 'linear'
         	};
         	$().UItoTop({
         		easingType: 'easeOutQuart'
         	});
         
         });
      </script>
      <!-- //here ends scrolling icon -->
      <!--bootstrap working-->
      <script src="../web/js/bootstrap.min.js"></script>
      <!-- //bootstrap working-->
    </body>
</html>
