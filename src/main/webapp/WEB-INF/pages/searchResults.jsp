<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Search results</title>
</head>

<body>
<div id="main">

    <form class="form-inline" id="search_form" action="/findContact">
        <div class="form-group">
            <input type="text" name="search" class="form-control" id="search"
                   placeholder="Search contacts">
        </div>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Search</button>
    </form>

    <div class="clearfix"></div>

    <h1>Search results</h1>

    <c:if test="${not empty listContact}">

        <p class="bg-success p_info">Found ${fn:length(listContact)} contacts</p>

        <div class="clearfix"></div>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>Full Name</th>
                <th>Address</th>
                <th>Contacts</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="contact" items="${listContact}">

                <tr class="table_tr" onclick="document.location = 'editContact?id=${contact.id}'">


                    <td width="200">${contact.firstName} ${contact.lastName}</td>
                    <td width="200">${contact.address}</td>
                    <td width="200">
                        <table class="table_inner">
                            <c:forEach var="number" items="${contact.numbers}">
                                <tr class="tr_numbers_details">
                                    <td width="50"><em>${number.type.title}</em></td>
                                    <td>${number.phoneNumber}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </td>
                    <td width="200">
                        <a href="editContact?id=${contact.id}" class="btn btn-default btn-sm">
                            <span class="glyphicon glyphicon-edit"></span>
                            Edit
                        </a>
                        <a href="deleteContact?id=${contact.id}">
                            <button class="btn btn-default btn-sm">
                                <span class="glyphicon glyphicon-remove"></span>
                                Remove
                            </button>
                        </a>
                    </td>
                </tr>

            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <c:if test="${empty listContact}">
        <p class="bg-warning p_info">Not found any results...</p>
    </c:if>

    <a href="${pageContext.request.contextPath}/">
        <button class="btn btn-default">Back</button>
    </a>

</div>

<script type="text/javascript" src="/resources/static/js/app.js"></script>
</body>
</html>

