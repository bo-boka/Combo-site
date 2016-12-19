/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
@Controller
public class TipCalculatorController extends HttpServlet {
    
    @RequestMapping(value="tipCalculator", method=RequestMethod.GET)
    public String calc(HttpServletRequest request) {
        return "tipCalculator";
    }
    
    @RequestMapping(value="/TipCalculate", method=RequestMethod.POST)
    public String doPost(HttpServletRequest request) {
        
        try {
            float amount = Float.parseFloat(request.getParameter("amount"));
            float tipPerc = Float.parseFloat(request.getParameter("tipPerc"));
            
            if (amount < 0 || tipPerc < 0) {
                request.setAttribute("badInput", true);
            } else {
                float tip = amount * tipPerc / 100;
                float total = amount + tip;
                
                request.setAttribute("amount", amount);
                request.setAttribute("total", total);
                request.setAttribute("tipPerc", tipPerc);
                request.setAttribute("tip", tip);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("badInput", true);
        }
        
        return "tipCalculatorResponse";
    }

    

}
