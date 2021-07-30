/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Boleta;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.swing.JEditorPane;

/**
 *
 * @author pc
 */
public class BoletaGenerator {    
    public static byte[] ObtenerBoleta(String id) throws MalformedURLException, IOException
    {
        byte[] bytes = null;
        try{
            
String urls="http://localhost:8080/AppDiscos/Paginas/Boleta.jsp?id="+44;
             URL url = new URL(urls);

            JEditorPane editorPane = new JEditorPane();
            editorPane.setEditable(false);
            editorPane.setPage(url);
            editorPane.setSize(1200, 800);
            // add a HTMLEditorKit to the editor pane
          
            

            // now add it to a scroll pane
            
            // render the page
            BufferedImage renderedImage = new BufferedImage(1000, 800, BufferedImage.TYPE_INT_RGB);
            editorPane.print(renderedImage.getGraphics());

            // write result to file
            ImageIO.write(renderedImage, "PNG", new File("C:\\Users\\pc\\Desktop\\ne.png"));
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(renderedImage, "jpg", baos);
             bytes = baos.toByteArray();
            
        }
        catch(Exception e)
        {
            e.getMessage();
        }
        return bytes;
        

            
            
    }
}
