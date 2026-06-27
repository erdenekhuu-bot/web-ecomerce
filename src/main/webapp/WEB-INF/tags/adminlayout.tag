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
	    <main class="flex">
	    	<section class="w-[10%]">
	    		<p>1</p>
	    		<p>2</p>
	    		<p>3</p>
	    		<p>4</p>
	    	</section>
	        <jsp:doBody />
	    </main>
	</body>
</html>