<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ui:layout title="Collection">

    <h1 class="text-3xl font-bold">
        Collection
    </h1>
    
      <p>Servlet message: <c:out value="${message}" /></p>

    <c:if test="${not empty message}">
        <p>Request attribute is working ✅</p>
    </c:if>
     <c:forEach var="item" items="${collections}">
        <div class="border p-4 mb-2">
            ${item}
        </div>
    </c:forEach>
</ui:layout>