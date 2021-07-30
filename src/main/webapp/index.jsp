<%-- 
    Document   : index
    Created on : 22-11-2020, 11:34:37
    Author     : chris
--%>


<%@page import="Estadistica.Estadisticas"%>
<%@page import="Clases.Grupo"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="com.google.auth.oauth2.AccessToken"%>
<%@page import="com.google.auth.oauth2.CloudShellCredentials"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="Clases.Producto"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="zxx">
   <head>
      <title>El señor de los discos</title>
      <!--meta tags -->
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="keywords" content="Discos,Parrillas,Asadores" />
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
      <link href="web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="web/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!-- For Clients slider -->
      <link rel="stylesheet" href="web/css/flexslider.css" type="text/css" media="all" />
      <!--flexs slider-->
      <link href="web/css/JiSlider.css" rel="stylesheet">
      <!--Shoping cart-->
      <link rel="stylesheet" href="web/css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <!--stylesheets-->
      <link href="web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
      
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
        function modalEnableBtn(){
                    document.getElementById("modalEnviar").disabled = false;
                }
        
   </script>
     <%
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        HttpSession s = request.getSession();
        List<Producto> productos= em.createNamedQuery("Producto.findAll").getResultList();
        List<Grupo> grupos= em.createNamedQuery("Grupo.findAll").getResultList();
        List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        List<Producto> see =new ArrayList<Producto>();
        List<Producto> carrusel=Estadisticas.MasVendidosBanner();
        for(Producto pro :productos)
        {
            if(pro.getDisponible()==Short.parseShort("0"))
            {
                see.add(pro);
            }
        }
        for(Producto p:see)
        {
            productos.remove(p);
        }
        
        for(Grupo gru: grupos)
        {
            List<Producto> prodGrupo = gru.getProductoList();
            List<Producto> produc= new ArrayList();
            if(gru.getProductoList().size()>0){
            for(Producto pro:prodGrupo)
            {
                if(pro.getDisponible()==0)
                {
                    produc.add(pro);
                }
            }
            for(Producto m:produc)
            {
                prodGrupo.remove(m);
            }
            for(Producto x:productos)
            {
                if(x.getIdproducto() == prodGrupo.get(0).getIdproducto())
                {
                    x.setNombre(gru.getNombreDeplegar());
                }
            }
            prodGrupo.remove(0);
            for(Producto f:prodGrupo)
            {
                productos.remove(f);
            }
            }
            
        }
    %>
   <body>
      <div class="header-outs" id="home">
         <div class="header-bar">
            <div class="container-fluid">
               <div class="hedder-up row">
                  <div class="col-lg-3 col-md-3 logo-head">
                        <h1>
                            <a class="navbar-brand" href="index.jsp">
                                <img src="images/Logoasd.png" alt="" style="width: 100%"/>
                            </a>
                        </h1>
                  </div>
                   <!--Colocar Servlts de buscar-->
                  <div class="col-lg-5 col-md-6 search-right">
                      <form action="Buscar" method="Post" class="form-inline my-lg-0">
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
            <nav class="navbar navbar-expand-lg navbar-light trasparente">
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                  <ul class="navbar-nav ">
                     <li class="nav-item active">
                        <a class="nav-link" href="index.jsp">Inicio<span class="sr-only">(current)</span></a>
                     </li>
                     <li class="nav-item">
                        <a href="Paginas/Historia.jsp" class="nav-link">Historia</a>
                     </li>
                     <li class="nav-item">
                        <a href="Paginas/BuscarCompra.jsp" class="nav-link">Buscar compra</a>
                     </li>
                     <li class="nav-item">
                        <a href="Paginas/NuestrosClientes.jsp" class="nav-link">Nuestros clientes</a>
                     </li>
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Productos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                           <%
                               for(FamiliaProducto fp:familia)
                            {%>
                            <a class="nav-link1" href="CategoriasMenu?id=<%=fp.getNombre()%>" style="padding: 0">
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
         <!-- Slideshow 4 -->
         <div class="clearfix"></div>
         <div class="slider text-center">
            <div class="callbacks_container">
               <ul class="rslides callbacks callbacks1"  id="slider4">
                  <li>
                     <div class="slider-img one-img">
                         <div class="filtro">
                            <div class="container">
                               <div class="slider-info ">
                                  <h5>Los mejores utensilios para parrilleros<br>encuentralos en el Señor de los discos</h5>
                                  <div class="bottom-info">
                                     <p>Somos artesanos del metal 100% nacionales y de la mejor calidad</p>
                                  </div>
                                  <div class="outs_more-buttn">
                                     <a href="Painas/Historia.jsp">Mas acerca de nosotros</a>
                                  </div>
                               </div>
                            </div>
                        </div>
                     </div>
                  </li>
                  <li>
                     <div class="slider-img two-img">
                         <div class="filtro">
                            <div class="container">
                               <div class="slider-info ">
                                  <h5>Contamos con una completa linea de menaje industrial</h5>
                                  <div class="bottom-info">
                                      <p>Para tu Negocio, Restaurant o Proyecto</p>
                                  </div>
                                  <div class="outs_more-buttn">
                                      <a href="Paginas/VerProductos.jsp">Ver productos</a>
                                  </div>
                               </div>
                            </div>
                         </div>
                     </div>
                  </li>
               </ul>
            </div>
         </div>
      <!-- //banner -->
      <!--new Arrivals -->
      <section class="blog py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title clr text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Mejores productos</h3>
            <div class="slid-img">
               <ul id="flexiselDemo1">
                   <%
                       for(Producto pro:carrusel)
                       {%>
                       <li>
                        <div class="agileinfo_port_grid" style="width: 300px">
                            <img id="carr" src="<%String ul = "data:image/png;base64," + Base64.getEncoder().encodeToString(pro.getImagenList().get(0).getImagen());
                            out.print(ul);%>" alt="" style="width: 100%" class="img-fluid2" />
                            <div class="banner-right-icon" style="text-align: center">
                                <h4 class="pt-3" style="color:white"><%out.println(pro.getNombre());%></h4>
                           </div>
                           <div class="outs_more-buttn" style="padding-left: 25%">
                               <a  href="Paginas/Producto.jsp?id=<% out.println(pro.getIdproducto()); %>" >Ver producto</a>
                           </div>
                        </div>
                     </li>
                       <%}
                   %>
               </ul>
            </div>
         </div>
      </section>
      <!--//about -->
     <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Productos</h3>
            <div class="row">
                <div class="side-bar col-lg-3">
                   <div class="search-hotel">
                      <h3 class="agileits-sear-head">Buscar</h3>
                      <form action="Buscar" method="post">
                         <input type="search" placeholder="Buscar..." name="txtBuscar" required="">
                         <input type="submit" value=" ">
                      </form>
                   </div>
                    <div class="search-hotel">
                      <h3 class="agileits-sear-head">Categorias</h3>
                      <form action="Categoria" method="post" onsubmit="return ValidacionCategoria()" name="FormCategoria">
                          <select class="form-control" name="txtCategoria"  required style="width: 80%;display: inline;">
                              <option disabled selected>
                                  Seleccione una categoria
                              </option>
                              <%
                                for(FamiliaProducto fp:familia)
                             {%>
                             <option value="<% out.println(fp.getNombre()); %>">
                                 <% out.println(fp.getNombre()); %>
                             </option>
                             <%}%>  
                          </select>
                         <input type="submit" value=" ">
                      </form>
                   </div>
                </div>
                
               <div class="left-ads-display col-lg-9">
                  <div class="row">
                    <%
                        for(Producto pro:productos)
                        {%>
                        <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                        <div class="product-toys-info">
                           <div class="men-pro-item">
                              <div class="men-thumb-item">
                                 <img src="<%String ul = "data:image/png;base64," + Base64.getEncoder().encodeToString(pro.getImagenList().get(0).getImagen());
                                 out.print(ul);%>" style="height: 240px" class="img-thumbnail img-fluid" alt="">
                                 <div class="men-cart-pro">
                                    <div class="inner-men-cart-pro">
                                       <a href="Paginas/Producto.jsp?id=<% out.println(pro.getIdproducto()); %>" class="link-product-add-cart">Ver producto</a>
                                    </div>
                                 </div>
                              </div>
                              <div class="item-info-product">
                                 <div class="info-product-price">
                                    <div class="grid_meta">
                                       <div class="product_price">
                                          <h4>
                                             <a href="Paginas/Producto.jsp?id=<% out.println(pro.getIdproducto()); %>"><% out.println(pro.getNombre()); %></a>
                                          </h4>
                                          <div class="grid-price mt-2">
                                             <span class="money "><% out.println("$"+pro.getPrecioVenta()); %></span>
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
                                           %>  
                  </div>
               </div>
                <button onclick="location.href='Paginas/VerProductos.jsp'" class="btn-dark btn-lg" style="width: 100%;margin: 5%;">
                    Ver todos los productos
                </button> 
            </div>      
         </div>
     </section>
     <!--subscribe-address-->
     <section class="subscribe">
         <div class="container-fluid">
         <div class="row">
            <div class="col-lg-12 col-md-12 address-w3l-right text-center">
               <div class="address-gried ">
                  <span class="far fa-map"></span>
                  <p>Nuestros talleres se encuentran en: <br>
                      San Miguel <br> 
                      Pedro Aguirre Cerda <br> 
                      Santiago de Chile
                  <p>
               </div>
               <div class="address-gried mt-3">
                  <span class="fas fa-phone-volume"></span>
                  <p>+56995503346</p>
               </div>
               <div class=" address-gried mt-3">
                  <span class="far fa-envelope"></span>
                  <p><a href="mailto:dserranotorroja@gmail.com">contacto@elsenordelosdiscos.cl</a>
                     <br><a href="mailto:servicioalcliente@elsenordelosdiscos.cl">servicioalcliente@elsenordelosdiscos.cl</a>
                  </p>
               </div>
            </div>
         </div>
		 </div>
      </section>
      <!--//subscribe-address-->
      <section class="sub-below-address py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
            <h3 class="title clr text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Contactenos</h3>
            <div class="icons mt-4 text-center">
               <ul>
                   <li><a href="https://www.instagram.com/elsenordelosdiscos/"><span  class="fab fa-instagram"></span></a></li>
                  <li><a onclick="location.href='https://wa.me/56995503346?text=Quiero%20un%20agendamiento'"><span class="fab fa-whatsapp"></span></a></li>
               </ul>
            </div>
         </div>
          <div>
              <div class="icons mt-4 text-left special-bottom" style="width: 56%;display: inline-block;contain: layout;">
                  <h3 class="title clr text-left mb-lg-5 mb-md-4 mb-sm-4 mb-3" style="margin-bottom: 0 !important;margin-left: 2vw">Pagos integrados con</h3>
                  <img src="Imagenes/webpay-logo-1.png" class="imgBottom" style="width: 22vw;margin-left: 4vw;background-color: #eaeaea33;" alt=""/>
              </div> 
             
              <div class="icons mt-4 text-right special-bottom" style="width: 41%;display: inline-block;contain: layout;">
                    <h3 class="title clr text-right mb-lg-5 mb-md-4 mb-sm-4 mb-3"  style="margin-bottom: 0 !important;margin-right: 5vw;">Distribucion por</h3>
                    <img src="Imagenes/logo.png" class="imgBottom" style="width: 63%;" alt=""/>
                    <img src="Imagenes/blx.png" class="imgBottom" style="width: 39%;" alt=""/>
                    <img src="Imagenes/skn.png" class="imgBottom" style="width: 44%;" alt=""/>
              </div>
          </div>
              
      </section>
      <!--//subscribe-->
      <!-- footer -->
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
                             <form action="IniciarSesion" method="post">
                                <div class="fields-grid">
                                   <div class="styled-input">
                                      <input type="email" placeholder="Email" name="txtCorreo" required="">
                                   </div>
                                   <div class="styled-input">
                                      <input type="password" placeholder="Contraseña" name="txtPass" required="">
                                   </div>
                                    <div class="g-recaptcha" data-sitekey="6LeVfbMaAAAAAORJ7Zqzh3FypKqM-FRw4mHGH9BA" data-callback="modalEnableBtn"></div>
                                    <div>
                                        <a href="Paginas/RecuperarPass.jsp" class="link">
                                            ¿Olvidaste tu contraseña?
                                        </a>
                                    </div>
                                    <button type="submit" class="btn subscrib-btnn" id="modalEnviar" disabled>Ingresar</button>
                                   <button onclick="location.href='Paginas/RegistrarCliente.jsp'" type="button" class="btn subscrib-btnn">Registrarse</button>
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
                               <button onclick="location.href='Paginas/EditarCliente.jsp'" class="btn-lg btn-dark">
                                   Editar datos del perfil
                               </button>
                               <button class="btn-lg btn-dark" onclick="location.href='Paginas/HistorialCompras.jsp'" >
                                   Historial de compras
                               </button>
                           </td>
                       </tr>
                   </table>
               </div>
               <div class="modal-footer">
                   <button class="btn btn-secondary" onclick="location.href='CerrarSesion'" >Cerrar sesion</button>
               </div>
            </div>
         </div>
                <%}
         %>
          
      </div>
      <!-- //Modal 1-->
      <!--js working-->
      <script src='web/js/jquery-2.2.3.min.js'></script>
      <!--//js working-->
      <!-- cart-js -->
      <script src="web/js/minicart_1.js"></script>
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
      <script src="web/js/responsiveslides.min.js"></script>
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
      <script src="web/js/jquery.flexisel.js"></script>
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
      <script src="web/js/move-top.js"></script>
      <script src="web/js/easing.js"></script>
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
      <script src="web/js/bootstrap.min.js"></script>
      <script 
          src="https://www.google.com/recaptcha/api.js">
      </script>
      <!-- //bootstrap working-->
   </body>
</html>
