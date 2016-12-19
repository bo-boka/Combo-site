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

    </head>
    <body>
        <div class="container">
            
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
                <h1>Compounded Interest Calculator!</h1>
                <form action="IntCalculate" method="POST" class="form-horizontal">
                    <div class="form-group">
                            <label for="annInterestRate" class="col-sm-4 control-label">Annual Interest Rate: </label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="annInterestRate" placeholder="0.00">
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="compoundPeriod" class="col-sm-4 control-label">Compound Period</label>
                            <div class="col-sm-4">
                                    <select name="compoundPeriod" class="form-control" id="compoundPeriod">
                                            <option value="quarterly">Quarterly</option>
                                            <option value="monthly">Monthly</option>
                                            <option value="daily">Daily</option>
                                    </select>
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="principal" class="weak col-sm-4 control-label">Investment Amount: </label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="principal" placeholder="0.00">
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="yrsInvest" class="col-sm-4 control-label">Years to Invest: </label>
                            <div class="col-sm-4">
                              <input type="text" class="form-control" name="yrsInvest" placeholder="0">
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
            
        </div>
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-3.0.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    </body>
</html>

