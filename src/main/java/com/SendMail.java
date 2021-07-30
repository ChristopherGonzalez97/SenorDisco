/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import Clases.Despacho;
import Clases.Destinatario;
import Clases.DetallePedido;
import Clases.DetalleVenta;
import Clases.Pedido;
import Clases.Usuario;
import Clases.Venta;
import com.ctc.wstx.util.StringUtil;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tools.ant.types.selectors.TypeSelector.FileType;

public class SendMail {

    public static void EnviarContraseña(String destino, String PassSegura) {

        // Recipient's email ID needs to be mentioned.
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);  
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Cambio de contraseña señor de los discos");

            // Send the actual HTML message.
             message.setContent(
             "<h1>Su nueva contraseña de ingreso <a>El señor de los discos</a> es</h1><br> "
             + "<h3><strong>"+PassSegura+"</strong></h3>"+
             "<h4>Recuerde cambiar la contraseña una vez iniciada la sesion</h4>",
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }
    public static void EnviarBoleta(byte[] byteArr) throws IOException, ClassNotFoundException
    {
        // Recipient's email ID needs to be mentioned.
        String to = "";

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
       // properties.put("mail.smtp.socketFactory.port", "465");  
      //  properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
       // properties.put("mail.smtp.socketFactory.fallback", "false");  
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                 return new PasswordAuthentication("", "");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));

        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));

   

        // Add html content

        // Specify the cid of the image to include in the email
        
        String html = "<html><body><b>Boleta de su compra en el señor de los discos</b> <img src='cid:ABC123xyz'></body></html>";

        Multipart mp = new MimeMultipart();

        MimeBodyPart htmlPart = new MimeBodyPart();

        htmlPart.setContent(html, "text/html");
        mp.addBodyPart(htmlPart);

        // add image in another part

        MimeBodyPart imagePart = new MimeBodyPart();
       
        ByteArrayDataSource rawData= new ByteArrayDataSource(byteArr, "application/octet-stream");
        DataHandler data= new DataHandler(rawData);
        imagePart.setDataHandler(new DataHandler(rawData));
        imagePart.setFileName("Boleta.jpg");
        // assign a cid to the image

        imagePart.setHeader("Content-ID", "ABC123xyz");

        mp.addBodyPart(imagePart);
        message.setContent(mp);

            

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Boleta de su compra");

            // Send the actual HTML message.
      
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
    public static void EnviarAviso(Venta venta,String destino)
    {
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
          
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });
        
         // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Compra en El señor de los discos");
            Destinatario de = venta.getDespachoList().get(0).getDestinatarioidDestinatario();
            List<DetalleVenta> dv=venta.getDetalleVentaList();
            StringBuilder productos = new StringBuilder();            
            for(DetalleVenta p:dv)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            Despacho des= venta.getDespachoList().get(0);
            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(venta.getFecha());
            // Send the actual HTML message.
             message.setContent("<h2>Su compra en <a href='https://Elsenordelosdiscos.cl'>El señor de los discos</a> fue exitosa</h2><br><h3>Los datos de su compra son los siguientes:</h3><br>"
                     + "<h3>Nombre: "+de.getNombre()+" "+de.getApellido()+ " </h3> "
                     + "<h3>Id de la compra: "+venta.getVentaPK().getIdventa()+" </h3>"
                     + "<h3>Fecha : "+date+" </h3>"
                     + "<h3>Monto : "+venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()+" </h3>"
                     +productos+"<br><h4>Utilizaremos este medio para darle actualizaciones sobre su compra<h4>"
                     ,
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
            EnviarAvisoDeCompra(venta);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
    }
    public static void EnviarAvisoDeCompra(Venta venta)
    {
        String to = "";

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
          
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });
        
         // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Compra en El señor de los discos");
            Destinatario de = venta.getDespachoList().get(0).getDestinatarioidDestinatario();
            List<DetalleVenta> dv=venta.getDetalleVentaList();
            StringBuilder productos = new StringBuilder();            
            for(DetalleVenta p:dv)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            Despacho des= venta.getDespachoList().get(0);
            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(venta.getFecha());
            // Send the actual HTML message.
             message.setContent("<h2>Nueva venta</h2><br>"
                     + "<h3>Nombre: "+de.getNombre()+" "+de.getApellido()+ " </h3> "
                     + "<h3>Id de la compra: "+venta.getVentaPK().getIdventa()+" </h3>"
                     + "<h3>Fecha : "+date+" </h3>"
                     + "<h3>Monto : "+venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()+" </h3><br>"
                     +productos
                     ,
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
    }
    public static void EnviarAvisoCompraSinDespacho(Venta venta)
    {
        String to = "";

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
          
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });
        
         // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Compra en El señor de los discos");
            Destinatario de = venta.getDespachoList().get(0).getDestinatarioidDestinatario();
            List<DetalleVenta> dv=venta.getDetalleVentaList();
            StringBuilder productos = new StringBuilder();            
            for(DetalleVenta p:dv)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            Despacho des= venta.getDespachoList().get(0);
            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(venta.getFecha());
            // Send the actual HTML message.
             message.setContent("<h2>Se realizo una compra sin despacho</h2><br><h3>Los datos de su compra son los siguientes:</h3><br>"
                     + "<h3>Nombre: "+de.getNombre()+" "+de.getApellido()+ " </h3> "
                     + "<h3>Id de la compra: "+venta.getVentaPK().getIdventa()+" </h3>"
                     + "<h3>Fecha : "+date+" </h3>"
                     + "<h3>Telefono: "+venta.getDespachoList().get(0).getDestinatarioidDestinatario().getTelefono()+" </h3>"
                     + "<h3>Email: "+venta.getDespachoList().get(0).getDestinatarioidDestinatario().getEmail()+" </h3>"
                     + "<h3>Monto : "+venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()+" </h3>"
                     +productos+"<br>"
                     ,
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
    }
    
    public static void EnviarAgendamiento(String destino,Pedido pedido)
    {
        // Recipient's email ID needs to be mentioned.
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
         
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            String pattern = "dd/MM/yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(pedido.getFecha());
            message.setSubject("Agendamiento creado");
            List<DetallePedido> ped= pedido.getDetallePedidoList();
            StringBuilder productos = new StringBuilder();            
            for(DetallePedido p:ped)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            // Send the actual HTML message.
             message.setContent(
             "<h3>Se ha agendado un pedido en <a href='https://Elsenordelosdiscos.cl'>El señor de los discos</a> con los siguientes datos</h3><br><h3>Id del agendamiento : "+pedido.getIdpedido()+"</h3><br>"+productos.toString()
                     +"<h3>Fecha aproximada de terminacion: </h3>"+date+"<h4>Una vez finalizada la construccion de sus productos se le notificara por este medio</h4>"
             ,
             "text/html");
            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }
    public static void AgendamientoEstado(String destino,Pedido pedido)
    {
        // Recipient's email ID needs to be mentioned.
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
        
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Agendamiento El señor de los discos");
            List<DetallePedido> ped= pedido.getDetallePedidoList();
            StringBuilder productos = new StringBuilder();            
            for(DetallePedido p:ped)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            // Send the actual HTML message.
             message.setContent(
             "<h2>Su pedido en <a href='https://Elsenordelosdiscos.cl'>El señor de los discos</a> ha sido "+pedido.getEstado()+"  con los siguientes datos</h2><br><h2>Id del agendamiento :"+pedido.getIdpedido()+"</h2><br>"+productos.toString()+"<h4>Una vez finalizado debe realizar el pago en el siguiente link <a href='https://Elsenordelosdiscos.cl/Paginas/BuscadorAgendamientos.jsp' >El señor de los discos </a></h4>"
             ,
             "text/html");
            // Send message
            Transport.send(message);
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }
    public static void VentaEstado(String destino , Venta venta)
    {
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);;
       // properties.put("mail.smtp.socketFactory.port", "465");  
       // properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");  
        //properties.put("mail.smtp.socketFactory.fallback", "false");  
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });
        
         // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Estado de su compra en El señor de los discos");
            Destinatario de = venta.getDespachoList().get(0).getDestinatarioidDestinatario();
            List<DetalleVenta> dv=venta.getDetalleVentaList();
            StringBuilder productos = new StringBuilder();            
            for(DetalleVenta p:dv)
              {
                   productos.append("<h3>"+ p.getProducto().getNombre()+" x "+p.getCantidad()+"</h3><br>");
              }
            Despacho des= venta.getDespachoList().get(0);
            String pattern = "MM-dd-yyyy";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
            String date = simpleDateFormat.format(venta.getFecha());
            // Send the actual HTML message.
            String despacho="";
            if(venta.getDespachoList().get(0).getCodigoDespacho()!=0)
            {
                despacho="<br><h3>Empresa de correo: </h3>" + venta.getDespachoList().get(0).getCompañia() +"<br>" 
                        +"<h3>Identificacion de su envio: </h3>"+ venta.getDespachoList().get(0).getBultoList().get(0).getOrdenDeTransporte();
            }
             message.setContent("<h2>Su compra en <a href='https://Elsenordelosdiscos.cl'>El señor de los discos</a> fue "+venta.getEstado() +"</h2><br><h3>Los datos de su compra son los siguientes:</h3><br>"
                     + "<h3>Nombre: "+de.getNombre()+" "+de.getApellido()+ " </h3> "
                     + "<h3>Id de la compra: "+venta.getVentaPK().getIdventa()+" </h3>"
                     + "<h3>Fecha : "+date+" </h3>"
                     + "<h3>Monto : "+venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal()+" </h3>"
                     +productos.toString()+despacho+"<br><h4>Utilizaremos este medio para darle actualizaciones sobre su compra</h4>"
                     ,
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (Exception e) {
            e.getMessage();
        }
        
    }
    public static void Registro(String destino)
    {
        String to = destino;

        // Sender's email ID needs to be mentioned
        String from = "";

        // Assuming you are sending email from through gmails smtp
        String host = "";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
       // properties.put("mail.smtp.starttls.enable", "false");
        properties.put("mail.smtp.port", "465");
        //properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.trust", "vps-359396.elsenordelosdiscos.cl");
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.starttls.enable", true);
        
        
        
        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("", "");

            }

        });
        
         // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("Estado de su compra en El señor de los discos");
            // Send the actual HTML message.
             message.setContent("<h4>Su registro en <a href='https://Elsenordelosdiscos.cl'> El señor de los discos</a> fue exitosa</h4><br>"
               +"<h5>Le damos la bienvenida a la familia de El señor de los discos y que disfrute de nuestros productos y servicios</h5>",
             "text/html");
            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        
    }
}