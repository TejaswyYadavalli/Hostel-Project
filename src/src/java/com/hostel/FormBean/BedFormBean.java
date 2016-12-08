/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hostel.FormBean;

import java.io.Serializable;

/**
 *
 * @author VASUDEVA RAO
 */
public class BedFormBean implements Serializable {

    private String bedStatus;
    private int bedId;
    private int floorNo;
    private int bedNo;
    private int roomNo;

    /**
     * @return the bedStatus
     */
    public String getBedStatus() {
        return bedStatus;
    }

    /**
     * @param bedStatus the bedStatus to set
     */
    public void setBedStatus(String bedStatus) {
        this.bedStatus = bedStatus;
    }

    /**
     * @return the bedId
     */
    public int getBedId() {
        return bedId;
    }

    /**
     * @param bedId the bedId to set
     */
    public void setBedId(int bedId) {
        this.bedId = bedId;
    }

    /**
     * @return the floorNo
     */
    public int getFloorNo() {
        return floorNo;
    }

    /**
     * @param floorNo the floorNo to set
     */
    public void setFloorNo(int floorNo) {
        this.floorNo = floorNo;
    }

    /**
     * @return the bedNo
     */
    public int getBedNo() {
        return bedNo;
    }

    /**
     * @param bedNo the bedNo to set
     */
    public void setBedNo(int bedNo) {
        this.bedNo = bedNo;
    }

    /**
     * @return the roomNo
     */
    public int getRoomNo() {
        return roomNo;
    }

    /**
     * @param roomNo the roomNo to set
     */
    public void setRoomNo(int roomNo) {
        this.roomNo = roomNo;
    }

}
