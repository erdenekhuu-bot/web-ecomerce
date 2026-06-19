<%@ tag body-content="scriptless" %>
<%@ attribute name="title" required="true" %>

<!DOCTYPE html>
<html>
	<head>
	    <title>${title}</title>
	     <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
	</head>
	<body>
	    
	    <main>
	        <jsp:doBody />
	    </main>
	</body>
</html>