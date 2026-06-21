<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="in.ps.studentapp.dto.Student"%>
<%@ page import="in.ps.studentapp.dao.PaymentsDAO"%>
<%@ page import="in.ps.studentapp.dao.PaymentDAOImpl"%>
<%@ page import="in.ps.studentapp.dto.Payment"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="in.ps.studentapp.dao.CoursesDAO"%>
<%@ page import="in.ps.studentapp.dao.CoursesDAOImpl"%>
<%@ page import="in.ps.studentapp.dto.Courses"%>

<%
Student s = (Student) session.getAttribute("student");

if (s == null) {
	response.sendRedirect("login.jsp");
	return;
}

PaymentsDAO pdao = new PaymentDAOImpl();
ArrayList<Payment> enrolledCourses = pdao.getPaymentByStudentId(s.getId());

CoursesDAO cdao = new CoursesDAOImpl();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Courses - ProDhee</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-50">

	<%@ include file="header.jsp"%>

	<div class="container mx-auto px-4 py-8">

		<!-- DEBUG -->
		<div class="bg-yellow-100 p-4 mb-6 rounded">
			Logged Student ID:
			<%=s.getId()%>
			<br> Payments Found:
			<%=enrolledCourses.size()%>
		</div>

		<h1 class="text-3xl font-bold text-gray-800 mb-8">
			My Enrolled Courses
		</h1>

		<%
		if (enrolledCourses.isEmpty()) {
		%>

		<div class="bg-white rounded-lg shadow-lg p-12 text-center">
			<h2 class="text-2xl font-bold text-gray-800 mb-2">
				No Courses Yet
			</h2>

			<a href="courses?category=all"
				class="inline-block bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded-lg mt-6">
				Browse Courses
			</a>
		</div>

		<%
		} else {
		%>

		<div class="grid grid-cols-1 md:grid-cols-3 gap-6">

			<%
			for (Payment payment : enrolledCourses) {

				Courses course = cdao.getCourses(payment.getCourseId());

				if (course == null) {
			%>

			<div class="bg-red-100 border border-red-400 p-4 rounded">
				Course Not Found for Course ID:
				<%=payment.getCourseId()%>
			</div>

			<%
				continue;
				}
			%>

			<div class="bg-white rounded-lg shadow-lg overflow-hidden">

				<div class="bg-orange-500 h-32"></div>

				<div class="p-6">

					<h3 class="text-lg font-bold mb-2">
						<%=course.getCourseName()%>
					</h3>

					<p class="text-gray-600 mb-2">
						<strong>Category:</strong>
						<%=course.getCategory()%>
					</p>

					<p class="text-gray-600 mb-2">
						<strong>Duration:</strong>
						<%=course.getMonths()%>
						Months
					</p>

					<p class="text-gray-600 mb-2">
						<strong>Amount Paid:</strong>
						₹<%=payment.getAmount()%>
					</p>

					<p class="text-gray-600 mb-4">
						<strong>Status:</strong>

						<span
							class="px-2 py-1 rounded text-sm bg-green-100 text-green-700">
							<%=payment.getStatus()%>
						</span>
					</p>

					<button
						class="w-full bg-green-500 text-white font-bold py-2 px-4 rounded cursor-default">
						Enrolled
					</button>

				</div>

			</div>

			<%
			}
			%>

		</div>

		<%
		}
		%>

	</div>

	<%@ include file="footer.jsp"%>

</body>
</html>