<%-- 
    Document   : Stock
    Created on : 23-01-2021, 13:35:54
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Producto"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
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
        List<Producto> productos= new ArrayList();
        if(s.getAttribute("filtroStock")==null)
        {
            productos= em.createNamedQuery("Producto.findAll").getResultList();
        }
        else{
            productos =(List<Producto>) s.getAttribute("filtroStock");
        }
        s.setAttribute("stockProductos", productos);
        List<Producto> StockCorrecto= new ArrayList<>();
        List<Producto> StockBajo= new ArrayList<>();
        List<Producto> StockCritico=new ArrayList<>();
        for(Producto pro:productos)
        {
            if(pro.StockStatus()==1)
            {
                StockCorrecto.add(pro);
            }
            else if(pro.StockStatus()==0)
            {
                StockBajo.add(pro);
            }
            else if(pro.StockStatus()==-1)
            {
                StockCritico.add(pro);
            }   
        }
    %>
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
        <table class="timetable_sub" style="width: 80%;margin-left: 10vw;margin-bottom: 2vw;">
            <tr>
                <th class="subCorrecto" colspan="3" style="font-size: 2vw;text-align: center !important;">
                    Stock correcto
                </th>
            </tr>
            <tr>
                <th class="subCorrecto">
                    Nombre
                </th>
                <th class="subCorrecto">
                    Stock
                </th>
                <th class="subCorrecto">
                    StockCritico
                </th>
                
            </tr>
            <%
                for(Producto pro: StockCorrecto)
                {%>
                <tr>
                    <td class="stickCorrecto">
                        <% out.println(pro.getNombre());%>
                    </td>
                    <td class="stickCorrecto">
                        <% out.println(pro.getStock());%>
                    </td>
                    <td class="stickCorrecto">
                        <% out.println(pro.getStockCritico());%>
                    </td>
                </tr>
               <%}
                if(StockCorrecto.size()==0)
                {%>
                <tr>
                    <td colspan="3" class="stickCorrecto" style="text-align: center !important;">
                        No hay productos con el stock correcto
                    </td>
                </tr>
                <%}
            %>
        </table>
            <table class="timetable_sub" style="width: 80%;margin-left: 10vw;margin-bottom: 2vw;">>          
            <tr>
                <th class="subBajo" colspan="3" style="font-size: 2vw;text-align: center !important;">
                    Stock bajo
                </th>
            </tr>
            <tr>
                <th class="subBajo">
                    Nombre
                </th>
                <th class="subBajo">
                    Stock
                </th>
                <th class="subBajo">
                    StockCritico
                </th>
                
            </tr>
            <%
                for(Producto pro: StockBajo)
                {%>
                <tr>
                    <td class="stickBajo">
                        <% out.println(pro.getNombre());%>
                    </td>
                    <td class="stickBajo">
                        <% out.println(pro.getStock());%>
                    </td>
                    <td class="stickBajo">
                        <% out.println(pro.getStockCritico());%>
                    </td>
                </tr>
               <%}
                if(StockBajo.size()==0)
                               {%>
                               <tr>
                                   <td colspan="3" class="stickBajo" style="text-align: center !important;">
                                       No hay productos con el stock bajo
                                   </td>
                               </tr>
                               <%}
                           %>
        </table>
         <table class="timetable_sub" style="width: 80%;margin-left: 10vw;margin-bottom: 2vw;">
            <tr>
                <th class="subCritico" colspan="3" style="font-size: 2vw;text-align: center !important;">
                    Stock critico
                </th>
            </tr>
            <tr>
                <th class="subCritico">
                    Nombre
                </th>
                <th class="subCritico">
                    Stock
                </th>
                <th class="subCritico">
                    StockCritico
                </th>
                
            </tr>
            <%
                for(Producto pro: StockCritico)
                {%>
                <tr>
                    <td class="stickCritico">
                        <% out.println(pro.getNombre());%>
                    </td>
                    <td class="stickCritico">
                        <% out.println(pro.getStock());%>
                    </td>
                    <td class="stickCritico">
                        <% out.println(pro.getStockCritico());%>
                    </td>
                </tr>
             <%}
                if(StockCritico.size()==0)
                               {%>
                               <tr>
                                   <td colspan="3" class="stickCritico" style="text-align: center !important;">
                                       No hay productos con el stock critico
                                   </td>
                               </tr>
                               <%}
                           %>
        </table>
        <form action="../StockExcel" method="GET">
                <button type="submit" class="btn" style="background-color: black;color: white;width: 80%;margin-left: 10%;margin-bottom:2vw;">
                    <span id="excel" style="font-size: 22px;">Exportar a Excel</span>
                    <img src="../Imagenes/excel.png" style="width: 4%;" alt=""/>
                </button>
           </form> 
        </section>
    </body>
</html>
