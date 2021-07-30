<%-- 
    Document   : RegistrarCliente
    Created on : 23-11-2020, 21:13:00
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="Clases.Comuna"%>
<%@page import="Clases.Region"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>El señor de los discos</title>
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
            var primerNombre = document.forms["FormularioCliente"]["txtPrimerNombre"].value;
            var segundoNombre = document.forms["FormularioCliente"]["txtSegundoNombre"].value;
            var apellidoPaterno = document.forms["FormularioCliente"]["txtApellidoPaterno"].value;
            var apellidoMaterno = document.forms["FormularioCliente"]["txtApellidoMaterno"].value;
            var email = document.forms["FormularioCliente"]["txtEmail"].value;
            var telefono = document.forms["FormularioCliente"]["txtTelefono"].value;
            var region = document.forms["FormularioCliente"]["SelectRegion"].value;
            var direccion = document.forms["FormularioCliente"]["txtDireccion"].value;
            
            var pass = document.forms["FormularioCliente"]["txtPass"].value;
            var confirmarPass = document.forms["FormularioCliente"]["txtPass2"].value;
           
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
            if(primerNombre==0)
            {
                document.forms["FormularioCliente"]["txtPrimerNombre"].style.borderColor = "red";
                alert('Ingrese su primer nombre');
                return false;
            }
            if(apellidoPaterno==0)
            {
                document.forms["FormularioCliente"]["txtApellidoPaterno"].style.borderColor = "red";
                alert('Ingrese su apellido paterno');
                return false;
            }
            if(apellidoMaterno==0)
            {
                document.forms["FormularioCliente"]["txtApellidoMaterno"].style.borderColor = "red";
                alert('Ingrese su apellido materno');
                return false;
            }
            if(email==0)
            {
                document.forms["FormularioCliente"]["txtEmail"].style.borderColor = "red";
                alert('Ingrese su email');
                return false;
            }
            if(telefono==0)
            {
                document.forms["FormularioCliente"]["txtTelefono"].style.borderColor = "red";
                alert('Ingrese su telefono');
                return false;
            }
            if(region=="Seleccione su region de residencia...")
            {
                document.forms["FormularioCliente"]["SelectRegion"].style.borderColor = "red";
                alert('Ingrese su region de residencia');
                return false;
            }
            var flag=0;
            var selected;
            var total= parseInt(document.getElementById("txtTotal").value);
            for(var i=1;i<total+1;i++)
            {
                    
                    var text="txtComuna"+i;
                    var comuna = document.getElementById(text).value;
                    if(comuna != "Seleccione comuna de residencia...")
                    {
                        selected=i;
                        flag=1;
                    }
            }
            if(flag==0)
            {
                for(var i=1;i<total+1;i++)
                {
                    var text="txtComuna"+i;
                    document.forms["FormularioCliente"][text].style.borderColor = "red";
                }
                alert('Ingrese su comuna de residencia');
                return false;
            }
            if(direccion==0)
            {
                document.forms["FormularioCliente"]["txtDireccion"].style.borderColor = "red";
                alert('Ingrese su direccion');
                return false;
            }
            
            if(pass==0)
            {
                document.forms["FormularioCliente"]["txtPass"].style.borderColor = "red";
                alert('Ingrese su contraseña');
                return false;
            }
            if(confirmarPass==0)
            {
                document.forms["FormularioCliente"]["txtPass2"].style.borderColor = "red";
                alert('Confirme su contraseña');
                return false;
            }
            if(pass!==confirmarPass)
            {
                document.forms["FormularioCliente"]["txtPass2"].style.borderColor = "red";
                document.forms["FormularioCliente"]["txtPass"].style.borderColor = "red";
                alert('Las contraseñas no coinciden');
                return false;
            }    
        }
        
    
        function Cambiar()
        {
            var e=document.getElementById("SelectRegion");
            var id = e.options[e.selectedIndex].value;
            var texto="txtComuna"+id;
            document.getElementById(texto).style.display = "block"; 
            OcultarResto(texto);
        }
        function OcultarResto(o)
        {
            
            var split= o.split("a");
            var id= parseInt(split[1]);
            var total= parseInt(document.getElementById("txtTotal").value);
            for(var i=1;i<total+1;i++)
            {
                if(i!==id)
                {
                    var text="txtComuna"+i;
                    document.getElementById(text).style.display = "none"; 
                    document.getElementById(text).value = "Seleccione comuna de residencia...";
                }
            }
        }
    </script>
