<%-- 
    Document   : Boleta
    Created on : 21-01-2021, 15:45:18
    Author     : pc
--%>

<%@page import="java.util.Base64"%>
<%@page import="Clases.Factura"%>
<%@page import="Clases.Boleta"%>
<%@page import="Clases.DocumentoTributario"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="Clases.Destinatario"%>
<%@page import="Clases.Despacho"%>
<%@page import="Clases.Venta"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <script src='../web/js/jquery-2.2.3.min.js'></script>
    <link href="../web/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
    <script>
            $(document).ready(function() {
                var dataURL="";
                 html2canvas($("#canvasThumbResult"), {
                    onrendered: function(canvas) {
                        var imgsrc = canvas.toDataURL("image/png");
                        console.log(imgsrc);
                        $("#canvasThumbResult").attr('src', imgsrc);
                        $("#canvasThumbResult").show();
                        dataURL = canvas.toDataURL();
                        send(dataURL);}
                });});
        function send(o)
        {
            var ul =window.location.href;
            var res=ul.split("=");
            var i= res[1]; 
            $.ajax({
                type:"POST", // la variable type guarda el tipo de la peticion GET,POST,..
                url:"../BotelaGen", //url guarda la ruta hacia donde se hace la peticion
                data:{dataImg:o,id:i}, // data recive un objeto con la informacion que se enviara al servidor
                success:function(data){ //success es una funcion que se utiliza si el servidor retorna informacion
                    window.location.replace("Voucher.jsp");
                 }// El tipo de datos esperados del servidor. Valor predeterminado: Intelligent Guess (xml, json, script, text, html).
            });
        }
    </script>
    <!--<script>
        $(function() {
            $("#geeks").click(function() {
                html2canvas($("#createImg"), {
                    onrendered: function(canvas) {
                        var imgsrc = canvas.toDataURL("image/png");
                        console.log(imgsrc);
                        $("#newimg").attr('src', imgsrc);
                        $("#img").show();
                        var dataURL = canvas.toDataURL();
                        $.ajax({
                            type: "POST",
                            url: "script.php",
                            data: {
                                imgBase64: dataURL
                            }
                        }).done(function(o) {
                            console.log('saved');
                        });
                    }
                });
            });
        });
    </script>--> 
    <%
            String url = request.getQueryString();
            String[] posiciones = url.split("=");
            String id = posiciones[1];
            HttpSession s = request.getSession();
            EntityManagerFactory emf ;
            emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
            EntityManager em = emf.createEntityManager();
            Venta venta=(Venta) em.createNamedQuery("Venta.findByIdventa").setParameter("idventa", Integer.parseInt(id)).getSingleResult();
            Despacho despacho = venta.getDespachoList().get(0);
            Destinatario destinatario = despacho.getDestinatarioidDestinatario();
            List<DetalleVenta> productos = venta.getDetalleVentaList();
            DocumentoTributario dte= venta.getDocumentoTributarioList().get(0);
            Boleta boleta=new Boleta();
            Factura factura= new Factura();
            if(dte.getBoleta()!=null)
            {
                boleta = dte.getBoleta();
            }
            else if(dte.getFactura()!=null){
                factura= dte.getFactura();
            }
    %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- <meta http-equiv="refresh" content="0;URL=../BoletaJava?id=<%out.println(id);%>"/> -->
        <link href="../web/css/boleta.css" rel="stylesheet" type="text/css"/>
    </head>
    <body id="canvasThumbResult">
        <img class="head" src="../Imagenes/BoletaGenerador3.png" alt=""/>
        <table class="tablaBoleta">
            <tr class="tablaTR">
                <th class="tablaTH" colspan="2">
                    Cliente
                </th> 
            </tr>
                <%
                    if(venta.getUsuario().getIdusuario()!=null)
                    {%>
                    <tr class="tablaTR">
                        <td class="tablaTD">
                            TIPO DE VENTA
                        </td>
                        <td class="tablaTD">
                            Venta realizada sin registro
                        </td>
                    </tr>
                    <%}
                %>
                <tr class="tablaTR">
                    <td class="tablaTD">
                        RUT
                    </td>
                    <td class="tablaTD">
                        <% out.println(destinatario.getRut()); %>
                    </td>
                </tr>   
                <tr class="tablaTR">
                    <td class="tablaTD">
                        NOMBRE
                    </td>
                    <td class="tablaTD">
                        <%
                             out.println(destinatario.getNombre()+" "+destinatario.getApellido());
                        %>
                    </td>
                </tr>   
                <tr class="tablaTR">
                    <td class="tablaTD">
                        DIRECCION
                    </td>
                    <td class="tablaTD">
                        <%
                            out.println(despacho.getDireccion());
                        %>
                        
                    </td>
                </tr>   
                <tr class="tablaTR">
                    <td class="tablaTD">
                        TELEFONO
                    </td>
                    <td class="tablaTD">
                        <% out.println(destinatario.getTelefono()); %>
                    </td>
                </tr>   
        </table>
        <table class="tablaBoleta">
            <tr class="tablaTR">
                <th colspan="6"  class="tablaTH">
                    Producto
                </th>
            </tr>
            <tr class="tablaTR">
                <th  class="tablaTH">
                    ID
                </th>
                <th class="tablaTH">
                    NOMBRE
                </th>
                <th class="tablaTH">
                    CANTIDAD
                </th>
                <th class="tablaTH">
                    PRECIO BRUTO POR PRODUCTO
                </th>
                <th class="tablaTH">
                    PRECIO IVA POR PRODUCTO
                </th>
                <th class="tablaTH">
                    SUBTOTAL
                </th>
            </tr>
            <%
                int total =0;
                for(DetalleVenta dv:productos)
                {%>
                <tr class="tablaTR">
                    <td class="tablaTD">
                        <% out.println(dv.getProducto().getIdproducto()); %>
                    </td>
                    <td class="tablaTD">
                        <% out.println(dv.getProducto().getNombre()); %>
                    </td>
                    <td class="tablaTD">
                        <% out.println(dv.getCantidad()); %>
                    </td>
                    <td class="tablaTD">
                        <% out.println(dv.getProducto().getPrecioBruto()); %>
                    </td>
                    <td class="tablaTD">
                        <% out.println(dv.getProducto().getIva()); %>
                    </td>
                    <td class="tablaTD">
                        <% out.println(dv.getTotalProducto()); %>
                    </td>
                </tr>  
                <%}
            %>
            <tr class="tablaTR">
                <td class="tablaTD" colspan="5">
                    Precio total
                </td> 
                <td class="tablaTD">
                    <%
                        if(dte.getBoleta()!=null)
                        {
                            out.println(boleta.getMontoFinal());
                        }
                        else
                        {
                            out.println(factura.getMontoFinal());
                        }
                    %>
                </td>
            </tr>
        </table>
                <table class="tablaBoleta">
                    <tr class="tablaTR">
                        <th class="tablaTH" colspan="2">
                            DESPACHO
                        </th>
                    </tr>
                    <%
                        if(despacho.getCodigoDespacho()!=0)
                        {%>
                         <tr class="tablaTR">
                        <td class="tablaTD">
                            COMPAÑIA
                        </td>
                        <td class="tablaTD">
                            ChileExpress
                        </td>
                    </tr>
                    <tr class="tablaTR">
                        <td class="tablaTD">
                            ID DE RASTREO
                        </td>
                        <td class="tablaTD">
                            <% out.println(despacho.getCodigoDespacho()); %>
                        </td>
                    </tr>
                    <tr class="tablaTR">
                        <td class="tablaTD">
                            DIRECCION
                        </td>
                        <td class="tablaTD">
                             <% out.println(despacho.getDireccion()); %>
                        </td>
                    </tr>
                    <tr class="tablaTR">
                        <td class="tablaTD">
                            TIPO DE DESPACHO
                        </td>
                        <td class="tablaTD">
                            <% out.println(despacho.getTipo()); %>
                        </td>
                    </tr>
                    <tr class="tablaTR">
                        <td class="tablaTD">
                            PRECIO DEL DESPACHO
                        </td>
                        <td class="tablaTD">
                            <%  out.println(despacho.getValor());%>
                        </td>
                    </tr>
                        <%}else
                        {%>
                        <tr class="tablaTR">
                            <td class="tablaTD" colspan="2">
                                SIN DESPACHO
                            </td>
                        </tr>  
                        <%}
                    %>
                   
                </table>
                        <table class="tablaBoleta">
                            <tr class="tablaTR">
                                <th class="tablaTH" colspan="2">
                                    PAGO
                                </th>
                            </tr>
                            <tr class="tablaTR">
                                <td class="tablaTD">
                                    PLATAFORMA
                                </td>
                                <td class="tablaTD">
                                    Webpay
                                </td>
                            </tr>
                            <tr class="tablaTR">
                                <td class="tablaTD">
                                    METODO DE PAGO
                                </td>
                                <td class="tablaTD">
                                    <% out.println(dte.getMetodoPago()); %>
                                </td>
                            </tr>
                        </table> 
    </body>
</html>
