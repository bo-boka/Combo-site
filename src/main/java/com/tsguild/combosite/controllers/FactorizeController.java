/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
//@WebServlet(name = "Factorize", urlPatterns = {"/Factorize"})

@Controller
public class FactorizeController {
    
    @RequestMapping(value="/factorizor", method=RequestMethod.GET)
    public String whatevs(){
        return "factorizor";
    }
   
    @RequestMapping(value="/Factorize", method=RequestMethod.POST)
    public String doPost(HttpServletRequest request){
        List<Integer> factors = new ArrayList<>();
        try {
            
            int num = Integer.parseInt(request.getParameter("num"));
            if (num > 0) {
                String perfMsg = "";
                String primeMsg = "";
                int factorSum = 0;
                int count = 0;
                for (int i = 1; i < num; i++) {
                    if (num % i == 0) {
                        factors.add(i);
                        factorSum += i;
                        count++;
                    }
                }

                if (factorSum == num){
                    perfMsg = num +" is a perfect number.";
                } else {
                    perfMsg = num +" is not a perfect number.";
                }

                if (factors.size() == 1){
                    primeMsg = num +" is a prime number.";
                } else {
                    primeMsg = num +" is not a prime number.";
                }

                String factorCount = num +" has "+ count +" factors."; 

                request.setAttribute("primeMsg", primeMsg);
                request.setAttribute("perfMsg", perfMsg);
                request.setAttribute("factors", factors);
                request.setAttribute("num", num);
                request.setAttribute("factorCount", factorCount);
            } else {
                request.setAttribute("badInput", true);
            }
        } catch (NumberFormatException e){
            request.setAttribute("badInput", true);
        }
        
//        request.getRequestDispatcher("response.jsp").forward(request, response);
        return "factorizorResponse";
    }

    
}
