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
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.utils.URIBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
public class Regiones 
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
                for (String i : mapa.keySet()) 
                {
                    System.out.println("key: " + i + " value: " + mapa.get(i));
                }
            }
        }
        catch (Exception e)
        {
            System.out.println(e.getMessage());
        }
        return mapa;
    }
    }