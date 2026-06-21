<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student, in.ps.studentapp.dto.Courses, in.ps.studentapp.dao.CoursesDAO, in.ps.studentapp.dao.CoursesDAOImpl" %>
<%
Student s = (Student) session.getAttribute("student");
if(s == null || s.getId() != 1) {
    response.sendRedirect("login.jsp");
    return;
}
int courseId = Integer.parseInt(request.getParameter("id") != null ? request.getParameter("id") : "0");
CoursesDAO cdao = new CoursesDAOImpl();
Courses course = cdao.getCourses(courseId);
if(course == null) {
    response.sendRedirect("admin.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Course - Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    <div class="container mx-auto px-4 py-8">
        <div class="max-w-2xl mx-auto">
            <h1 class="text-3xl font-bold text-gray-800 mb-8">Update Course</h1>
            <div class="bg-white rounded-lg shadow-lg p-8">
                <form action="updateCourse" method="POST" class="space-y-6">
                    <input type="hidden" name="courseId" value="<%= course.getCourseId() %>">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Course Name</label>
                        <input type="text" name="courseName" value="<%= course.getCourseName() %>" required class="w-full px-4 py-3 rounded-lg border border-gray-300">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Category</label>
                        <input type="text" name="category" value="<%= course.getCategory() %>" required class="w-full px-4 py-3 rounded-lg border border-gray-300">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                        <textarea name="courseInfo" rows="4" required class="w-full px-4 py-3 rounded-lg border border-gray-300"><%= course.getCourseInfo() %></textarea>
                    </div>
                    <div class="grid grid-cols-2 gap-6">
                        <input type="hidden" name="months" value="<%= course.getMonths() %>">
                        <input type="hidden" name="fees" value="<%= course.getFees() %>">
                    </div>
                    <div class="flex gap-4">
                        <button type="submit" class="flex-1 bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded">Update</button>
                        <a href="admin.jsp" class="flex-1 bg-gray-400 hover:bg-gray-500 text-white font-bold py-3 px-6 rounded text-center">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
