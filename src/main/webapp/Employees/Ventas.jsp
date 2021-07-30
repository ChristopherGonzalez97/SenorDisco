<%-- 
    Document   : Ventas
    Created on : 18-01-2021, 18:55:34
    Author     : pc
--%>

<%@page import="Clases.Cliente"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Clases.Venta"%>
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
</head>
<script>
    function ValidarBoletaIngreso()
    {
         var formulario = "FormBoleta"+event.submitter.id;
        var cantidad = document.forms[formulario]["flImagen"].value;
        if(cantidad<=0)
        {
            document.forms[formulario]["flImagen"].style.borderColor = "red";
            alert('Ingrese la boleta');
            return false; 
        }
    }
    
    function Cambiar()
    {
        var seleccion = event.target.value;
        Hide(seleccion);
    }
    function Hide(o)
    {
        document.getElementById("fechaAFecha").style.display="none";
        document.getElementById("fecha").style.display="none";
        document.getElementById("rut").style.display="none";
        document.getElementById("boleta").style.display="none";
        document.getElementById("factura").style.display="none";
        document.getElementById("estado").style.display="none";
        document.getElementById(o).style.display="inline-block";
    }
    function ValidarFechaDesde()
    {
        var desde=document.forms["FechaDesde"]["fechaInicial"].value;
        var hasta=document.forms["FechaDesde"]["fechaFinal"].value;
        if( desde == 0)
        {
            document.forms["FechaDesde"]["fechaInicial"].style.borderColor = "red";
            alert('Ingrese la fecha inicial');
            return false; 
        }
        if(hasta==0)
        {
            document.forms["FechaDesde"]["fechaFinal"].style.borderColor = "red";
            alert('Ingrese la fecha final');
            return false; 
        }
    }
     function ValidarFecha()
    {
        var desde=document.forms["Fecha"]["txtFecha"].value;
        if( desde == 0)
        {
            document.forms["Fecha"]["txtFecha"].style.borderColor = "red";
            alert('Ingrese la fecha');
            return false; 
        }
    }
     function ValidarRut()
    {
        var rut=document.forms["Rut"]["txtRut"].value;
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
                document.forms["Rut"]["txtRut"].style.borderColor = "red";
                alert("Ingrese su rut en el formato correcto xxxxxxx-x");
                return false;
            } 
    }
     function ValidarBoleta()
    {
        var desde=document.forms["Boleta"]["txtBoleta"].value;
        if( desde == 0)
        {
            document.forms["Boleta"]["txtBoleta"].style.borderColor = "red";
            alert('Ingrese el numero de boleta');
            return false; 
        }
    }
     function ValidarFactura()
    {
        var desde=document.forms["Factura"]["txtFactura"].value;
        if( desde == 0)
        {
            document.forms["Factura"]["txtFactura"].style.borderColor = "red";
            alert('Ingrese el numero de factura');
            return false; 
        }
    }
     function ValidarEstado()
    {
        var desde=document.forms["Estado"]["txtEstado"].value;
        if( desde == "Seleccione un estado")
        {
            document.forms["Estado"]["txtEstado"].style.borderColor = "red";
            alert('Ingrese el estado');
            return false; 
        }
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
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
           
            List<Venta> ventas= new ArrayList();
            if(s.getAttribute("filtroVenta")!=null)
            {
                ventas =(List<Venta>) s.getAttribute("filtroVenta");
                s.removeAttribute("filtroVenta");
            }else{
                ventas= em.createNamedQuery("Venta.findAll").getResultList();
            }
            s.setAttribute("listaVenta", ventas);
            
            List<Venta> sinBoletaLegal = new ArrayList<Venta>();
            for(Venta ven:ventas)
            {
                if(ven.getBoletaLegal()==null)
                {
                    sinBoletaLegal.add(ven);
                }
            }
            
            List<Venta> ventasPorDespachar = new ArrayList<Venta>();
            for(Venta ven:ventas)
            {
                if(ven.getEstado().equals("Realizada") && ven.getDespachoList().get(0).getCodigoDespacho()!=0)
                {
                    ventasPorDespachar.add(ven);
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
               <button class="btn btn-block sent-butnn" style="width: 15%;margin-bottom: 2.5em;margin-left: 8px;" onclick="location.href='Modulador.jsp'">
                  Volver
          </button>
               <div class="container py-lg-12 py-md-12 py-sm-12 py-12" style="    max-width: 100%;">
            <div class="contact-list-grid">
            <button class="accordion">
                    Ventas sin boleta legal (<% out.println(sinBoletaLegal.size());%>)
            </button>
                <div class="paneloide">
            <%
                for(Venta v: sinBoletaLegal)
                {%>
                    <button class="accordion">
                        <table>
                            <tr>
                                <td style="padding-right: 70px;">
                                    Id Venta
                                </td>
                                <td style="padding-right: 70px;">
                                    Nombre comprador
                                </td>
                                <td style="padding-right: 70px;">
                                    Fecha de la compra
                                </td>
                                <td style="padding-right: 70px;">
                                    Estado de la compra
                                </td></tr>
                            <tr>
                                <td>
                                    <% out.println(v.getVentaPK().getIdventa()); %>
                                </td>
                                <td>
                                    <% out.println(v.getDespachoList().get(0).getDestinatarioidDestinatario().getNombre()); %>
                                </td>    
                                <td>
                                    <% 
                                        String pattern = "MM-dd-yyyy";
                                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                                        String date = simpleDateFormat.format(v.getFecha());
                                        out.println(date);
                                    %>
                                </td>
                                <td>
                                    <%out.println(v.getEstado());%>
                                </td>
                            </tr>
                        </table>
                    </button>
                    <div class="paneloide">
                        <table class="timetable_sub" style="width: 100%;">
                           <thead>
                              <tr>
                                    <th class="sub">
                                        Id 
                                    </th>

                                    <th class="sub">
                                        Nombre
                                    </th>
                                    <th class="sub">
                                        Cantidad
                                    </th>
                                    
                              </tr>
                           </thead>
                          <tbody>
                             <%
                                    int total=0;
                                    List<DetalleVenta> productos = new ArrayList<DetalleVenta>();
                                    Despacho despacho = new Despacho();
                                    despacho = v.getDespachoList().get(0);
                                    productos= v.getDetalleVentaList();
                                    for(DetalleVenta prod: productos)
                                    {

                                %>
                                <tr>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIdproducto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getNombre());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getCantidad());  %>
                                    </td>
                                </tr>   

                                <%
                                    
                                    }
                                %>
                                <tr>
                                    <td colspan="2" class="sub" style="padding-right: 1vw;text-align: right !important;">
                                        Monto final
                                    </td>
                                    <td class="stick">
                                        <% out.println("$"+v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                    </td>
                                </tr>
                              <tr>
                                  <th colspan="3" class="sub">Despacho</th>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Compañia
                                  </td>
                                  <td class="stick" colspan="2">
                                      <%
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getCompañia()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                      %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Id del despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                       <% 
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getBultoList().get(0).getOrdenDeTransporte()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                       %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Tipo de despacho
                                  </td>
                                  <td class="stick"  colspan="2">
                                      <% out.println(despacho.getTipo()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Total del despacho
                                  </td>
                                  <td class="stick"  colspan="2">
                                      <% out.println(despacho.getValor()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <th colspan="3" class="sub">Pago</th>
                              </tr>                      
                              <tr>
                                  <td class="sub">
                                      Plataforma
                                  </td>
                                  <td class="stick"  colspan="2">
                                      WebPay
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Metodo de pago
                                  </td>
                                  <td class="stick"  colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Total pagado
                                  </td>
                                  <td class="stick"  colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                  </td>
                              </tr>
                           
                              <tr>
                               
                                    <td>
                                        <form action="../CargarBoletaLegal" onsubmit="return ValidarBoletaIngreso()" name="FormBoleta<%=v.getVentaPK().getIdventa()%>" method="Post" enctype="multipart/form-data">
                                            Agregar boleta
                                            <input type="file" name="flImagen">
                                            <input type="hidden" name="txtIdVenta" value="<%= v.getVentaPK().getIdventa() %>" >
                                            <button type="submit" style="width: 100%;" class="sent-butnn btn" id="<%= v.getVentaPK().getIdventa() %>">
                                              Agregar boleta
                                          </button>
                                        </form>
                                    </td> 
                              </tr>
                          </tbody>
                        </table>
                    </div>
                <%}
            %>    
            </div>
            </div>
         </div>
           </section>    
         <section class="Verp-roducto" style="padding-top: 0;">
         <div class="container py-lg-12 py-md-12 py-sm-12 py-12" style="    max-width: 100%;">
            <div class="contact-list-grid">
            <button class="accordion">
                    Ventas por despachar (<% out.println(ventasPorDespachar.size());%>)
            </button>
                <div class="paneloide">
            <%
                for(Venta v: ventasPorDespachar)
                {%>
                    <button class="accordion">
                        <table>
                            <tr>
                                <td  style="padding-right: 70px;">
                                    Id Venta
                                </td>
                                <td  style="padding-right: 70px;">
                                    Nombre comprador
                                </td>
                                <td  style="padding-right: 70px;">
                                    Fecha de la compra
                                </td>
                                <td  style="padding-right: 70px;">
                                    Estado de la compra
                                </td></tr>
                            <tr>
                                <td>
                                    <% out.println(v.getVentaPK().getIdventa()); %>
                                </td>
                                <td>
                                    <% out.println(v.getDespachoList().get(0).getDestinatarioidDestinatario().getNombre()); %>
                                </td>    
                                <td>
                                    <% 
                                        String pattern = "MM-dd-yyyy";
                                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                                        String date = simpleDateFormat.format(v.getFecha());
                                        out.println(date);
                                    %>
                                </td>
                                <td>
                                    <%out.println(v.getEstado());%>
                                </td>
                            </tr>
                        </table>
                        
                    </button>
                    <div class="paneloide">
                        <table class="timetable_sub"  style="width: 100%;">
                           <thead>
                              <tr>
                                    <th class="sub">
                                        Id 
                                    </th>

                                    <th class="sub">
                                        Nombre
                                    </th>
                                    <th class="sub">
                                        Cantidad
                                    </th>
                                    
                              </tr>
                           </thead>
                          <tbody>
                             <%
                                    int total=0;
                                    List<DetalleVenta> productos = new ArrayList<DetalleVenta>();
                                    Despacho despacho = new Despacho();
                                    despacho = v.getDespachoList().get(0);
                                    productos= v.getDetalleVentaList();
                                    for(DetalleVenta prod: productos)
                                    {

                                %>
                                <tr>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIdproducto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getNombre());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getCantidad());  %>
                                    </td>
                                </tr>   

                                <%
                                    
                                    }
                                %>
                                <tr>
                                    <td colspan="2" class="sub" style="padding-right: 1vw;text-align: right !important;">
                                        Monto final
                                    </td>
                                    <td class="stick">
                                        <% out.println("$"+v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                    </td>
                                </tr>
                              <tr>
                                  <th class="sub" colspan="3">Despacho</th>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Compañia
                                  </td>
                                  <td class="stick" colspan="2">
                                      <%
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getCompañia()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                      %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Id del despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                       <% 
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getBultoList().get(0).getOrdenDeTransporte()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                       %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Tipo de despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                      <% out.println(despacho.getTipo()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Total del despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                      <% out.println(despacho.getValor()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <th class="sub" colspan="3">Pago</th>
                              </tr>                      
                              <tr>
                                  <td class="sub">
                                      Plataforma
                                  </td>
                                  <td class="stick" colspan="2">
                                      WebPay
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Metodo de pago
                                  </td>
                                  <td class="stick" colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Total pagado
                                  </td>
                                  <td class="stick" colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                  </td>
                              </tr>
                              <%
                                  if(v.getEstado().equals("Realizada")|| despacho.getCodigoDespacho()!=0)
                                  {
                              %>
                              <tr>
                                  <td colspan="3">
                                    <button style="width: 100%" type="button" class="sent-butnn btn" onclick="location.href='../CambiarEstado?id=<%= v.getVentaPK().getIdventa() %>'" >
                                        Venta despachada
                                    </button>
                                  </td>
                              </tr>
                              <%
                                  }else if(v.getEstado().equals("Despachada") || despacho.getCodigoDespacho()!=0)
                                   {%>
                                       <tr>
                                            <td colspan="3">
                                              <button  style="width: 100%" type="button" class="sent-butnn btn"  onclick="location.href='../CambiarEstado?id=<%= v.getVentaPK().getIdventa() %>'" >
                                                  Venta recibida por el cliente
                                              </button>
                                            </td>
                                        </tr>
                              <%}else{%>
                              <tr>
                                  <td colspan="3">
                                      Venta Finalizada
                                  </td>
                              </tr> 
                              <tr>
                               <%}
                                   
                               if(despacho.getCodigoDespacho()!=0){
                                     %>
                              <td>
                                   <button style="width: 100%" type="button" class="sent-butnn btn" onclick="location.href='Label.jsp?id=<%= v.getVentaPK().getIdventa() %>'" >
                                        Ver Guia de despacho
                                   </button>
                               </td> 
                              <%}%>
                               <td>
                                    <button style="width: 100%" type="button" class="sent-butnn btn" onclick="location.href='MostrarBoleta.jsp?id=<%= v.getVentaPK().getIdventa()%>'" >
                                            Ver Boleta
                                    </button>
                                </td>  
                              </tr>
                          </tbody>
                        </table>
                    </div>
                <%}
            %>    
            </div>
            </div>
         </div>
      </section> 
      <section class="Verp-roducto" style="padding-top: 0;">
         <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
            <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Modulo de ventas</h3>
            <div style="margin: 3vw;">
                <select class="form-control" onchange="Cambiar()" name="txtFiltro">
                <option>
                    Seleccione Filtro
                </option>
                <option value="fechaAFecha">
                    Desde fecha a fecha
                </option>
                <option value="fecha">
                    Fecha especifica
                </option>
                <option value="rut">
                    Rut
                </option>
                <option value="estado">
                    Estado de compra
                </option>
                <option value="boleta">
                    Numero Boleta
                </option>
                <option value="factura">
                    Numero Factura
                </option>
            </select>
                <form action="../FiltrarFechas" id="fechaAFecha" onsubmit="return ValidarFechaDesde()" name="FechaDesde" style="display: none">
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
                <form action="../FiltrarFechaDia" onsubmit="return ValidarFecha()" name="Fecha" id="fecha" style="display: none">
                <table>
                    <tr>
                        <td>
                            Fecha 
                        </td>
                        <td>
                            <input class="form-control" type="date" name="txtFecha">
                        </td>
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
                <form action="../FiltrarVentasRut" onsubmit="return ValidarRut()"  name="Rut" id="rut" style="display: none">
                <table>
                    <tr>
                        <td>
                            Rut
                        </td>
                        <td>
                            <input class="form-control" type="text" name="txtRut">
                        </td>
                 
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
                <form action="../BuscarBoleta" name="Boleta" onsubmit="return ValidarBoleta()"  id="boleta" style="display: none">
                <table>
                    <tr>
                        <td>
                            Buscar por N° de boleta
                        </td>
                        <td>
                            <input class="form-control" type="text" name="txtBoleta">
                        </td>
                  
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
                <form action="../BuscarFactura" name="Factura" onsubmit="return ValidarFactura()"  id="factura" style="display: none">
                <table>
                    <tr>
                        <td>
                            Buscar por N° de factura
                        </td>
                        <td>
                            <input class="form-control" type="text" name="txtFactura">
                        </td>
                   
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
                <form action="../FiltroEstado" name="Estado" onsubmit="return ValidarEstado()"  id="estado" style="display: none">
                <table>
                    <tr>
                        <td>
                            Filtrar por estado 
                        </td>
                        <td>
                            <select class="form-control" name="txtEstado">
                                <option disabled selected>
                                    Seleccione un estado
                                </option>
                                <option>
                                    Realizada
                                </option>
                                <option>
                                    Despachada
                                </option>
                                <option>
                                    Finalizada
                                </option>
                            </select>
                        </td>
                        <td>
                            <input class="btn sent-butnn" style="margin-left: 1vw;width: 26vw;" type="submit" value="buscar">
                        </td>
                    </tr>
                </table>
            </form>
            </div>
            <div class="contact-list-grid">
            <%
                for(Venta v:ventas)
                {%>
                    <button class="accordion">
                        <table>
                            <tr>
                                <td style="padding-right: 70px;">
                                    Id Venta
                                </td>
                                <td style="padding-right: 70px;">
                                    Nombre comprador
                                </td>
                                <td style="padding-right: 70px;">
                                    Fecha de la compra
                                </td>
                                <td style="padding-right: 70px;">
                                    Estado de la compra
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <% out.println(v.getVentaPK().getIdventa()); %>
                                </td>
                                <td>
                                    <% out.println(v.getDespachoList().get(0).getDestinatarioidDestinatario().getNombre()); %>
                                </td>    
                                <td>
                                    <% 
                                        String pattern = "MM-dd-yyyy";
                                        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
                                        String date = simpleDateFormat.format(v.getFecha());
                                        out.println(date);
                                    %>
                                </td>
                                <td>
                                    <%out.println(v.getEstado());%>
                                </td>
                            </tr>
                        </table>
                        
                    </button>
                    <div class="paneloide">
                        <table class="timetable_sub" style="width: 100%">
                           <thead>
                              <tr>
                                    <th class="sub">
                                        Id 
                                    </th>
                                    <th class="sub">
                                        Nombre
                                    </th>
                                    <th class="sub">
                                        Cantidad
                                    </th>  
                              </tr>
                           </thead>
                          <tbody>
                             <%
                                    int total=0;
                                    List<DetalleVenta> productos = new ArrayList<DetalleVenta>();
                                    Despacho despacho = new Despacho();
                                    despacho = v.getDespachoList().get(0);
                                    productos= v.getDetalleVentaList();
                                    for(DetalleVenta prod: productos)
                                    {

                                %>
                                <tr>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIdproducto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getNombre());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getCantidad());  %>
                                    </td>
                                </tr>   

                                <%
                                    
                                    }
                                %>
                                <tr>
                                    <td colspan="2" class="sub" class="sub" style="padding-right: 1vw;text-align: right !important;"> 
                                        Monto final
                                    </td>
                                    <td class="stick">
                                        <% out.println("$"+v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                    </td>
                                </tr>
                              <tr>
                                  <th colspan="3" class="sub">Despacho</th>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Compañia
                                  </td>
                                  <td class="stick" colspan="2">
                                      <%
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getCompañia()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                      %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Id del despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                       <% 
                                           if(despacho.getCodigoDespacho()!=0){
                                                 out.println(despacho.getBultoList().get(0).getOrdenDeTransporte()); 
                                           }else
                                           {
                                            out.println("Sin despacho");
                                           }
                                       %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Tipo de despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                      <% out.println(despacho.getTipo()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Total del despacho
                                  </td>
                                  <td class="stick" colspan="2">
                                      <% out.println(despacho.getValor()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <th class="sub" colspan="3">Pago</th>
                              </tr>                      
                              <tr>
                                  <td class="sub">
                                      Plataforma
                                  </td>
                                  <td class="stick" colspan="2">
                                      WebPay
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Metodo de pago
                                  </td>
                                  <td class="stick" colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Total pagado
                                  </td>
                                  <td class="stick" colspan="2">
                                        <% out.println(v.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                  </td>
                              </tr>
                              <%
                                  if(v.getEstado().equals("Realizada"))
                                  {
                              %>
                              <tr>
                                  <td colspan="3">
                                    <button style="width: 100%;" type="button" class="sent-butnn btn" onclick="location.href='../CambiarEstado?id=<%= v.getVentaPK().getIdventa() %>'" >
                                        Venta despachada
                                    </button>
                                  </td>
                              </tr>
                              <%
                                  }else if(v.getEstado().equals("Despachada"))
                                   {%>
                                       <tr>
                                            <td colspan="3">
                                              <button style="width: 100%;" type="button" class="sent-butnn btn" onclick="location.href='../CambiarEstado?id=<%= v.getVentaPK().getIdventa() %>'" >
                                                  Venta recibida por el cliente
                                              </button>
                                            </td>
                                        </tr>
                              <%}else{%>
                              <tr>
                                  <td colspan="3">
                                      Venta Finalizada
                                  </td>
                              </tr> 
                               <%}
                                  
                              %>
                              <tr>
                                  <td>
                                       <button style="width: 100%;" type="button" class="sent-butnn btn" onclick="location.href='MostrarBoleta.jsp?id=<%= v.getVentaPK().getIdventa()%>'" >
                                                  Ver Boleta
                                        </button>
                                  </td>
                                   <td>
                                       <button style="width: 67%;" type="button" class="sent-butnn btn" onclick="location.href='Label.jsp?id=<%= v.getVentaPK().getIdventa() %>'" >
                                                  Ver Guia de despacho
                                        </button>
                                  </td>
                              </tr>
                            <%
                                     if(v.fechaLimite()==true)
                                     {%>
                                     <tr>
                                         <td colspan="3">
                                             <button style="width: 100%;" type="button" class="sent-butnn btn" >
                                                 Garantia
                                             </button>
                                         </td>
                                     </tr>
                                     <%}
                                 %>
                          </tbody>
                        </table>
                    </div>
                <%}
            %>    
            </div>
         </div>
            
            <form action="../ExcelVenta" method="GET">
                <button type="submit" class="btn" style="background-color: black;color: white;width: 80%;margin-left: 10%;margin-bottom:2vw;">
                    <span id="excel" style="font-size: 22px;">Exportar a Excel</span>
                    <img src="../Imagenes/excel.png" style="width: 4%;" alt=""/>
                </button>
           </form> 
            <form action="../VentasGeneral" method="GET">
                <button type="submit" class="btn" style="background-color: black;color: white;width: 80%;margin-left: 10%;margin-bottom:2vw;">
                    <span id="excel" style="font-size: 22px;">Exportar general a Excel</span>
                    <img src="../Imagenes/excel.png" style="width: 4%;" alt=""/>
                </button>
        </form>
            
      </section>   
    </body>
    <script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active2");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>

</html>
