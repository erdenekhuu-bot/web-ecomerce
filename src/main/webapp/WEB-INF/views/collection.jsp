<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ui:layout title="Collection">

    <h1 class="text-3xl font-bold">
        Collection
    </h1>
    
    <section class="p-6 grid grid-cols-2 gap-4">
    	<div class="p-8">
    		<img src="${pageContext.request.contextPath}/images/col1.png" alt="" class="m-4">
    		<img src="${pageContext.request.contextPath}/images/col2.png" alt="" class="m-4">
    		<img src="${pageContext.request.contextPath}/images/col3.png" alt="" class="m-4">
    	</div>
    	<div class="p-8">
    		<p class="font-bold my-2 text-3xl">The Sculptural Overcoat</p>
    		<p>$1,250.00</p>
    		<p class="my-3">Color</p>
    		<p>SELECT SIZE</p>
    	</div>
    </section>
    
   
</ui:layout>