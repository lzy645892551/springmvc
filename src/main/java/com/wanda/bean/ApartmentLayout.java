package com.wanda.bean;

import java.util.Date;

public class ApartmentLayout {
    private String apartmentLayoutId;

    private String apartmentLayout;

    private String updateUser;

    private String updateTime;

    private String deleteUser;

    private String deleteTime;

    private String deleteState;

    public String getApartmentLayoutId() {
        return apartmentLayoutId;
    }

    public void setApartmentLayoutId(String apartmentLayoutId) {
        this.apartmentLayoutId = apartmentLayoutId == null ? null : apartmentLayoutId.trim();
    }

    public String getApartmentLayout() {
        return apartmentLayout;
    }

    public void setApartmentLayout(String apartmentLayout) {
        this.apartmentLayout = apartmentLayout == null ? null : apartmentLayout.trim();
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
}