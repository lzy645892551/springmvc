package com.wanda.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.wanda.bean.Organization;
import com.wanda.dao.OrganizationMapper;
import com.wanda.service.OrganizationsManagerService;
 
 
 
@Service
public class OrganizationsServiceImpl implements OrganizationsManagerService{
 
    @Autowired
    @Qualifier("organizationMapper")
    private OrganizationMapper organizationMapper;

    /**
     * 查询所有组织所有信息
     */
	public List<Organization> getAllOrganizationsManager() {
		return organizationMapper.getAllOrganizationsManager();
	}

	public Organization selectByOrganizationId(String organizationId) {
		return organizationMapper.selectByOrganizationId(organizationId);
	}

	public int updateDeleteStateByOrganization(Organization organization) {
		return organizationMapper.updateDeleteStateByOrganization(organization);
	}

	public int addOrganization(Organization organization) {
		return organizationMapper.insertSelective(organization);
	}

	public int updateByOrganizationId(Organization organization) {
		return organizationMapper.updateOrganizationById(organization);
	}
     

}