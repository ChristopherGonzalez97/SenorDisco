<%-- 
    Document   : Voucher
    Created on : 08-01-2021, 12:01:22
    Author     : pc
--%>

<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Destinatario"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.Usuario"%>
<%@page import="Clases.VentaPK"%>
<%@page import="Clases.Venta"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comprobante de compra</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" id="viewport-meta">
    </head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <script>
         addEventListener("load", function () {
         	setTimeout(hideURLbar, 0);
         }, false);
         
         function hideURLbar() {
         	window.scrollTo(0, 1);
         }
      </script>
      <script src='../web/js/jquery-2.2.3.min.js'></script>
      <link href="../web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
      <!--//booststrap end-->
      <!-- font-awesome icons -->
      <link href="../web/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!-- //font-awesome icons -->
      <!--Shoping cart-->
      <link rel="stylesheet" href="../web/css/shop.css" type="text/css" />
      <!--//Shoping cart-->
      <!--checkout-->
      <link rel="stylesheet" type="text/css" href="../web/css/checkout.css">
      <!--//checkout-->
      <!--stylesheets-->
      <link href="../web/css/style.css" rel='stylesheet' type='text/css' media="all">
      <!--//stylesheets-->
      <link href="//fonts.googleapis.com/css?family=Sunflower:500,700" rel="stylesheet">
      <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
      <body  id="printDiv" style="background-color: azure">
        <%
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            HttpSession s= request.getSession();
            Venta venta =(Venta)s.getAttribute("venta");
            venta=em.createNamedQuery("Venta.findByIdventa", Venta.class).setParameter("idventa", venta.getVentaPK().getIdventa()).getSingleResult();
            Usuario user = venta.getUsuario();
            Despacho despacho = venta.getDespachoList().get(0);
            List<DetalleVenta> productos = venta.getDetalleVentaList();
            Destinatario detina =despacho.getDestinatarioidDestinatario();
        %>
        <div class="header-outs" id="home" style="padding-bottom: 12vw;">
         <div class="header-bar">
            <div class="container-fluid">
               <div class="hedder-up row">
                  <div class="col-lg-12 col-md-12 logo-head">
                        <h1>
                            <a class="navbar-brand">
                                <img src="../images/LogoBoleta.png" alt="" style="width: 100%"/>
                            </a>
                        </h1>
                  </div>
         </div>
            </div>
         </div>
         <!-- Slideshow 4 -->
         <div class="clearfix"></div>
         </div>
         <section class="boleta">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3>Comprobante de compra</h3>
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="2">Cliente</th>
                              </tr>
                           </thead>
                          <tbody>
                              <tr>
                                  <td class="sub">
                                      Rut
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(detina.getRut());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Nombre
                                  </td>
                                  <td class="stick">
                                        <%
                                           out.println(detina.getNombre()+" "+detina.getApellido());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Direccion
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(despacho.getDireccion());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Correo electronico
                                  </td>
                                  <td class="stick">
                                        <%
                                            out.println(detina.getEmail());
                                        %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Telefono
                                  </td>
                                  <td class="stick">
                                       <%
                                            out.println(detina.getTelefono());
                                        %>
                                  </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3 gridpos">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="6">Productos</th>
                              </tr>
                              <tr>
                                    <th>
                                        Id 
                                    </th>

                                    <th>
                                        Nombre
                                    </th>

                                    <th>
                                        Precio bruto 
                                    </th>

                                    <th>
                                        IVA
                                    </th>
                                    <th>
                                        Cantidad
                                    </th>
                                    <th>
                                        Subtotal
                                    </th>
                              </tr>
                           </thead>
                          <tbody>
                             <%
                                    int total=0;
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
                                        <%  out.println(prod.getProducto().getPrecioBruto());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getProducto().getIva());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getCantidad());  %>
                                    </td>
                                    <td class="stick">
                                        <%  out.println(prod.getTotalProducto());  %>
                                    </td>
                                </tr>   

                                <%
                                    total=total+prod.getTotalProducto();
                                    }
                                %>
                                <tr>
                                    <td colspan="5" class="sub">
                                        Precio total de los productos
                                    </td>
                                    <td class="stick">
                                        <% out.println("$"+total); %>
                                    </td>
                                </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>
            <%
                if(venta.getDespachoList().get(0).getCodigoDespacho()!=0)
                {%>
                <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="2">Despacho</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                  <td class="sub">
                                      Compañia
                                  </td>
                                  <td class="stick">
                                        <% out.println(despacho.getCompañia());%>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Id del despacho
                                  </td>
                                  <td class="stick">
                                       <% out.println(despacho.getBultoList().get(0).getOrdenDeTransporte()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Tipo de despacho
                                  </td>
                                  <td class="stick">
                                      <% out.println(despacho.getTipo()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                      Total del despacho
                                  </td>
                                  <td class="stick">
                                      <% out.println(despacho.getValor()); %>
                                  </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>  
                <%}
            %>                        
            
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                  <th colspan="2">Pago</th>
                              </tr>
                           </thead>
                           <tbody>
                              <tr>
                                  <td class="sub">
                                      Plataforma
                                  </td>
                                  <td class="stick">
                                      WebPay
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Metodo de pago
                                  </td>
                                  <td class="stick">
                                        <% out.println(venta.getDocumentoTributarioList().get(0).getMetodoPago()); %>
                                  </td>
                              </tr>
                              <tr>
                                  <td class="sub">
                                       Total pagado
                                  </td>
                                  <td class="stick">
                                        <% out.println(venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()); %>
                                  </td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <div style="    position: absolute;width: 80%;z-index: 1;">
                  <button type="button" class="btnPDF" id="viewport" onclick="return ViewPort()">
                        Obtener PDF
                        <img src="../Imagenes/IconoPd2f.png" class="iconoPdf" alt=""/>
                   </button> 
                   <button type="button" class="btnFin" id="viewport2"  onclick="location.href='../FinCompra'">
                        Ir al inicio
                    </button> 
              </div>
                 <img src="../Imagenes/estampa1.png" class="comprobante" alt=""/>
            </div>                                    
      </section>
    </body>
    <script>
    function cargarPDF()
    {
       var z=document.getElementById("viewport").style.display="none";
       var f=document.getElementById("viewport2").style.display="none";
       var pdf=html2canvas(document.getElementById("printDiv"), {
                        onrendered: function(canvas) {
                        var imgData = canvas.toDataURL('image/png');
                        var doc = new jsPDF('p', 'mm', [220, 297]); //210mm wide and 297mm high
                        doc.addImage(imgData,'JPEG',0,0,220,297);
                        doc.save('Comprobante.pdf');
                        
                }
            }
                    );
  
    }
    function ViewPort()
    {
       myExternalWindow = window.open("http://localhost:8080/AppDiscos/Paginas/Voucher.jsp", "myWindowName", "resizable");
       myExternalWindow.resizeTo(800,750); //resize window to 500x500
       myExternalWindow.onload = function(){myExternalWindow.window.cargarPDF()};
       setTimeout(() => {myExternalWindow.close();},3000);
    }
    </script>
</html>
