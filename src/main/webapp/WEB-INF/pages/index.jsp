<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contacts Management</title>
</head>

<body>
<div id="main">

    <form class="form-inline" id="search_form" action="/findContact">
        <div class="form-group">
            <input type="text" name="search" class="form-control" placeholder="Search contacts">
        </div>
        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span> Search</button>
    </form>

    <div class="clearfix"></div>

    <h1>Contacts List</h1>

    <a href="/newContact">
        <button class="btn btn-default btn_new_contact">
            <span class="glyphicon glyphicon-plus"></span> New Contact
        </button>
    </a>

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
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/app.js"></script>
</body>
</html>
