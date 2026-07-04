<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ui:admin-layout title="Product page">

    <section class="p-6">
    <div class="flex items-center justify-between pb-4">
	            <h1 class="text-2xl font-bold text-gray-900 tracking-tight">Product Management</h1>
	        </div>
	        <div class="flex items-center justify-between gap-4 bg-white p-4 rounded-xl border border-gray-200 shadow-sm mb-6">
			    <div class="relative flex-1 max-w-md">
			        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
			            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
			                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
			            </svg>
			        </div>
			        <input type="text" placeholder="Search products..." class="block w-full pl-10 pr-4 py-2.5 bg-gray-50 border border-gray-300 rounded-lg text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-slate-900 focus:border-slate-900 focus:bg-white transition-all"/>
			    </div>
			    <button type="button" onclick="toggleModal(true)" class="hover:cursor-pointer inline-flex items-center gap-2 px-4 py-2.5 bg-slate-900 hover:bg-slate-800 text-white text-sm font-medium rounded-lg shadow-sm hover:shadow transition-all focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-900">
				    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
				        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
				    </svg>
				    Create product
				</button>
			</div>
			
		<!--Modal form (product)-->	
		<div id="ProductModalTransparent" class="fixed inset-0 z-50 hidden bg-gray-900/50 backdrop-blur-sm flex items-center justify-center p-4 transition-all">
	    <div class="bg-white p-4 rounded-xl shadow-xl border border-gray-100 max-w-md w-full overflow-hidden transform transition-all">
	        <form action="${pageContext.request.contextPath}/product" method="POST">
	        	<div>
                <label for="name" class="block text-sm font-semibold text-gray-700 mb-1">Product Name:</label>
                <input type="text" id="name" name="name" maxlength="150" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
            </div>

            <div>
                <label for="description" class="block text-sm font-semibold text-gray-700 mb-1">Description:</label>
                <textarea id="description" name="description" maxlength="200" rows="3"
                          class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150"></textarea>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label for="size" class="block text-sm font-semibold text-gray-700 mb-1">Size:</label>
                    <input type="text" id="size" name="size" maxlength="5" placeholder="e.g., XL, M, 42" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
                </div>
                <div>
                    <label for="color" class="block text-sm font-semibold text-gray-700 mb-1">Color:</label>
                    <input type="text" id="color" name="color" maxlength="20" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
                </div>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label for="price" class="block text-sm font-semibold text-gray-700 mb-1">Price ($):</label>
                    <input type="number" id="price" name="price" min="0" value="0"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
                </div>
                <div>
                    <label for="category_id" class="block text-sm font-semibold text-gray-700 mb-1">Category ID:</label>
                    <input type="number" id="category_id" name="category_id" required
                           class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
                </div>
            </div>

            <div>
                <label for="attribute" class="block text-sm font-semibold text-gray-700 mb-1">Attribute / Brand:</label>
                <input type="text" id="attribute" name="attribute" maxlength="100" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
            </div>

            <div>
                <label for="image" class="block text-sm font-semibold text-gray-700 mb-1">Image URL:</label>
                <input type="text" id="image" name="image" placeholder="http://example.com/image.jpg"
                       class="w-full px-4 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition duration-150">
            </div>


            <div class="pt-4 border-t border-gray-200 flex justify-end">
                <button type="submit" 
                        class="px-6 py-2.5 bg-emerald-600 hover:bg-emerald-700 text-white font-medium text-sm rounded-md shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500 transition duration-150 ease-in-out cursor-pointer">
                    Save Product
                </button>
            </div>
	        </form>
	    </div>
    </section>
    
    
    <script>
		const contextPath = "${pageContext.request.contextPath}";
	    function toggleModal(show) {
	        const modal = document.getElementById('ProductModalTransparent');
	        if (show) {
	            modal.classList.remove('hidden');
	            document.body.style.overflow = 'hidden'; 
	        } else {
	            modal.classList.add('hidden');
	            document.body.style.overflow = '';
	        }
	    }
	    
	    async function handleDeleteCategory(id) {
	        if (confirm(`Are you sure you want to delete category ID: ${id}?`)) {
	            await fetch(contextPath + "/admin?id=" + encodeURIComponent(id),{method: "DELETE"}).then(()=>window.location.reload())
	        }
	    }

	    window.onclick = function(event) {
	        const modal = document.getElementById('ProductModalTransparent');
	        if (event.target === modal) {
	            toggleModal(false);
	        }
	    }
	</script>
    
    
    
</ui:admin-layout>