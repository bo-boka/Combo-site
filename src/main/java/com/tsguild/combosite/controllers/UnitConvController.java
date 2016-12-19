/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tsguild.combosite.controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author apprentice
 */
@Controller
public class UnitConvController{
    
    @RequestMapping(value="unitConverter", method=RequestMethod.GET)
    public String whert(HttpServletRequest request){
        return "unitConverter";
    }

    @RequestMapping(value="/UnitCalculate", method=RequestMethod.POST)
    public String doGet(HttpServletRequest request){
        
        try {
            String fromUT = request.getParameter("fromUnitT");
            String fromUL = request.getParameter("fromUnitL");
            String fromUV = request.getParameter("fromUnitV");
//            String fromUM = request.getParameter("fromUnitM");
            String toUT = request.getParameter("toUnitT");
            String toUL = request.getParameter("toUnitL");
            String toUV = request.getParameter("toUnitV");
//            String toUM = request.getParameter("toUnitM");
            double num = Double.parseDouble(request.getParameter("num"));
            double conNum = 0;
            
            if (fromUT.equals("cel") && toUT.equals("far")) {
                conNum = num * 1.8 + 32;
            }
            else if (fromUT.equals("far") && toUT.equals("cel")) {
                conNum = (num - 32)/1.8;
            }
            else if (fromUT.equals("kel") && toUT.equals("cel")) {
                conNum = num - 273.15;
            }
            else if (fromUT.equals("cel") && toUT.equals("kel")) {
                conNum = num + 273.15;
            }
            else if (fromUT.equals("kel") && toUT.equals("far")) {
                conNum = num * 1.8 - 459.67;
            }
            else if (fromUT.equals("far") && toUT.equals("kel")) {
                conNum = (num + 459.67)/1.8;
            }

            else if (fromUL.equals("in") && toUL.equals("cm")) {
                conNum = num *2.54;
            }
            else if (fromUL.equals("cm") && toUL.equals("in")) {
                conNum = num /2.54;
            }
            else if (fromUL.equals("in") && toUL.equals("ft")) {
                conNum = num /12;
            }
            else if (fromUL.equals("ft") && toUL.equals("in")) {
                conNum = num *12;
            }
            else if (fromUL.equals("ft") && toUL.equals("yd")) {
                conNum = num /3;
            }
            else if (fromUL.equals("yd") && toUL.equals("ft")) {
                conNum = num *3;
            }
            else if (fromUL.equals("m") && toUL.equals("yd")) {
                conNum = num *1.09361;
            }
            else if (fromUL.equals("yd") && toUL.equals("m")) {
                conNum = num /1.09361;
            }
            else if (fromUL.equals("mi") && toUL.equals("km")) {
                conNum = num * 1.60934;
            }
            else if (fromUL.equals("km") && toUL.equals("mi")) {
                conNum = num / 1.60934;
            }

            else if (fromUV.equals("gal") && toUV.equals("qt")) {
                conNum = num *4;
            }
            else if (fromUV.equals("qt") && toUV.equals("gal")) {
                conNum = num /4;
            }
            else if (fromUV.equals("gal") && toUV.equals("pt")) {
                conNum = num *8;
            }
            else if (fromUV.equals("pt") && toUV.equals("gal")) {
                conNum = num /8;
            }
            else if (fromUV.equals("gal") && toUV.equals("c")) {
                conNum = num * 15.7725;
            }
            else if (fromUV.equals("c") && toUV.equals("gal")) {
                conNum = num / 15.7725;
            }
            else if (fromUV.equals("gal") && toUV.equals("flOz")) {
                conNum = num * 128;
            }
            else if (fromUV.equals("flOz") && toUV.equals("gal")) {
                conNum = num / 128;
            }
            else if (fromUV.equals("gal") && toUV.equals("l")) {
                conNum = num * 3.78541;
            }
            else if (fromUV.equals("l") && toUV.equals("gal")) {
                conNum = num / 3.78541;
            }
            else if (fromUV.equals("flOz") && toUV.equals("ml")) {
                conNum = num * 29.5735;
            }
            else if (fromUV.equals("ml") && toUV.equals("flOz")) {
                conNum = num / 29.5735;
            }
            else if (fromUV.equals("gal") && toUV.equals("imGal")) {
                conNum = num * 0.832674;
            }
            else if (fromUV.equals("imGal") && toUV.equals("gal")) {
                conNum = num / 0.832674;
            }
            else if (fromUV.equals("qt") && toUV.equals("imQt")) {
                conNum = num * 0.832674;
            }
            else if (fromUV.equals("imQt") && toUV.equals("qt")) {
                conNum = num / 0.832674;
            }
            else if (fromUV.equals("pt") && toUV.equals("imPt")) {
                conNum = num * 0.832674;
            }
            else if (fromUV.equals("imPt") && toUV.equals("pt")) {
                conNum = num / 0.832674;
            } else {
                request.setAttribute("badInput", true);
            }

            request.setAttribute("conNum", conNum);
        
        } catch (NumberFormatException ex) {
            request.setAttribute("badInput", true);
        }
        return "unitConverter";
    }

}
