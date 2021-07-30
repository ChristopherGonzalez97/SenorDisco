<%-- 
    Document   : Compra
    Created on : 30-01-2021, 13:31:21
    Author     : pc
--%>

<%@page import="Clases.Destinatario"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.Venta"%>
<%@page import="Clases.Cliente"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra</title>
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
     Venta venta =(Venta)s.getAttribute("venta");
     Usuario user = venta.getUsuario();
     Despacho despacho = venta.getDespachoList().get(0);
     List<DetalleVenta> productos = venta.getDetalleVentaList();
     Destinatario detina =despacho.getDestinatarioidDestinatario();
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
        <section class="compra">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3>Informacion de la compra</h3>
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="2">Cliente</th>
                              </tr>
                           </thead>
                          <tbody>
                              <tr>
                                  <td <td class="sub">
                                      Estado de la compra
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(venta.getEstado());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Rut
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(detina.getRut());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Nombre
                                  </td>
                                  <td class="stick">
                                        <%
                                           out.println(detina.getNombre()+" "+detina.getApellido());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Direccion
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(despacho.getDireccion());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Correo electronico
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(detina.getEmail());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Telefono
                                  </td>
                                  <td class="stick">
                                       <%
                                            out.println(detina.getTelefono());
                                        %>
                                  </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3 gridpos">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="6">Productos</th>
                              </tr>
                              <tr>
                                    <th>
                                        Id 
                                    </th>

                                    <th>
                                        Nombre
                                    </th>

                                    <th>
                                        Precio bruto 
                                    </th>

                                    <th>
                                        IVA
                                    </th>
                                    <th>
                                        Cantidad
                                    </th>
                                    <th>
                                        Subtotal
                                    </th>
                              </tr>
                           </thead>
                          <tbody>
                             <%
                                    int total=0;
                                    for(DetalleVenta prod: productos)
                                    {

                                %>
                                <tr>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIdproducto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getNombre());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getPrecioBruto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIva());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getCantidad());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getTotalProducto());  %>
                                    </td>
                                </tr>   

                                <%
                                    total=total+prod.getTotalProducto();
                                    }
                                %>
                                <tr>
                                    <td colspan="5" class="sub">
                                        Precio total de los productos
                                    </td>
                                    <td class="stick">
                                        <% out.println("$"+total); %>
                                    </td>
                                </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>
            <%
                if(venta.getDespachoList().get(0).getCodigoDespacho()!=0)
                {%>
                    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                       <div class="shop_inner_inf">
                          <div class="privacy about">
                             <div class="checkout-right">
                                <table class="timetable_sub">
                                   <thead>
                                      <tr>
                                          <th colspan="2">Despacho</th>
                                      </tr>
                                   </thead>
                                   <tbody>
                                      <tr>
                                          <td class="sub">
                                              Compañia
                                          </td>
                                          <td class="stick">
                                               <% out.println(despacho.getCompañia()); %>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="sub">
                                              Id del despacho
                                          </td>
                                          <td class="stick">
                                               <% out.println(despacho.getBultoList().get(0).getOrdenDeTransporte()); %>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="sub">
                                              Tipo de despacho
                                          </td>
                                          <td class="stick">
                                              <% out.println(despacho.getTipo()); %>
                                          </td>
                                      </tr>
                                      <tr>
                                          <td class="sub">
                                              Total del despacho
                                          </td>
                                          <td class="stick">
                                              <% out.println(despacho.getValor()); %>
                                          </td>
                                      </tr>
                                   </tbody>
                                </table>
                             </div>
                          </div>
                       </div>
                       <!-- //top products -->
                    </div>  
                <%}
            %>
            
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="2">Pago</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                  <td class="sub">
                                      Plataforma
                                  </td>
                                  <td class="stick">
                                      WebPay
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Metodo de pago
                                  </td>
                                  <td class="stick">
                                        <% out.println(venta.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Total pagado
                                  </td>
                                  <td class="stick">
                                        <% out.println(venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                  </td>
                              </tr>
                           </tbody>
                        </table>
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
      <!--// cart-js -->
      <!--quantity-->
      <script>
         $('.value-plus').on('click', function () {
         	var divUpd = $(this).parent().find('.value'),
         		newVal = parseInt(divUpd.text(), 10) + 1;
         	divUpd.text(newVal);
         });
         
         $('.value-minus').on('click', function () {
         	var divUpd = $(this).parent().find('.value'),
         		newVal = parseInt(divUpd.text(), 10) - 1;
         	if (newVal >= 1) divUpd.text(newVal);
         });
      </script>
      <!--quantity-->
      <!--closed-->
      <script>
    function Eliminar(){
         var cierre= event.target.value;
         $('.rem'+cierre).fadeOut('slow', function (c) {
         			$('.rem'+cierre).remove();});
          toys.cart.remove(cierre);
         	};    
      </script>
      <!--//closed-->
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
