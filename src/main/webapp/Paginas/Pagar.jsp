<%-- 
    Document   : Pagar
    Created on : 03-01-2021, 16:11:12
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page import="Clases.Destinatario"%>
<%@page import="Clases.Venta"%>
<%@page import="Despacho.NumeracionChileExpress"%>
<%@page import="Despacho.CalleChileExpress"%>
<%@page import="Despacho.ComunaChileExpress"%>
<%@page import="Despacho.RegionChileExpress"%>
<%@page import="java.util.Base64"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="Clases.FamiliaProducto"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCreateResponse"%>
<%@page import="Clases.DetalleVenta"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagando</title>
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
    </head>
    <script type="text/javascript">
        function Condiciones()
        {
            var condiciones = document.forms["formPago"]["rbtCondiciones"].checked;
            
            if(condiciones==false)
            {
                document.forms["formPago"]["rbtCondiciones"].style.borderColor = "red";
                alert('Acepte los terminos y condiciones');
                return false;
            }
        }
    </script>
    <%
     EntityManagerFactory emf ;
     emf = Persistence.createEntityManagerFactory("cl.senordelosdiscos_SenorDisco_war_1.0-SNAPSHOTPU");
     EntityManager em = emf.createEntityManager();
     HttpSession s = request.getSession();
     List<DetalleVenta> carro = (List<DetalleVenta>) s.getAttribute("carro");
     List<FamiliaProducto> familia= em.createNamedQuery("FamiliaProducto.findAll").getResultList();
     Venta venta = (Venta) s.getAttribute("venta");
     Destinatario destinatario = venta.getDespachoList().get(0).getDestinatarioidDestinatario();
    
     WebpayPlusTransactionCreateResponse responses =(WebpayPlusTransactionCreateResponse) s.getAttribute("responses");
    %>
    <body>
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
                                 
         <section class="carro">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
               <div class="shop_inner_inf">
                  <div class="privacy about">
                     <h3>Carro de compra</h3>
                     <div class="checkout-right">
                        <table class="timetable_sub">
                           <thead>
                              <tr>
                                 <th>Id del producto</th>
                                 <th>Nombre</th>
                                 <th>Cantidad</th>
                                 <th>Precio</th>
                              </tr>
                           </thead>
                          <tbody>
                               <%
                                   int seguimiento=0;
                                   int total=0;
                                   for(DetalleVenta dv:carro)
                                   {
                               %>
                                   <tr class="rem<%=seguimiento%>">
                                        <td class="invert"><% out.println(dv.getProducto().getIdproducto()); %></td>
                                        <td class="invert"><% out.println(dv.getProducto().getNombre());%></td>
                                        <td class="invert">
                                           <div class="quantity">
                                              <div class="quantity-select">
                                                 <div><span><% out.println(dv.getCantidad());%></span></div>
                                              </div>
                                           </div>
                                        </td>
                                        <td class="invert"><% out.println(dv.getProducto().getPrecioVenta());%></td>
                              </tr>
                                   <%  seguimiento++;
                                       total=total+dv.getTotalProducto();}
                               %>
                               <tr>
                                   <td class="invert" colspan="3">
                                       Total productos
                                   </td>
                                   <td class="invert">
                                       <% out.println("$"+total); %>
                                   </td>
                               </tr>
                               <%
                                   if(s.getAttribute("RegionResultado")!=null)
                                   {%>
                                    <tr>
                                   <th colspan="3">
                                       Direccion 
                                   </th>
                                   <th>
                                       Precio despacho
                                   </th>
                               </tr>
                               <tr>
                                   <td colspan="3">
                                        <%
                                            RegionChileExpress regionC=(RegionChileExpress) s.getAttribute("RegionResultado");
                                            ComunaChileExpress comunaC= (ComunaChileExpress) s.getAttribute("ComunaResultado");
                                            CalleChileExpress calleC =(CalleChileExpress) s.getAttribute("CalleResultado");
                                            NumeracionChileExpress num = (NumeracionChileExpress) s.getAttribute("DireccionnResultado");
                                            
                                            out.println(regionC.getRegionName()+", "+comunaC.getCountyName()+", "+calleC.getStreetName()+" "+num.getNumber());
                                        %>
                                   </td>
                                   <td class="invert"> 
                                       <%
                                          
                                           out.println("$"+venta.getDespachoList().get(0).getValor());
                                           
                                       %>
                                   </td>
                               </tr>
                                    <%}
                               %>
                               
                                <tr>
                                    <th colspan="5">
                                        Destinatario
                                    </th>
                                       </tr>
                                       <tr>
                                           <th>
                                               Rut
                                           </th>
                                           <th colspan="2">
                                               Nombre
                                           </th>
                                           
                                           <th>
                                               Telefono
                                           </th>
                                       </tr>
                                       <tr>
                                           <td class="invert">
                                               <%
                                                   out.println(destinatario.getRut());
                                               %>
                                           </td>
                                           
                                           <td colspan="2" class="invert">
                                               <%
                                                   out.println(destinatario.getNombre()+" "+destinatario.getApellido());
                                               %>
                                           </td>                                              
                                           <td class="invert">
                                               <%
                                                   out.println(destinatario.getTelefono());
                                               %>
                                           </td>
                                       </tr>
                                       <tr>
                                           <th colspan="5">
                                               Email
                                           </th>
                                       </tr>
                                       <tr>
                                           <td colspan="5" class="invert">
                                               <%
                                                   out.println(destinatario.getEmail());
                                               %>
                                           </td>
                                       </tr>
                                        <tr>
                                            <th colspan="6">
                                                Total a pagar
                                            </th>
                                        </tr>
                                        <tr>
                                            <td colspan="6" class="invert">
                                            <%
                                                out.println("$"+venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal());
                                            %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="invert" colspan="6">
                                                <form method="post" action="<%=responses.getUrl()%>" onsubmit="return Condiciones()" name="formPago">
                                                    <input type="checkbox" name="rbtCondiciones" > He leido y acepto los <button class="terminos" type="button" data-toggle="modal" data-target="#exampleModal2">Terminos y condiciones</button>
                                                    <input type="hidden" name="token_ws" value="<%=responses.getToken()%>" />
                                                    <button type="submit" class="btnPagar">
                                                       Pagar
                                                   </button>
                                                    <img src="../Imagenes/webpay.png" style="width: 50%;" alt=""/>
                                                 </form>
                                            </td>
                                        </tr>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
               <!-- //top products -->
            </div>
      </section>                                           
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
               ?? 2020 El se??or de los discos. All Rights Reserved 
            </p>
         </div>
      </footer>
      <!-- //footer -->
      <!-- Modal 1-->
      <div class="modal fade" id="exampleModal2" style="margin-left: -24rem;" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog" role="document">
               <div class="modal-content" style="width: 182%">
                       <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">Terminos y condiciones</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                          </button>
                       </div>
                       <div class="modal-body">
                          <div class="register-form">
                              <ol style="list-style-type: inherit">
                                  <li>
                                      Somos un Ecommerces Denominada Sitio Seguro, donde podr??s navegar, comprar, contactarnos, y agendar nuestros productos y servicios de forma segura y confiable, esto quiere decir que tus datos personales al momento de registrarte o al realizar la compra estar??n protegidos y seguros de malas pr??cticas.
                                  </li>
                                  <li>
                                      Denominamos malas pr??cticas el compartir informaci??n de nuestros clientes.
                                  </li>
                                  <li>
                                      Desarrollamos un Marketing Digital por medios tradicionales y aplicaciones de Redes Sociales.
                                  </li>
                                  <li>
                                      En nuestro Ecommerce podr??s optar a m??ltiples modalidades de pagos. Todas ellas enlazadas debidamente, que te brinda la mejor experiencia en tu compra online.
                                  </li>
                                  <li>
                                      Contamos con un soporte a la compra, con un panel de preguntas autom??ticas y luego con una interacci??n directa con la administraci??n del sitio.
                                  </li>
                                  <li>
                                      Nuestro cliente puede realizar compras sin estar previamente registrado.
                                  </li>
                                  <li>
                                      Al momento que el cliente decide comprar cada uno de nuestros productos, debe notar que nuestros productos son fabricados por artesanos chilenos en chile, y est??n sujeto en algunos casos, al agendamiento de fabricaci??n, agendamiento de abastecimiento de Materias Primas, Terminaci??n por pinturas (lo que en ciertas temporadas clim??ticas extiende la espera de los productos) Terminaci??n Enlozado, carga de fabricaci??n por pedidos agendados previos:
                                      <ol>
                                          <li>
                                             Agendamiento de Fabricaci??n: esto quiere decir que la fabrica puede tener atochamientos en la fabricaci??n de uno o mas productos en sus l??neas productivas
                                          </li>
                                          <li>
                                              Agendamiento de Abastecimiento: Corresponde a los quiebres de stock que nuestros proveedores mantienen para las materias Primas.
                                          </li>
                                          <li>
                                              Terminaci??n taller Pintura: Este caso es sumamente sensible, ya que nuestros productos son pintados de forma artesanal, o semi industrial y el secado de esta terminaci??n, queda sujeto a las condiciones clim??ticas, que en algunas temporadas sobre pasa la semana.
                                          </li>
                                          <li>
                                              Terminaci??n Enlozado: Servicio Tercerizado, que esta sujeto a la carga de trabajo por parte de nuestro proveedor, en algunos casos el tiempo de espera se puede retrasar hasta por 3 semanas.
                                          </li>
                                      </ol>
                                  </li>
                                  <li>
                                      Nuestro cliente puede revisar todos nuestros productos indistintamente si mantienen quiebre de stock.
                                  </li>
                                  <li>
                                        Para los casos que nuestros clientes deseen comprar nuestros productos y estos mantengan quiebre de stock, desarrollamos un apartado agendamiento, esto quiere decir que el cliente se contactara mediante la p??gina, para agendar la fabricaci??n de nuestros productos.
                                  </li>
                                  <li>
                                      El proceso de agendamiento contempla varias etapas:
                                      <ol>
                                          <li>
                                              El cliente debe identificar su o sus productos.
                                          </li>
                                          <li>
                                              El Cliente debe indicar las cantidades que va a necesitar agendar para la fabricaci??n.
                                          </li>
                                          <li>
                                              El, administrador del sitio, recepci??na la solicitud de fabricaci??n, se pone en contacto con fabrica, la cual determina los d??as pertinentes para la fabricaci??n, luego se notifica al cliente el tiempo de espera, para su aprobaci??n.
                                          </li>
                                          <li>
                                              El cliente al momento de aprobar los plazos indicados por agendamiento, Para el cliente Distribuidor; la solicitud de Agendamiento de fabricaci??n, se convierte en Orden de trabajo, lo que ser?? facturado de inmediatamente a la espera de ser fabricado y distribuido hacia nuestro cliente, Para el cliente persona Natural, Este debe Transferir o cancelar la Mitad del valor del agendamiento, como modo de anticipo por el trabajo agendado a fabrica.
                                          </li>
                                          <li>
                                              Una ves contemos con el stock seg??n la solicitud de agendamiento, se notifica al cliente mediante mail, direccion??ndolo al carrito de copra de nuestra web.
                                          </li>
                                      </ol>
                                  </li>
                                  <li>
                                      Todos nuestros clientes al momento de generar la operaci??n de compra, sus datos est??n custodiados por El se??or de los discos spa. Nos denominamos sitio seguro para efectuar pagos, navegar en nuestra web, realizar agendamientos, contactarnos y solicitar visitas o reuniones en terreno.
                                  </li>
                                  <li>
                                      Nuestra Modalidad pago online, est?? sujeta a nuestro proveedor de sistema Webpay, donde nuestro cliente podr?? elegir su medio de pago.
                                  </li>
                                  <li>
                                      Una ves realizada la compra en nuestra web, se notifica al cliente mediante correo, se env??a boleta de la transacci??n y datos del despacho.
                                  </li>
                                  <li>
                                      Los despachos est??n sujetos a nuestros proveedores de transporte, (Chilexpress, Starken, correos de chile entre otros medios de transportes tradicionales) una ves generada la venta, nuestro proveedor de transporte retira el producto en taller, y realiza la distribuci??n final hasta el cliente.
                                  </li>
                                  <li>
                                      Tambi??n contamos con la opci??n retiro en taller, previo a la compra o agendamiento de los productos.
                                  </li>
                                  <li>
                                      No contamos con servicio t??cnico.
                                  </li>
                                  <li>
                                      Contamos y nos acogemos a la garant??a legal seg??n lo indica sernac. Seg??n legislaci??n chilena
                                  </li>
                                  <li>
                                      Para efecto de devoluciones contamos con pol??ticas comerciales tales:
                                      <ol>
                                          <li>Nuestro cliente debe conservar la Boleta de la compra.</li>
                                          <li>No nos responsabilizamos si un producto previo al uso necesita curado y el cliente no sabe realizar este proceso.</li>
                                          <li>No nos podemos responsabilizar si nuestro cliente no sigues los cuidados de alguno de nuestros productos.</li>
                                          <li>Nuestros woks, necesitan curado previo al uso, en nuestra vitrina encontrara nuestro cliente el wok curado y no curado, en caso de oxido del producto por mal uso la marca no se hace responsable del oxido del mismo.</li>
                                          <li>Nuestro Cliente no debe intervenir el producto, ya sea con pinturas, maquinas manuales o industriales, no debe estar intervenido con fuego, o con alg??n objeto contundente, el producto debe permanecer en las mismas condiciones que es enviado, todos nuestros productos que est??n en vitrina de venta son copia fiel al original, se considera devoluci??n a problemas t??cnicos o por la fabricaci??n misma, un producto que perdi?? una pieza, un componente por culpa del cliente no se considera devoluci??n, ya que este se asume intervenci??n intensional donde la marca no esta sujeta a la devoluci??n del producto o del dinero. </li>
                                          <li>Al momento de realizar la compra es el cliente quien cancela la distribuci??n del producto mediante un medio de transporte lo cual esta detallado al momento de la compra, si el cliente desea realizar la devoluci??n de nuestros productos ser?? el que tendr?? que re enviar y cancelar los valores asociados a este env??o a nuestras dependencias, o dirigirse a nuestro taller. En el cual se determinara y revisara el producto para determinar si aplica devoluci??n seg??n lo dispuesto en este informativo de pol??ticas de compra, en el caso que el producto cumpla las condiciones con lo estipulado en lo descrito en este mismo informativo se dar?? comienzo a la devoluci??n de cambio de producto o devoluci??n del dinero si el cliente lo requiera, en caso de no aplicar devoluci??n por lo descrito anteriormente, ser?? el cliente quien tendr?? que realizar el retiro nuevamente del producto o envi?? hasta su domicilio considerando los costos asociados a esta operaci??n, En caso de que aplique devoluci??n ser?? el cliente quien asumir?? los costos asociados a la distribuci??n nuevamente hasta su Domicilio.</li>
                                          <li>Todas nuestras ventas est??n sujeta a mas gastos de env??o sea cual sea el caso</li>
                                          <li>Todos nuestros env??os est??n tercerizados y responsabilizados por nuestros proveedores de distribuci??n,  en caso que el producto sufra da??os en el transporte hasta su domicilio, es el transporte que gatilla su seguro de carga ante el cliente,  y este debe ser notado, avisado, al mismo momento de la recepci??n del producto al operario del transporte, indicando la disconformidad del servicio de transporte estropeando el producto, de no indicar fallas  en el producto en la recepci??n del mismo, se asume como una recepci??n conforme en domicilio del cliente, quedando nula la opci??n de ejercer el seguro de carga por parte del cliente, Donde la marca no se responsabiliza por recepci??n conforme cuando debi?? ser disconforme por parte del cliente.</li>
                                          <li>www.elsenordelosdiscos.cl es una vitrina virtual de productos donde se ejerce el libre comercio de productos seg??n lo indica la legislaci??n chilena, donde a su vez el cliente puede cancelar de forma segura y online nuestros productos.  siempre se le informa al cliente que sus env??os est??n sujetos a un tercero, sea en la navegaci??n o al momento de concretar la compra, donde es el cliente que cancela por el servicio de transporte ??ltima milla, o donde el cliente tiene la opci??n de retirar el o los productos directo en nuestro taller.</li>
                                          <li>Los tiempos de entrega est??n sujetos a la carga de trabajo, agendamiento u otro particular al proveedor del servicio de transporte.</li>
                                      </ol>
                                  </li>
                                  <li>
                                      Somos PYME de fabricaci??n artesanal nacional.
                                  </li>
                              </ol>
                          </div>
                       </div>
                       <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                       </div>
                    </div>
                </div>
      </div>
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
                                      <input type="password" placeholder="Contrase??a" name="txtPass" required="">
                                   </div>
                                    <div class="g-recaptcha" data-sitekey="6LeVfbMaAAAAAORJ7Zqzh3FypKqM-FRw4mHGH9BA" data-callback="modalEnableBtn"></div>
                                    <div>
                                        <a href="RecuperarPass.jsp" class="link">
                                            ??Olvidaste tu contrase??a?
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
       
    </body>
</html>
