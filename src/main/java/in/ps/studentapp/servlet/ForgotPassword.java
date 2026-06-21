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

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentDAO sdao = new StudentDAOImpl();
        String phone_str = req.getParameter("phone");
        String mail = req.getParameter("mail");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        
        try {
            long phone = Long.parseLong(phone_str);
            Student s = sdao.getStudent(phone, mail);
            
            if(s != null) {
                if(newPassword.equals(confirmPassword)) {
                    s.setPassword(newPassword);
                    boolean result = sdao.updatePassword(s.getId(), newPassword);
                    if(result) {
                        req.setAttribute("success", "Password reset successfully!");
                        RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                        rd.forward(req, resp);
                    } else {
                        req.setAttribute("error", "Failed to reset password");
                        RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
                        rd.forward(req, resp);
                    }
                } else {
                    req.setAttribute("error", "Passwords do not match!");
                    RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
                    rd.forward(req, resp);
                }
            } else {
                req.setAttribute("error", "Phone and email combination not found!");
                RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
                rd.forward(req, resp);
            }
        } catch(NumberFormatException e) {
            req.setAttribute("error", "Invalid phone format!");
            RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
            rd.forward(req, resp);
        }
    }
}
