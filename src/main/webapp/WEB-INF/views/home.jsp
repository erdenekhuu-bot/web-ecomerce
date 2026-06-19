<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>

<ui:layout title="Home">
    <section class="max-h-[920px] relative overflow-hidden">
    	<img src="${pageContext.request.contextPath}/images/background.png" alt="" class="w-full h-full object-cover z-0">
    	<div class="absolute inset-0 flex items-center z-10">
        	<div class="text-white">
        		<p class="text-[1rem] font-light">COLLECTION 01</p>
        		<p class="text-[4.5rem] tracking-wider font-normal">SPRING / SUMMER</p>
        		<p class="text-[3rem] font-medium">2024</p>
        	</div>
    	</div>
	</section>
	
	<section class="max-h-[800px] relative overflow-hidden">
	   <div class="flex justify-between align-center p-4">
		   	<p class="text-[2rem] font-medium uppercase tracking-wider">shop by category</p>
		   	<p class="text-[1rem] font-medium uppercase">view all</p>
	   </div>
		<div class="swiper">
		  <div class="swiper-wrapper">
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/sw1.png" alt="">
		    </div>
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/sw2.png" alt="">
		    </div>
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/sw1.png" alt="">
		    </div>
		  </div>
		
		
		  <div class="swiper-button-prev"></div>
		  <div class="swiper-button-next"></div>
		
		</div>
	</section>
	
	<section class="max-h-[800px] relative overflow-hidden">
		<div class="flex justify-between align-center p-4">
		   	<p class="text-[2rem] font-medium uppercase tracking-wider">trending show</p>
		   	<p class="text-[1rem] font-medium uppercase">view all</p>
	   </div>
	   
	   <div class="swiper">
		  <div class="swiper-wrapper">
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/screen.png" alt="" width="594px">
		    </div>
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/screen1.png" alt="" width="594px">
		    </div>
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/screen2.png" alt="" width="594px">
		    </div>
		    <div class="swiper-slide">
		    	<img src="${pageContext.request.contextPath}/images/screen3.png" alt="" width="594px">
		    </div>
		  </div>
		
		
		  <div class="swiper-button-prev"></div>
		  <div class="swiper-button-next"></div>
		
		</div>
	</section>
    
   
	 <script>
		  document.addEventListener("DOMContentLoaded", function() {
		    const swiper = new Swiper('.swiper', {
		      slidesPerView: 2, 
		      spaceBetween: 10, 
		      navigation: {
		        nextEl: '.swiper-button-next',
		        prevEl: '.swiper-button-prev',
		      },
		      loop: true, 
		      autoplay: {
		         delay: 3000, 
		      },
		    });
		  });
	</script>
	
</ui:layout>