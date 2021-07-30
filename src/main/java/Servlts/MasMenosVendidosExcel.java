/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlts;

import Clases.Venta;
import Estadistica.ProductoVenta;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@WebServlet(name = "MasMenosVendidosExcel", urlPatterns = {"/MasMenosVendidosExcel"})
public class MasMenosVendidosExcel extends HttpServlet {

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
            out.println("<title>Servlet MasMenosVendidosExcel</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MasMenosVendidosExcel at " + request.getContextPath() + "</h1>");
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
             List<ProductoVenta> productos  =( List<ProductoVenta>) s.getAttribute("ProductosExcelMasMenos");
        
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=VentasExport.xls");
         
        
            
        
        
         HSSFWorkbook wb= new HSSFWorkbook();
         HSSFSheet sheet = wb.createSheet("Estadisticas");
         HSSFRow row= sheet.createRow(0);
         
        CellStyle cellStyle = wb.createCellStyle();
        cellStyle.setBorderBottom(BorderStyle.MEDIUM);
        cellStyle.setBorderLeft(BorderStyle.MEDIUM);
        cellStyle.setBorderRight(BorderStyle.MEDIUM);
        cellStyle.setBorderTop(BorderStyle.MEDIUM);
        cellStyle.setAlignment(HorizontalAlignment.CENTER);  
        cellStyle.setFillForegroundColor(IndexedColors.BLACK.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font font = wb.createFont();
        font.setFontHeightInPoints((short)18);
        font.setColor(IndexedColors.WHITE.getIndex());
        font.setBold(true);
        font.setItalic(true);
        cellStyle.setFont(font);   
        
        CellStyle separador = wb.createCellStyle();
        separador.setBorderBottom(BorderStyle.MEDIUM);
        separador.setBorderLeft(BorderStyle.MEDIUM);
        separador.setBorderRight(BorderStyle.MEDIUM);
        separador.setBorderTop(BorderStyle.MEDIUM);
        separador.setAlignment(HorizontalAlignment.CENTER);  
        separador.setFillForegroundColor(IndexedColors.BRIGHT_GREEN.getIndex());
        separador.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        
        CellStyle SubCellStyle = wb.createCellStyle();
        SubCellStyle.setBorderBottom(BorderStyle.MEDIUM);
        SubCellStyle.setBorderLeft(BorderStyle.MEDIUM);
        SubCellStyle.setBorderRight(BorderStyle.MEDIUM);
        SubCellStyle.setBorderTop(BorderStyle.MEDIUM);
        SubCellStyle.setAlignment(HorizontalAlignment.CENTER);  
        SubCellStyle.setFillForegroundColor(IndexedColors.BLACK.getIndex());
        SubCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font fonta = wb.createFont();
        fonta.setFontHeightInPoints((short)14);
        fonta.setColor(IndexedColors.WHITE.getIndex());
        fonta.setBold(true);
        SubCellStyle.setFont(fonta); 
        
        CellStyle normalCell = wb.createCellStyle();
        normalCell.setBorderBottom(BorderStyle.MEDIUM);
        normalCell.setBorderLeft(BorderStyle.MEDIUM);
        normalCell.setBorderRight(BorderStyle.MEDIUM);
        normalCell.setBorderTop(BorderStyle.MEDIUM);
        normalCell.setFillForegroundColor(IndexedColors.BLACK.getIndex());
        normalCell.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        Font fontn = wb.createFont();
        fontn.setFontHeightInPoints((short)12);
        fontn.setBold(true);
        fontn.setItalic(true);
        fontn.setColor(IndexedColors.WHITE.getIndex());
        normalCell.setFont(fontn);
         
        CellStyle normal = wb.createCellStyle();
        normal.setBorderBottom(BorderStyle.MEDIUM);
        normal.setBorderLeft(BorderStyle.MEDIUM);
        normal.setBorderRight(BorderStyle.MEDIUM);
        normal.setBorderTop(BorderStyle.MEDIUM);
        Font fonto = wb.createFont();
        fonto.setFontHeightInPoints((short)10);
        fonto.setColor(IndexedColors.BLACK.getIndex());
        normal.setFont(fonto);
         
         
         
         HSSFCell cell= row.createCell(0);
         cell.setCellStyle(cellStyle);
         cell.setCellValue("Estadisticas de venta de productos");
         cell.setCellStyle(cellStyle);
         cell=row.createCell(1);
         cell.setCellStyle(cellStyle);
         cell=row.createCell(2);
         int fila=1;
         sheet.addMergedRegion(new CellRangeAddress(0,0,0,5));
         row= sheet.createRow(fila);
         cell= row.createCell(0);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Id producto");
         cell=row.createCell(1);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Nombre");
         cell=row.createCell(2);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Categoria");
         cell=row.createCell(3);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Stock actual");
         cell=row.createCell(4);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Cantidad de ventas");
         cell=row.createCell(5);
         cell.setCellStyle(normalCell);
         cell.setCellValue("Fabricante");
         fila++;
         for(ProductoVenta pro : productos)
         {
            row= sheet.createRow(fila);
            cell= row.createCell(0);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getProducto().getIdproducto());
            cell=row.createCell(1);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getProducto().getNombre());
            cell=row.createCell(2);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getProducto().getFamiliaProductoIdfamiliaProducto().getNombre());
            cell=row.createCell(3);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getProducto().getStock());
            cell=row.createCell(4);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getCantidadVendidos());
            cell=row.createCell(5);
            cell.setCellStyle(normal);
            cell.setCellValue(pro.getProducto().getFabricanteRut().getNombre());
            fila++;
         }
         
         sheet.autoSizeColumn(0);
         sheet.autoSizeColumn(1);
         sheet.autoSizeColumn(2);
         sheet.autoSizeColumn(3);
         sheet.autoSizeColumn(4);
         sheet.autoSizeColumn(5);
         
         
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
