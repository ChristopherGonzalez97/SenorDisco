/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Despacho;
/**
 *
 * @author chris
 */
import com.google.gson.Gson;
import java.net.URI;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;

public class ChileExpress 
{
        public static HashMap<String, RegionChileExpress> ObtenerRegiones()
    {
        HttpClient httpclient = HttpClients.createDefault();
        HashMap<String, RegionChileExpress> mapa = new HashMap<String, RegionChileExpress>();
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/georeference/api/v1.0/regions");
            URI uri = builder.build();
            HttpGet request = new HttpGet(uri);
            request.setHeader("Cache-Control", "no-cache");


            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) 
            {
                ArrayList<String> arrayConLosDatos = new ArrayList<String>();
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                String[] a= StringUtils.substringsBetween(datosa[0],"{" ,"}");
                for(String frase:a)
                {
                    ArrayList<String> last=new ArrayList<String>();
                    RegionChileExpress region= new RegionChileExpress();
                    String[] b =StringUtils.splitByWholeSeparator(frase, ",");
                    for(String slit:b)
                    {
                        //Array de un arrray
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        last.add(c[1]);
                    }
                    region.setRegionId(last.get(0));
                    region.setRegionName(last.get(1));
                    region.setIneRegionCode(Integer.parseInt(last.get(2)));
                    mapa.put(last.get(1), region);

                }
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return mapa;
    }
        public static HashMap<String, ComunaChileExpress> Comunas(String regionCode) 
    {
        HttpClient httpclient = HttpClients.createDefault();
        HashMap<String, ComunaChileExpress> mapa = new HashMap<String, ComunaChileExpress>();
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/georeference/api/v1.0/coverage-areas?RegionCode="+regionCode+"&type=0");

            URI uri = builder.build();            
            HttpGet request = new HttpGet(uri);
            request.setHeader("Cache-Control", "no-cache");
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) 
            {
                ArrayList<String> arrayConLosDatos = new ArrayList<String>();
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                String[] a= StringUtils.substringsBetween(datosa[0],"{" ,"}");
                for(String frase:a)
                {
                    ArrayList<String> last=new ArrayList<String>();
                    ComunaChileExpress comuna = new ComunaChileExpress();
                    String[] b =StringUtils.splitByWholeSeparator(frase, ",");
                    for(String slit:b)
                    {
                        //Array de un arrray
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        last.add(c[1]);
                    }
                    comuna.setCountyCode(last.get(0));
                    comuna.setCountyName(last.get(1));
                    comuna.setRegionCode(last.get(2));
                    comuna.setIneCountyCode(Integer.parseInt(last.get(3)));
                    comuna.setQueryMode(Integer.parseInt(last.get(4)));
                    comuna.setCoverageName(last.get(5));
                    mapa.put(last.get(1), comuna);
                }
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return mapa;
    }
       
     public static CalleChileExpress BuscarCalle(String countyName , String streetName) 
    {
        CalleChileExpress calle = new CalleChileExpress();
        HttpClient httpclient = HttpClients.createDefault();      
        try
        {
            int flag=0;
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/georeference/api/v1.0/streets/search");
            flag=1;
            URI uri = builder.build();
            flag=2;
            HttpPost request = new HttpPost(uri);
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Cache-Control", "no-cache");
            JSONObject json = new JSONObject();
            json.put("countyName", countyName); 
            json.put("streetName", streetName); 
            StringEntity params = new StringEntity(json.toString());
            request.setEntity(params);
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();
            if (entity != null) 
            {
                ArrayList<String> Calle = new ArrayList<String>();
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                String[] a= StringUtils.substringsBetween(datosa[0],"{" ,"}");
                if(a[0].equals(""))
                {
                    throw new Exception("Calle no encontrada");
                }
                for(String frase:a)
                {
                    ArrayList<String> last=new ArrayList<String>();
                    String[] b =StringUtils.splitByWholeSeparator(frase, ",");
                    for(String slit:b)
                    {
                        //Array de un arrray
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        last.add(c[1]);
                    }
                    calle.setStreetId(Integer.parseInt(last.get(0)));
                    calle.setStreetName(last.get(1));
                    calle.setCountyName(last.get(2));
                    calle.setRoadType(last.get(3));
                    
            }
            }
        }
            catch (Exception e)
            {
                CalleChileExpress calleNoFound = new CalleChileExpress();
                calleNoFound.setRoadType(e.getMessage());
                calleNoFound.setCountyName(e.getStackTrace().toString());
                calleNoFound.setStreetId(-100);
                return calleNoFound;
            }
        return calle;
    }
     
