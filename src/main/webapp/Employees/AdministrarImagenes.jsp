<%-- 
    Document   : AdministrarImagenes
    Created on : 19-11-2020, 17:34:40
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="java.util.Base64"%>
<%@page import="Clases.Imagen"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Producto"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
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
      <script>
          function Validar()
          {
               var image=document.forms["FormImagen"]["flImagen"].value;
               var posicion=document.forms["FormImagen"]["txtPosicion"].value;
            
             if(image==0)
            {
                document.forms["FormImagen"]["flImagen"].style.borderColor = "red";
                alert('Ingrese la nueva imagen');
                return false;
            }
             if(posicion=="Seleccione...")
            {
                document.forms["FormImagen"]["txtPosicionamiento"].style.borderColor = "red";
                alert('Ingrese la posicion de la imagen');
                return false;
            }
          }
      </script>
    <%HttpSession s = request.getSession();
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
        Producto producto= em.find(Producto.class, Integer.parseInt(id));
        List<FamiliaProducto> familias = em.createNamedQuery("FamiliaProducto.findAll").getResultList();
        List<Imagen> imagenes= producto.getImagenList();
    %>
    <body>
         <div class="header-outs" id="home" style="padding-bottom: 13vw;">
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
        <div id="formulario" class="formulario">
            <button type="button" onclick="location.href='Productos.jsp'" style="width: 100%;" class="btn-warning">
                            Volver
            </button>
            <button style="width: 100%;margin-bottom:1vw;" class="btn-info" onclick="javascript:location.reload(true)">
                            Refrescar
            </button>
            <h3>
                Imagenes de <% out.println(producto.getNombre()); %>
            </h3>
            <table>
            <%
                if(imagenes.isEmpty()){
                %>
                <tr>
                    <td>
                        <h1>
                            No hay productos 
                        </h1>
                    </td>
                </tr>
                
            <%}else
            {
                int conter=0;
                for(Imagen i:imagenes)
                {
                        if(conter%4==0)
                        {
                        %>
                        <tr></tr>
                        <%
                        }
            
                    %>
                    <td style="width: 25%;height: 0px;text-align: center;">
                            <div style="font-family: helvetica;">
                                <br>
                                <img src="<%
                                String ur="";
                                ur = "data:image/png;base64," + Base64.getEncoder().encodeToString(i.getImagen());
                                out.print(ur);
                                conter++;
                                 %>
                                 " height="180" width="150" ><br>
                            </div>
                            <%
                                if(i.getHabilitado()==Short.parseShort("1"))
                                {%>
                                <button style="text-align: center;" onclick="location.href='../DeshabilitarImagen?id=<%=i.getImagenPK().getIdimagen() %>'" class="btn-danger">
                                    Deshabilitar
                                </button>
                                <%}else{%>
                                <button onclick="location.href='../HabilitarImagen?id=<%=i.getImagenPK().getIdimagen() %>'" class="btn-success">
                                    Habilitar
                                </button>
                                <%}%>     
                    </td>
                    <%
                }
            }
            %>
            <tr>
                <td>
                </td>
            </tr>
            </table>
                
            <form action="../AgregarImagen"  method="Post" name="FormImagen" onsubmit="return Validar()" enctype="multipart/form-data">
                <table style="margin-top: 2vw;">
                    <input type="hidden" name="txtId" value="<%= producto.getIdproducto()%>"
                    <tr>
                        <td>
                            <input type="file" name="flImagen">
                        </td>
                        <td>
                            <select name="txtPosicion">
                                <option>
                                    Seleccione...
                                </option>
                                <option value="1">Horizontal</option>
                                <option value="2">Vertical</option>
                            </select>
                        </td>
                        <td>

                            <input type="submit" value="Agregar">
                        </td>
                    </tr>
                </table>        
            </form>
        </div>
    </body>
</html>
