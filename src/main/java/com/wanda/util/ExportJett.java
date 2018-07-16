package com.wanda.util;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.wanda.bean.Contract;
import com.wanda.bean.HtUnit;

public class ExportJett {  
    
    public void buildStudentExcel(List<HtUnit> list, String sheetname, OutputStream out) {  
                  
    	
    	
        HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet1 = wb.createSheet("sheet1");  
        HSSFRow row = sheet1.createRow((short) 0);  
       
        row.createCell((short) 0).setCellValue("楼栋名称");  
        row.createCell((short) 1).setCellValue("项目名称");  
        row.createCell((short) 2).setCellValue("单元号");  
        row.createCell((short) 3).setCellValue("房间数");
        row.createCell((short) 4).setCellValue("修改人");
        row.createCell((short) 5).setCellValue("修改时间");
        for (int i = 0; i < list.size(); i++) {  
        	HtUnit s = (HtUnit)list.get(i);  
            row=sheet1.createRow((short)(i+1));  
           
            row.createCell((short) 0).setCellValue(s.getBuild().getBuildName());  
            row.createCell((short) 1).setCellValue(s.getProject().getProjectName());  
            row.createCell((short) 2).setCellValue(s.getUnitCode());  
            row.createCell((short) 3).setCellValue(s.getRoomCount()); 
            row.createCell((short) 4).setCellValue(s.getUpdateUser());
            Date date = s.getUpdateTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String time = sdf.format(date);
            row.createCell((short) 5).setCellValue(time);
           
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
