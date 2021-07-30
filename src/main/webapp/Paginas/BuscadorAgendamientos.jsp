<%-- 
    Document   : BuscadorAgendamientos
    Created on : 26-01-2021, 14:24:48
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar agendamiento</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Toys Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
         Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
      
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
        <%
     EntityManagerFactory emf ;
     emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
     EntityManager em = emf.createEntityManager();
     HttpSession s = request.getSession();
     List<DetalleVenta> carro = (List<DetalleVenta>) s.getAttribute("carro");
     List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
     
    %>
    <body>
         <div class="header-outs" id="home" style="padding-bottom: 12vw;">
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
         <section class="registro" id="buscador">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Buscar agendamiento</h3>
            <div class="contact-list-grid">
                <form onsubmit="return Validacion()" class="register-form" action="../BuscarAgendamiento"  name="FormBuscar" method="Post">
                        <div class=" agile-wls-contact-mid">
                            <div class="form-group contact-forms">
                                <input type="number" name="txtIdPedido" class="form-control"  placeholder="Ingrese el Id del pedido">
                            </div>
                             <div class="form-group contact-forms">
                                <input type="email" name="txtCorreo" class="form-control"  placeholder="Ingrese el correo electronico del pedido">
                            </div>
                            <%
                                if(s.getAttribute("errorMessage")!=null)
                                {%>
                                <div class="error form-group contact-forms">
                                    <% 
                                        out.println(s.getAttribute("errorMessage"));
                                        s.removeAttribute("errorMessage");
                                    %>
                                </div>
                               <% }
                            %>
                            <button type="submit" class="btn btn-block sent-butnn">Buscar</button>
                        </div>
                </form>       
            </div>
         </div>
         <!--//contact-map -->
      </section>                  
        <%
            if(s.getAttribute("resultadoBuscador")!=null)
            {
                %>
                <script>
                        document.getElementById("buscador").style.display="none";
                </script>      
        <%
                Pedido pedido = (Pedido) s.getAttribute("resultadoBuscador");
                if(pedido.getEstado().equals("En construccion"))
                {
                    %>
                     <div class="error form-group contact-forms Verp-roducto" style="margin-top: 12vw;">
                                    <% 
                                        out.println("El pedido aun esta en construccion, se le notificara al correo proporcionado cualquier cambio de estado");
                                    %>
                     </div>
                <%
                    s.removeAttribute("resultadoBuscador");
                
                    }else if(pedido.getEstado().equals("Terminado"))
                {%>
                <section class="boleta">
                    <div class="container py-lg-5 py-md-4 py-sm-4 py-3" style="padding-top: 0 !important">
               <div class="shop_inner_inf">
                  <div class="privacy about Verp-roducto">
                     <h3>Agendamiento <% out.println(pedido.getIdpedido());  %></h3>
                     <div class="checkout-right">
                        <table class="timetable_sub">
                          <tbody>
                              <tr>
                                  <td class="sub">
                                      Id producto
                                  </td>
                                  <td class="sub">
                                      Nombre producto
                                  </td>
                                  <td class="sub">
                                      Cantidad
                                  </td>
                              </tr>
                                        <%
                                  List<DetallePedido> pedidos = new ArrayList<DetallePedido>();
                                  pedidos=pedido.getDetallePedidoList();
                                  for(DetallePedido p:pedidos)
                                  {%>
                                  <tr>
                                      <td class="stick"> 
                                          <% out.println(p.getProducto().getIdproducto()); %> 
                                      </td>
                                      <td class="stick">
                                          <% out.println(p.getProducto().getNombre()); %> 
                                      </td>
                                      <td class="stick">
                                          <% out.println(p.getCantidad()); %> 
                                      </td>
                                  </tr>
                                  <%}
                              %>
                                    <tr>
                                        <td colspan="3">
                                            <button  onclick="location.href='../AgendamientoAVenta'">
                                                Ir a pagar
                                            </button>
                                        </td>
                                    </tr>
                          </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>
        </section>  
                    <%}else if(pedido.getEstado().equals("Finalizado"))
                {%>
                <div class="error form-group contact-forms Verp-roducto" style="margin-top: 12vw;">
                                    <% 
                                        out.println("Este pedido ya fue pagado, si tiene algun problema con su agendamiento porfavor comunicarse con el administrador");
                                    %>
                     </div>
                <%
                    s.removeAttribute("resultadoBuscador");}

            }
        
        %>
    </body>
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
    <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      <script>
           function Validacion()
        {
            var correo=document.forms["FormBuscar"]["txtCorreo"].value;
     
            var id = document.forms["FormBuscar"]["txtIdPedido"].value;
             if(correo==0)
            {
                document.forms["FormBuscar"]["txtCorreo"].style.borderColor = "red";
                alert('Ingrese el correo del agendamiento');
                return false;
            }
            if(id==0)
            {
                document.forms["FormBuscar"]["txtIdPedido"].style.borderColor = "red";
                alert('Ingrese el Id de la compra');
                return false;
            }
        }
      </script>
</html>
