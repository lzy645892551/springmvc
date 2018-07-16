package com.wanda.bean;

import java.util.Date;

public class OpeningPay {
    private String openingPayId;

    private String payTypeId;
    
    private PayType payType;

    private String openingReportId;

    private String updateUser;

    private Date updateTime;

    private String deleteUser;

    private Date deleteTime;

    private String deleteState;
    
    

    public PayType getPayType() {
		return payType;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	public String getOpeningPayId() {
        return openingPayId;
    }

    public void setOpeningPayId(String openingPayId) {
        this.openingPayId = openingPayId == null ? null : openingPayId.trim();
    }

    public String getPayTypeId() {
        return payTypeId;
    }

    public void setPayTypeId(String payTypeId) {
        this.payTypeId = payTypeId == null ? null : payTypeId.trim();
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
}