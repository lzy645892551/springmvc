package com.wanda.dao;

import com.wanda.bean.HtRoomChange;

public interface HtRoomChangeMapper {
    int deleteByPrimaryKey(String roomChangeId);

    int insert(HtRoomChange record);

    int insertSelective(HtRoomChange record);

    HtRoomChange selectByPrimaryKey(String roomChangeId);

    int updateByPrimaryKeySelective(HtRoomChange record);

    int updateByPrimaryKey(HtRoomChange record);
}