      public static NumeracionChileExpress Numeracion(int idCalle , int numeracion) 
    {
        HttpClient httpclient = HttpClients.createDefault();
        NumeracionChileExpress num = new NumeracionChileExpress();
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/georeference/api/v1.0/streets/"+idCalle+"/numbers?streetNumber="+numeracion);
            URI uri = builder.build();
            HttpGet request = new HttpGet(uri);
            request.setHeader("Cache-Control", "no-cache");
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();

            if (entity != null) 
            {
                ArrayList<String> Calle = new ArrayList<String>();
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"[" ,"]");
                String[] a= StringUtils.substringsBetween(datosa[0],"{" ,"}");
                if(a[0].equals(""))
                {
                    throw new Exception("Numeracion no encontrada");
                }
                for(String frase:a)
                {
                    ArrayList<String> last=new ArrayList<String>();
                    String[] b =StringUtils.splitByWholeSeparator(frase, ",");
                    for(String slit:b)
                    {
                        //Array de un arrray
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        last.add(c[1]);
                    }
                    num.setNumber(Integer.parseInt(last.get(0)));
                    num.setLatitude(Double.parseDouble(last.get(1)));
                    num.setLongitude(Double.parseDouble(last.get(2)));
                    num.setAddresId(Integer.parseInt(last.get(3)));
                    
            }
        }
        }
        catch (Exception e)
        {
            num.setAddresId(-100);
            return num;
        }
        return num;
    }
      
       public static List<Resultado>  Cotizar(PaqueteChileExpress paquete, ComunaChileExpress comunaDestino,int total) 
    {
        HttpClient httpclient = HttpClients.createDefault();
        String API_KEY = "fd4c082d758148f2855a9ac386cc40bc";
        Resultado resu=new Resultado();
        List<Resultado> resus= new ArrayList();
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/rating/api/v1.0/rates/courier");
            ComunaChileExpress origen = new ComunaChileExpress();
            origen=origen.ComunaOrigenChileExpress();
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);
            JSONObject json = new JSONObject();
            JSONObject packet = new JSONObject();
            packet.put("weight", paquete.getWeight());
            packet.put("height", paquete.getHeight());
            packet.put("width", paquete.getWidth());
            packet.put("length", paquete.getLength());
            json.put("originCountyCode",origen.getCountyCode());
            json.put("destinationCountyCode", comunaDestino.getCountyCode());
            json.put("package", packet);
            json.put("productType", "3");
            json.put("contentType", "1");
            json.put("declaredWorth", total);
            json.put("deliveryTime", "0");
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Cache-Control", "no-cache");
            request.addHeader("Ocp-Apim-Subscription-Key", API_KEY);
            StringEntity params = new StringEntity(json.toString());
            request.setEntity(params);
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();
            
            
            if (entity != null) 
            {
                ArrayList<String> Calle = new ArrayList<String>();
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"{","}");
                for(String frase:datosa)
                    {
                        ArrayList<String> last=new ArrayList<String>();
                        String[] b =StringUtils.splitByWholeSeparator(frase, ","); 
                        b[0]=StringUtils.removeStart(b[0], "data:{courierServiceOptions:[{");
                        b[7]=StringUtils.removeStart(b[7], "additionalServices:[{");
                        for(String slit:b)
                        {
                            //Array de un arrray
                            String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                            last.add(c[1]);
                        }
                        resu.setServiceTypeCode(Integer.parseInt(last.get(0)));
                        resu.setServiceDescription(last.get(1));
                        resu.setDidUseVolumetricWeight(last.get(2));
                        last.set(3, StringUtils.remove(last.get(3), "."));
                        resu.setFinalWeight(Integer.parseInt(last.get(3)));
                        resu.setServiceValue(Integer.parseInt(last.get(4)));
                        resu.setConditions(last.get(5));
                        resu.setDeliveryType(Integer.parseInt(last.get(6)));
                        resu.setAdditionalServices(last.get(7));
                        if(last.size()>8)
                        {
                            resu.setCoberturaExtendida(Integer.parseInt(last.get(9)));
                        }
                        else
                        {
                            resu.setCoberturaExtendida(0);
                        }
                        resus.add(resu);
                        resu=new Resultado();
                        last.clear();
                }
                }
        }   
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return resus;
    }
    public static Certificado GenerarCertificado()
    {
        Certificado certificado = new Certificado();
        HttpClient httpclient = HttpClients.createDefault();
        String API_KEY = "9a71c7c964dd4a048034238d1c70e1d3";
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/transport-orders/api/v1.0/transport-order-certificates?customerCardNumber=18578680");
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);
            JSONObject json = new JSONObject();
            json.put("customerCardNumber","18578680");
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Cache-Control", "no-cache");
            request.addHeader("Ocp-Apim-Subscription-Key", API_KEY);
            
            StringEntity params = new StringEntity(json.toString());
            request.setEntity(params);
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();
            
            if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"{" ,"}");
                for(String frase:datosa)
                {
                    ArrayList<String> last=new ArrayList<String>();
                    String[] b =StringUtils.splitByWholeSeparator(frase, ",");
                    for(String slit:b)
                    {
                        //Array de un arrray
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        last.add(c[1]);
                    }       
                    certificado.setNumeroCertificado(Integer.parseInt(last.get(0)));
            }
        }
        }catch(Exception e)
        {
            e.getMessage();
        }
        
        return certificado;
    }
    
    public static Response GenerarEnvio(Header heade, Address addresDets,Address addresDevo,Contacto contactoD, Contacto contactoR, List<Packet> paquetes)
    {
        Response respuesta = new Response();
        HttpClient httpclient = HttpClients.createDefault();
        String API_KEY = "9a71c7c964dd4a048034238d1c70e1d3";
        try
        {
            URIBuilder builder = new URIBuilder("https://testservices.wschilexpress.com/transport-orders/api/v1.0/transport-orders");
            URI uri = builder.build();
            HttpPost request = new HttpPost(uri);
            request.setHeader("Content-Type", "application/json");
            request.setHeader("Cache-Control", "no-cache");
            request.addHeader("Accept-Encoding", "UTF-8"); 
            request.addHeader("Ocp-Apim-Subscription-Key", API_KEY);
            
            JSONObject json = new JSONObject();
            JSONObject header = new JSONObject();
            header.put("certificateNumber", heade.getCertificadoNumero());
            header.put("customerCardNumber", "18578680");
            header.put("countyOfOriginCoverageCode", heade.getCodigoDeOrigen());
            header.put("labelType", 2);
            header.put("marketplaceRut", "96756430");
            header.put("sellerRut", "DEFAULT");
            
            JSONObject addressDest = new JSONObject();
            addressDest.put("addressId", addresDets.getAddressId());
            addressDest.put("countyCoverageCode", addresDets.getCodigoComuna());
            addressDest.put("streetName", addresDets.getNombreCalle());
            addressDest.put("streetNumber", addresDets.getNumeracionCalle());
            addressDest.put("supplement", addresDets.getObservaciones());
            addressDest.put("addressType", "DEST");
            addressDest.put("deliveryOnCommercialOffice", false);
            addressDest.put("observation", "DEFAULT");
            
            JSONObject addressDev = new JSONObject();
            addressDev.put("addressId", addresDevo.getAddressId());
            addressDev.put("countyCoverageCode", addresDevo.getCodigoComuna());
            addressDev.put("streetName", addresDevo.getNombreCalle());
            addressDev.put("streetNumber", addresDevo.getNumeracionCalle());
            addressDev.put("supplement", "DEFAULT");
            addressDev.put("addressType", "DEV");
            addressDev.put("deliveryOnCommercialOffice", false);
            addressDev.put("observation", "DEFAULT");
            
            JSONObject contactR = new JSONObject();
            contactR.put("name", contactoR.getNombre());
            contactR.put("phoneNumber", contactoR.getNumero());
            contactR.put("mail", contactoR.getMail());
            contactR.put("contactType", "R");
            
            JSONObject contactD=new JSONObject();
            contactD.put("name", contactoD.getNombre());
            contactD.put("phoneNumber", contactoD.getNumero());
            contactD.put("mail", contactoD.getMail());
            contactD.put("contactType", "D");
            
            JSONArray p= new JSONArray();
            for(Packet pa : paquetes)
            {
                JSONObject packages= new JSONObject();
                packages.put("weight", pa.getWeight());
                packages.put("height", pa.getHeight());
                packages.put("width", pa.getWidth());
                packages.put("length", pa.getLength());
                packages.put("serviceDeliveryCode", "3");
                packages.put("productCode", "3");
                packages.put("deliveryReference", "TEST-EOC-17");
                packages.put("groupReference", "GRUPO");
                packages.put("declaredValue", String.valueOf(pa.getValorProducto()));
                packages.put("declaredContent", "5");
                packages.put("extendedCoverageAreaIndicator", false);
                p.put(packages);
            }
            
            
            
            
            JSONArray addresses = new JSONArray();
            addresses.put(addressDest);
            addresses.put(addressDev);
            
            JSONArray contacts=new JSONArray();
            contacts.put(contactR);
            contacts.put(contactD);
            
            JSONObject details=new JSONObject();
            details.put("addresses", addresses);
            details.put("contacts", contacts);
            details.put("packages", p);
            JSONArray det=new JSONArray();
            det.put(details);
            
            json.put("header", header);
            json.put("details", det);
                    
            StringEntity params = new StringEntity(json.toString());
            request.setEntity(params);
            HttpResponse response = httpclient.execute(request);
            HttpEntity entity = response.getEntity();
            
            if (entity != null) 
            {
                String datos= EntityUtils.toString(entity);
                datos = StringUtils.remove(datos, "\\");
                datos= StringUtils.remove(datos,"\"");
                String datosa [] = StringUtils.substringsBetween(datos,"{" ,"}");
                datosa[0]=StringUtils.removeStart(datosa[0],"data:{header:");
                datosa[1]=StringUtils.remove(datosa[1], "label:{");
                ArrayList<String> cabezera=new ArrayList<String>();
                String[] b =StringUtils.splitByWholeSeparator(datosa[0], ",");
                for(String slit:b)
                {
                    //Array de un array
                    String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                    cabezera.add(c[1]);
                }
                respuesta.getHeader().setCertificateNumber(Double.parseDouble(cabezera.get(0)));
                respuesta.getHeader().setCountOfGeneratedOrders(Integer.parseInt(cabezera.get(1)));
                datosa=ArrayUtils.remove(datosa, 0);
                List<DetailsResponse> detlles=new ArrayList<DetailsResponse>();
                List<Label> labes=new ArrayList<Label>();
                for(String s:datosa)
                {
                    s = StringUtils.remove(s, "label:{");
                    DetailsResponse d= new DetailsResponse();
                    Label l = new Label();
                    ArrayList<String> detalles=new ArrayList<String>();
                    detalles.removeAll(detalles);
                    String[] a =StringUtils.splitByWholeSeparator(s, ",");
                    for(String slit:a)
                    {
                        //Array de un array
                        String[] c =StringUtils.splitByWholeSeparator(slit, ":");
                        detalles.add(c[1]);
                    }
                    d.setTransportOrderNumber(Double.parseDouble(detalles.get(0)));
                    d.setReference(detalles.get(1));
                    d.setProductoDescription(detalles.get(2));
                    d.setServiceDescription(detalles.get(3));
                    d.setGenericString1(detalles.get(4));
                    d.setGenericString2(detalles.get(5));
                    d.setDeliveryTypeCode(detalles.get(6));
                    d.setDestinationCoverageAreaName(detalles.get(7));
                    d.setAdditionalProductDescription(detalles.get(8));
                    d.setBarcode(detalles.get(9));
                    d.setClasificationData(detalles.get(10));
                    d.setPrintedDate(detalles.get(11));
                    d.setLabelVersion(detalles.get(12));
                    d.setDistributionDescription(detalles.get(13));
                    d.setCompanyName(detalles.get(14));
                    d.setRecipient(detalles.get(15));
                    d.setAddress(detalles.get(16));
                    d.setGroupReference(detalles.get(17));
                    d.setCreatedDate(detalles.get(18));
                    detlles.add(d);
                    l.setLabelData(detalles.get(19));
                    l.setLabelType(detalles.get(20));
                    labes.add(l);
                } 
                respuesta.setDetail(detlles);
                respuesta.setLabel(labes);
        }
        }catch(Exception e)
        {
            e.getMessage();
        }
        
        return respuesta;
    }
    }