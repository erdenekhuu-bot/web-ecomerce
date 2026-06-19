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
	    <header class="flex justify-between align-center p-4">
		    <a  href="${pageContext.request.contextPath}/home" class="font-normal text-6xl italic tracking-wide">MONOCHROME</a>
		    <nav class="space-x-12 py-3">
		    	<a href="${pageContext.request.contextPath}/new-arrival" class="uppercase text-2xl font-medium">New arrivals</a>
		    	<a href="${pageContext.request.contextPath}/collection" class="uppercase text-2xl font-medium">Collections</a>
		    	<a href="${pageContext.request.contextPath}/designer" class="uppercase text-2xl font-medium">Designers</a>
		    	<a href="${pageContext.request.contextPath}/journal" class="uppercase text-2xl font-medium">Journal</a>
		    	<a href="${pageContext.request.contextPath}/about" class="uppercase text-2xl font-medium">About</a>
		    </nav>
		    <section class="flex gap-4">
		    	<input placeholder="Searchs"/>
		    </section>
	    </header>
	    <main>
	        <jsp:doBody />
	    </main>
	</body>
</html>