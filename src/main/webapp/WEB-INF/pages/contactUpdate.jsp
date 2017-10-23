<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webjars/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/style.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact New/Update</title>
</head>

<body>
<div id="update">

    <h1>Contact Form</h1>

    <form method="post" action="${pageContext.request.contextPath}/saveContact" class="form-group required">

        <table class="table .table_update">
            <tr>
                <td>
                    First name
                    <label class='control-label'></label>
                </td>
                <td width="200">
                    <form:hidden path="contact.id"/>
                    <spring:bind path="contact.firstName">
                    <input type="text"
                           required
                           class="form-control"
                           value="<c:out value="${status.value}"/>"
                           name="<c:out value="${status.expression}"/>">
                </td>
                </spring:bind>
            </tr>

            <tr>
                <td>Last name</td>
                <td>
                    <spring:bind path="contact.lastName">
                        <input type="text"
                               class="form-control"
                               value="<c:out value="${status.value}"/>"
                               name="<c:out value="${status.expression}"/>">
                    </spring:bind>
                </td>
            </tr>

            <tr>
                <td>Address</td>
                <td>
                    <spring:bind path="contact.address">
                        <input type="text"
                               class="form-control"
                               value="<c:out value="${status.value}"/>"
                               name="<c:out value="${status.expression}"/>">
                    </spring:bind>
                </td>
            </tr>

            <%--For new contacts--%>
            <c:if test="${empty contact.numbers}">
                <form:hidden path="number.id"/>
                <tr>
                    <td>Phone type</td>
                    <td>
                        <spring:bind path="number.type">
                            <select name="type" class="form-control">
                                <c:forEach var="type" items="${numberTypes}">
                                    <option value="${type}">${type.title}</option>
                                </c:forEach>
                            </select>
                        </spring:bind>
                    </td>
                </tr>

                <tr>
                    <td>Number<label class='control-label'></label></td>
                    <td>
                        <spring:bind path="number.phoneNumber">
                            <input type="text"
                                   required
                                   class="form-control"
                                   value="<c:out value="${status.value}"/>"
                                   name="<c:out value="${status.expression}"/>">
                        </spring:bind>
                    </td>
                </tr>
            </c:if>

            <%--If contacts already exists--%>
            <c:if test="${not empty contact.numbers}">

                <form:form modelAttribute="contact">

                    <c:forEach var="number" items="${contact.numbers}" varStatus="status">
                        <tr>
                            <td>Phone #${status.index + 1}</td>
                            <td>
                                <form:hidden path="numbers[${status.index}].id"/>
                                <input type="hidden" name="numbers[${status.index}].contact.id" class="form-control"
                                       value="${contact.id}"/>
                                <select name="numbers[${status.index}].type" class="form-control">
                                    <c:forEach var="type" items="${numberTypes}">
                                        <option ${type eq number.type ? 'selected="selected"' : ''}
                                                value="${type}">${type.title}</option>
                                    </c:forEach>
                                </select>
                                <input name="numbers[${status.index}].phoneNumber" required class="form-control"
                                       value="${number.phoneNumber}"/>
                                <a href="/deleteNumber?id=${number.id}&contactid=${contact.id}">
                                    <input type="button" id="btn_delete" class="btn btn-default btn-sm" value="Delete"/>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </form:form>
            </c:if>

            <tr id="newnumberhere"></tr>
        </table>

        <%--Controls--%>
        <div align="center">
            <c:if test="${ empty contact.numbers}">
                <input type="submit" class="btn btn-default" value="Create">
            </c:if>

            <c:if test="${not empty contact.numbers}">
                <input type="submit" class="btn btn-default" value="Save">
            </c:if>
            <input type="reset" class="btn btn-default" value="Reset">
            <input type="button" class="btn btn-default" value="Home" onclick="window.location='/';">
            <%--If new contact, hide button--%>
            <c:if test="${not empty contact.numbers}">
                <input type="button" id="create_new_phone" class="btn btn-default" value="Add phone"
                       onclick="createNewPhoneForm();">
            </c:if>
        </div>

    </form>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/static/js/app.js"></script>
</body>
</html>