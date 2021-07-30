<%-- 
    Document   : AgregarProducto
    Created on : 24-11-2020, 13:14:55
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Marca"%>
<%@page import="Clases.Grupo"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="Clases.Fabricante"%>
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
        <title>JSP Page</title>
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
     <script type="text/javascript">
        function Validacion()
        {
            var nombreProducto=document.forms["FormularioProducto"]["txtNombreProducto"].value;
            var descripcion=document.forms["FormularioProducto"]["txtDescripcion"].value;
            var precioVenta=document.forms["FormularioProducto"]["txtPrecioVenta"].value;
            var precioCompra=document.forms["FormularioProducto"]["txtPrecioCompra"].value;
            var precioVendedor=document.forms["FormularioProducto"]["txtPrecioVendedor"].value;
            var precioDistribuidor=document.forms["FormularioProducto"]["txtPrecioDistribuidor"].value;
            var stockInicial=document.forms["FormularioProducto"]["txtStockInicial"].value;
            var stockCritico=document.forms["FormularioProducto"]["txtStockCritico"].value;
            var imagen=document.forms["FormularioProducto"]["flImagen"].value;
            var fabricante =document.forms["FormularioProducto"]["txtFabricante"].value;
            var marca =document.forms["FormularioProducto"]["txtMarca"].value;
            var posicionamiento =document.forms["FormularioProducto"]["txtPosicion"].value;
            var familia =document.forms["FormularioProducto"]["txtFamilia"].value;
            var diametro =document.forms["FormularioProducto"]["txtDiametro"].value;
            var peso =document.forms["FormularioProducto"]["txtPeso"].value;
            var alto =document.forms["FormularioProducto"]["txtAlto"].value;
            var ancho =document.forms["FormularioProducto"]["txtAncho"].value;
            var largo =document.forms["FormularioProducto"]["txtLargo"].value;
            var grupo = document.forms["FormularioProducto"]["btnGrupo"].checked;
            var altoProducto =document.forms["FormularioProducto"]["txtAltoProducto"].value;
            var anchoProducto =document.forms["FormularioProducto"]["txtAnchoProducto"].value;
            var largoProducto =document.forms["FormularioProducto"]["txtLargoProducto"].value;
            var btnVideo=document.forms["FormularioProducto"]["btnVideo"].checked; 
            if(nombreProducto==0)
            {
                document.forms["FormularioProducto"]["txtNombreProducto"].style.borderColor = "red";
                alert('Ingrese el nombre del producto');
                return false;
            }
            if(descripcion==0)
            {
                document.forms["FormularioProducto"]["txtDescripcion"].style.borderColor = "red";
                alert('Ingrese la descripcion del producto');
                return false;
            }
            
            if(peso==0)
            {
                document.forms["FormularioProducto"]["txtPeso"].style.borderColor = "red";
                alert('Ingrese el peso del paquete');
                return false;
            }
            if(ancho==0)
            {
                document.forms["FormularioProducto"]["txtAncho"].style.borderColor = "red";
                alert('Ingrese el ancho del paquete');
                return false;
            }
            if(largo==0)
            {
                document.forms["FormularioProducto"]["txtLargo"].style.borderColor = "red";
                alert('Ingrese el largo del paquete');
                return false;
            }
            if(alto==0)
            {
                document.forms["FormularioProducto"]["txtAlto"].style.borderColor = "red";
                alert('Ingrese el alto del paquete');
                return false;
            }
            if(anchoProducto==0)
            {
                document.forms["FormularioProducto"]["txtAnchoProducto"].style.borderColor = "red";
                alert('Ingrese el ancho del paquete');
                return false;
            }
            if(largoProducto==0)
            {
                document.forms["FormularioProducto"]["txtLargoProducto"].style.borderColor = "red";
                alert('Ingrese el largo del paquete');
                return false;
            }
            if(altoProducto==0)
            {
                document.forms["FormularioProducto"]["txtAltoProducto"].style.borderColor = "red";
                alert('Ingrese el alto del paquete');
                return false;
            }
            
            if(btnVideo==false)
            {
                var link =document.forms["FormularioProducto"]["txtVideo"].value;
                
                if(link==0)
                {
                    document.forms["FormularioProducto"]["txtVideo"].style.borderColor = "red";
                    document.forms["FormularioProducto"]["btnVideo"].style.borderColor = "red";
                    alert('Ingrese el link del video o seleccione la casilla correspondiente');
                    return false;
                }
            }
            if(diametro==0)
            {
                document.forms["FormularioProducto"]["txtDiametro"].style.borderColor = "red";
                alert('Ingrese el diametro del paquete');
                return false;
            }
            if(precioVenta==0)
            {
                document.forms["FormularioProducto"]["txtPrecioVenta"].style.borderColor = "red";
                alert('Ingrese el precio de venta');
                return false;
            }
            if(precioCompra==0)
            {
                document.forms["FormularioProducto"]["txtPrecioCompra"].style.borderColor = "red";
                alert('Ingrese el precio de compra');
                return false;
            }
            if(precioDistribuidor==0)
            {
                document.forms["FormularioProducto"]["txtPrecioDistribuidor"].style.borderColor = "red";
                alert('Ingrese el precio de distribuidor');
                return false;
            }
            if(precioVendedor==0)
            {
                document.forms["FormularioProducto"]["txtPrecioVendedor"].style.borderColor = "red";
                alert('Ingrese el precio del vendedor');
                return false;
            }
            if(stockInicial.length==0 || stockInicial<0)
            {
                document.forms["FormularioProducto"]["txtStockInicial"].style.borderColor = "red";
                alert('Ingrese el stock inicial');
                return false;
            }
            if(stockCritico==0)
            {
                document.forms["FormularioProducto"]["txtStockCritico"].style.borderColor = "red";
                alert('Ingrese el stock critico');
                return false;
            }
            if(imagen==0)
            {
                document.forms["FormularioProducto"]["flImagen"].style.borderColor = "red";
                alert('Ingrese la imagen del producto');
                return false;
            }
            if(fabricante=="Seleccione...")
            {
                document.forms["FormularioProducto"]["txtFabricante"].style.borderColor = "red";
                alert('Ingrese el fabricante del producto');
                return false;
            }
             if(familia=="Seleccione...")
            {
                document.forms["FormularioProducto"]["txtFamilia"].style.borderColor = "red";
                alert('Ingrese la familia correspondiente al producto');
                return false;
            }
            if(marca=="Seleccione...")
            {
                document.forms["FormularioProducto"]["txtMarca"].style.borderColor = "red";
                alert('Ingrese la marca correspondiente al producto');
                return false;
            }
            if(posicionamiento=="Seleccione...")
            {
                document.forms["FormularioProducto"]["txtPosicion"].style.borderColor = "red";
                alert('Ingrese el posicionamiento de la imagen');
                return false;
            }
            if(grupo==true)
            {
                var grupo2=document.forms["FormularioProducto"]["txtGrupo"].value;
                var talla=document.forms["FormularioProducto"]["txtTalla"].value;
                if(grupo2=="Seleccione...")
                {
                    document.forms["FormularioProducto"]["txtGrupo"].style.borderColor = "red";
                    alert('Seleccione el grupo correspondiente al producto');
                    return false;
                }
                if(talla==0)
                {
                    document.forms["FormularioProducto"]["txtGrupo"].style.borderColor = "red";
                    alert('Ingrese la talla del producto');
                    return false;
                }
                
            }
        }
        function mostrarGrupos()
        {
            var grupo = document.forms["FormularioProducto"]["btnGrupo"].checked;
            if(grupo==false)
            {
                document.getElementById("grupo1").style.display="none";
                document.getElementById("grupo2").style.display="none";
            }else{
                document.getElementById("grupo1").style.display="contents";    
                document.getElementById("grupo2").style.display="revert";
            }
            
        }
    </script>
