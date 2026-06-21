<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student"%>

<%
Student s = (Student) session.getAttribute("student");

if(s == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - ProDhee</title>

<script src="https://cdn.tailwindcss.com"></script>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
.success{
    text-align:center;
    color:green;
}
.error{
    text-align:center;
    color:red;
}
</style>

</head>

<body class="bg-gray-50">

    <%@ include file="header.jsp" %>

    <div class="container mx-auto px-4 py-8">

        <div class="bg-white rounded-lg shadow-lg p-8">

            <div class="text-center mb-8">
                <h1 class="text-4xl font-bold text-gray-800">
                    Welcome, <%= s.getName() %>
                </h1>
                <p class="text-gray-500 mt-2">
                    Student Dashboard
                </p>
            </div>

            <div class="grid md:grid-cols-3 gap-6">

                <a href="profile.jsp"
                    class="bg-white border rounded-lg p-6 shadow hover:shadow-lg transition">
                    <i class="fas fa-user text-3xl text-orange-500 mb-4"></i>
                    <h3 class="font-bold text-lg">Profile</h3>
                    <p class="text-gray-600">View your profile details</p>
                </a>

                <a href="my-courses.jsp"
                    class="bg-white border rounded-lg p-6 shadow hover:shadow-lg transition">
                    <i class="fas fa-book text-3xl text-orange-500 mb-4"></i>
                    <h3 class="font-bold text-lg">Courses</h3>
                    <p class="text-gray-600">Browse your courses</p>
                </a>

                <a href="settings.jsp"
                    class="bg-white border rounded-lg p-6 shadow hover:shadow-lg transition">
                    <i class="fas fa-cog text-3xl text-orange-500 mb-4"></i>
                    <h3 class="font-bold text-lg">Settings</h3>
                    <p class="text-gray-600">Manage account settings</p>
                </a>

            </div>

            <div class="mt-10">
                <h2 class="text-2xl font-bold mb-4">Student Information</h2>

                <div class="overflow-x-auto">
                    <table class="min-w-full border border-gray-200">
                        <thead class="bg-gray-100">
                            <tr>
                                <th class="p-3 border">ID</th>
                                <th class="p-3 border">Name</th>
                                <th class="p-3 border">Email</th>
                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td class="p-3 border"><%= s.getId() %></td>
                                <td class="p-3 border"><%= s.getName() %></td>
                                <td class="p-3 border"><%= s.getMail() %></td>
                            </tr>
                        </tbody>

                    </table>
                </div>

            </div>

        </div>

    </div>

    <%@ include file="footer.jsp" %>

</body>
</html>