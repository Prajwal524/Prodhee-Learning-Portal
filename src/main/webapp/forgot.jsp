<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - ProDhee</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

</head>

<body class="bg-gray-50">

	```
	<%@ include file="header.jsp"%>

	<div class="container mx-auto px-4 py-12">

		<div class="max-w-2xl mx-auto">

			<div class="bg-white rounded-lg shadow-lg p-8">

				<div class="text-center mb-8">

					<div
						class="w-20 h-20 bg-orange-500 rounded-full mx-auto flex items-center justify-center mb-4">
						<i class="fas fa-key text-white text-3xl"></i>
					</div>

					<h1 class="text-3xl font-bold text-gray-800">Forgot Password</h1>

					<p class="text-gray-500 mt-2">Verify your account and create a
						new password</p>

				</div>

				<% if(request.getAttribute("success") != null) { %>
				<div
					class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-6">
					<%= request.getAttribute("success") %>
				</div>
				<% } %>

				<% if(request.getAttribute("error") != null) { %>
				<div
					class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
					<%= request.getAttribute("error") %>
				</div>
				<% } %>

				<form action="forgotPassword" method="POST" class="space-y-6">

					<div>

						<label class="block text-sm font-medium text-gray-700 mb-2">
							Phone Number </label> <input type="tel" name="phone" required
							placeholder="Enter your registered phone number"
							class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">

					</div>

					<div>

						<label class="block text-sm font-medium text-gray-700 mb-2">
							Email Address </label> <input type="email" name="mail" required
							placeholder="Enter your registered email"
							class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">

					</div>

					<div>

						<label class="block text-sm font-medium text-gray-700 mb-2">
							New Password </label> <input type="password" name="newPassword" required
							placeholder="Enter new password"
							class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">

					</div>

					<div>

						<label class="block text-sm font-medium text-gray-700 mb-2">
							Confirm Password </label> <input type="password" name="confirmPassword"
							required placeholder="Confirm new password"
							class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-orange-500">

					</div>

					<div class="flex gap-4">

						<button type="submit"
							class="flex-1 bg-orange-500 hover:bg-orange-600 text-white font-bold py-3 px-6 rounded-lg transition">

							Reset Password</button>

						<a href="login.jsp"
							class="flex-1 bg-gray-500 hover:bg-gray-600 text-white font-bold py-3 px-6 rounded-lg text-center transition">

							Back to Login </a>

					</div>

				</form>

			</div>

		</div>

	</div>

	<%@ include file="footer.jsp"%>
	```

</body>
</html>
