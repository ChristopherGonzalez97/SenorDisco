/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Enviame;

import Clases.Despacho;
import Clases.Destinatario;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.json.JsonObject;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
import org.apache.commons.lang3.StringUtils;
import static org.apache.fop.fonts.type1.AdobeStandardEncoding.i;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.velocity.runtime.parser.node.MathUtils;
import org.json.JSONObject;

/**
 *
 * @author pc
 */
public class Enviame {
    
    public static Carrier TarifadorBLX(double weight,String from, String to) throws URISyntaxException, UnsupportedEncodingException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://facturacion.enviame.io/api/v1/prices?weight="+weight+"&from_place="+from+"&to_place="+to+"&carrier=BLX");
        URI uri = builder.build();
        HttpGet request = new HttpGet(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("x-api-key", "");
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Carrier carier = new Carrier();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                datos = datosa[0];  
                datosa = StringUtils.split(datos, "[");
                String carrier=datosa[0];
                String servicios = datosa[1];
                datosa = StringUtils.substringsBetween(servicios,"{", "}");
                List<CarrierService> servicio = new ArrayList<CarrierService>();
                for(String s:datosa)
                {
                    String spliter [] = StringUtils.splitByWholeSeparator(s, ",");
                    ArrayList<String> keeper=new ArrayList<String>();
                    for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                    if(!keeper.get(3).equals("null")){
                        CarrierService service = new CarrierService();
                        service.setName(keeper.get(0));
                        service.setCode(keeper.get(1));
                        service.setTransitDays(Integer.parseInt(keeper.get(2)));
                        service.setPrice(Integer.parseInt(keeper.get(3)));
                        service.setPriceFormatted(keeper.get(4));
                        servicio.add(service);
                    }
                }
                String spliter [] = StringUtils.splitByWholeSeparator(carrier, ",");
                ArrayList<String> keeper=new ArrayList<String>();
                for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                carier.setCode(keeper.get(0));
                carier.setName(keeper.get(1));
                carier.setServices(servicio);
            }
         else{
             System.out.println("FUck");
         }
        return carier;
    }
    public static Carrier TarifadorSKN(double weight,String from, String to) throws URISyntaxException, UnsupportedEncodingException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://facturacion.enviame.io/api/v1/prices?weight="+weight+"&from_place="+from+"&to_place="+to+"&carrier=SKN");
        URI uri = builder.build();
        HttpGet request = new HttpGet(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("x-api-key", "");
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Carrier carier = new Carrier();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                datos = datosa[0];  
                datosa = StringUtils.split(datos, "[");
                String carrier=datosa[0];
                String servicios = datosa[1];
                datosa = StringUtils.substringsBetween(servicios,"{", "}");
                List<CarrierService> servicio = new ArrayList<CarrierService>();
                for(String s:datosa)
                {
                    String spliter [] = StringUtils.splitByWholeSeparator(s, ",");
                    ArrayList<String> keeper=new ArrayList<String>();
                    for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                    if(!keeper.get(3).equals("null")){
                        CarrierService service = new CarrierService();
                        service.setName(keeper.get(0));
                        service.setCode(keeper.get(1));
                        service.setTransitDays(Integer.parseInt(keeper.get(2)));
                        service.setPrice(Integer.parseInt(keeper.get(3)));
                        service.setPriceFormatted(keeper.get(4));
                        servicio.add(service);
                    }
                }
                String spliter [] = StringUtils.splitByWholeSeparator(carrier, ",");
                ArrayList<String> keeper=new ArrayList<String>();
                for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                carier.setCode(keeper.get(0));
                carier.setName(keeper.get(1));
                carier.setServices(servicio);
            }
         else{
             System.out.println("FUck");
         }
        return carier;
    }
    public static Carrier ListadoCarriers() throws URISyntaxException, UnsupportedEncodingException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s1/v1/companies/3974/carriers");
        URI uri = builder.build();
        HttpGet request = new HttpGet(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        request.setHeader("Content-Type", "application/json");
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Carrier carier = new Carrier();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                datos = datosa[0];  
                datosa = StringUtils.split(datos, "[");
                String carrier=datosa[0];
                String servicios = datosa[1];
                datosa = StringUtils.substringsBetween(servicios,"{", "}");
                List<CarrierService> servicio = new ArrayList<CarrierService>();
                for(String s:datosa)
                {
                    String spliter [] = StringUtils.splitByWholeSeparator(s, ",");
                    ArrayList<String> keeper=new ArrayList<String>();
                    for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                    if(!keeper.get(3).equals("null")){
                        CarrierService service = new CarrierService();
                        service.setName(keeper.get(0));
                        service.setCode(keeper.get(1));
                        service.setTransitDays(Integer.parseInt(keeper.get(2)));
                        service.setPrice(Integer.parseInt(keeper.get(3)));
                        service.setPriceFormatted(keeper.get(4));
                        servicio.add(service);
                    }
                }
                String spliter [] = StringUtils.splitByWholeSeparator(carrier, ",");
                ArrayList<String> keeper=new ArrayList<String>();
                for(String t:spliter)
                    {
                        String r [] = StringUtils.splitByWholeSeparator(t, ":");
                        keeper.add(r[1]);
                    }
                carier.setCode(keeper.get(0));
                carier.setName(keeper.get(1));
                carier.setServices(servicio);
            }
         else{
             System.out.println("FUck");
         }
        return carier;
    }
    
    public static Carrier ListarBodega() throws URISyntaxException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s1/v1/warehouses/03");
        URI uri = builder.build();
        HttpGet request = new HttpGet(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Carrier carier = new Carrier();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                datos = datosa[0];  
                datosa = StringUtils.split(datos, "[");
                String carrier=datosa[0];
                String servicios = datosa[1];
                datosa = StringUtils.substringsBetween(servicios,"{", "}");
              
                
            }
         else{
             System.out.println("FUck");
         }
        return carier;
    }
    public static List<CompañiaRetiro> ListarRetiros() throws URISyntaxException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s2/v2/companies/3974/pickups");
        URI uri = builder.build();
        HttpGet request = new HttpGet(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        List<CompañiaRetiro> retiros= new ArrayList<CompañiaRetiro>();
        Carrier carier = new Carrier();
        if (entity != null) 
            {   
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                
                datos = datosa[0];
                datosa = StringUtils.split(datos, "[");
                datos=datosa[1];
                datosa=StringUtils.splitByWholeSeparator(datos,"},{");
                CompañiaRetiro starken = new CompañiaRetiro();
                starken.setCodRetiro("SKN");
                CompañiaRetiro blueExpress = new CompañiaRetiro();
                blueExpress.setCodRetiro("BLX");
                for(String s:datosa)
                {
                    String answer = StringUtils.substringAfter(s, "carrier:");
                    String carrierInfo[] = StringUtils.substringsBetween(answer, "{", "}");
                    carrierInfo=StringUtils.split(carrierInfo[0], ",");
                    for(String c:carrierInfo)
                    {
                        String a[]=StringUtils.split(c,":");
                        if(a[0].equalsIgnoreCase("code"))
                        {
                            if(a[1].equalsIgnoreCase("SKN"))
                            {
                                String answer2 = StringUtils.substringAfter(s, "pickup_date:");
                                String dateInfo[]=StringUtils.split(answer2, ",");
                                dateInfo = StringUtils.split(dateInfo[0]);
                                answer2 = dateInfo[0];
                                Retiro retiro = new Retiro();
                                s=StringUtils.replace(s, "carrier_identifier", "-");
                                String answer3 = StringUtils.substringAfter(s, "identifier:");
                                String idInfo[]= StringUtils.split(answer3, ",");
                                answer3= idInfo[0]; 
                                String answer4 = StringUtils.substringAfter(s, "qty:");
                                String qtyInfo[]= StringUtils.split(answer4, ",");
                                answer4= qtyInfo[0]; 
                                
                                retiro.setFecha(answer2);
                                retiro.setIdRetiro(answer3);
                                retiro.setQty(Integer.parseInt(answer4));
                                starken.getRetiroList().add(retiro);
                            }
                            else if(a[1].equalsIgnoreCase("BLX"))
                            {
                                String answer2 = StringUtils.substringAfter(s, "pickup_date:");
                                String dateInfo[]=StringUtils.split(answer2, ",");
                                dateInfo = StringUtils.split(dateInfo[0]);
                                answer2 = dateInfo[0];
                                Retiro retiro = new Retiro();
                                s=StringUtils.replace(s, "carrier_identifier", "-");
                                String answer3 = StringUtils.substringAfter(s, "identifier:");
                                String idInfo[]= StringUtils.split(answer3, ",");
                                answer3= idInfo[0]; 
                                String answer4 = StringUtils.substringAfter(s, "qty:");
                                String qtyInfo[]= StringUtils.split(answer4, ",");
                                answer4= qtyInfo[0]; 
                                
                                retiro.setQty(Integer.parseInt(answer4));
                                retiro.setFecha(answer2);
                                retiro.setIdRetiro(answer3);
                                blueExpress.getRetiroList().add(retiro);
                            }
                        }
                    }
                }
               retiros.add(starken);
               retiros.add(blueExpress);
            }
         else{
             System.out.println("FUck");
         }
        return retiros;
    }
    
    public static Carrier CrearRetiro(String qty, String fecha, String cariier) throws URISyntaxException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s2/v2/companies/3974/pickups");
        URI uri = builder.build();
        HttpPost request = new HttpPost(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        request.addHeader("Content-Type","application/x-www-form-urlencoded");
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);  

        nameValuePairs.add(new BasicNameValuePair("carrier_code", cariier));  
        nameValuePairs.add(new BasicNameValuePair("warehouse_code", "03"));  
        nameValuePairs.add(new BasicNameValuePair("qty", qty));  
        nameValuePairs.add(new BasicNameValuePair("contact_name", "Diego Serrano"));  
        nameValuePairs.add(new BasicNameValuePair("contact_phone", "995503346	"));  
        nameValuePairs.add(new BasicNameValuePair("range_time", "PM"));  
        nameValuePairs.add(new BasicNameValuePair("pickup_date", fecha));  
        request.setEntity(new UrlEncodedFormEntity(nameValuePairs));
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
     
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
            }
         else{
             System.out.println("FUck");
         }
          Carrier carier = new Carrier();
          return carier;
            
    }
    
    public static Envio CrearEnvioPrueba() throws URISyntaxException, IOException
    {

        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s2/v2/companies/3974/deliveries");
        URI uri = builder.build();
        HttpPost request = new HttpPost(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        request.setHeader("Content-Type", "application/json");
        JSONObject json = new JSONObject();
        JSONObject shippingOrder = new JSONObject();
        JSONObject shippingOrigin= new JSONObject();
        JSONObject deliveryAddress= new JSONObject();
        Envio envio = new Envio();
        JSONObject shippingDestination = new JSONObject();
        JSONObject customer = new JSONObject();
        JSONObject homeAddress = new JSONObject();
        JSONObject carrier = new JSONObject();
        shippingOrder.put("n_packages", "1"); 
        shippingOrder.put("content_description", "Orden 123"); 
        shippingOrder.put("imported_id", "1"); 
        shippingOrder.put("order_price", "21990.0"); 
        shippingOrder.put("weight", "1.0"); 
        shippingOrder.put("volume", "1.0"); 
        shippingOrder.put("type", "delivery"); 
        shippingOrigin.put("warehouse_code", "03"); 
        customer.put("name", "roberto pavez basualto"); 
        customer.put("email", ""); 
        customer.put("phone", ""); 
        homeAddress.put("place", "NUNOA"); 
        homeAddress.put("full_address", "Platon 5171,PEDRO AGUIRRE CERDA, METROPOLITANA DE SANTIAGO"); 
        homeAddress.put("information", ""); 
        shippingDestination.put("customer",customer); 
        deliveryAddress.put("home_address", homeAddress);
        shippingDestination.put("delivery_address", deliveryAddress);
        carrier.put("carrier_code", "SKN"); 
        carrier.put("carrier_service", "priority"); 
        carrier.put("tracking_number", "");
        
        json.put("shipping_order", shippingOrder);
        json.put("shipping_origin", shippingOrigin);
        json.put("shipping_destination", shippingDestination);
        json.put("carrier", carrier);
        String see = json.toString();
        
        StringEntity params = new StringEntity(json.toString());
        request.setEntity(params);
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Carrier carier = new Carrier();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String answer2 = StringUtils.substringAfter(datos, "identifier:");
                String idInfo[]= StringUtils.split(answer2, ",");
                answer2= idInfo[0];
                envio.setIdEtiqueta(answer2);
                answer2 = StringUtils.substringAfter(datos, "tracking_number:");
                idInfo = StringUtils.split(answer2, ",");
                answer2= idInfo[0];
                envio.setIdRastreo(answer2);
                String answer3 = StringUtils.substringAfter(datos, "PDF:");
                idInfo = StringUtils.split(answer3, ",");
                answer3= idInfo[0];
                envio.setEtiqueta(answer3);
            }
         else{
             System.out.println("FUck");
         }
        return envio;
    }
    

    public static Envio CrearEnvio(int cantBultos, String contenido,int idDespacho, int precioProductos,String infoAdicional ,String comuna, String direccion , Destinatario destinatario,Despacho despacho, String carier) throws URISyntaxException, IOException
    {
        HttpClient httpclient = HttpClients.createDefault();     
        URIBuilder builder = new URIBuilder("https://api.enviame.io/api/s2/v2/companies/3974/deliveries");
        URI uri = builder.build();
        HttpPost request = new HttpPost(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        request.setHeader("Content-Type", "application/json");
        JSONObject json = new JSONObject();
        JSONObject shippingOrder = new JSONObject();
        JSONObject shippingOrigin= new JSONObject();
        JSONObject deliveryAddress= new JSONObject();
        
        JSONObject shippingDestination = new JSONObject();
        JSONObject customer = new JSONObject();
        JSONObject homeAddress = new JSONObject();
        JSONObject carrier = new JSONObject();
        shippingOrder.put("n_packages", cantBultos); 
        shippingOrder.put("content_description", contenido); 
        shippingOrder.put("imported_id", idDespacho); 
        shippingOrder.put("order_price", precioProductos); 
        shippingOrder.put("weight", "1.0"); 
        shippingOrder.put("volume", "1.0"); 
        shippingOrder.put("type", "delivery"); 
        shippingOrigin.put("warehouse_code", "03"); 
        customer.put("name", destinatario.getNombre()+" "+destinatario.getApellido()); 
        customer.put("email", destinatario.getEmail()); 
        customer.put("phone", destinatario.getTelefono()); 
        homeAddress.put("place", comuna); 
        homeAddress.put("full_address", direccion); 
        if(infoAdicional.isEmpty())
        {
            homeAddress.put("information", ""); 
        }else{
            homeAddress.put("information", infoAdicional); 
        }
        shippingDestination.put("customer",customer); 
        deliveryAddress.put("home_address", homeAddress);
        shippingDestination.put("delivery_address", deliveryAddress);
        carrier.put("carrier_code", carier); 
        carrier.put("carrier_service",despacho.getTipo()); 
        carrier.put("tracking_number", "");
        
        json.put("shipping_order", shippingOrder);
        json.put("shipping_origin", shippingOrigin);
        json.put("shipping_destination", shippingDestination);
        json.put("carrier", carrier);
        String see = json.toString();
        
        StringEntity params = new StringEntity(json.toString());
        request.setEntity(params);
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
        Envio envio = new Envio();
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String answer2 = StringUtils.substringAfter(datos, "identifier:");
                String idInfo[]= StringUtils.split(answer2, ",");
                answer2= idInfo[0];
                envio.setIdEtiqueta(answer2);
                answer2 = StringUtils.substringAfter(datos, "tracking_number:");
                idInfo = StringUtils.split(answer2, ",");
                answer2= idInfo[0];
                envio.setIdRastreo(answer2);
                String answer3 = StringUtils.substringAfter(datos, "PDF:");
                idInfo = StringUtils.split(answer3, ",");
                answer3= idInfo[0];
                envio.setEtiqueta(answer3);
            }
         else{
             System.out.println("FUck");
         }
        return envio;
    }
    
    public static String nextDiaHabil(String date) throws ParseException
    {
        DateTimeFormatter sdf= DateTimeFormatter.ISO_DATE;
        LocalDate fechaManana= LocalDate.parse(date, sdf);
        fechaManana = fechaManana.plusDays(1);
        while(fechaManana.getDayOfWeek() == DayOfWeek.SATURDAY ||  fechaManana.getDayOfWeek() == DayOfWeek.SUNDAY)
        {
            fechaManana = fechaManana.plusDays(1);
        }
        date = fechaManana.format(sdf);
        return date;
    }
    
    public static void EditarRetiro(String id,String qty) throws UnsupportedEncodingException, URISyntaxException, IOException {
        HttpClient httpclient = HttpClients.createDefault();     
        String ur = "https://api.enviame.io/api/s2/v2/companies/3974/pickups/"+id;
        URIBuilder builder = new URIBuilder(ur);
        URI uri = builder.build();
        HttpPut request = new HttpPut(uri);
        request.setHeader("Accept", "application/json");
        request.setHeader("api-key", "");
        request.addHeader("Content-Type","application/x-www-form-urlencoded");
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>(2);
        nameValuePairs.add(new BasicNameValuePair("qty", qty ));  
        request.setEntity(new UrlEncodedFormEntity(nameValuePairs));
        HttpResponse response = httpclient.execute(request);
        HttpEntity entity = response.getEntity();
     
        if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
            }
         else{
             System.out.println("FUck");
         }
    }
public static int Redondear(int number)
{
    int redondear = number;
    double r= redondear/100;
    r = Math.ceil(r);
    redondear = (int)(r+1)*100;
    return redondear;
}

}


