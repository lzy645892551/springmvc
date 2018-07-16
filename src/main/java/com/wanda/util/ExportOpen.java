package com.wanda.util;

import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExportOpen {  
    
    public void buildStudentExcel(List<Map<String,String>> list, String sheetname, OutputStream out) {  
                  
    	
    	
        HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet1 = wb.createSheet("sheet1");  
        HSSFRow row = sheet1.createRow((short) 0);  
       
        row.createCell((short) 0).setCellValue("项目名称");  
        row.createCell((short) 1).setCellValue("房间");  
        row.createCell((short) 2).setCellValue("面积");  
        row.createCell((short) 3).setCellValue("计价方式");
        row.createCell((short) 4).setCellValue("面积单价");
        row.createCell((short) 5).setCellValue("总价");
        for (int i = 0; i < list.size(); i++) {  
        	Map<String, String> m = list.get(i);  
            row=sheet1.createRow((short)(i+1));  
           
            row.createCell((short) 0).setCellValue(m.get("proName"));  
            row.createCell((short) 1).setCellValue(m.get("roomCode"));  
            row.createCell((short) 2).setCellValue(m.get("area"));  
            row.createCell((short) 3).setCellValue(m.get("priceType")); 
            row.createCell((short) 4).setCellValue(m.get("price"));
            row.createCell((short) 5).setCellValue(m.get("total"));
           
        }  
        try {  
            out.flush();  
            wb.write(out);  
            out.close();          
  
        } catch (Exception e) {  
            e.printStackTrace();  
            System.out.println("Out  is  closed ");  
        }  
    }

}
