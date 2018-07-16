package com.wanda.dao;

import java.util.List;
import java.util.Map;

import com.wanda.bean.HtRoom;
import com.wanda.bean.HtRoomPay;

public interface HtRoomPayMapper {
    int deleteByPrimaryKey(String roomPayId);

    int insert(HtRoomPay record);

    int insertSelective(HtRoomPay record);

    HtRoomPay selectByPrimaryKey(String roomPayId);

    int updateByPrimaryKeySelective(HtRoomPay record);

    int updateByPrimaryKey(HtRoomPay record);
    
    List<HtRoomPay> getList();
    

	void del(Map map);

	void zuofei(Map map);

	void gengmingshenqing(String id);

	void huanfangshenqing(String id);

	List<HtRoomPay> getLists();

	void shenhe(String roomPayId);

	void butongguo(String roomPayId);

	void huanfang(HtRoomPay htRoomPay);

	void gengming(HtRoomPay htRoomPay);

	void tuikuan(Map map);

}