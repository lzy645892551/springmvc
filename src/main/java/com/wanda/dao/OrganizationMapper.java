package com.wanda.dao;

import java.util.List;

import com.wanda.bean.Organization;

public interface OrganizationMapper {

	int deleteByPrimaryKey(String organizationId);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(String organizationId);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);

	List<Organization> getAllOrganizationsManager();

	Organization selectByOrganizationId(String organizationId);

	int updateDeleteStateByOrganization(Organization organization);
	
	int updateOrganizationById(Organization organization);
}