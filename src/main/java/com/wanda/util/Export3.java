package com.wanda.util;

import java.io.OutputStream;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.wanda.bean.HtRoomPay;

public class Export3 {  
    
    
	public void buildStudentExcel(List<HtRoomPay> list, String sheetname, OutputStream out) {  
                  
    	
    	
        HSSFWorkbook wb = new HSSFWorkbook();  
        HSSFSheet sheet1 = wb.createSheet("sheet1");  
        HSSFRow row = sheet1.createRow((short) 0);  
        
//        HSSFCell a = row.createCell((short) 0);
//        a.setEncoding(HSSFCell.ENCODING_UTF_16);
//        a.setCellValue("编号");  
        row.createCell((short) 0).setCellValue("编号");  
        row.createCell((short) 1).setCellValue("合同编号");  
        row.createCell((short) 2).setCellValue("订单编号");  
        row.createCell((short) 3).setCellValue("房间编号");
        row.createCell((short) 4).setCellValue("客户编号");
        row.createCell((short) 5).setCellValue("客户名称");
        row.createCell((short) 6).setCellValue("业务员编号");
        row.createCell((short) 7).setCellValue("业务员名称");
        row.createCell((short) 8).setCellValue("应收金额");
        row.createCell((short) 9).setCellValue("已收金额");
        row.createCell((short) 10).setCellValue("未收金额");
        row.createCell((short) 11).setCellValue("付款时间");
        row.createCell((short) 12).setCellValue("付款类型");
        row.createCell((short) 13).setCellValue("已缴款次数");
        row.createCell((short) 14).setCellValue("代缴款次数");
        row.createCell((short) 15).setCellValue("状态");
        for (int i = 0; i < list.size(); i++) {  
        	HtRoomPay s = (HtRoomPay)list.get(i);  
            row=sheet1.createRow((short)(i+1));  
            row.createCell((short) 0).setCellValue(s.getRoomPayId());  
            row.createCell((short) 1).setCellValue(s.getContractId());  
            row.createCell((short) 2).setCellValue(s.getOrderId());  
            row.createCell((short) 3).setCellValue(s.getRoomId()); 
            row.createCell((short) 4).setCellValue(s.getCustomerId());
//            HSSFCell csCell2 = row.createCell((short) 5);
//            csCell2.setEncoding(HSSFCell.ENCODING_UTF_16);
//            csCell2.setCellValue(s.getCustomerName());
            row.createCell((short) 5).setCellValue(s.getCustomerName());
            row.createCell((short) 6).setCellValue(s.getUserId());
            row.createCell((short) 7).setCellValue(s.getName());
//            HSSFCell csCell = row.createCell((short) 7);
//            csCell.setEncoding(HSSFCell.ENCODING_UTF_16);
//            csCell.setCellValue(s.getName());
            row.createCell((short) 8).setCellValue(s.getReceivableMoney());
            row.createCell((short) 9).setCellValue(s.getReceivedMoney());
            row.createCell((short) 10).setCellValue(s.getUncollectedMoney());
            row.createCell((short) 11).setCellValue(s.getDeleteUser());
            row.createCell((short) 12).setCellValue(s.getPayType());
            row.createCell((short) 13).setCellValue(s.getFinishTimes());
            row.createCell((short) 14).setCellValue(s.getWaitTimes());
            row.createCell((short) 15).setCellValue(s.getDeleteState());
//            HSSFCell csCell3 = row.createCell((short) 15);
//            csCell3.setEncoding(HSSFCell.ENCODING_UTF_16);
//            csCell3.setCellValue(s.getDeleteState());
           
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
