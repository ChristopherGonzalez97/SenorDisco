<%-- 
    Document   : EditarProducto
    Created on : 23-10-2020, 17:43:17
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="Clases.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <script type="text/javascript">
        function Vaciar()
        {
            var nombre= event.target.name;
            document.forms["FormularioEdicion"][nombre].value="";
        }
        function Validacion()
        {
            var nombreProducto=document.forms["FormularioEdicion"]["txtNombreProducto"].value;
            var descripcion=document.forms["FormularioEdicion"]["txtDescripcion"].value;
            var precioVenta=document.forms["FormularioEdicion"]["txtPrecioVenta"].value;
            var precioVendedor=document.forms["FormularioEdicion"]["txtPrecioVendedor"].value;
            var precioCompra=document.forms["FormularioEdicion"]["txtPrecioCompra"].value;
            var stockInicial=document.forms["FormularioEdicion"]["txtStock"].value;
            var stockCritico=document.forms["FormularioEdicion"]["txtStockCritico"].value;
            var largo=document.forms["FormularioEdicion"]["txtLargo"].value;
            var ancho=document.forms["FormularioEdicion"]["txtAncho"].value;
            var alto=document.forms["FormularioEdicion"]["txtAlto"].value;
            var largoProducto=document.forms["FormularioEdicion"]["txtLargoProducto"].value;
            var anchoProducto=document.forms["FormularioEdicion"]["txtAnchoProducto"].value;
            var altoProducto=document.forms["FormularioEdicion"]["txtAltoProducto"].value;
            var precioDistribuidor=document.forms["FormularioEdicion"]["txtPrecioDistribuidor"].value;
            var diametro=document.forms["FormularioEdicion"]["txtDiametro"].value;
            var peso=document.forms["FormularioEdicion"]["txtPeso"].value;
            
             if(nombreProducto==0)
            {
                document.forms["FormularioEdicion"]["txtNombreProducto"].style.borderColor = "red";
                alert('Ingrese el nombre del producto');
                return false;
            }
            if(descripcion==0)
            {
                document.forms["FormularioEdicion"]["txtDescripcion"].style.borderColor = "red";
                alert('Ingrese la descripcion del producto');
                return false;
            }
            if(precioVenta==0)
            {
                document.forms["FormularioEdicion"]["txtPrecioVenta"].style.borderColor = "red";
                alert('Ingrese el precio de venta');
                return false;
            }
            if(precioDistribuidor==0)
            {
                document.forms["FormularioEdicion"]["txtPrecioDistribuidor"].style.borderColor = "red";
                alert('Ingrese el precio del distribuidor');
                return false;
            }
            if(precioCompra==0)
            {
                document.forms["FormularioEdicion"]["txtPrecioCompra"].style.borderColor = "red";
                alert('Ingrese el precio de compra');
                return false;
            }
            if(alto==0)
            {
                document.forms["FormularioEdicion"]["txtAlto"].style.borderColor = "red";
                alert('Ingrese el alto del paquete');
                return false;
            }
            if(largo==0)
            {
                document.forms["FormularioEdicion"]["txtLargo"].style.borderColor = "red";
                alert('Ingrese el largo del paquete');
                return false;
            }
            if(ancho==0)
            {
                document.forms["FormularioEdicion"]["txtAncho"].style.borderColor = "red";
                alert('Ingrese el ancho del paquete');
                return false;
            }
            if(altoProducto==0)
            {
                document.forms["FormularioEdicion"]["txtAltoProducto"].style.borderColor = "red";
                alert('Ingrese el alto del producto');
                return false;
            }
            if(largoProducto==0)
            {
                document.forms["FormularioEdicion"]["txtLargoProducto"].style.borderColor = "red";
                alert('Ingrese el largo del producto');
                return false;
            }
            if(anchoProducto==0)
            {
                document.forms["FormularioEdicion"]["txtAnchoProducto"].style.borderColor = "red";
                alert('Ingrese el ancho del producto');
                return false;
            }
             if(precioVendedor==0)
            {
                document.forms["FormularioEdicion"]["txtPrecioVendedor"].style.borderColor = "red";
                alert('Ingrese el precio del vendedor');
                return false;
            }
            if(peso==0)
            {
                document.forms["FormularioEdicion"]["txtPeso"].style.borderColor = "red";
                alert('Ingrese el peso del producto');
                return false;
            }
             if(diametro.length==0 || diametro<0)
            {
                document.forms["FormularioEdicion"]["txtDiametro"].style.borderColor = "red";
                alert('Ingrese el diametro del producto');
                return false;
            }
            if(stockInicial.length==0 || stockInicial<0)
            {
                document.forms["FormularioEdicion"]["txtStock"].style.borderColor = "red";
                alert('Ingrese el stock');
                return false;
            }
            if(stockCritico==0)
            {
                document.forms["FormularioEdicion"]["txtStockCritico"].style.borderColor = "red";
                alert('Ingrese el stock critico');
                return false;
            }
            
        }
        function Etiqueta()
        {
            var nombre= document.getElementById("inputval").textContent;
            var etiqueta = nombre.split(/[\\-_]/);
            var img = etiqueta[2];
            document.getElementById("inputval").textContent=img;
        }
        function CambioImg()
        {
            // Get the first file in the FileList object
            var imageFile = document.getElementById('imagen').files[0];
            // get a local URL representation of the image blob
            var url = window.URL.createObjectURL(imageFile);
            // Now use your newly created URL!
            document.getElementById("imgActual").src=url;
        }
    </script>
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
        String url = request.getQueryString();
        String[] posiciones = url.split("=");
        String id = posiciones[1];
        EntityManagerFactory emf ;
        emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
        EntityManager em = emf.createEntityManager();
        List<Producto> p = em.createNamedQuery("Producto.findAll").getResultList();
        List<FamiliaProducto> familias = em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        Producto producto=new Producto();
        for(Producto pro :p)
        {
            if(pro.getIdproducto()==Integer.parseInt(id))
            {
                producto = pro;
            }
        }
    %>
    <body>
        <div class="header-outs" id="home" style="padding-bottom: 11vw;">
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
        <div>
             <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom:0;margin-left: 8px;" onclick="location.href='Productos.jsp'">
                  Volver
          </button>
        </div>
        <div id="formulario" class="formulario">
            <h1>Editando <% out.println(producto.getNombre()); %></h1>
        <form action="../EditarProducto" name="FormularioEdicion" method="POST"  enctype="multipart/form-data" onsubmit="return Validacion()">
            <table>
                <tr>
                    <td rowspan="12" style="width: 400px">
                        <div>
                            <label for="imagen" >
                                <img src="<%String urlq = "data:image/png;base64," + Base64.getEncoder().encodeToString(producto.getImagenList().get(0).getImagen());
                                     out.print(urlq);%>" height="300"  width="95%" id="imgActual">
                            </label>
                                     <button style="width: 100%" type="button" class="btn-info" onclick="location.href='AdministrarImagenes.jsp?id=<%=producto.getIdproducto()%>'">Administrar fotos</button>
                        </div> 
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" value="<%=producto.getIdproducto() %>" name="txtId">
                        Nombre
                    </td>
                    <td>
                        <input type="text" onclick="Vaciar()" name="txtNombreProducto" value="<%= producto.getNombre() %>" >
                    </td>
                </tr>
                <tr>
                    <td>
                        Descripcion
                    </td>
                    <td>
                        <textarea name="txtDescripcion" onclick="Vaciar()" style="resize: none;height: 141px"><% out.println(producto.getDescripcion()); %></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio venta
                    </td>
                    <td>
                        <input type="number" name="txtPrecioVenta" value="<%= producto.getPrecioVenta()%>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio compra
                    </td>
                    <td>
                        <input type="number" name="txtPrecioCompra" value="<%= producto.getPrecioCompra() %>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio vendedor
                    </td>
                    <td>
                        <input type="number" name="txtPrecioVendedor" value="<%= producto.getPrecioVendedor()%>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio distribuidor
                    </td>
                    <td>
                        <input type="number" name="txtPrecioDistribuidor" value="<%= producto.getPrecioDistribuidor() %>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        Alto paquete
                    </td>
                    <td>
                        <input type="number" name="txtAlto" value="<%= producto.getAltura() %>" onclick="Vaciar()">cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Ancho paquete
                    </td>
                    <td>
                        <input type="number" name="txtAncho" value="<%= producto.getAncho()%>" onclick="Vaciar()">cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Largo paquete
                    </td>
                    <td>
                        <input type="number" name="txtLargo" value="<%= producto.getLargo()%>" onclick="Vaciar()">cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Alto producto
                    </td>
                    <td>
                        <input type="number" name="txtAltoProducto" value="<%= producto.getAltoProducto()%>" onclick="Vaciar()">cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Ancho producto
                    </td>
                    <td>
                        <input type="number" name="txtAnchoProducto" value="<%= producto.getAnchoProducto()%>" onclick="Vaciar()">cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Largo producto
                    </td>
                    <td>
                        <input type="number" name="txtLargoProducto" value="<%= producto.getLargoProducto()%>" onclick="Vaciar()"> cm
                    </td>
                </tr>
                <tr>
                    <td>
                        Diametro
                    </td>
                    <td>
                        <input type="number" name="txtDiametro" value="<%= producto.getDiametro()%>" onclick="Vaciar()"> cm.
                    </td>
                </tr>
                <tr>
                    <td>
                        Peso
                    </td>
                    <td>
                        <input type="number" name="txtPeso" value="<%= producto.getPeso()%>" onclick="Vaciar()"> Kg
                    </td>
                </tr>
                
                <tr>
                    <td>
                        Stock
                    </td>
                    <td>
                        <input type="number" name="txtStock" value="<%= producto.getStock()%>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        Stock critico
                    </td>
                    <td>
                        <input type="number" name="txtStockCritico" value="<%= producto.getStockCritico() %>" onclick="Vaciar()">
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="button" onclick="location.href='Productos.jsp'" style="width: 100%;margin: 1vw;" class="btn-warning">
                            Volver
                        </button>
                    </td>
                    <td>
                        <input style="width: 100%;margin: 2vw;" class="btn-success" type="submit" value="Editar">
                    </td>
                </tr>
            </table>
        </form>
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
    </body>
</html>
