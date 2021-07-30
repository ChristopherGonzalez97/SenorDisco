<%-- 
    Document   : BuscarCompra
    Created on : 26-01-2021, 14:57:19
    Author     : pc
--%>

<%@page import="Clases.Usuario"%>
<%@page import="Clases.Destinatario"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Venta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscar compra</title>
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
      <script>
           function Validacion()
        {
            var rut=document.forms["FormBuscar"]["txtRut"].value;
            var id=document.forms["FormBuscar"]["txtIdVenta"].value;
            
            var Fn = {
            validaRut : function (rutCompleto) {
                    if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
                            return false;
                    var tmp 	= rutCompleto.split('-');
                    var digv	= tmp[1]; 
                    var rut 	= tmp[0];
                    if ( digv == 'K' ) digv = 'k' ;
                    return (Fn.dv(rut) == digv );
                                                },
                    dv : function(T){
                            var M=0,S=1;
                            for(;T;T=Math.floor(T/10))
                                    S=(S+T%10*(9-M++%6))%11;
                            return S?S-1:'k';
                                    }
                    }
            if(Fn.validaRut(rut)==false)
            {   
                document.forms["FormBuscar"]["txtRut"].style.borderColor = "red";
                alert("Ingrese su rut en el formato correcto xxxxxxx-x");
                return false;
            } 
            if(id==0)
            {
                document.forms["FormBuscar"]["txtIdVenta"].style.borderColor = "red";
                alert('Ingrese el Id de la compra');
                return false;
            }
        }
        function modalEnableBtn(){
                    document.getElementById("modalEnviar").disabled = false;
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
      <script src="https://www.google.com/recaptcha/api.js">
      </script>
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
         <section class="registro">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Buscar compra</h3>
            <div class="contact-list-grid">
                <form class="register-form" action="../BuscarCompra" onsubmit="return Validacion()" name="FormBuscar" method="Post">
                        <div class=" agile-wls-contact-mid">
                            <div class="form-group contact-forms">
                                <input type="number" name="txtIdVenta" class="form-control"  placeholder="Ingrese el Id de la venta">
                            </div>
                            <div class="form-group contact-forms">
                                <input type="text" name="txtRut" class="form-control"  placeholder="Ingrese el rut del comprador">
                            </div>
                            <div class="g-recaptcha" data-sitekey="6LcHfrMaAAAAAJweaRSDKTMrAD15jK1LnbT0xQsX" data-callback="modalEnableBtn"></div>
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
                            <button type="submit" class="btn btn-block sent-butnn" disabled="true" id="modalEnviar">Buscar</button>
                        </div>
                </form>       
            </div>
         </div>
         <!--//contact-map -->
      </section>                  
        <%
            if(s.getAttribute("VentaEncontrada")!=null)
            {
                Venta venta= (Venta)s.getAttribute("VentaEncontrada");
        %>
            <table>
                <tr>
                    <td>
                        Id venta
                    </td>
                    <td>
                        <% out.println(venta.getVentaPK().getIdventa()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nombre comprador
                    </td>
                    <td>
                        <%  if(venta.getUsuario().getIdusuario()!=1)
                            {
                                out.println(venta.getUsuario().getClienteList().get(0).getPersona().getNombre()); 
                            }else{
                                out.println(venta.getDespachoList().get(0).getDestinatarioidDestinatario().getNombre());
                            }
                            %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Rut
                    </td>
                    <td>
                        <%
                            if(venta.getUsuario().getIdusuario()!=null)
                            {
                                out.println(venta.getUsuario().getClienteList().get(0).getRutCliente()); 
                            }
                            else{
                              out.println(venta.getDespachoList().get(0).getDestinatarioidDestinatario().getRut());
                            }
                            %>
                            
                    </td>
                </tr>
                <tr>
                    <td>
                        Direccion
                    </td>
                    <td>
                        <% out.println(venta.getDespachoList().get(0).getDireccion()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Correo
                    </td>
                    <td>
                        <% out.println(venta.getDespachoList().get(0).getDireccion()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Telefono
                    </td>
                    <td>
                        <% out.println(venta.getDespachoList().get(0).getDestinatarioidDestinatario().getTelefono()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Estado
                    </td>
                    <td>
                        <%
                            if(venta.getEstado().equals("Realizada"))
                            {
                                out.println("En preparacion"); 
                            }else
                            {
                                out.println(venta.getEstado()); 
                            }
                            
                        %>
                    </td>
                </tr>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                </tr>
                <%
                    List<DetalleVenta> detalle= venta.getDetalleVentaList();
                    for(DetalleVenta d:detalle)
                    {%>
                    <tr>
                        <td>
                            <% out.println(d.getProducto().getNombre()); %>
                        </td>
                        <td>
                            <% out.println(d.getCantidad()); %>
                        </td>
                    </tr>  
                    <%}
                %>
                <tr>
                    <td>
                        Compañia de despacho
                    </td>
                    <td>
                        <% out.println(venta.getDespachoList().get(0).getCompañia()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Id de despacho
                    </td>
                    <td>
                        <% out.println(venta.getDespachoList().get(0).getIddespacho()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Revise su despacho en 
                    </td>
                    <td>
                        apsfnams
                    </td>
                </tr>
                <tr>
                    <td>
                        Plataforma de pago
                    </td>
                    <td>
                        Webpay
                    </td>
                </tr>
                <tr>
                    <td>
                        Metodo de pago
                    </td>
                    <td>
                        <% out.println(venta.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                    </td>
                </tr>
                <tr>
                    <td>
                        Total pagado
                    </td>
                    <td>
                        <% out.println(venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                    </td>
                </tr>
            </table>  
            
            <%}
        %>
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
