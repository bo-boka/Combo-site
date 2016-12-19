<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Combo Site Home</title>
        <!-- Bootstrap core CSS -->
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/css/combosite.css" rel="stylesheet">

        <!-- SWC Icon -->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <script type="text/javascript">

            function doLoadStuff(){		
                hideAllDivs();
            }	
            
            function hideAllDivs() {
                var allUnitDivs = document.getElementsByClassName("unitDiv");
                for (var i = 1; i < allUnitDivs.length; i++) {
                    allUnitDivs[i].style.display = "none";
                }
            }
            
            function selectType() {
                if (document.getElementById("type").value == "temperature"){
                    document.getElementById("tempDiv").style.display = "block";
                    document.getElementById("lengthDiv").style.display = "none";
                    document.getElementById("volumeDiv").style.display = "none";
//                    document.getElementById("massDiv").style.display = "none";
                }else if (document.getElementById("type").value == "length") {
                    document.getElementById("tempDiv").style.display = "none";
                    document.getElementById("lengthDiv").style.display = "block";
                    document.getElementById("volumeDiv").style.display = "none";
//                    document.getElementById("massDiv").style.display = "none";
                }else if (document.getElementById("type").value == "volume") {
                    document.getElementById("tempDiv").style.display = "none";
                    document.getElementById("lengthDiv").style.display = "none";
                    document.getElementById("volumeDiv").style.display = "block";
//                    document.getElementById("massDiv").style.display = "none";
                }else if (document.getElementById("type").value == "mass") {
                    document.getElementById("tempDiv").style.display = "none";
                    document.getElementById("lengthDiv").style.display = "none";
                    document.getElementById("volumeDiv").style.display = "none";
//                    document.getElementById("massDiv").style.display = "block";
                }
            }
            
        </script>
    </head>
    <body onload="doLoadStuff();">
        <div class="container">
            <center>
            <header>
                <div class="decorate" id="headtext">
                    <p>Software Guild Java Cohort</p>
                    <p>JSP Site Lab</p>
                </div>
                <div class="navbar decorate">
                    <ul class="nav nav-justified">
                        <li role="presentation"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/luckySevens">Lucky Sevens</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/factorizor">Factorizor</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/interestCalculator">Interest Calculator</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/flooringCalculator">Flooring Calculator</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/tipCalculator">Tip Calculator</a></li>
                        <li role="presentation"><a href="${pageContext.request.contextPath}/unitConverter">Unit Converter</a></li>
                    </ul>    
                </div>
            </header>
            <div id="divBody" class="decorate">
                <h1>Unit Converter!</h1>
                <form action="UnitCalculate" method="POST" class="form-horizontal">
                    <div class="form-group">
                    <label for="type" class="col-sm-4 control-label">Conversion Type: </label>
                    <div class="col-sm-4">
                        <select name="type" class="form-control" id="type" onchange="selectType()">
                            <option value="temperature">Temperature</option>
                            <option value="length">Length</option>
                            <option value="volume">Volume</option>
                            <!--<option value="mass">Mass</option>-->
                        </select>
                    </div>
                </div>
                <div id="tempDiv" class="unitDiv">
                    <div class="form-group">
                        <label for="unit" class="col-sm-4 control-label">From: </label>
                        <div class="col-sm-4">
                            <select name="fromUnitT" class="form-control" id="unit">
                                <option value="far">Fahrenheit</option>
                                <option value="cel">Celsius</option>
                                <option value="kel">Kelvin</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" class="unitDiv">
                        <label for="unit" class="col-sm-4 control-label">To: </label>
                        <div class="col-sm-4">
                            <select name="toUnitT" class="form-control" id="unit">
                                <option value="far">Fahrenheit</option>
                                <option value="cel">Celsius</option>
                                <option value="kel">Kelvin</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div id="lengthDiv" class="unitDiv">
                    <div class="form-group">
                        <label for="unit" class="col-sm-4 control-label">From: </label>
                        <div class="col-sm-4">
                            <select name="fromUnitL" class="form-control" id="unit">
                                <option value="in">Inch</option>
                                <option value="ft">Foot</option>
                                <option value="yd">Yard</option>
                                <option value="mi">Mile</option>
                                <option value="cm">Centimeter</option>
                                <option value="m">Meter</option>
                                <option value="km">Kilometer</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" class="unitDiv">
                        <label for="type" class="col-sm-4 control-label">To: </label>
                        <div class="col-sm-4">
                            <select name="toUnitL" class="form-control" id="unit">
                                <option value="in">Inch</option>
                                <option value="ft">Foot</option>
                                <option value="yd">Yard</option>
                                <option value="mi">Mile</option>
                                <option value="cm">Centimeter</option>
                                <option value="m">Meter</option>
                                <option value="km">Kilometer</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div id="volumeDiv" class="unitDiv">
                    <div class="form-group">
                        <label for="unit" class="col-sm-4 control-label">From: </label>
                        <div class="col-sm-4">
                            <select name="fromUnitV" class="form-control" id="unit">
                                <option value="gal">Gallon</option>
                                <option value="qt">Quart</option>
                                <option value="pt">Pint</option>
                                <option value="c">Cup</option>
                                <option value="flOz">Fluid Ounce</option>
                                <option value="l">Liter</option>
                                <option value="ml">Milliliter</option>
                                <option value="imGal">Imperial Gallon</option>
                                <option value="imQt">Imperial Quart</option>
                                <option value="imPt">Imperial Pint</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="unit" class="col-sm-4 control-label">To: </label>
                        <div class="col-sm-4">
                            <select name="toUnitV" class="form-control" id="unit">
                                <option value="gal">Gallon</option>
                                <option value="qt">Quart</option>
                                <option value="pt">Pint</option>
                                <option value="c">Cup</option>
                                <option value="flOz">Fluid Ounce</option>
                                <option value="l">Liter</option>
                                <option value="ml">Milliliter</option>
                                <option value="imGal">Imperial Gallon</option>
                                <option value="imQt">Imperial Quart</option>
                                <option value="imPt">Imperial Pint</option>
                            </select>
                        </div>
                    </div>
                </div>
                <!--                <div id="massDiv" class="unitDiv">
                                    <div class="form-group">
                                        <label for="unit" class="col-sm-4 control-label">From: </label>
                                        <div class="col-sm-4">
                                            <select name="fromUnitM" class="form-control" id="unit">
                                                <option value="t">Ton</option>
                                                <option value="g">Gram</option>
                                                <option value="lb">Pound</option>
                                                <option value="oz">Ounce</option>
                                                <option value="kg">Kilogram</option>
                                                <option value="ml">Milligram</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="unit" class="col-sm-4 control-label">To: </label>
                                        <div class="col-sm-4">
                                            <select name="toUnitM" class="form-control" id="unit">
                                                <option value="t">Ton</option>
                                                <option value="g">Gram</option>
                                                <option value="lb">Pound</option>
                                                <option value="oz">Ounce</option>
                                                <option value="kg">Kilogram</option>
                                                <option value="ml">Milligram</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>-->
                <div class="form-group">
                    <label for="num" class="col-sm-4 control-label">Enter Number: </label>
                    <div class="col-sm-2">
                        <input type="number" class="form-control" name="num" placeholder="0.00">
                    </div>
                    <div class="col-sm-2">
                        Result: 
                        <c:if test="${badInput}">
                            Error. Try again.
                        </c:if>
                        <c:if test="${!badInput}">
                            <c:out value="${conNum}"/>
                        </c:if>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-4">
                        <button type="submit" class="btn btn-default">Calculate</button>
                    </div>
                </div>
            </form>
            </div>
            <footer>
                <div class="decorate">
                    <p>Created By: Sarah Boka 2016<br>
                    Powered By Java and Bootstrap</p>
                </div>
            </footer>
            </center>
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

