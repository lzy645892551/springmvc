package com.wanda.bean;

import java.util.Date;

public class ReceptionRecord {
    private String receptionRecordId;

    private String userId;

    private String userName;

    private String number;

    private Date receptionTime;

    private String receptionMode;

    private String receptionContent;

    private String customerId;

    private String customerName;

    private Integer times;

    private String updateUser;

    private Date updateTime;

    private String deleteUser;

    private Date deleteTime;

    private String deleteState;

    public String getReceptionRecordId() {
        return receptionRecordId;
    }

    public void setReceptionRecordId(String receptionRecordId) {
        this.receptionRecordId = receptionRecordId == null ? null : receptionRecordId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public Date getReceptionTime() {
        return receptionTime;
    }

    public void setReceptionTime(Date receptionTime) {
        this.receptionTime = receptionTime;
    }

    public String getReceptionMode() {
        return receptionMode;
    }

    public void setReceptionMode(String receptionMode) {
        this.receptionMode = receptionMode == null ? null : receptionMode.trim();
    }

    public String getReceptionContent() {
        return receptionContent;
    }

    public void setReceptionContent(String receptionContent) {
        this.receptionContent = receptionContent == null ? null : receptionContent.trim();
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId == null ? null : customerId.trim();
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public Integer getTimes() {
        return times;
    }

    public void setTimes(Integer times) {
        this.times = times;
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