<%-- 
    Document   : AgregarFabricante
    Created on : 20-10-2020, 14:46:57
    Author     : chris
--%>

<%@page import="Clases.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <script type="text/javascript">
        function Validar()
        {
            var rut =document.forms["FormularioAddFabricante"]["txtRut"].value;
            var fabricante =document.forms["FormularioAddFabricante"]["txtNombreFabricante"].value;
            var telefono =document.forms["FormularioAddFabricante"]["txtTelefono"].value;
            var banco =document.forms["FormularioAddFabricante"]["txtBanco"].value;
            var ncuenta =document.forms["FormularioAddFabricante"]["txtNumeroCuenta"].value;
            
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
                document.forms["FormularioAddFabricante"]["txtRut"].style.borderColor = "red";
                alert("Ingrese el rut en el formato correcto xxxxxxx-x");
                return false;
            } 
            
            if(fabricante==0)
            {
                document.forms["FormularioAddFabricante"]["txtNombreFabricante"].style.borderColor = "red";
                alert('Ingrese el nombre del fabricante');
                return false;
            }
            if(telefono==0)
            {
                document.forms["FormularioAddFabricante"]["txtTelefono"].style.borderColor = "red";
                alert('Ingrese el telefono del fabricante');
                return false;
            }
            if(banco==0)
            {
                document.forms["FormularioAddFabricante"]["txtBanco"].style.borderColor = "red";
                alert('Ingrese el banco del fabricante');
                return false;
            }
            if(ncuenta==0)
            {
                document.forms["FormularioAddFabricante"]["txtNumeroCuenta"].style.borderColor = "red";
                alert('Ingrese el N° de cuenta del fabricante');
                return false;
            }
            
        }
    </script>
    <body>
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
            if(s.getAttribute("errorMessage")!=null)
            {%>
            <div class="error form-group contact-forms">
                <% 
                    out.println(s.getAttribute("errorMessage"));
                    s.removeAttribute("errorMessage");
                %>
            </div>
           <% }
        %>
        <form action="../AgregarFabricante" name="FormularioAddFabricante" method="POST" onsubmit="return Validar()">
             <table>
                <tr>
                    <td>
                        Nombre del fabricante
                    </td>
                    <td>
                        <input type="text" name="txtNombreFabricante">
                    </td>
                </tr>
                <tr>
                    <td>
                        Rut del fabricante
                    </td>
                    <td>
                        <input type="text" name="txtRut">
                    </td>
                </tr>
                <tr>
                    <td>
                         Banco    
                    </td>
                    <td>
                        <input type="text" name="txtBanco">
                    </td>
                </tr>
                <tr>
                    <td>
                         N° de cuenta
                    </td>
                    <td>
                        <input type="text" name="txtNumeroCuenta">
                    </td>
                </tr>
                <tr>
                    <td>
                        Telefono
                    </td>
                    <td>
                        <input type="number" name="txtTelefono">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Agregar">
                    </td>
                    <td>
                        <input type="reset" value="Limpiar">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
