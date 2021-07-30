/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WebPay;

import Clases.Venta;
import Clases.VentaPK;
import cl.transbank.common.IntegrationType;
import cl.transbank.webpay.exception.TransactionCreateException;
import cl.transbank.webpay.webpayplus.WebpayPlus;

import cl.transbank.webpay.webpayplus.WebpayPlus;
import cl.transbank.webpay.webpayplus.model.WebpayPlusTransactionCreateResponse;
import java.io.IOException;

/**
 *
 * @author chris
 */
public class WebPay {

    /**
     * @param args the command line arguments
     */
    public static WebpayPlusTransactionCreateResponse ObtenerLink(Venta venta ,String id) throws TransactionCreateException, IOException {
       // Host: https://webpay3gint.transbank.cl
       // Tbk-Api-Key-Id: Código de comercio
       // Tbk-Api-Key-Secret: Llave secreta
       // Content-Type: application/json
       WebpayPlusTransactionCreateResponse r=new WebpayPlusTransactionCreateResponse(); 
       try{
       WebpayPlus.Transaction.setCommerceCode("597037555088");
       WebpayPlus.Transaction.setApiKey("5075a853f0f3cc4e02743c3f4058a87b");
       WebpayPlus.Transaction.setIntegrationType(IntegrationType.LIVE);
       VentaPK ventapk= venta.getVentaPK();
       String idVenta= String.valueOf(ventapk.getIdventa());
       double precio = venta.getDocumentoTributarioList().get(0).getBoleta().getMontoFinal();
       final WebpayPlusTransactionCreateResponse response = WebpayPlus.Transaction.create(idVenta,id,precio,"https://elsenordelosdiscos.cl/RespuestaWebPay");
       r=response;
       return r;
       }
       catch(Exception e)
       {
           e.getMessage();
       }
       return r;
    }
    
}
