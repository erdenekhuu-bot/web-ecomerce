<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-indigo-600 to-cyan-500 min-h-screen flex items-center justify-center p-4">

    <div class="bg-white p-8 md:p-10 rounded-2xl shadow-xl w-full max-w-md transition-all duration-300">
        
        <%-- ========================================== --%>
        <%--              LOGIN FORM CARD               --%>
        <%-- ========================================== --%>
        <div id="login-card">
            <div class="text-center mb-8">
                <h2 class="text-gray-900 text-3xl font-bold tracking-tight mb-2">Welcome Back</h2>
                <p class="text-gray-500 text-sm">Please enter your details to sign in</p>
            </div>
            <form action="${pageContext.request.contextPath}/login" method="POST" class="space-y-5">
                <div>
                    <label for="login-username" class="block text-sm font-medium text-gray-700 mb-1.5">Username</label>
                    <input type="text" id="login-username" name="username" placeholder="Enter your username" required autocomplete="username"
                        class="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-gray-950 placeholder-gray-400 focus:outline-none focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 transition duration-200">
                </div>

                <div>
                    <label for="login-password" class="block text-sm font-medium text-gray-700 mb-1.5">Password</label>
                    <input type="password" id="login-password" name="password" placeholder="••••••••" required autocomplete="current-password"
                        class="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-gray-950 placeholder-gray-400 focus:outline-none focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 transition duration-200">
                </div>

                <button type="submit" class="w-full py-2.5 px-4 bg-indigo-600 hover:bg-indigo-700 active:bg-indigo-800 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition duration-200 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2">
                    Sign In
                </button>
            </form>

            <div class="text-center mt-6 text-sm text-gray-600">
                Don't have an account? 
                <button onclick="toggleAuth()" class="font-medium text-indigo-600 hover:text-indigo-500 hover:underline focus:outline-none">Sign up</button>
            </div>
        </div>

        <%-- ========================================== --%>
        <%--             SIGN UP FORM CARD              --%>
        <%-- ========================================== --%>
        <div id="signup-card" class="hidden">
            <div class="text-center mb-8">
                <h2 class="text-gray-900 text-3xl font-bold tracking-tight mb-2">Create Account</h2>
                <p class="text-gray-500 text-sm">Get started with your free account today</p>
            </div>
            <form  action="${pageContext.request.contextPath}/register"  method="POST" class="space-y-4">
                <div>
                    <label for="reg-name" class="block text-sm font-medium text-gray-700 mb-1.5">Full Name</label>
                    <input type="text" id="reg-name" name="name" placeholder="John Doe" required autocomplete="name"
                        class="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-gray-950 placeholder-gray-400 focus:outline-none focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 transition duration-200">
                </div>

                <div>
                    <label for="reg-password" class="block text-sm font-medium text-gray-700 mb-1.5">Password</label>
                    <input type="password" id="reg-password" name="password" placeholder="Minimum 8 characters" required autocomplete="new-password"
                        class="w-full px-4 py-2.5 border border-gray-300 rounded-lg text-gray-950 placeholder-gray-400 focus:outline-none focus:border-indigo-500 focus:ring-4 focus:ring-indigo-500/10 transition duration-200">
                </div>

                <button type="submit" class="w-full py-2.5 px-4 bg-indigo-600 hover:bg-indigo-700 active:bg-indigo-800 text-white font-semibold rounded-lg shadow-md hover:shadow-lg transition duration-200 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 mt-2">
                    Create Account
                </button>
            </form>

            <div class="text-center mt-6 text-sm text-gray-600">
                Already have an account? 
                <button onclick="toggleAuth()" class="font-medium text-indigo-600 hover:text-indigo-500 hover:underline focus:outline-none">Sign in</button>
            </div>
        </div>

    </div>

    <%-- Small utility script to toggle between forms smoothly without page reload --%>
    <script>

      
        function toggleAuth() {
            const loginCard = document.getElementById('login-card');
            const signupCard = document.getElementById('signup-card');
            
            loginCard.classList.toggle('hidden');
            signupCard.classList.toggle('hidden');
        }
        
        
    </script>
</body>
</html>