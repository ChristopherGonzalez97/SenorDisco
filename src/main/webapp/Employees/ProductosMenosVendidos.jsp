<%-- 
    Document   : ProductosMenosVendidos
    Created on : 24-01-2021, 15:21:41
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="Estadistica.Estadisticas"%>
<%@page import="Estadistica.ProductoVenta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
            List<ProductoVenta> masVendidas = new ArrayList<ProductoVenta>();
            if(s.getAttribute("filtroMasVendido")!=null)
            {
                masVendidas= (List<ProductoVenta>) s.getAttribute("filtroMasVendido");
            }
            else
            {
                 masVendidas = Estadisticas.MenosVendidos(); 
            }
           s.setAttribute("ProductosExcelMasMenos", masVendidas);
        %>
         <script>
    function Cambiar()
    {
        var seleccion = event.target.value;
        Hide(seleccion);
    }
    function Hide(o)
    {
        document.getElementById("fechaAFecha").style.display="none";
        document.getElementById("categoria").style.display="none";
        document.getElementById(o).style.display="inline-block";
    }
    function ValidarFechaDesde()
    {
        var desde=document.forms["FormDesde"]["fechaInicial"].value;
        var hasta=document.forms["FormDesde"]["fechaFinal"].value;
        if( desde == 0)
        {
            document.forms["FormDesde"]["fechaInicial"].style.borderColor = "red";
            alert('Ingrese la fecha inicial');
            return false; 
        }
        if(hasta==0)
        {
            document.forms["FormDesde"]["fechaFinal"].style.borderColor = "red";
            alert('Ingrese la fecha final');
            return false; 
        }
    }
    function ValidarCategoria()
    {
        var desde=document.forms["FormCategoria"]["txtCategoria"].value;
        if(desde=="Categorias")
        {
            document.forms["FormCategoria"]["txtCategoria"].style.borderColor = "red";
            alert('Seleccione una categoria');
            return false; 
        }
    }
</script>
        <body>
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
             <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom: 2.5em;margin-left: 8px;" onclick="location.href='Estadisticas.jsp'">
                  Volver
          </button>
            <div style="margin: 3vw;">
                <select class="form-control" onchange="Cambiar()" name="txtFiltro">
                <option>
                    Seleccione Filtro
                </option>
                <option value="fechaAFecha">
                    Desde fecha a fecha
                </option>
                <option value="categoria">
                    Categoria
                </option>
                </select>
                <form action="../VendidoMenosFecha" onsubmit="return ValidarFechaDesde()" method="POST" name="FormDesde"  id="fechaAFecha" style="display: none">
                <table>
                    <tr>
                        <td>
                            Fecha desde
                        </td>
                        <td>
                            <input class="form-control" type="date" name="fechaInicial">
                        </td>
                        <td>
                            Fecha hasta
                        </td>
                        <td>
                            <input class="form-control" type="date" name="fechaFinal">
                        </td>
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
                <form action="../VendidosMenosCategoria" onsubmit="return ValidarCategoria()" method="POST" name="FormCategoria" id="categoria" style="display: none" >
                <table>
                    <tr>
                        <td>
                            Seleccione categoria
                        </td>
                        <td>
                            <select name="txtCategoria" class="form-control">
                                <option disabled selected>
                                    Categorias
                                </option>
                                <%
                                    for(FamiliaProducto cat:familia)
                                    {%>
                                    <option>
                                        <% 
                                            out.println(cat.getNombre());
                                        %>
                                    </option>
                                    <%}
                                %>
                            </select>
                        </td>
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
            </div>
            <table class="timetable_sub" style="width: 80%;margin-left: 10vw;margin-bottom: 2vw;">
            <tr>
                <th class="sub" colspan="5" style="font-size: 2vw;text-align: center !important;">
                    Productos menos vendidos
                </th>
            </tr>
            <tr>
                <th  class="sub">
                    Id
                </th>
                <th class="sub">
                    Nombre
                </th>
                <th  class="sub">
                    Categoria
                </th>
                <th class="sub">
                    Cantidad de ventas
                </th>
                <th class="sub">
                    Stock actual
                </th>
            </tr>
                <% 
                    for(ProductoVenta pro :masVendidas)
                    {%>
                    <tr>
                        <td class="stick">
                            <% out.println(pro.getProducto().getIdproducto());%>
                        </td>
                        <td class="stick">
                            <% out.println(pro.getProducto().getNombre());%>
                        </td>
                        <td class="stick">
                            <% out.println(pro.getProducto().getFamiliaProductoIdfamiliaProducto().getNombre());%>
                        </td>
                        <td class="stick">
                            <% out.println(pro.getCantidadVendidos());%>
                        </td>
                        <td class="stick">
                            <% out.println(pro.getProducto().getStock());%>
                        </td>
                    </tr>
                   <%}
                %>
        </table>
        <form action="../MasMenosVendidosExcel" method="GET">
                <button type="submit" class="btn" style="background-color: black;color: white;width: 80%;margin-left: 10%;margin-bottom:2vw;">
                    <span id="excel" style="font-size: 22px;">Exportar a Excel</span>
                    <img src="../Imagenes/excel.png" style="width: 4%;" alt=""/>
                </button>
           </form> 
        </section>
    </body>
</html>