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
    <title>My Profile - ProDhee</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-orange-500 to-orange-600 px-6 py-12">
                    <div class="text-white text-center">
                        <div class="w-24 h-24 bg-white rounded-full mx-auto mb-4 flex items-center justify-center">
                            <i class="fas fa-user text-orange-500 text-4xl"></i>
                        </div>
                        <h1 class="text-3xl font-bold"><%= s.getName() %></h1>
                        <p class="text-orange-100"><%= s.getMail() %></p>
                    </div>
                </div>
                
                <div class="p-6">
                    <h2 class="text-2xl font-bold text-gray-800 mb-6">Personal Information</h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Full Name</label>
                            <div class="bg-gray-50 px-4 py-3 rounded-lg"><%= s.getName() %></div>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email Address</label>
                            <div class="bg-gray-50 px-4 py-3 rounded-lg"><%= s.getMail() %></div>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Phone Number</label>
                            <div class="bg-gray-50 px-4 py-3 rounded-lg"><%= s.getPhone() %></div>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Member Since</label>
                            <div class="bg-gray-50 px-4 py-3 rounded-lg"><%= s.getDate() %></div>
                        </div>
                    </div>
                    <div class="mt-8 flex gap-4">
                        <a href="updateAccount.jsp" class="flex-1 bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded-lg text-center">Edit Profile</a>
                        <a href="resetPassword.jsp" class="flex-1 bg-gray-500 hover:bg-gray-600 text-white font-bold py-3 px-6 rounded-lg text-center">Change Password</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>
</body>
</html>
