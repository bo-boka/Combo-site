/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import java.io.IOException;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
//@WebServlet(name = "LuckySevensController", urlPatterns = {"/LuckySevensController"})
@Controller
public class LuckySevensController {
    
    @RequestMapping(value="/luckySevens", method=RequestMethod.GET)
    public String whatever() {
        return "luckySevens";
    }

    @RequestMapping(value="/LuckySevensController", method=RequestMethod.POST)
    public String doPost(HttpServletRequest request){
        
        String tempString = request.getParameter("betAmount");
        try {
            int betAmount = Integer.parseInt(tempString);
            if (betAmount < 0){
                request.setAttribute("badInput", true);
            } else {
                int highMoney = betAmount;

                Random rollDice = new Random();
                int roll1;
                int roll2;
                int count = 0;
                int highRoll = 0;
                do {
                    roll1 = rollDice.nextInt(7);
                    roll2 = rollDice.nextInt(7);

                    if ((roll1 + roll2) == 7) {
                        betAmount += 4;
                        count++;
                        if (betAmount > highMoney) {
                            highMoney = betAmount;
                            highRoll = count;
                        }
                        System.out.println(betAmount);               
                    } else {           
                        betAmount -= 1;
                        System.out.println(betAmount);
                        count++;
                    }
                } while (betAmount != 0);
                String rollCount = "Number of rolls: " + (count + 1) + ".";
                String results = "Your highest amount was $"+ highMoney + " after "+ (highRoll + 1) +" rolls.";

                request.setAttribute("rollCount", rollCount);
                request.setAttribute("results", results);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("badInput", true);
        }
        
        //request.getRequestDispatcher("luckySevensResponse.jsp").forward(request, response);
        return "luckySevensResponse";
    }


}
