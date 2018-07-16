package com.wanda.util;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.wanda.bean.Order;

public class Export2 {  
    
    public void buildStudentExcel(List<Order> list, String sheetname, OutputStream out) {  
                  
    	
    	
        HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet1 = wb.createSheet("sheet1");  
        HSSFRow row = sheet1.createRow((short) 0);  
       
        row.createCell((short) 0).setCellValue("订单编号");  
        row.createCell((short) 1).setCellValue("客户名称");  
        row.createCell((short) 2).setCellValue("购买面积");  
        row.createCell((short) 3).setCellValue("房间单价");
        row.createCell((short) 4).setCellValue("房间总价");
        row.createCell((short) 5).setCellValue("订单类型");
        row.createCell((short) 6).setCellValue("付款方式");
        row.createCell((short) 7).setCellValue("业务员名称");
        for (int i = 0; i < list.size(); i++) {  
        	Order s = (Order)list.get(i);  
            row=sheet1.createRow((short)(i+1));  
           
            row.createCell((short) 0).setCellValue(s.getOrderId());  
            row.createCell((short) 1).setCellValue(s.getCustomerName());  
            row.createCell((short) 2).setCellValue(s.getPayArea());  
            row.createCell((short) 3).setCellValue(s.getUnitPrice()); 
            row.createCell((short) 4).setCellValue(s.getTotal());
            row.createCell((short) 5).setCellValue(s.getOrderType());
            row.createCell((short) 6).setCellValue(s.getPayTypeName());
            row.createCell((short) 7).setCellValue(s.getName());
           
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
