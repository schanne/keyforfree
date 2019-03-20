<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>

    <jsp:attribute name="title">${game.getName()}</jsp:attribute>

    <jsp:attribute name="nav_log">
        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <ul class="nav navbar-nav navbar-right mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a href="register" class="nav-link" style="text-decoration: none; color: white;">
                            <i class="fas fa-user-plus"></i>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="login" class="nav-link" style="text-decoration: none; color: white;">
                            <i class="fas fa-sign-in-alt"></i>
                        </a>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right mt-2 mt-lg-0">
                    <li class="nav-item active">
                        <a href="cart" class="nav-link">
                            <i class="fas fa-shopping-cart"></i>
                        </a>
                    </li>
                    <li class="nav-item active">
                        <a href="logout" class="nav-link">
                            <i class="fas fa-sign-out-alt"></i>
                        </a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/style/detail.css"/>">
    </jsp:attribute>


    <jsp:attribute name="main">
        <c:set var="test1" value="True"></c:set>
        <c:set var="sysrec" value="Recommended"></c:set>
            <div class="detailFirst">
                <h1 class="title">${game.getName()}</h1>
            <div class="text">
                <table class="myTable">
                    <tr>
                        <td class="myImageField">
                            <div class="myImageDiv">
                                <img src="${game.getImage()}" class="img-fluid img-thumbnail">
                            </div>
                        </td>
                        <td>
                            <div class="scrollview">
                                ${game.getAboutText()}
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row pricingDiv">
                <div class="pricingRow">${game.getPrice()}€</div>
                <div class="pricingRow">Menge</div>
                <div class="pricingRow">Kaufen</div>
            </div>
        </div>

        <div class="accordion" id="accordionExample">
            <div class="card">
                <div class="card text-center">
                    <div class="card-header" id="cardHeaderOne">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#collapseOne">
                                    Beschreibung
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#collapseTwo" role="button" aria-expanded="false" aria-controls="headingTwo">
                                    Informationen
                                </a>
                            </li>
                            <c:choose>
                                <c:when test="${game.getRequirements().getPlatformWindows() == test1}">
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#collapseThree" role="button" aria-expanded="false" aria-controls="headingThree">
                                            Systemvoraussetzungen-Windows
                                        </a>
                                    </li>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${game.getRequirements().getPlatformLinux() == test1}">
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#collapseFour" role="button" aria-expanded="false" aria-controls="headingFour">
                                            Systemvoraussetzungen-Linux
                                        </a>
                                    </li>
                                </c:when>
                            </c:choose>
                            <c:choose>
                                <c:when test="${game.getRequirements().getPlatformMac() == test1}">
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#collapseFive" role="button" aria-expanded="false" aria-controls="headingFive">
                                            Systemvoraussetzungen-Mac
                                        </a>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </div>
                    <div class="card-body tab-content" id="cardBodyOne">
                        <div id="collapseOne" class="tab-pane fade-in active" data-parent="#accordionExample">
                            <div class="card-body">
                                ${game.getDescription()}
                            </div>
                        </div>
                        <div id="collapseTwo" class="tab-pane fade" data-parent="#accordionExample">
                            <div class="card-body">
                                Erscheinungsjahr: ${game.getReleaseYear()}
                                <br>
                                Sprachen: ${game.getLanguages()}
                                <br>
                                Genre:
                                <br>
                                Kategorie:
                            </div>
                        </div>
                        <!--Systemvoraussetzungen Windows-->
                        <div id="collapseThree" class="tab-pane fade" data-parent="#accordionExample">
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${game.getHaveMinPCReqs() == test1}">
                                        Minimum:
                                        <br>
                                        ${game.getRequirements().getPCMinReqsText()}
                                        <br>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${game.getHaveRecPCReqs() == test1}">
                                        Empfohlen:
                                        <br>
                                        ${game.getRequirements().getPCRecReqsText()}
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <!--Systemvoraussrtzungen Linux-->
                        <div id="collapseFour" class="tab-pane fade" data-parent="#accordionExample">
                            <div class="card-body">
                                <c:set var="test1" value="True"></c:set>
                                <c:choose>
                                    <c:when test="${game.getHaveMinLinuxReqs() == test1}">
                                        Minimum:
                                        <br>
                                        ${game.getRequirements().getLinuxMinReqsText()}
                                        <br>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${game.getHaveRecLinuxReqs() == test1}">
                                        Empfohlen:
                                        <br>
                                        ${game.getRequirements().getLinuxRecReqsText()}
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                        <!--Systemvoraussetzungen Mac-->
                        <div id="collapseFive" class="tab-pane fade" data-parent="#accordionExample">
                            <div class="card-body">
                                <c:set var="test1" value="True"></c:set>
                                <c:choose>
                                    <c:when test="${game.getHaveMinMacReqs() == test1}">
                                        Minimum:
                                        <br>
                                        ${game.getRequirements().getMacMinReqsText()}
                                        <br>
                                    </c:when>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${game.getHaveRecMacReqs() == test1}">
                                        Empfohlen:
                                        <br>
                                        ${game.getRequirements().getMacRecReqsText()}
                                    </c:when>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</template:base>