</head>
    <%
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        HttpSession s = request.getSession();
        List<Region> regiones= em.createNamedQuery("Region.findAll").getResultList();
        List<Comuna> comunas= em.createNamedQuery("Comuna.findAll").getResultList();
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
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Registro de usuario</h3>
            <div class="contact-list-grid">
             
            <form class="register-form" action="../AgregarCliente" onsubmit="return Validar()" name="FormularioCliente" method="Post">
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
                        <input type="text" class="form-control" name="txtPrimerNombre" placeholder="Primer nombre">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" class="form-control" name="txtSegundoNombre"  placeholder="Segundo nombre">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" class="form-control" name="txtApellidoPaterno"  placeholder="Apellido paterno">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" class="form-control" name="txtApellidoMaterno"  placeholder="Apellido materno">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="email" name="txtEmail" class="form-control"  placeholder="Correo electronico">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" name="txtTelefono"  class="form-control"  placeholder="Telefono">
                    </div>
                    <div class="form-group contact-forms">
                        <select id="SelectRegion" class="form-control" onchange="Cambiar()" name="txtRegion">
                            <option>
                                Seleccione su region de residencia...
                            </option>
                            <%
                                for(Region re:regiones)
                                {%>
                                <option value="<%= re.getIdregion()%>">
                                    <% out.println(re.getNombre()); %>
                                </option>
                                <%}
                            %>
                        </select>
                    </div>
                    <div class="form-group contact-forms">
                        <%
                            int total=0;
                            for(Region r:regiones)
                            {
                                List<Comuna> c = r.getComunaList();
                                %>
                                <select id="txtComuna<%=r.getIdregion()%>" class="form-control" name="txtComuna<%=r.getIdregion()%>" style="display: none">
                                    <option>
                                        Seleccione comuna de residencia...
                                    </option>
                                        <%
                                            for(Comuna co:c)
                                            {
                                                out.println("<option>"+co.getNombre()+"</option>");
                                            }
                                        %>
                                </select>
                        <%
                              total++;  
                            }
                        %>
                        <input type="hidden" name="txtTotal" id="txtTotal" value="<%=total%>">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="text" name="txtDireccion"  class="form-control"  placeholder="Direccion (Calle y numeracion)">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="password" name="txtPass"   class="form-control"  placeholder="Contraseña">
                    </div>
                    <div class="form-group contact-forms">
                        <input type="password" name="txtPass2"   class="form-control"  placeholder="Vuelva a ingresar su contraseña">
                    </div>
                    <button type="submit" class="btn btn-block sent-butnn">Registrarse</button>
                </div>
        </form>       
            </div>
         </div>
         <!--//contact-map -->
      </section>               
      <!--//subscribe-->
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
      <script src="../web/js/jquery-2.2.3.min.js"></script>
      <!-- newsletter modal -->
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
      <!-- price range (top products) -->
      <script src="../web/js/jquery-ui.js"></script>
      <script>
         //<![CDATA[ 
         $(window).load(function () {
         	$("#slider-range").slider({
         		range: true,
         		min: 0,
         		max: 9000,
         		values: [50, 6000],
         		slide: function (event, ui) {
         			$("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
         		}
         	});
         	$("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));
         
         }); //]]>
      </script>
      <!-- //price range (top products) -->
      <!-- single -->
      <script src="../web/js/imagezoom.js"></script>
      <!-- single -->
      <!-- script for responsive tabs -->
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
    </body>
</html>
