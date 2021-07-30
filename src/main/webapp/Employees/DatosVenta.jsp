<%-- 
    Document   : DatosVenta
    Created on : 26-11-2020, 21:46:33
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Comuna"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Region"%>
<%@page import="Clases.Region"%>
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
         <!-- //Modal 1-->
      <!--jQuery-->
      <script src="../web/js/jquery-2.2.3.min.js"></script>
      <!-- newsletter modal -->
      <!-- cart-js -->
      <!-- //cart-js -->
      <!-- price range (top products) -->
      <script src="../web/js/jquery-ui.js"></script>
      
      <!-- FlexSlider -->
      <script src="../web/js/jquery.flexslider.js"></script>
     
      <!-- //here ends scrolling icon -->
      <!-- //smooth-scrolling-of-move-up -->
      <!--bootstrap working-->
      <script src="../web/js/bootstrap.min.js"></script>
      <!-- //bootstrap working--> 
    <script type="text/javascript">
    function Appear()
        {
            var cierre= event.target.value;
            if(cierre==="on")
            {
                $("#despachoRegion").addClass('despachoSi');
                $("#despachoComuna").addClass('despachoSi');
                $("#despachoDireccion").addClass('despachoSi');
            }else
            {
                $("#despachoRegion").removeClass('despachoSi');
                $("#despachoComuna").removeClass('despachoSi');
                $("#despachoDireccion").removeClass('despachoSi');
                OcultarResto("a0");
                document.getElementById("SelectRegion").value="Seleccione su region de residencia...";
            }
            
        }
        function AppearPass()
        {
            var cierre= event.target.value;
            if(cierre==="on")
            {
                $("#user").addClass('despachoSi');
                $("#user2").addClass('despachoSi'); 
            }else
            {
                $("#user").removeClass('despachoSi');
                $("#user2").removeClass('despachoSi');
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
    <style>
        .despacho{
            display: none;
        }
        .despachoSi{
            display: block;
        }
        .user{
            display: none;
        }
    </style>
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
        
        List<Region> regiones= em.createNamedQuery("Region.findAll").getResultList();
        List<Comuna> comunas= em.createNamedQuery("Comuna.findAll").getResultList();
        List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
    %>
    <body>
         <form class="register-form" action="../AgregarCliente" onsubmit="return Validar()" name="FormularioCliente" method="Post">
            <table>
                <tr>
                    <td>
                        Rut
                    </td>
                    <td>
                        <input type="text" name="txtRut">
                    </td>
                </tr>
                <tr>
                    <td>
                        Primer nombre
                    </td>
                    <td>
                        <input type="text" name="txtPrimerNombre">
                    </td>
                </tr>
                <tr>
                    <td>
                        Segundo nombre
                    </td>
                    <td>
                        <input type="text" name="txtSegundoNombre">
                    </td>
                </tr>
                <tr>
                    <td>
                        Apellido paterno
                    </td>
                    <td>
                        <input type="text" name="txtApellidoPaterno">
                    </td>
                </tr>
                <tr>
                    <td>
                        Apellido materno
                    </td>
                    <td>
                        <input type="text" name="txtApellidoMaterno">
                    </td>
                </tr>
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <input type="email" name="txtEmail">
                    </td>
                </tr>
                <tr>
                    <td>
                        Telefono
                    </td>
                    <td>
                        <input type="text" name="txtTelefono">
                    </td>
                </tr>
                <tr>
                    <td>
                        Opciones de despacho
                    </td>
                    <td>
                        <input type="radio" name="txtDespacho" onchange="return Appear()" value="on">Despacho a domicilio
                        <input type="radio" name="txtDespacho" onchange="return Appear()" value="off">Retiro en tienda
                    </td>
                </tr>
                <tr class="despacho" id="despachoRegion" name="despachoRegion">
                    <td>
                        Region
                    </td>
                    <td>
                        <select id="SelectRegion" onchange="Cambiar()" name="txtRegion">
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
                    </td>
                </tr>
                <tr class="despacho" id="despachoComuna" name="despachoComuna">
                    <td>
                        Comuna
                    </td>
                    <td>
                        <%
                            int total=0;
                            for(Region r:regiones)
                            {
                                total++;
                                List<Comuna> c = r.getComunaList();
                                %>
                                <select id="txtComuna<%=r.getIdregion()%>" name="txtComuna<%=r.getIdregion()%>" style="display: none">
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
                                
                            }
                        %>
                        <input type="hidden" name="txtTotal" id="txtTotal" value="<%=total%>">
                    </td>
                </tr>
                <tr class="despacho" id="despachoDireccion" name="despachoDireccion">
                    <td>
                        Direccion
                    </td>
                    <td>
                        <input type="text" name="txtDireccion">
                    </td>
                </tr>
                <tr>
                    <td>¿Desea guardar sus datos para futuras compras?</td>
                    <td>
                        <input type="radio" name="txtUser" onchange="AppearPass()" value="on">Si
                        <input type="radio" name="txtUser" onchange="AppearPass()" value="off">No
                    </td>
                </tr>
                <tr class="despacho" id="user">
                    <td>
                        Contraseña
                    </td>
                    <td>
                        <input type="password" name="txtPass">
                    </td>
                </tr>
                <tr class="despacho" id="user2">
                    <td>
                        Confirme contraseña
                    </td>
                    <td>
                        <input type="password" name="txtPass2">
                    </td>
                </tr>
                <tr>   
                    <td colspan="2">
                        <input class="btn-success" type="submit" value="Registrarse" style="width: 100%;margin: 1vw;">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
