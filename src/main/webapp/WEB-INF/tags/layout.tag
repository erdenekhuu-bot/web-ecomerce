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
		    <a href="#" class="font-bold">MONOCHROME</a>
		    <nav class="space-x-12">
		    	<a href="#">New arrivals</a>
		    	<a href="#">Collections</a>
		    	<a href="#">Designers</a>
		    	<a href="#">Journal</a>
		    	<a href="#">About</a>
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