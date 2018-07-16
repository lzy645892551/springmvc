package com.wanda.bean;

import java.util.Date;

public class HtRoomPay {
    private String roomPayId;

    private String contractId;

    private String orderId;

    private String roomId;

    private String customerId;

    private String customerName;

    private String userId;

    private String name;

    private Float receivableMoney;

    private Float receivedMoney;

    private Float uncollectedMoney;

    private Date payTime;

    private String payType;

    private String finishTimes;

    private String waitTimes;

    private String updateUser;

    private Date updateTime;

    private String deleteUser;

    private Date deleteTime;

    private String deleteState;

    public String getRoomPayId() {
        return roomPayId;
    }

    public void setRoomPayId(String roomPayId) {
        this.roomPayId = roomPayId == null ? null : roomPayId.trim();
    }

    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId == null ? null : contractId.trim();
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId == null ? null : roomId.trim();
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Float getReceivableMoney() {
        return receivableMoney;
    }

    public void setReceivableMoney(Float receivableMoney) {
        this.receivableMoney = receivableMoney;
    }

    public Float getReceivedMoney() {
        return receivedMoney;
    }

    public void setReceivedMoney(Float receivedMoney) {
        this.receivedMoney = receivedMoney;
    }

    public Float getUncollectedMoney() {
        return uncollectedMoney;
    }

    public void setUncollectedMoney(Float uncollectedMoney) {
        this.uncollectedMoney = uncollectedMoney;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType == null ? null : payType.trim();
    }

    public String getFinishTimes() {
        return finishTimes;
    }

    public void setFinishTimes(String finishTimes) {
        this.finishTimes = finishTimes == null ? null : finishTimes.trim();
    }

    public String getWaitTimes() {
        return waitTimes;
    }

    public void setWaitTimes(String waitTimes) {
        this.waitTimes = waitTimes == null ? null : waitTimes.trim();
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