</head>
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
        List<Fabricante> fabricantes=em.createNamedQuery("Fabricante.findAll").getResultList();
        List<Grupo> grupos =em.createNamedQuery("Grupo.findAll").getResultList();
        List<Marca> marcas = em.createNamedQuery("Marca.findAll").getResultList();
        List<FamiliaProducto> familias = em.createNamedQuery("FamiliaProducto.findAll").getResultList(); 
%>
    <body>
         <div class="header-outs" id="home" style="padding-bottom: 12vw;">
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
         <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom: 2.5em;margin-left: 8px;" onclick="location.href='Productos.jsp'">
                  Volver
          </button>
        <div id="formulario" class="formulario">
            
            <h2>Registro de Producto</h2>
            <%
                if(s.getAttribute("errorMessage")!=null)
                {%>
                <h3 id="error">
                    <% out.println(s.getAttribute("errorMessage")); %>
                </h3>
                <%
                    s.removeAttribute("errorMessage");}
            %>
            <form class="register-form" action="../AgregarProducto" onsubmit="return Validacion()" name="FormularioProducto"  method="Post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                        Nombre del producto
                    </td>
                    <td>
                        <input type="text" name="txtNombreProducto" placeholder="Nombre del producto">
                    </td>
                </tr>
                <tr> 
                    <td>
                       Descripcion 
                    </td>
                    <td>
                        <textarea style="width: 100%;resize: none;background-color: transparent;" placeholder="Descripcion del producto" name="txtDescripcion"></textarea>
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Diametro
                    </td>
                    <td>
                        <input type="number" placeholder="Diametro" name="txtDiametro">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Peso
                    </td>
                    <td>
                        <input type="number" placeholder="Peso (Kg)" name="txtPeso" step="0.1">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Largo
                    </td>
                    <td>
                        <input type="number" placeholder="Largo (cm)" name="txtLargo">
                    </td>  
                </tr>
                <tr> 
                    <td>
                        Ancho
                    </td>
                    <td>
                        <input type="number" placeholder="Ancho (cm)" name="txtAncho">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Alto
                    </td>
                    <td>
                        <input type="number" placeholder="Alto (cm)" name="txtAlto">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Precio de venta
                    </td>
                    <td>
                        <input type="number" placeholder="Precio de venta" name="txtPrecioVenta">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Precio de compra
                    </td>
                    <td>
                        <input type="number" placeholder="Precio de compra" name="txtPrecioCompra">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Precio de vendedor
                    </td>
                    <td>
                        <input type="number" placeholder="Precio de compra" name="txtPrecioVendedor">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Precio de distribuidor
                    </td>
                    <td>
                        <input type="number" placeholder="Precio de distribuidor" name="txtPrecioDistribuidor">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Stock inicial
                    </td>
                    <td>
                        <input type="number" placeholder="Stock inicial" name="txtStockInicial">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Stock critico
                    </td>
                    <td>
                        <input type="number" placeholder="Stock critico" name="txtStockCritico">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Video
                    </td>
                    <td>
                        <input type="text" placeholder="Link del video del producto" name="txtVideo">
                    </td>
                    <td>
                        <input type="checkbox"  name="btnVideo"> Producto sin video
                    </td>
                </tr>
                <tr> 
                    <td>
                       Alto del producto
                    </td>
                    <td>
                        <input type="number" placeholder="Alto del producto" name="txtAltoProducto">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Ancho del producto
                    </td>
                    <td>
                        <input type="number" placeholder="Ancho del producto" name="txtAnchoProducto">
                    </td>  
                </tr>
                <tr> 
                    <td>
                       Largo del producto
                    </td>
                    <td>
                        <input type="number" placeholder="Largo del producto" name="txtLargoProducto">
                    </td>  
                </tr>
                <tr>
                    <td>
                        Imagen del producto
                    </td>
                    <td>
                        <input type="file" name="flImagen">
                    </td>
                </tr>
                <tr>
                    <td>
                        Posicionamiento imagen
                    </td>
                    <td>
                        <select name="txtPosicion">
                            <option selected="true" disabled="true">
                                Seleccione...
                            </option>
                            <option value="1">Horizontal</option>
                            <option value="2">Vertical</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        Familia del producto
                    </td>
                    <td>
                        <select name="txtFamilia">
                            <option>Seleccione...</option>
                            <%
                                for(FamiliaProducto f:familias)
                                {
                                    
                                    out.print("<option value='"+f.getIdfamiliaProducto()+"'>"+f.getNombre()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                    <td>
                        <button type="button" class="btn-info" onclick="location.href='AgregarFamilia.jsp'">Agregar nueva familia de productos</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        Fabricante
                    </td>
                    <td>
                        <select name="txtFabricante">
                            <option>Seleccione...</option>
                            <%
                                for(Fabricante f:fabricantes)
                                {
                                    
                                    out.print("<option value='"+f.getRut()+"'>"+f.getNombre()+"</option>");
                                }
                            %>
                        </select>
                    </td>
                    <td>
                        <button type="button" class="btn-info" onclick="location.href='AgregarFabricante.jsp'">Agregar nuevo fabricante</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        Marca
                    </td>
                    <td>
                         <select name="txtMarca">
                             <option disabled="true" selected="true">
                                Seleccione...
                            </option>
                            <%
                                for(Marca m:marcas)
                                {%>
                                <option value="<%=m.getIdMarca()%>">
                                       <%
                                           out.println(m.getNombre());
                                       %>
                                </option>   
                                <%}
                            %>
                        </select>
                    </td>
                    <td>
                        <button type="button" class="btn-info" onclick="location.href='AgregarMarca.jsp'">Agregar nueva Marca</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        Pertenece a un grupo?
                    </td>
                    <td>
                        <input type="checkbox" name="btnGrupo" onclick="mostrarGrupos()">
                    </td>
                </tr>
                <tr id="grupo1" style="display: none;">
                    <td>
                        Elija el grupo
                    </td>
                    <td>
                        <select name="txtGrupo">
                            <option disabled="true" selected="true">
                                Seleccione...
                            </option>
                            <%
                                for(Grupo gru:grupos)
                                {%>
                                <option value="<%=gru.getIdgrupo()%>"><% out.println(gru.getNombreGrupo());%></option>
                                <%}
                            %>
                        </select>
                    </td>
                    <td>
                        <button type="button" class="btn-info" onclick="location.href='AgregarGrupo.jsp'">Agregar nuevo grupo</button>
                    </td>
                </tr>
                <tr id="grupo2" style="display: none;">
                    <td>
                        Talla
                    </td>
                    <td>
                        <input type="text" placeholder="Talla" name="txtTalla" > 
                    </td>
                </tr>
                <tr>
                    <td  colspan="1.5" >
                        <input type="reset" style="width: 100%;margin-top: 2vw;margin-bottom: 2vw" class="btn-danger btn-lg" value="Limpiar">
                    </td>
                    <td  colspan="1.5">
                        <input type="submit" style="width: 100%;margin-top: 2vw;margin-bottom: 2vw;" class="btn-success btn-lg" value="Aceptar">
                    </td>
                </tr>
            </table>
        </form>
        </div>
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
                     <form action="#" method="post">
                        <div class="fields-grid">
                           <div class="styled-input">
                              <input type="email" placeholder="Email" name="txtEmail" required="">
                           </div>
                           <div class="styled-input">
                              <input type="password" placeholder="Contraseña" name="password" required="">
                           </div>
                           <button type="submit" class="btn subscrib-btnn">Ingresar</button>
                           O
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
      </div>                  
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
