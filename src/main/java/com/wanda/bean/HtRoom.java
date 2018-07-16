package com.wanda.bean;

import java.util.Date;

public class HtRoom {
    private String roomId;

    private String roomCode;

    private Float buildUpArea;

    private Float innerArea;

    private String apartmentLayoutId;

    private Float innerPrice;

    private Float unitPrice;

    private Integer floor;

    private Integer state;

    private String unitId;

    private String purposeId;

    private String buildId;

    private String openingReportId;

    private String updateUser;

    private String updateTime;

    private String deleteUser;

    private String deleteTime;

    private String deleteState;

    private String projectId;
    
    private HtBuild build;
    
    private HtUnit unit;
    
    private ApartmentLayout layout;
    
    private Purpose purpose;
    
    private HtProject project;

    public HtProject getProject() {
		return project;
	}

	public void setProject(HtProject project) {
		this.project = project;
	}

	public HtBuild getBuild() {
		return build;
	}

	public void setBuild(HtBuild build) {
		this.build = build;
	}

	public HtUnit getUnit() {
		return unit;
	}

	public void setUnit(HtUnit unit) {
		this.unit = unit;
	}

	public ApartmentLayout getLayout() {
		return layout;
	}

	public void setLayout(ApartmentLayout layout) {
		this.layout = layout;
	}


	public Purpose getPurpose() {
		return purpose;
	}

	public void setPurpose(Purpose purpose) {
		this.purpose = purpose;
	}

	public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
    }

    public String getRoomCode() {
        return roomCode;
    }

    public void setRoomCode(String roomCode) {
        this.roomCode = roomCode == null ? null : roomCode.trim();
    }

    public Float getBuildUpArea() {
        return buildUpArea;
    }

    public void setBuildUpArea(Float buildUpArea) {
        this.buildUpArea = buildUpArea;
    }

    public Float getInnerArea() {
        return innerArea;
    }

    public void setInnerArea(Float innerArea) {
        this.innerArea = innerArea;
    }

    public String getApartmentLayoutId() {
        return apartmentLayoutId;
    }

    public void setApartmentLayoutId(String apartmentLayoutId) {
        this.apartmentLayoutId = apartmentLayoutId == null ? null : apartmentLayoutId.trim();
    }

    public Float getInnerPrice() {
        return innerPrice;
    }

    public void setInnerPrice(Float innerPrice) {
        this.innerPrice = innerPrice;
    }

    public Float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId == null ? null : unitId.trim();
    }

    public String getPurposeId() {
        return purposeId;
    }

    public void setPurposeId(String purposeId) {
        this.purposeId = purposeId == null ? null : purposeId.trim();
    }

    public String getBuildId() {
        return buildId;
    }

    public void setBuildId(String buildId) {
        this.buildId = buildId == null ? null : buildId.trim();
    }

    public String getOpeningReportId() {
        return openingReportId;
    }

    public void setOpeningReportId(String openingReportId) {
        this.openingReportId = openingReportId == null ? null : openingReportId.trim();
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser == null ? null : updateUser.trim();
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getDeleteUser() {
        return deleteUser;
    }

    public void setDeleteUser(String deleteUser) {
        this.deleteUser = deleteUser == null ? null : deleteUser.trim();
    }

    public String getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(String deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getDeleteState() {
        return deleteState;
    }

    public void setDeleteState(String deleteState) {
        this.deleteState = deleteState == null ? null : deleteState.trim();
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }
}