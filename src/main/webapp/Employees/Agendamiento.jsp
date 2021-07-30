<%-- 
    Document   : Agendamiento
    Created on : 25-01-2021, 21:22:09
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.DetallePedido"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Fabricante"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="Clases.Producto"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agendamientos</title>
      <meta name="viewport" content="width=device-width, initial-scale=1">
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
        <script>
            function Validar()
            {
                var formulario = "FormAdd"+event.submitter.id;
                var cantidad = document.forms[formulario]["txtCantidad"].value;
                if(cantidad<=0)
                {
                    document.forms[formulario]["txtCantidad"].style.borderColor = "red";
                    alert('Ingrese la cantidad');
                    return false; 
                }
            }
            function ValidarAgendamiento()
            {
                var fecha = document.forms["FormAgendamiento"]["txtFecha"].value;
                var correo = document.forms["FormAgendamiento"]["txtCorreo"].value;
                if( fecha == 0)
                {
                    document.forms["FormAgendamiento"]["txtFecha"].style.borderColor = "red";
                    alert('Ingrese la fecha');
                    return false; 
                }
                if( correo == 0)
                {
                    document.forms["FormAgendamiento"]["txtCorreo"].style.borderColor = "red";
                    alert('Ingrese el correo del cliente');
                    return false; 
                }

            }
            
        </script>    
            
       <%
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
        %>
        <div class="header-outs" id="home" style="padding-bottom: 3vw;">
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
       <section class="Verp-roducto">
           <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom: 2.5em;margin-left: 8px;" onclick="location.href='Modulador.jsp'">
                  Volver
          </button>
           <button class="btn btn-block sent-butnn" style="width: 80%;" onclick="location.href='VerAgendamientos.jsp'">
                  Ver Agendamientos
          </button>
          <%
              if(s.getAttribute("agendamiento")!=null)
              {
                  List<DetallePedido> detalle =(List<DetallePedido>) s.getAttribute("agendamiento");
                  %>
                 <section class="boleta">
                        <div class="container py-lg-10 py-md-10 py-sm-10 py-10">
                           <div class="shop_inner_inf">
                              <div class="privacy about">
                                 <h3>Nuevo agendamiento</h3>
                                 <div class="checkout-right">
                                     <table class="timetable_sub" style="width: 100%;">
                                        <thead>
                                           <tr>
                                                <th class="sub">
                                                    Producto
                                                </th>
                                                <th class="sub">
                                                    Cantidad
                                                </th>
                                                <th class="sub">
                                                    Quitar
                                                </th>
                                           </tr>
                                        </thead>
                                       <tbody>
                                     <% for(DetallePedido det:detalle)
                                               {%>
                                               <tr>
                                                   <td class="stick">
                                                       <% out.println(det.getProducto().getNombre());%>
                                                   </td>
                                                   <td class="stick" style="border-left: 1px black solid;border-right: 1px black solid">
                                                       <% out.println(det.getCantidad());%>
                                                   </td>
                                                   <td class="stick" style="text-align: right !important;">
                                                       <button class="quitar" onclick="location.href='../QuitarAgendamiento?id=<%= det.getProducto().getIdproducto() %>'">
                                                           X
                                                       </button>
                                                   </td>
                                               </tr>                          
                                               <%}
                                           %>
                                       </tbody>
                                     </table>
                                     
                                 </div>
                              </div>
                           </div>
                        </div>
                        <div class="container py-lg-10 py-md-10 py-sm-10 py-10">
                           <div class="shop_inner_inf">
                              <div class="privacy about">
                                 <div class="checkout-right">
                                     <form action="../CrearAgendamiento" name="FormAgendamiento" onsubmit="return ValidarAgendamiento()">
                                        <table class="timetable_sub" style="width: 100%;">
                                              <tr>
                                                  <td class="sub">
                                                    Fecha aproxiamada de finalizacion
                                                  </td>
                                                  <td class="stick ">
                                                      <input type="date" class="form-control" name="txtFecha">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td class="sub">
                                                          Correo
                                                  </td>
                                                  <td class="stick">
                                                      <input type="email" class="form-control" name="txtCorreo">
                                                  </td>
                                              </tr>
                                              <tr>
                                                  <td colspan="2">
                                                      <button type="submit" class="crear">
                                                          Crear agendamiento
                                                      </button>
                                                  </td>
                                              </tr> 
                                          </table>
                                      </form>      
                                 </div>
                              </div>
                           </div>
                        </div>               
                                  
                  </section>
          <%
              }
          %>
          
          
          <div class="left-ads-display col-lg-12">
                  <div class="row">
                    <%
                        for(Producto pro:productos)
                        {
                                %>
                                    <div class="col-lg-3 col-md-3 col-sm-3 product-men women_two">
                                    <div class="product-toys-info">
                                       <div class="men-pro-item">
                                          <div class="men-thumb-item">
                                             <img src="<%String ul = "data:image/png;base64," + Base64.getEncoder().encodeToString(pro.getImagenList().get(0).getImagen());
                                         out.print(ul);%>" class="img-thumbnail img-fluid" alt="">
                                          </div>
                                          <div class="item-info-product">
                                             <div class="info-product-price">
                                                <div class="grid_meta">
                                                    <div class="product_price">
                                                        <%out.println(pro.getNombre());%>
                                                    </div>
                                                   <div class="product_price">
                                                       Agregar a agendamiento
                                                       <form action="../AgregarAgendamiento" onsubmit="return Validar()" name="FormAdd<%= pro.getIdproducto() %>">
                                                           <table>
                                                               <tr>
                                                                   <td>
                                                                       <input type="number" min="0" name="txtCantidad">
                                                                       <input type="hidden" name="txtIdProducto" value="<% out.println(pro.getIdproducto()); %>">
                                                                   </td>
                                                                   <td>
                                                                       <button id="<%=pro.getIdproducto()%>">
                                                                           +
                                                                       </button>
                                                                   </td>
                                                               </tr>
                                                           </table>
                                                       </form>
                                                   </div>
                                                </div>
                                             </div>
                                             <div class="clearfix"></div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                               <%
                        }%>  
                  </div>
               </div>
       </section>
          
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
                                    <div>
                                        <a href="RecuperarPass.jsp" class="link">
                                            ¿Olvidaste tu contraseña?
                                        </a>
                                    </div>
                                   <button type="submit" class="btn subscrib-btnn">Ingresar</button>
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
