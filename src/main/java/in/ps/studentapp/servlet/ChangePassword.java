package in.ps.studentapp.servlet;

import java.io.IOException;

import in.ps.studentapp.dao.StudentDAO;
import in.ps.studentapp.dao.StudentDAOImpl;
import in.ps.studentapp.dto.Student;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/changePassword")
public class ChangePassword extends HttpServlet {


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    
	    System.out.println("CHANGE PASSWORD SERVLET HIT");

	    HttpSession session = req.getSession();

	    Student s = (Student) session.getAttribute("student");

	    if (s == null) {
	        resp.sendRedirect("login.jsp");
	        return;
	    }

	    String currentPassword = req.getParameter("currentPassword");
	    String newPassword = req.getParameter("newPassword");
	    String confirmPassword = req.getParameter("confirmPassword");

	    if (!s.getPassword().equals(currentPassword)) {
	        req.setAttribute("error", "Current password is incorrect!");
	        RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
	        rd.forward(req, resp);
	        return;
	    }    

	    if (!newPassword.equals(confirmPassword)) {
	        req.setAttribute("error", "Passwords do not match!");
	        RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
	        rd.forward(req, resp);
	        return;
	    }

	    StudentDAO sdao = new StudentDAOImpl();

	    System.out.println("=================================");
	    System.out.println("CHANGE PASSWORD SERVLET HIT");
	    System.out.println("Student ID : " + s.getId());
	    System.out.println("Current Password Entered : " + currentPassword);
	    System.out.println("Session Password : " + s.getPassword());
	    System.out.println("New Password : " + newPassword);
	    System.out.println("=================================");

	    boolean result = sdao.updatePassword(s.getId(), newPassword);

	    if (result) {
	        Student updated = sdao.getStudentById(s.getId());
	        session.setAttribute("student", updated);
	        req.setAttribute("success", "Password changed successfully!");
	        RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
	        rd.forward(req, resp);
	    } else {
	        req.setAttribute("error", "Failed to change password!");
	        RequestDispatcher rd = req.getRequestDispatcher("resetPassword.jsp");
	        rd.forward(req, resp);
	    }
	}

}
