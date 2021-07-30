/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Producto;
import Clases.Venta;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 *
 * @author pc
 */
@WebServlet(name = "StockExcel", urlPatterns = {"/StockExcel"})
public class StockExcel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet StockExcel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StockExcel at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession();
        List<Producto> productos =(List<Producto>) s.getAttribute("stockProductos");
        List<Producto> StockCorrecto= new ArrayList<>();
        List<Producto> StockBajo= new ArrayList<>();
        List<Producto> StockCritico=new ArrayList<>();
        for(Producto pro:productos)
        {
            if(pro.StockStatus()==1)
            {
                StockCorrecto.add(pro);
            }
            else if(pro.StockStatus()==0)
            {
                StockBajo.add(pro);
            }
            else if(pro.StockStatus()==-1)
            {
                StockCritico.add(pro);
            }   
        }
        
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=Stock.xls");
         
         HSSFWorkbook wb= new HSSFWorkbook();
         HSSFSheet sheet = wb.createSheet("Stock");
         HSSFRow row= sheet.createRow(0);
         
        CellStyle cellStyle = wb.createCellStyle();
        cellStyle.setBorderBottom(BorderStyle.MEDIUM);
        cellStyle.setBorderLeft(BorderStyle.MEDIUM);
        cellStyle.setBorderRight(BorderStyle.MEDIUM);
        cellStyle.setBorderTop(BorderStyle.MEDIUM);
        cellStyle.setAlignment(HorizontalAlignment.CENTER);  
        cellStyle.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font = wb.createFont();
        font.setFontHeightInPoints((short)12);
        font.setColor(IndexedColors.BLACK.getIndex());
        font.setBold(true);
        font.setItalic(true);
        cellStyle.setFont(font);   
        
        CellStyle cellStyle2 = wb.createCellStyle();
        cellStyle2.setBorderBottom(BorderStyle.MEDIUM);
        cellStyle2.setBorderLeft(BorderStyle.MEDIUM);
        cellStyle2.setBorderRight(BorderStyle.MEDIUM);
        cellStyle2.setBorderTop(BorderStyle.MEDIUM);
        cellStyle2.setAlignment(HorizontalAlignment.CENTER);  
        cellStyle2.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
        cellStyle2.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font fontB = wb.createFont();
        fontB.setFontHeightInPoints((short)10);
        fontB.setColor(IndexedColors.BLACK.getIndex());
        fontB.setBold(true);
        fontB.setItalic(true);
        cellStyle2.setFont(fontB);   
        
        
        
        
        CellStyle cellStyleBajo = wb.createCellStyle();
        cellStyleBajo.setBorderBottom(BorderStyle.MEDIUM);
        cellStyleBajo.setBorderLeft(BorderStyle.MEDIUM);
        cellStyleBajo.setBorderRight(BorderStyle.MEDIUM);
        cellStyleBajo.setBorderTop(BorderStyle.MEDIUM);
        cellStyleBajo.setAlignment(HorizontalAlignment.CENTER);  
        cellStyleBajo.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
        cellStyleBajo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font2 = wb.createFont();
        font2.setFontHeightInPoints((short)10);
        font2.setColor(IndexedColors.BLACK.getIndex());
        font2.setBold(true);
        font2.setItalic(true);
        cellStyleBajo.setFont(font2);   
        
        CellStyle cellStyleBajoA = wb.createCellStyle();
        cellStyleBajoA.setBorderBottom(BorderStyle.MEDIUM);
        cellStyleBajoA.setBorderLeft(BorderStyle.MEDIUM);
        cellStyleBajoA.setBorderRight(BorderStyle.MEDIUM);
        cellStyleBajoA.setBorderTop(BorderStyle.MEDIUM);
        cellStyleBajoA.setAlignment(HorizontalAlignment.CENTER);  
        cellStyleBajoA.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.getIndex());
        cellStyleBajoA.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font2A = wb.createFont();
        font2A.setFontHeightInPoints((short)12);
        font2A.setColor(IndexedColors.BLACK.getIndex());
        font2A.setBold(true);
        font2A.setItalic(true);
        cellStyleBajoA.setFont(font2A);   
        
        
        
        CellStyle cellStyleCritico = wb.createCellStyle();
        cellStyleCritico.setBorderBottom(BorderStyle.MEDIUM);
        cellStyleCritico.setBorderLeft(BorderStyle.MEDIUM);
        cellStyleCritico.setBorderRight(BorderStyle.MEDIUM);
        cellStyleCritico.setBorderTop(BorderStyle.MEDIUM);
        cellStyleCritico.setAlignment(HorizontalAlignment.CENTER);  
        cellStyleCritico.setFillForegroundColor(IndexedColors.CORAL.getIndex());
        cellStyleCritico.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font3 = wb.createFont();
        font3.setFontHeightInPoints((short)10);
        font3.setColor(IndexedColors.BLACK.getIndex());
        font3.setBold(true);
        font3.setItalic(true);
        cellStyleCritico.setFont(font3);  
        
        
         CellStyle cellStyleCriticoA = wb.createCellStyle();
        cellStyleCriticoA.setBorderBottom(BorderStyle.MEDIUM);
        cellStyleCriticoA.setBorderLeft(BorderStyle.MEDIUM);
        cellStyleCriticoA.setBorderRight(BorderStyle.MEDIUM);
        cellStyleCriticoA.setBorderTop(BorderStyle.MEDIUM);
        cellStyleCriticoA.setAlignment(HorizontalAlignment.CENTER);  
        cellStyleCriticoA.setFillForegroundColor(IndexedColors.CORAL.getIndex());
        cellStyleCriticoA.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font3A = wb.createFont();
        font3A.setFontHeightInPoints((short)12);
        font3A.setColor(IndexedColors.BLACK.getIndex());
        font3A.setBold(true);
        font3A.setItalic(true);
        cellStyleCriticoA.setFont(font3A);
        
        
        
         HSSFCell cell= row.createCell(0);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Estadisticas de Ventas");
         cell.setCellStyle(cellStyle);
         cell=row.createCell(1);
         cell.setCellStyle(cellStyle);
         cell=row.createCell(3);
         cell.setCellStyle(cellStyle);
         cell=row.createCell(4);
         sheet.addMergedRegion(new CellRangeAddress(0,0,0,4));
         int fila =1;
         row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Productos con stock correcto");
         cell.setCellStyle(cellStyle);
         cell=row.createCell(1);
         cell.setCellStyle(cellStyle);
         cell=row.createCell(3);
         cell.setCellStyle(cellStyle);
         cell=row.createCell(4);
         sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
         fila++;
         row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Id producto");
         cell=row.createCell(1);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Categoria");
         cell=row.createCell(2);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Stock");
         cell=row.createCell(3);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Stock critico");
         cell=row.createCell(4);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Fabricante");
         fila++;
         for(Producto pro:StockCorrecto)
         {
              row= sheet.createRow(fila);
                cell= row.createCell(0);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(pro.getIdproducto());
                cell=row.createCell(1);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(pro.getFamiliaProductoIdfamiliaProducto().getNombre());
                cell=row.createCell(2);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(pro.getStock());
                cell=row.createCell(3);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(pro.getStockCritico());
                cell=row.createCell(4);
                cell.setCellStyle(cellStyle2);
                cell.setCellValue(pro.getFabricanteRut().getNombre());
                fila++;
         }
         if(StockCorrecto.size()==0)
         {
            row= sheet.createRow(fila);
            cell= row.createCell(0);
            cell.setCellStyle(cellStyle2);
            cell.setCellValue("No hay productos con el stock correcto");
            cell=row.createCell(1);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(2);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(3);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(4);
            cell.setCellStyle(cellStyle2);
            sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
            fila++;

         }
          row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Productos con stock bajo");
         sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
         fila++;
         row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Id producto");
         cell=row.createCell(1);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Categoria");
         cell=row.createCell(2);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Stock");
         cell=row.createCell(3);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Stock critico");
         cell=row.createCell(4);
         cell.setCellStyle(cellStyleBajoA);
         cell.setCellValue("Fabricante");
         fila++;
         for(Producto pro:StockBajo)
         {
              row= sheet.createRow(fila);
                cell= row.createCell(0);
                cell.setCellStyle(cellStyleBajo);
                cell.setCellValue(pro.getIdproducto());
                cell=row.createCell(1);
                cell.setCellStyle(cellStyleBajo);
                cell.setCellValue(pro.getFamiliaProductoIdfamiliaProducto().getNombre());
                cell=row.createCell(2);
                cell.setCellStyle(cellStyleBajo);
                cell.setCellValue(pro.getStock());
                cell=row.createCell(3);
                cell.setCellStyle(cellStyleBajo);
                cell.setCellValue(pro.getStockCritico());
                cell=row.createCell(4);
                cell.setCellStyle(cellStyleBajo);
                cell.setCellValue(pro.getFabricanteRut().getNombre());
                fila++;
         }
         if(StockBajo.size()==0)
         {
            row= sheet.createRow(fila);
            cell= row.createCell(0);
            cell.setCellStyle(cellStyle2);
            cell.setCellValue("No hay productos con el stock bajo");
            cell=row.createCell(1);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(2);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(3);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(4);
            cell.setCellStyle(cellStyle2);
            sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
            fila++;

         }
          row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Productos con stock critico");
         sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
         fila++;
         row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Id producto");
         cell=row.createCell(1);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Categoria");
         cell=row.createCell(2);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Stock");
         cell=row.createCell(3);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Stock critico");
         cell=row.createCell(4);
         cell.setCellStyle(cellStyleCriticoA);
         cell.setCellValue("Fabricante");
         fila++;
         for(Producto pro:StockCritico)
         {
              row= sheet.createRow(fila);
                cell= row.createCell(0);
                cell.setCellStyle(cellStyleCritico);
                cell.setCellValue(pro.getIdproducto());
                cell=row.createCell(1);
                cell.setCellStyle(cellStyleCritico);
                cell.setCellValue(pro.getFamiliaProductoIdfamiliaProducto().getNombre());
                cell=row.createCell(2);
                cell.setCellStyle(cellStyleCritico);
                cell.setCellValue(pro.getStock());
                cell=row.createCell(3);
                cell.setCellStyle(cellStyleCritico);
                cell.setCellValue(pro.getStockCritico());
                cell=row.createCell(4);
                cell.setCellStyle(cellStyleCritico);
                cell.setCellValue(pro.getFabricanteRut().getNombre());
                fila++;
         }
         if(StockCritico.size()==0)
         {
            row= sheet.createRow(fila);
            cell= row.createCell(0);
            cell.setCellStyle(cellStyle2);
            cell.setCellValue("No hay productos con el stock critico");
            cell=row.createCell(1);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(2);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(3);
            cell.setCellStyle(cellStyle2);
            cell=row.createCell(4);
            cell.setCellStyle(cellStyle2);
            sheet.addMergedRegion(new CellRangeAddress(fila,fila,0,4));
            fila++;

         }
         
         sheet.autoSizeColumn(0);
         sheet.autoSizeColumn(1);
         sheet.autoSizeColumn(2);
         sheet.autoSizeColumn(3);
         sheet.autoSizeColumn(4);
         
         
         
        ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
        wb.write(outByteStream);

        byte[] outArray = outByteStream.toByteArray();
        OutputStream outStream = response.getOutputStream();
        outStream.write(outArray);
        outStream.flush(); 

        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
