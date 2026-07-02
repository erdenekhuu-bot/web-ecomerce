<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="ui" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ui:admin-layout title="Category page">
    <section class="p-6">
	        <div class="flex items-center justify-between pb-4">
	            <h1 class="text-2xl font-bold text-gray-900 tracking-tight">Category Management</h1>
	        </div>
	        <div class="flex items-center justify-between gap-4 bg-white p-4 rounded-xl border border-gray-200 shadow-sm mb-6">
			    <div class="relative flex-1 max-w-md">
			        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
			            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
			                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
			            </svg>
			        </div>
			        <input type="text" placeholder="Search categories..." class="block w-full pl-10 pr-4 py-2.5 bg-gray-50 border border-gray-300 rounded-lg text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-slate-900 focus:border-slate-900 focus:bg-white transition-all"/>
			    </div>
			    <button type="button" onclick="toggleModal(true)" class="hover:cursor-pointer inline-flex items-center gap-2 px-4 py-2.5 bg-slate-900 hover:bg-slate-800 text-white text-sm font-medium rounded-lg shadow-sm hover:shadow transition-all focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-900">
				    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
				        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
				    </svg>
				    Create category
				</button>
			</div>
	        <div class="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
		    <div class="overflow-x-auto">
		        <table class="w-full text-left border-collapse">
			            <thead>
			                <tr class="bg-gray-50 border-b border-gray-200">
			                    <th class="px-6 py-3 text-xs font-semibold uppercase tracking-wider text-gray-500 w-24">ID</th>
			                    <th class="px-6 py-3 text-xs font-semibold uppercase tracking-wider text-gray-500">Name</th>
			                    <th class="px-6 py-3 text-xs font-semibold uppercase tracking-wider text-gray-500">Description</th>
			                    <th class="px-6 py-3 text-xs font-semibold uppercase tracking-wider text-gray-500 text-right w-24">Actions</th>
			                </tr>
			            </thead>
		            	<tbody class="divide-y divide-gray-100">
			                <c:forEach var="category" items="${categories}">
			                    <tr class="hover:bg-gray-50/70 transition-colors">
			                        <td class="px-6 py-4 text-sm font-mono text-gray-500">${category.id}</td>
			                        <td class="px-6 py-4 text-sm font-semibold text-gray-900">${category.name}</td>
			                        <td class="px-6 py-4 text-sm text-gray-600">${category.description}</td>
			                        <td class="px-6 py-4 text-sm text-right whitespace-nowrap">
			                            <div class="flex flex-x-4">
			                            	<button type="button" onclick="handleDeleteCategory('${category.id}')"
				                                class="inline-flex items-center justify-center p-2 rounded-lg text-gray-400 hover:text-red-600 hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-red-500 transition-all group hover:cursor-pointer">
			                                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
			                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-4v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
			                                </svg>
			                            </button>
			                            </div>
			                        </td>
			                    </tr>
			                </c:forEach>
		            	</tbody>
		        	</table>
			    </div>
			</div>
	
	        <div class="bg-gray-50 px-6 py-4 border-t border-gray-200 flex items-center justify-between">
	            <span class="text-sm text-gray-500">Showing pages 1 to ${totalPages}</span>
	               <div class="flex items-center gap-1.5">
	                 <c:forEach var="pageNumber" begin="1" end="${totalPages}">
	                        <a href="${pageContext.request.contextPath}/admin?page=${pageNumber}" class="inline-flex items-center justify-center min-w-[32px] h-8 px-2 text-sm font-medium rounded-md transition-all border shadow-sm ${pageNumber == currentPage ? 'bg-slate-900 border-slate-900 text-white hover:bg-slate-800' : 'bg-white border-gray-200 text-gray-700 hover:bg-gray-50'}">
	                           ${pageNumber}
	                        </a>
	                 </c:forEach>
	               </div>
	            </div>
	        </div>
	    </div>
	    
	    <div id="createCategoryModal" class="fixed inset-0 z-50 hidden bg-gray-900/50 backdrop-blur-sm flex items-center justify-center p-4 transition-all">
	    <div class="bg-white rounded-xl shadow-xl border border-gray-100 max-w-md w-full overflow-hidden transform transition-all">
	        <div class="px-6 py-4 border-b border-gray-100 flex items-center justify-between bg-gray-50">
	            <div>
	                <h3 class="text-lg font-bold text-gray-900">Create New Category</h3>
	                <p class="text-xs text-gray-500 mt-0.5">Add a new category to group your products.</p>
	            </div>
	            <button type="button" onclick="toggleModal(false)" class="text-gray-400 hover:text-gray-600 p-1 rounded-lg hover:bg-gray-100 transition-colors">
	                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
	                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
	                </svg>
	            </button>
	        </div>
	        <form action="${pageContext.request.contextPath}/admin" method="POST" class="p-6 space-y-4">
	            <div>
	                <label for="categoryName" class="block text-sm font-semibold text-gray-700 mb-1.5">Category Name *</label>
	                <input type="text" id="categoryName" name="name" required placeholder="" 
	                    class="block w-full px-3 py-2 border border-gray-300 rounded-lg text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-slate-900 focus:border-slate-900 transition-all"
	                />
	            </div>
	            <div>
	                <label for="categoryDescription" class="block text-sm font-semibold text-gray-700 mb-1.5">Description</label>
	                <textarea id="categoryDescription" required name="description" rows="4" placeholder="" 
	                    class="block w-full px-3 py-2 border border-gray-300 rounded-lg text-sm text-gray-900 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-slate-900 focus:border-slate-900 transition-all resize-none"
	                ></textarea>
	            </div>
	            <div class="flex items-center justify-end gap-3 pt-4 border-t border-gray-100">
	                <button type="button" onclick="toggleModal(false)" class="hover:cursor-pointer px-4 py-2 border border-gray-300 rounded-lg text-sm font-medium text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 transition-colors">
	                    Cancel
	                </button>
	                <button type="submit" class="hover:cursor-pointer px-4 py-2 bg-slate-900 hover:bg-slate-800 text-white text-sm font-medium rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-slate-900 transition-colors">
	                    Save Category
	                </button>
	            </div>
	        </form>
	    </div>
	</section>

	<script>
		const contextPath = "${pageContext.request.contextPath}";
	    function toggleModal(show) {
	        const modal = document.getElementById('createCategoryModal');
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
	        const modal = document.getElementById('createCategoryModal');
	        if (event.target === modal) {
	            toggleModal(false);
	        }
	    }
	</script>
</ui:admin-layout>