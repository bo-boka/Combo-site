/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.dto;

/**
 *
 * @author apprentice
 */
public class InterestYear {
    int year;
    double begP;
    double profit;
    double endP;
    
    public InterestYear(){
        
    }

    public InterestYear(int year, double begP, double profit, double endP) {
        this.year = year;
        this.begP = begP;
        this.profit = profit;
        this.endP = endP;
    }
    
    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getBegP() {
        return begP;
    }

    public void setBegP(double begP) {
        this.begP = begP;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }

    public double getEndP() {
        return endP;
    }

    public void setEndP(double endP) {
        this.endP = endP;
    }
    
    
}
