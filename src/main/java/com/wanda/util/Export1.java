package com.wanda.util;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.wanda.bean.Contract;

public class Export1 {  
    
    public void buildStudentExcel(List<Contract> list, String sheetname, OutputStream out) {  
                  
    	
    	
        HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet1 = wb.createSheet("sheet1");  
        HSSFRow row = sheet1.createRow((short) 0);  
       
        row.createCell((short) 0).setCellValue("房间");  
        row.createCell((short) 1).setCellValue("客户名称");  
        row.createCell((short) 2).setCellValue("合同编号");  
        row.createCell((short) 3).setCellValue("签署日期");
        row.createCell((short) 4).setCellValue("合同总价");
        row.createCell((short) 5).setCellValue("付款方式");
        row.createCell((short) 6).setCellValue("业务员");
        row.createCell((short) 7).setCellValue("状态");
        for (int i = 0; i < list.size(); i++) {  
        	Contract s = (Contract)list.get(i);  
            row=sheet1.createRow((short)(i+1));  
           
            row.createCell((short) 0).setCellValue(s.getRoomId());  
            row.createCell((short) 1).setCellValue(s.getCustomerName());  
            row.createCell((short) 2).setCellValue(s.getContractId());  
            row.createCell((short) 3).setCellValue(s.getDeleteUser()); 
            row.createCell((short) 4).setCellValue(s.getTotal());
            row.createCell((short) 5).setCellValue(s.getPayTypeName());
            row.createCell((short) 6).setCellValue(s.getName());
            row.createCell((short) 7).setCellValue(s.getContractState());
           
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
