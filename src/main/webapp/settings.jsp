<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student" %>
<%
Student s = (Student) session.getAttribute("student");
if(s == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings - ProDhee</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    <div class="container mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-8">Settings</h1>
        <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
            <div class="md:col-span-1">
                <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                    <nav class="flex flex-col">
                        <a href="#account" class="px-6 py-4 border-l-4 border-orange-500 bg-orange-50 text-orange-600 font-bold">Account</a>
                        <a href="#notifications" class="px-6 py-4 text-gray-700 hover:bg-gray-50">Notifications</a>
                        <a href="#privacy" class="px-6 py-4 text-gray-700 hover:bg-gray-50">Privacy</a>
                    </nav>
                </div>
            </div>
            <div class="md:col-span-3">
                <div id="account" class="bg-white rounded-lg shadow-lg p-8">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Account Settings</h2>
                    <p class="text-gray-600 mb-2"><strong>Email:</strong> <%= s.getMail() %></p>
                    <p class="text-gray-600 mb-2"><strong>Phone:</strong> <%= s.getPhone() %></p>
                    <p class="text-gray-600 mb-6"><strong>Member Since:</strong> <%= s.getDate() %></p>
                    <div class="flex gap-4">
                        <a href="updateAccount.jsp" class="bg-orange-500 hover:bg-orange-600 text-white font-bold py-2 px-6 rounded">Edit Account</a>
                        <a href="resetPassword.jsp" class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-6 rounded">Change Password</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
