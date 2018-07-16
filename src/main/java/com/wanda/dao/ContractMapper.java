package com.wanda.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.wanda.bean.Contract;

public interface ContractMapper {
    int deleteByPrimaryKey(String contractId);

    int insert(Contract record);

    int insertSelective(Contract record);

    Contract selectByPrimaryKey(String contractId);

    int updateByPrimaryKeySelective(Contract record);

    int updateByPrimaryKey(Contract record);
    
    List<Contract> getList();
    
    List<Contract> getLista();
    
    Contract getId(String orderId);
    
    void del(Map map);
    
    void zuofei(Map map);
    
    void huifu(Map map);

	Contract getcId(Date signTime);
}