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
	    <header class="flex w-full fixed z-20 bg-white justify-between align-center p-4">
		    <a  href="${pageContext.request.contextPath}/home" class="font-normal text-3xl lg:text-5xl italic tracking-wide">MONOCHROME</a>
		    <nav class="space-x-12 py-3 hidden lg:block">
		    	<a href="${pageContext.request.contextPath}/new-arrival" class="uppercase text-2xl ${newarrival ? 'underline' : ''} font-medium">New arrivals</a>
		    	<a href="${pageContext.request.contextPath}/collection" class="uppercase text-2xl ${collection ? 'underline' : ''} font-medium">Collections</a>
		    	<a href="${pageContext.request.contextPath}/designer" class="uppercase text-2xl ${designer ? 'underline' : ''} font-medium">Designers</a>
		    	<a href="${pageContext.request.contextPath}/journal" class="uppercase text-2xl ${journal ? 'underline' : ''} font-medium">Journal</a>
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