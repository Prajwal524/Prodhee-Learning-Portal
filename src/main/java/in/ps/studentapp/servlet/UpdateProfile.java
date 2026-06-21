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

@WebServlet("/updateProfile")
public class UpdateProfile extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        StudentDAO sdao = new StudentDAOImpl();
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String mail = req.getParameter("mail");
        long phone = Long.parseLong(req.getParameter("phone"));
        
        Student s = sdao.getStudentById(id);

        s.setName(name);
        s.setMail(mail);
        s.setPhone(phone);
        
        boolean result = sdao.updateStudent(s);
        if(result) {
            HttpSession session = req.getSession();
            Student updated = sdao.getStudentById(id);
            session.setAttribute("student", updated);
            req.setAttribute("success", "Profile updated!");
            RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("error", "Failed to update");
            RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
            rd.forward(req, resp);
        }
    }
}
