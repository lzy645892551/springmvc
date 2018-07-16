package com.wanda.bean;

import java.util.Date;

public class OpeningReport {
    private String openingReportId;

    private Date openingReportTime;

    private String projectId;
    
    private HtProject project;

    private String payTypeId;

    private String updateUser;

    private Date updateTime;

    private String deleteUser;

    private Date deleteTime;

    private String deleteState;

    private String roomId;

    private String state;

    private String priceType;

    private String openingReportName;

    private String reportType;

    private Double discount;

    private byte[] openingReportDescription;
    
    

    public HtProject getProject() {
		return project;
	}

	public void setProject(HtProject project) {
		this.project = project;
	}

	public String getOpeningReportId() {
        return openingReportId;
    }

    public void setOpeningReportId(String openingReportId) {
        this.openingReportId = openingReportId == null ? null : openingReportId.trim();
    }

    public Date getOpeningReportTime() {
        return openingReportTime;
    }

    public void setOpeningReportTime(Date openingReportTime) {
        this.openingReportTime = openingReportTime;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getPayTypeId() {
        return payTypeId;
    }

    public void setPayTypeId(String payTypeId) {
        this.payTypeId = payTypeId == null ? null : payTypeId.trim();
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getDeleteUser() {
        return deleteUser;
    }

    public void setDeleteUser(String deleteUser) {
        this.deleteUser = deleteUser == null ? null : deleteUser.trim();
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getDeleteState() {
        return deleteState;
    }

    public void setDeleteState(String deleteState) {
        this.deleteState = deleteState == null ? null : deleteState.trim();
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public String getPriceType() {
        return priceType;
    }

    public void setPriceType(String priceType) {
        this.priceType = priceType == null ? null : priceType.trim();
    }

    public String getOpeningReportName() {
        return openingReportName;
    }

    public void setOpeningReportName(String openingReportName) {
        this.openingReportName = openingReportName == null ? null : openingReportName.trim();
    }

    public String getReportType() {
        return reportType;
    }

    public void setReportType(String reportType) {
        this.reportType = reportType == null ? null : reportType.trim();
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public byte[] getOpeningReportDescription() {
        return openingReportDescription;
    }

    public void setOpeningReportDescription(byte[] openingReportDescription) {
        this.openingReportDescription = openingReportDescription;
    }
}