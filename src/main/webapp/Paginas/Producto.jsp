<%-- 
    Document   : Producto
    Created on : 23-11-2020, 14:00:55
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Imagen"%>
<%@page import="Clases.Producto"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        String url = request.getQueryString();
        String[] posiciones = url.split("=");
        String id = posiciones[1];
        
        EntityManagerFactory emf ;
        HttpSession s = request.getSession();
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        List<Producto> productos= em.createNamedQuery("Producto.findAll").getResultList();
        
        List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        Producto producto=new Producto();
        for(Producto pro :productos)
            {
                if(pro.getIdproducto()==Integer.parseInt(id))
                {
                    producto = pro;
                }
            }
        List<Imagen> img= producto.getImagenList();
        List<Producto> similares= Estadistica.Estadisticas.ProductosSimilares(producto);
    %>  
    <head>
         <title><% 
             if(producto.getGrupoIdgrupo()!=null)
             {
                 out.println(producto.getGrupoIdgrupo().getNombreDeplegar());
             }else{
                 out.println(producto.getNombre());
            }        
             %></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="keywords" content="Toys Shop Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
         Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
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
   </head>
   <script type="text/javascript">
       function cambiar()
       {
           var seleccion= event.target.id;
           var btn="div"+seleccion;
           document.getElementById(btn).style.display="block";
           var n = parseInt(seleccion);
           ocultarResto(n);
       }
       function ocultarResto(o)
       {
             var total= parseInt(document.getElementById("hdTotal").value);
             for(var i=0;i<total+1;i++)
            {
                if(i!==o)
                {
                    var btn="div"+i;
                    document.getElementById(btn).style.display="none";
                }
            }
       }
   </script>
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
      <!--//banner -->
      <!--/shop-->
      <section class="banner-bottom p-roducto">
          <div class="container" style="padding-top: 1vw;">
             <h2 style="text-align: center";>
                 <% out.println(producto.getNombre()); %>
             </h2>
             <div class="inner-sec-shop pt-lg-4 pt-3" style="padding-top: 1vw !important;">
               <div class="row">
                  <div class="col-lg-5 single-item ">
                     <div class="grid images_3_of_2">
                        <div class="flexslider1">
                           <ul class="slides">
                            <%
                                for(Imagen i:img)
                                {
                                    if(i.getHabilitado()!=Short.parseShort("0")){
                                String urlq = "data:image/png;base64," + Base64.getEncoder().encodeToString(i.getImagen());%>
                                    <li data-thumb="<%out.println(urlq);%>">
                                        <div class="thumb-image">
                                            <%
                                                if(i.getPosicion()==2)
                                                {%>
                                                  <img src="<%out.println(urlq);%>" data-imagezoom="true" class="imgVertical img-fluid" alt=" ">   
                                                <%}else{%>
                                                <img src="<%out.println(urlq);%>" style="height:230px;margin-top: 10%" data-imagezoom="true" class="img-fluid imgHorizontal" alt=" "> 
                                                         <%}
                                            %>
                                            
                                        </div> 
                                    </li>
                                <%}
                            }
                            %>   
                           </ul>
                           <div class="clearfix"></div>
                        </div>
                     </div>
                  </div>
                  <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                      <%
                                if(s.getAttribute("ErrorStock")!=null)
                                {%>
                                <div class="error form-group contact-forms">
                                    <% 
                                        out.println(s.getAttribute("ErrorStock"));
                                        s.removeAttribute("ErrorStock");
                                    %>
                                </div>
                                <div class="agendar form-group contact-forms">
                                    <button class="botonWSP" onclick="location.href='https://wa.me/?text=Quiero%20un%20agendamiento'">
                                        <img src="../Imagenes/WspLogoMIni.png" class="agendarWSP">
                                        Contactar para agendamiento
                                    </button>
                                </div>
                               <% }
                            %>
                      
                      <h3>
                         Precio
                     </h3>
                     <p>
                         <span class="item_price"><%out.println("$"+producto.getPrecioVenta());%></span>
                     </p>
                     <h3>Descripcion:</h3>
                     <p>
                          <span class="item-info-product">
                             <%out.println(producto.getDescripcion());%>
                         </span>
                     </p>
                     <h3>Peso:</h3>
                     <p>
                          <span class="item-info-product">
                             <%out.println(producto.getPeso()+"KG");%>
                         </span>
                     </p>
                     <h3>Dimensiones:</h3>
                     <p>
                          <span class="item-info-product">
                             <%out.println("Altura: "+producto.getAltoProducto()+"cm.");%>
                         </span>
                         <br>
                          <span class="item-info-product">
                             <%out.println("Ancho: "+producto.getAnchoProducto()+"cm.");%>
                         </span>
                         <br>
                          <span class="item-info-product">
                             <%out.println("Largo: "+producto.getLargoProducto()+"cm.");%>
                         </span>
                     </p>   
                     <%
                        if(producto.getGrupoIdgrupo()!=null)
                        {
                            List<Producto> pro= producto.getGrupoIdgrupo().getProductoList();
                         %>
                          <h3>Tallas:</h3>
                          <p>
                               <%
                                   int flag=0;
                                   for(Producto pr :pro)
                                   {%>
                                   <input type="radio" name="rbtTalla" id="<%=flag%>" onclick="cambiar()"> <%out.println(pr.getTalla()+" ($"+pr.getPrecioVenta()+")");%><br>
                                   <%
                                       flag++;
                                   }
                               %>
                          </p>
                          <%
                              flag =0;
                              for(Producto p:pro)
                              {%>
                              <div class="occasion-cart" id="div<%=flag%>" style="display: none">
                                    <div class="toys single-item singlepage">
                                       <form action="#" method="post">
                                          <input type="hidden" name="cmd" value="_cart">
                                          <input type="hidden" name="add" value="1">
                                          <input type="hidden" name="toys_item" value="<%out.println(p.getNombre());%>">
                                          <input type="hidden" name="shipping" value="<%out.println(p.getIdproducto());%>">
                                          <input type="hidden" name="amount" value="<%out.println(p.getPrecioVenta());%>">
                                          <%
                                              if(producto.getStock()==0)
                                              {%>
                                              Producto sin stock
                                              <div class="agendar form-group contact-forms">
                                                  <button class="botonWSP" type="button" onclick="location.href='https://wa.me/?text=Hola%20quisiera%20un%20agendamiento%20de%20<%=p.getNombre()%>'">
                                                      <img src="../Imagenes/WspLogoMIni.png" class="agendarWSP" >
                                                    Contactar para agendamiento
                                                </button>
                                              </div>
                                              <%}
                                                else{%>
                                                <button type="submit" class="toys-cart ptoys-cart add">
                                                    Agregar al carro
                                                </button>
                                            <%}
                                          %>
                                       </form>
                                    </div>
                                 </div>
                              <%
                                  flag++;
                                  }
                          %>
                          <input type="hidden" value="<%=flag-1%>" id="hdTotal">
                     <%  
                        }else{
                     %>
                     <!-- Aqui tenrmina el modulo grupo -->
                     <div class="occasion-cart">
                        <div class="toys single-item singlepage">
                           <form action="#" method="post">
                              <input type="hidden" name="cmd" value="_cart">
                              <input type="hidden" name="add" value="1">
                              <input type="hidden" name="toys_item" value="<%out.println(producto.getNombre());%>">
                              <input type="hidden" name="shipping" value="<%out.println(producto.getIdproducto());%>">
                              <input type="hidden" name="amount" value="<%out.println(producto.getPrecioVenta());%>">
                              <%
                                  if(producto.getStock()==0)
                                  {%>
                                  Producto sin stock
                                  <div class="agendar form-group contact-forms">
                                      <button class="botonWSP" type="button" onclick="location.href='https://wa.me/?text=Hola%20quisiera%20un%20agendamiento%20de%20<%=producto.getNombre()%>'">
                                          <img src="../Imagenes/WspLogoMIni.png" class="agendarWSP" >
                                        Contactar para agendamiento
                                    </button>
                                  </div>
                                  <%}
                                    else{%>
                                    <button type="submit" class="toys-cart ptoys-cart add">
                                        Agregar al carro
                                    </button>
                                <%}
                              %>
                           </form>
                        </div>
                     </div><%}%>
                  </div>
                  <div class="clearfix"> </div>
               </div>
            </div>
         </div>
      </section>                
      <!--//subscribe-->
      <section class="blog py-lg-4 py-md-3 py-sm-3 py-3">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title clr text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Productos similares</h3>
            <div class="slid-img">
               <ul id="flexiselDemo1">
                   <%
                       for(Producto pro:similares)
                       {%>
                       <li>
                        <div class="agileinfo_port_grid" style="width: 300px">
                            <img id="carr" src="<%String ul = "data:image/png;base64," + Base64.getEncoder().encodeToString(pro.getImagenList().get(0).getImagen());
                            out.print(ul);%>" alt="" style="width: 100%" class="img-fluid2" />
                            <div class="banner-right-icon" style="text-align: center">
                                <h4 class="pt-3" style="color:white"><%out.println(pro.getNombre());%></h4>
                           </div>
                           <div class="outs_more-buttn" style="padding-left: 25%">
                               <a  href="Producto.jsp?id=<% out.println(pro.getIdproducto()); %>" >Ver producto</a>
                           </div>
                        </div>
                     </li>
                       <%}
                   %>
               </ul>
            </div>
         </div>
      </section>
      <!-- footer -->
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
