<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student" %>
<%
Student s = (Student) session.getAttribute("student");
if(s == null || s.getId() != 1) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course - Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto">
            <div class="flex justify-between items-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800">Add New Course</h1>
                <a href="admin.jsp" class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-6 rounded">Back</a>
            </div>
            <% if(request.getAttribute("success") != null) { %>
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6"><%= request.getAttribute("success") %></div>
            <% } %>
            <% if(request.getAttribute("error") != null) { %>
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6"><%= request.getAttribute("error") %></div>
            <% } %>
            <div class="bg-white rounded-lg shadow-lg p-8">
                <form action="addCourse" method="POST" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Course Name</label>
                        <input type="text" name="courseName" required class="w-full px-4 py-3 rounded-lg border border-gray-300">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                        <select name="category" required class="w-full px-4 py-3 rounded-lg border border-gray-300">
                            <option value="">Select Category</option>
                            <option value="Java">Java</option>
                            <option value="Python">Python</option>
                            <option value="Angular/React">Angular/React</option>
                            <option value="Cloud">Cloud Computing</option>
                        </select>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                        <textarea name="courseInfo" rows="4" required class="w-full px-4 py-3 rounded-lg border border-gray-300"></textarea>
                    </div>
                    <div class="grid grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Duration (Months)</label>
                            <input type="number" name="months" required min="1" class="w-full px-4 py-3 rounded-lg border border-gray-300">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Fee (₹)</label>
                            <input type="number" name="fees" required min="0" step="0.01" class="w-full px-4 py-3 rounded-lg border border-gray-300">
                        </div>
                    </div>
                    <div class="flex gap-4">
                        <button type="submit" class="flex-1 bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded">Add Course</button>
                        <a href="admin.jsp" class="flex-1 bg-gray-400 hover:bg-gray-500 text-white font-bold py-3 px-6 rounded text-center">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
