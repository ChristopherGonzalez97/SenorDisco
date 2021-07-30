<%-- 
    Document   : Despacho
    Created on : 30-11-2020, 15:20:31
    Author     : chris
--%>
<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Despacho"%>
<%@page import="Despacho.NumeracionChileExpress"%>
<%@page import="Despacho.CalleChileExpress"%>
<%@page import="Despacho.ComunaChileExpress"%>
<%@page import="Despacho.RegionChileExpress"%>
<%@page import="Clases.Comuna"%>
<%@page import="Clases.Region"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Despacho</title>
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
    <body>
        <script type="text/javascript">
            function ValidarCampos()
            {
                var region=document.forms["FormularioDespacho"]["txtRegion"].value;
                var comuna=document.forms["FormularioDespacho"]["txtComuna"].value;
                var calle=document.forms["FormularioDespacho"]["txtCalle"].value;
                var numeracion=document.forms["FormularioDespacho"]["txtNumber"].value;
                if(region==="Seleccione la region del despacho")
                {
                    document.forms["FormularioDespacho"]["txtRegion"].style.borderColor = "red";
                    alert('Ingrese la region del despacho');
                    return false;
                }
                if(comuna==="Seleccione la comuna del despacho")
                {
                    document.forms["FormularioDespacho"]["txtComuna"].style.borderColor = "red";
                    alert('Ingrese la comuna del despacho');
                    return false;
                }
                if(calle==0)
                {
                    document.forms["FormularioDespacho"]["txtCalle"].style.borderColor = "red";
                    alert('Ingrese la calle del despacho');
                    return false;
                }
                if(numeracion==0)
                {
                    document.forms["FormularioDespacho"]["txtNumber"].style.borderColor = "red";
                    alert('Ingrese la numeracion del despacho');
                    return false;
                }
            }
            function BuscarRegion()
            {
                var region=document.forms["FormularioDespacho"]["txtRegion"].value;
                region.search("ñ");
                region=region.replace(/ñ/gi,"n");
                $.ajax({
                        type: "GET",
                        url: "https://testservices.wschilexpress.com/georeference/api/v1.0/regions",

                        // Request headers
                        beforeSend: function(xhrObj) {
                            xhrObj.setRequestHeader("Cache-Control", "no-cache");
                            },
                    })
                    .done(function (data) {
                        var iterator = data.regions.values(); 
                        for (let elements of iterator) { 
                            var nombre=elements.regionName.toLowerCase();
                            if(nombre==region.toLowerCase())
                            {
                                var com = document.getElementById("SelectComuna");
                                var id = document.getElementById("resultadoDireccion")
                                com.innerHTML += Comunas(elements.regionId);
                            }
                        }
                    })
                    .fail(function () {
                        alert("Error en la direccion");
                    });
            }
    
            
            function Comunas(id)
            {
             $.ajax({
                type: "GET",
                url: "https://testservices.wschilexpress.com/georeference/api/v1.0/coverage-areas?RegionCode="+id+"&type=0",

                // Request headers
                beforeSend: function(xhrObj) {
                    xhrObj.setRequestHeader("Cache-Control", "no-cache");
                    },
                })
            .done(function (data) {
                var com = document.getElementById("SelectComuna");
                com.innerHTML ="<option>Seleccione la comuna del despacho</option>";
                var iterator = data.coverageAreas; 
                for (let elements of iterator) { 
                    com.innerHTML += ("<option>"+elements.coverageName+"</option>"); 
                }
            })
            .fail(function () {
                alert("Error en la direccions");
            });   
            }
        </script>   
        <%
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            HttpSession s=request.getSession();
            List<Region> regiones= em.createNamedQuery("Region.findAll").getResultList();
            List<Comuna> comunas= em.createNamedQuery("Comuna.findAll").getResultList();
            List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        %>
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
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3" id="formDireccion" >
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Ingrese los datos para el despacho</h3>
            <div class="contact-list-grid">
                <form class="register-form" action="../ComprobarDireccion" name="FormularioDespacho" onsubmit="return ValidarCampos()"  method="Post">
                <div class=" agile-wls-contact-mid">
                    <div class="form-group contact-forms">
                        <select class="form-control" id="SelectRegion" style="width: 100%;"  name="txtRegion" onchange="return BuscarRegion()">
                                <option  disabled selected>
                                    Seleccione la region del despacho
                                </option>
                                <script type="text/javascript">
                                    let select=document.getElementById("SelectRegion");
                                    $.ajax({
                                           type: "GET",
                                           url: "https://testservices.wschilexpress.com/georeference/api/v1.0/regions",

                                           // Request headers
                                           beforeSend: function(xhrObj) {
                                               xhrObj.setRequestHeader("Cache-Control", "no-cache");
                                               },
                                           })
                                       .done(function (data) {
                                           var iterator = data.regions.values(); 
                                           for (let elements of iterator) { 
                                           select.innerHTML += ("<option>" +elements.regionName+ "</option> <br>");
                                           }
                                       });
                                 </script> 
                            </select>
                    </div>
                    <div class="form-group contact-forms">
                        <select class="form-control" style="width: 100%;" id="SelectComuna" name="txtComuna">
                                <option>Seleccione la comuna del despacho</option>
                        </select>
                    </div>
                    <div class="form-group contact-forms">
                        <input class="form-control" type="text" name="txtCalle" placeholder="Calle">                    
                    </div>
                    <div class="form-group contact-forms">
                        <input class="form-control" type="number" name="txtNumber" id="txtNumber" placeholder="Numeracion">                    
                    </div>
                    <button type="submit" class="btn btn-block sent-butnn">Comprobar direccion</button>
                </div>
        </form>
                 <%
                                if(s.getAttribute("errorDireccion")!=null)
                                {%>
                                <div class="error form-group contact-forms">
                                    <% 
                                        out.println(s.getAttribute("errorDireccion"));
                                        s.removeAttribute("errorDireccion");
                                    %>
                                    <h3>
                                        ¿Continuar la compra sin despacho? y resolverlo con un agentte telefonico?
                                    </h3>
                                    <button type="button" class="btn btn-secondary" onclick="location.href='../CompraSinDespacho'" data-dismiss="modal">Comprar sin despacho</button>
                                
                                </div>
                               <% }
                            %>
            </div>
         </div>
            <%
                if(s.getAttribute("Resultado")!=null){
                     RegionChileExpress regionResultado=(RegionChileExpress)s.getAttribute("RegionResultado");
                    ComunaChileExpress comunaResultado=(ComunaChileExpress)s.getAttribute("ComunaResultado");
                    CalleChileExpress calleResultado=(CalleChileExpress)s.getAttribute("CalleResultado");
                    NumeracionChileExpress numeracionResultado=(NumeracionChileExpress)s.getAttribute("DireccionnResultado");
            %>
            <script type="text/javascript">
                document.getElementById("formDireccion").style.display="none";
            </script>
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center  mb-3">Datos del despacho</h3>
            <div class="contact-list-grid">
                <form class="register-form" action="../Cotizar"  method="Post">
                <div class=" agile-wls-contact-mid">
                    <table style="margin: auto">
                        <tr>
                            <td>
                                <div style="text-align: left;">
                                    Region : <%out.println(regionResultado.getRegionName());%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                 <div style="text-align: left;">
                                    Comuna :<%out.println(comunaResultado.getCountyName());%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="text-align: left;">
                                    Calle : <%out.println(calleResultado.getStreetName());%>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div style="text-align: left;">
                                    Numeracion :  <%out.println(numeracionResultado.getNumber());%>
                                </div>
                            </td>
                        </tr>
                        <tr id="last">
                            <td>
                                <div style="text-align: left;">
                                    <img class="dirValida" src="../Imagenes/DireccionValida.png"  alt=""/>
                               </div>
                            </td>
                        </tr>
                    </table>
                    <div class="form-group contact-forms" id="last2">
                        <textarea class="form-control" name="txtAdicionales" placeholder="Informacion adicional &#10; Ejemplo: Departamento 560"></textarea>
                    </div>
                    <button id="last3" type="submit" class="btn btn-block sent-butnn">Cotizar</button>
                </div>
        </form>
                 <%
                                if(s.getAttribute("errorDireccion")!=null)
                                {%>
                                <div class="error form-group contact-forms">
                                    <% 
                                        out.println(s.getAttribute("errorDireccion"));
                                        s.removeAttribute("errorDireccion");
                                    %>
                                    <h3>
                                        ¿Continuar la compra sin despacho? y resolverlo con un agentte telefonico?
                                    </h3>
                                    <button type="button" class="btn btn-secondary" onclick="location.href='../CompraSinDespacho'" data-dismiss="modal">Comprar sin despacho</button>
                                </div>
                               <% }
                            %>
            </div>
         </div>
            <%}%>
      </section>                             
        <%
            if(s.getAttribute("despacho")!=null)
            {
                List<Despacho> despacho= new ArrayList();
                despacho=(List<Despacho>) s.getAttribute("despacho");
                %>
                <script type="text/javascript">
                    document.getElementById("last").style.display="none";
                    document.getElementById("last2").style.display="none";
                    document.getElementById("last3").style.display="none";
                </script>
                <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                <h3 class="title text-center  mb-3">Seleccione el tipo de despacho</h3>
                <div class="contact-list-grid">
                <form class="register-form"   method="Post">
                <div class=" agile-wls-contact-mid">
                       <%
                                int i=0;
                                if(despacho.isEmpty())
                                {%>
                                     <div class="form-group contact-forms">
                                         <button type="button" class="btn btn-block btnChileExpress" onclick="location.href='../CompraSinDespacho'" >
                                                        Lamentablemente nuestro sistema no pudo encontrar un servicio de despacho para su localidad<br>
                                                        pero puede continuar su compra sin despacho, luego un asesor se comunicara con usted para resolver el despacho
                                                        <br>
                                                        <strong>Haga click aqui para continuar la compra sin despacho</strong>
                                                    </button>
                                     </div>  
                                <%}
                                else
                                {
                                      for(Despacho d:despacho)
                                        {%>
                                            <div class="form-group contact-forms">
                                                    <button type="button" class="btn btn-block sent-butnn" onclick="location.href='../Pagar?idDespacho=<%=i%>'">
                                                        <%out.println("Despacho "+ d.getTipo()+" $"+d.getValor());%>
                                                        <%
                                                            if(d.getCompañia().equals("Blue express"))
                                                            {
                                                            %><img src="../Imagenes/blx.png" class="logoDespacho"  alt=""/><%
                                                            }else if(d.getCompañia().equals("Starken"))
                                                            {
                                                            %><img src="../Imagenes/skn.png" class="logoDespacho"  alt=""/><%
                                                            }
                                                        %>
                                                    </button>
                                            </div>                                   
                                        <%i++;}
                                }%>
                              
                        </div>
                </form> 
                    </div>
                </div>
                            <%
            }%>                    
             
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
