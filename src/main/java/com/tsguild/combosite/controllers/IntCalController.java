/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import com.tsguild.combosite.dto.InterestYear;
import java.util.ArrayList;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
//@WebServlet(name = "IntCalController", urlPatterns = {"/Calculate"})
@Controller
public class IntCalController extends HttpServlet {
    
    @RequestMapping(value="interestCalculator", method=RequestMethod.GET)
    public String whatevs() {
        return "interestCalculator";
    }

    @RequestMapping(value="/IntCalculate", method=RequestMethod.POST)
    public String doPost(HttpServletRequest request){
        
        ArrayList<InterestYear> results = new ArrayList<>();
        
        double yearFraction = 0;
        try {
            double annInt = Double.parseDouble(request.getParameter("annInterestRate"));
            String compPeriod = request.getParameter("compoundPeriod");
            double principal = Double.parseDouble(request.getParameter("principal"));
            int yrsInvest = Integer.parseInt(request.getParameter("yrsInvest"));
            
            if (annInt <= 0 || principal <= 0 || yrsInvest <=0 || (!compPeriod.equals("quarterly") && !compPeriod.equals("monthly") && !compPeriod.equals("daily"))) {
                request.setAttribute("badInput", true);
            } else {
                request.setAttribute("principal", principal);
            
                if (compPeriod.equals("quarterly")){
                    yearFraction = 4;
                } else if (compPeriod.equals("monthly")){
                    yearFraction = 12;
                } else if (compPeriod.equals("daily")) {
                    yearFraction = 365;
                }
                double compInt = annInt/yearFraction;

                for (int j = 0; j < yrsInvest; j++){
                    double beginPrincipal = principal;
                    for (int i = 0; i < yearFraction; i++){
                        principal += principal * (compInt/100);
                    }

                    double result = Math.round((principal - beginPrincipal) * 100.0) / 100.0;
                    double begPrinc = Math.round((beginPrincipal) * 100.0) / 100.0;
                    double endPrinc = Math.round((principal) * 100.0) / 100.0;
                    InterestYear inst = new InterestYear(j, begPrinc, result, endPrinc);
                    results.add(inst);
                    
                }
                request.setAttribute("results", results);
            }
        } catch (NumberFormatException e){
            request.setAttribute("badInput", true);
        }
//        request.getRequestDispatcher("response.jsp").forward(request, response);
        return "interestCalculatorResponse";
    }

}
