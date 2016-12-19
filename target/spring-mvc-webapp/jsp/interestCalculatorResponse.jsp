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
                <c:if test="${badInput}">
                    <h1>You done it wrong. Go back and try again.</h1><br><br>
                    <a href="${pageContext.request.contextPath}/interestCalculator"><input type="submit" value="Restart"</a>
                </c:if>
                <c:if test="${!badInput}">
                    <h1>Calculated Compounded Interest Results</h1>
                    <div>
                        <c:forEach items="${results}" var="yearResult">
                            <c:set var="object" value="${yearResult}" />
                            <c:if test="${not empty object['class'].declaredFields}">
                                <hr>
                                <ul>
                                    <c:forEach var="field" items="${object['class'].declaredFields}">
                                        <c:catch><li><span>${field.name}</span>${object[field.name]}</li></c:catch>
                                    </c:forEach>
                                </ul>
                            </c:if>
                        </c:forEach>
                    </div>
                    <a href="${pageContext.request.contextPath}/interestCalculator"><input type="submit" value="Restart"</a>
                </c:if>
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

