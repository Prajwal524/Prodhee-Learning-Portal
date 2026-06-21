<%@page import="in.ps.studentapp.dto.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<script src="https://cdn.tailwindcss.com"></script>

<%
Student headerStudent = (Student) session.getAttribute("student");
%>

<header class="sticky top-0 z-50 bg-white shadow-sm border-b border-gray-200">
    <div class="container mx-auto px-4 py-4">
        <div class="flex flex-col md:flex-row justify-between items-center">

            <div class="flex items-center space-x-3 mb-4 md:mb-0">
                <div class="bg-black text-white p-2 rounded-lg">
                    <i class="fas fa-graduation-cap text-2xl"></i>
                </div>
                <div>
                    <h1 class="text-2xl font-bold text-black">ProDhee</h1>
                    <p class="text-sm text-gray-600">Student Courses Portal</p>
                </div>
            </div>

            <div class="w-full md:w-1/3 mb-4 md:mb-0">
                <div class="relative">
                    <form action="searchCourses" method="POST" class="relative">
                        <input
                            type="text"
                            name="searchQuery"
                            placeholder="Search courses..."
                            class="w-full p-3 pl-10 pr-12 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">

                        <i class="fas fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>

                        <button
                            type="submit"
                            class="absolute right-0 top-0 h-full px-4 bg-orange-500 text-white rounded-r-lg hover:bg-orange-600">
                            Search
                        </button>
                    </form>
                </div>
            </div>

            <div class="flex items-center space-x-2 px-4 py-2 rounded-full border border-gray-200 relative group">

                <div class="bg-orange-500 text-white p-2 rounded-full cursor-pointer">
                    <i class="fas fa-user"></i>
                </div>

                <% if(headerStudent != null){ %>

                <div class="cursor-pointer">
                    <p class="font-medium text-black"><%= headerStudent.getName() %></p>
                    <p class="text-xs text-gray-600">Student</p>
                </div>

                <div class="absolute top-full right-0 mt-2 w-52 bg-white rounded-lg shadow-xl border border-gray-200 overflow-hidden opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">

                    <div class="px-4 py-3 border-b border-gray-100">
                        <p class="font-medium text-black"><%= headerStudent.getName() %></p>
                        <p class="text-xs text-gray-500"><%= headerStudent.getMail() %></p>
                    </div>

                    <a href="dashboard.jsp" class="flex items-center px-4 py-3 hover:bg-gray-50">
                        <i class="fas fa-tachometer-alt mr-3"></i>
                        Dashboard
                    </a>

                    <a href="courses?category=all" class="flex items-center px-4 py-3 hover:bg-gray-50">
                        <i class="fas fa-book mr-3"></i>
                        Courses
                    </a>

                    <a href="profile.jsp" class="flex items-center px-4 py-3 hover:bg-gray-50">
                        <i class="fas fa-user mr-3"></i>
                        Profile
                    </a>

                    <a href="settings.jsp" class="flex items-center px-4 py-3 hover:bg-gray-50">
                        <i class="fas fa-cog mr-3"></i>
                        Settings
                    </a>

                    <form action="logout" method="POST" class="border-t border-gray-100">
                        <button type="submit"
                            class="w-full text-left flex items-center px-4 py-3 text-red-600 hover:bg-red-50">
                            <i class="fas fa-sign-out-alt mr-3"></i>
                            Logout
                        </button>
                    </form>
                </div>

                <% } else { %>

                <div class="flex items-center space-x-4">
                    <a href="login.jsp" class="text-orange-500 font-medium">Login</a>
                    <span class="text-gray-300">|</span>
                    <a href="signup.jsp" class="font-medium">Sign Up</a>
                </div>

                <% } %>

            </div>
        </div>
    </div>
</header>