package in.ps.studentapp.servlet;

import java.io.IOException;
import in.ps.studentapp.dao.CoursesDAO;
import in.ps.studentapp.dao.CoursesDAOImpl;
import in.ps.studentapp.dto.Courses;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateCourse")
public class UpdateCourse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int courseId = Integer.parseInt(req.getParameter("courseId"));
        String courseName = req.getParameter("courseName");
        String category = req.getParameter("category");
        String courseInfo = req.getParameter("courseInfo");
        int months = Integer.parseInt(req.getParameter("months"));
        double fees = Double.parseDouble(req.getParameter("fees"));
        
        Courses course = new Courses();
        course.setCourseId(courseId);
        course.setCourseName(courseName);
        course.setCategory(category);
        course.setCourseInfo(courseInfo);
        course.setMonths(months);
        course.setFees(fees);
        
        CoursesDAO cdao = new CoursesDAOImpl();
        boolean result = cdao.updateCourse(course);
        
        if(result) {
            resp.sendRedirect("admin.jsp");
        } else {
            resp.sendRedirect("admin.jsp");
        }
    }
}
