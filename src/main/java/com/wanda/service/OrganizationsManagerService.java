package com.wanda.service;

import java.util.List;

import com.wanda.bean.Organization;

public interface OrganizationsManagerService {

	/**
	 * 查询所有组织的信息
	 * @return
	 */
	List<Organization> getAllOrganizationsManager();

	Organization selectByOrganizationId(String organizationId);

	int updateDeleteStateByOrganization(Organization organization);

	int addOrganization(Organization organization);

	int updateByOrganizationId(Organization organization);
	
}
