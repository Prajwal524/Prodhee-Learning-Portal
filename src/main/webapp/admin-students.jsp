<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student" %>
<%@ page import="in.ps.studentapp.dao.StudentDAO" %>
<%@ page import="in.ps.studentapp.dao.StudentDAOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%
Student s = (Student) session.getAttribute("student");
if(s == null || s.getId() != 1) {
    response.sendRedirect("login.jsp");
    return;
}
StudentDAO sdao = new StudentDAOImpl();
ArrayList<Student> students = sdao.getStudent();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students - Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Manage Students</h1>
            <a href="admin.jsp" class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-6 rounded">Back</a>
        </div>
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <table class="w-full">
                <thead class="bg-orange-500 text-white">
                    <tr>
                        <th class="px-6 py-4 text-left">ID</th>
                        <th class="px-6 py-4 text-left">Name</th>
                        <th class="px-6 py-4 text-left">Email</th>
                        <th class="px-6 py-4 text-left">Phone</th>
                        <th class="px-6 py-4 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Student student : students) { %>
                        <tr class="border-b hover:bg-gray-50">
                            <td class="px-6 py-4"><%= student.getId() %></td>
                            <td class="px-6 py-4"><%= student.getName() %></td>
                            <td class="px-6 py-4"><%= student.getMail() %></td>
                            <td class="px-6 py-4"><%= student.getPhone() %></td>
                            <td class="px-6 py-4 text-center">
                                <form action="deleteStudent" method="POST" style="display:inline;" onsubmit="return confirm('Delete this student?');">
                                    <input type="hidden" name="studentId" value="<%= student.getId() %>">
                                    <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
