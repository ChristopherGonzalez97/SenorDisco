<%-- 
    Document   : IdentificarContacto
    Created on : 06-01-2021, 14:50:21
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El señor de los discos</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="../web/js/jquery-2.2.3.min.js" type="text/javascript"></script>
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
        <script type="text/javascript">
            function Validar()
            {
                var rut = document.forms["FormularioCliente"]["txtRut"].value;
                var nombre= document.forms["FormularioCliente"]["txtNombre"].value;
                var apellido = document.forms["FormularioCliente"]["txtApellido"].value;
                var mail = document.forms["FormularioCliente"]["txtMail"].value;
                var telefono = document.forms["FormularioCliente"]["txtTelefono"].value;
                var registro = document.forms["FormularioCliente"]["rdbRegistro"].value;
                
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
                document.forms["FormularioCliente"]["txtRut"].style.borderColor = "red";
                alert("Ingrese su rut en el formato correcto xxxxxxx-x");
                return false;
            }
            if(nombre==0)
            {
                document.forms["FormularioCliente"]["txtNombre"].style.borderColor = "red";
                alert('Ingrese su nombre');
                return false;
            }
            
            if(apellido==0)
            {
                document.forms["FormularioCliente"]["txtApellido"].style.borderColor = "red";
                alert('Ingrese su apellido');
                return false;
            }
            
            if(mail==0)
            {
                document.forms["FormularioCliente"]["txtMail"].style.borderColor = "red";
                alert('Ingrese su primer correo electronico');
                return false;
            }
            
            if(telefono==0)
            {
                document.forms["FormularioCliente"]["txtTelefono"].style.borderColor = "red";
                alert('Ingrese su telefono');
                return false;
            }
            
            if(registro==0)
            {
                document.getElementById('quetion').style.color = "red";
                document.getElementById('gridRadios1').style.color = "red";
                alert('Ingrese una opcion en la pregunta si desea crear un usuario en el señor de los discos');
                return false;
            }
            if(registro=="Si")
            {
                var pass = document.forms["FormularioCliente"]["txtPass"].value;
                var pass2 = document.forms["FormularioCliente"]["txtPass2"].value;
                if(pass==0)
                {
                    document.forms["FormularioCliente"]["txtPass"].style.borderColor= "red";
                    alert('Ingrese una contraseña');
                    return false;
                }
                if(pass2==0)
                {
                    document.forms["FormularioCliente"]["txtPass2"].style.borderColor= "red";
                    alert('Ingrese nuevamente la contraseña');
                    return false;
                }
                }
                if(pass!=pass2)
                {   
                    document.forms["FormularioCliente"]["txtPass"].style.borderColor= "red";
                    document.forms["FormularioCliente"]["txtPass2"].style.borderColor= "red";
                    alert('Las contraseñas no coinciden');
                    return false;
                }
            }
            function Mostrar()
            {
                 var registro = document.forms["FormularioCliente"]["rdbRegistro"].value;
                 if(registro=="Si")
                 {
                     document.getElementById('Passwords').style.display= "block";
                     document.getElementById('Passwords2').style.display= "block";
                 }
                 else{
                     document.getElementById('Passwords').style.display= "none";
                     document.getElementById('Passwords2').style.display= "none";
                     
                 }
            }
        </script>
    </head>
    <%
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
            HttpSession s= request.getSession();
        %>
    <body>
        <div class="header-outs" id="home" >
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
         <div class="container identifiacion">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Identificacion del comprador</h3>
            <div class="contact-list-grid">
             
            <form class="register-form" action="../Identificar" onsubmit="return Validar()" name="FormularioCliente" method="Post">
                <div class=" agile-wls-contact-mid">
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
                    <div class="form-group contact-forms">
                        <input type="text" name="txtRut" class="form-control" placeholder="Rut (XXXXXXXX-X)">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" class="form-control" name="txtNombre" placeholder="Nombre">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" class="form-control" name="txtApellido"  placeholder="Apellido">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="email" name="txtMail" class="form-control"  placeholder="Correo electronico">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" name="txtTelefono"  class="form-control"  placeholder="Telefono">
                    </div>
                    <div class="form-group contact-forms">
                        
                    </div>
                    <fieldset class="form-group">
                     <div class="row">
                         <div class="col-form-label col-sm-10 pt-0" id="quetion">¿Desea crear una cuenta en el señor de los discos?</div>
                        <div class="col-sm-10">
                           <div class="form-check">
                              <input class="form-check-input" type="radio" value="Si" name="rdbRegistro" id="gridRadios1"  onchange="Mostrar()">
                              <label class="form-check-label" for="gridRadios1">
                                  Si
                              </label>
                           </div>
                           <div class="form-check">
                              <input class="form-check-input" type="radio" value="No" name="rdbRegistro" id="gridRadios2"  onchange="Mostrar()">
                              <label class="form-check-label" for="gridRadios2">
                                  No
                              </label>
                           </div>
                        </div>
                     </div>
                  </fieldset>
                    <div class="form-group contact-forms" id="Passwords" style="display: none">
                        <input type="password" name="txtPass"   class="form-control"  placeholder="Contraseña">
                    </div>
                    <div class="form-group contact-forms" id="Passwords2" style="display: none">
                        <input type="password" name="txtPass2"   class="form-control"  placeholder="Vuelva a ingresar su contraseña">
                    </div>
                    <button type="submit" class="btn btn-block sent-butnn">Avanzar</button>
                </div>
        </form>       
            </div>
         </div>
         <!--//contact-map -->
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
