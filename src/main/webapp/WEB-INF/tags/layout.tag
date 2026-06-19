<%@ tag body-content="scriptless" %>
<%@ attribute name="title" required="true" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>${title}</title>
	     <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
	</head>
	<body class="!bg-white !min-h-screen">
	    <header class="flex justify-between align-center">
		    <a  href="${pageContext.request.contextPath}/home" class="font-bold">MONOCHROME</a>
		    <nav class="space-x-12">
		    	<a href="${pageContext.request.contextPath}/new-arrival">New arrivals</a>
		    	<a href="${pageContext.request.contextPath}/collection">Collections</a>
		    	<a href="${pageContext.request.contextPath}/designer">Designers</a>
		    	<a href="${pageContext.request.contextPath}/journal">Journal</a>
		    	<a href="${pageContext.request.contextPath}/about">About</a>
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