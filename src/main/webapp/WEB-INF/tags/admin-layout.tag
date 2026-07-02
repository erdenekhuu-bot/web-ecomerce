<%@ tag body-content="scriptless" %>
<%@ attribute name="title" required="true" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>${title}</title>
	    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css"/>
		<script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
	</head>
	<body class="!bg-white !min-h-screen">
	    <main class="flex gap-x-2">
	        <section class="p-4">
	        	<div class="my-6">
	        		<a href="${pageContext.request.contextPath}/home" class="font-bold text-4xl italic tracking-wide">MONOCHROME</a>
	        	</div>
	        	<a href="${pageContext.request.contextPath}/admin" class="block p-2 ${category ? 'bg-black text-white' : 'bg-white text-black'}">
				    Category management
				</a>
	        	<a href="${pageContext.request.contextPath}/admin/product" class="block p-2 ${product ? 'bg-black text-white' : 'bg-white text-black'}">Product management</a>
	        	<a href="${pageContext.request.contextPath}/admin/order" class="block p-2 ${order ? 'bg-black text-white' : 'bg-white text-black'}">Order management</a>
	        	<a href="${pageContext.request.contextPath}/admin/payment" class="block p-2 ${payment ? 'bg-black text-white' : 'bg-white text-black'}">Payment management</a>
	        	<a href="${pageContext.request.contextPath}/admin/shopcard" class="block p-2 ${shopcard ? 'bg-black text-white' : 'bg-white text-black'}">Shopcard management</a>
	        	<a href="${pageContext.request.contextPath}/admin/user" class="block p-2 ${user ? 'bg-black text-white' : 'bg-white text-black'}">User management</a>
	        </section>
	        <section class="w-full">
	        	<jsp:doBody />
	        </section>
	    </main>
	</body>
</html>