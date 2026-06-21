<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student, in.ps.studentapp.dao.PaymentsDAO, in.ps.studentapp.dao.PaymentDAOImpl, in.ps.studentapp.dto.Payment, java.util.ArrayList" %>
<%
Student s = (Student) session.getAttribute("student");
if(s == null || s.getId() != 1) {
    response.sendRedirect("login.jsp");
    return;
}
PaymentsDAO pdao = new PaymentDAOImpl();
ArrayList<Payment> payments = pdao.getPayment();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments - Admin</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50">
    <%@ include file="header.jsp" %>
    <div class="container mx-auto px-4 py-8">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Payment Management</h1>
            <a href="admin.jsp" class="bg-gray-500 hover:bg-gray-600 text-white font-bold py-2 px-6 rounded">Back</a>
        </div>
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <table class="w-full">
                <thead class="bg-orange-500 text-white">
                    <tr>
                        <th class="px-6 py-4 text-left">ID</th>
                        <th class="px-6 py-4 text-left">Student</th>
                        <th class="px-6 py-4 text-left">Course</th>
                        <th class="px-6 py-4 text-left">Amount</th>
                        <th class="px-6 py-4 text-left">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Payment payment : payments) { %>
                        <tr class="border-b hover:bg-gray-50">
                            <td class="px-6 py-4"><%= payment.getPaymentId() %></td>
                            <td class="px-6 py-4"><%= payment.getStudentId() %></td>
                            <td class="px-6 py-4"><%= payment.getCourseId() %></td>
                            <td class="px-6 py-4">₹<%= payment.getAmount() %></td>
                            <td class="px-6 py-4"><span class="px-2 py-1 rounded text-sm <%= payment.getStatus().equals("SUCCESS") ? "bg-green-100 text-green-700" : "bg-yellow-100" %>"><%= payment.getStatus() %></span></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
