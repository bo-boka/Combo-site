/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
//@WebServlet(name = "FlooringController", urlPatterns = {"/Calculate"})

@Controller
public class FlooringController{
    
    @RequestMapping(value="flooringCalculator", method=RequestMethod.GET)
    public String werk(){
        return "flooringCalculator";
    }

    @RequestMapping(value="/Calculate", method=RequestMethod.POST)
    public String doGet(HttpServletRequest request){
        
        try {
            double width = Double.parseDouble(request.getParameter("width"));
            double length = Double.parseDouble(request.getParameter("length"));
            double costSqFt = Double.parseDouble(request.getParameter("costSqFt"));
            
            if (width < 0 || length < 0 || costSqFt < 0){
                request.setAttribute("badInput", true);
            } else {
                double hoursWorked = (width * length / 20);
                double materialCost = width * length * costSqFt;
                double laborCost = 0;
                double minutesWorked = hoursWorked * 60;

                if (minutesWorked < 15){
                    laborCost = 86/4;
                } else {
                    laborCost = hoursWorked * 86;
                }

                double totalCost = Math.round((laborCost + materialCost) * 100.0) / 100.0;

                request.setAttribute("total", totalCost);
            }
         
        } catch (NumberFormatException e) {
            request.setAttribute("badInput", true);
        }
        return "flooringCalculatorResponse";
//        request.getRequestDispatcher("response.jsp").forward(request, response);    
    }

}
