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

@WebServlet("/addCourse")
public class AddCourse extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseName = req.getParameter("courseName");
        String category = req.getParameter("category");
        String courseInfo = req.getParameter("courseInfo");
        int months = Integer.parseInt(req.getParameter("months"));
        double fees = Double.parseDouble(req.getParameter("fees"));
        
        Courses course = new Courses();
        course.setCourseName(courseName);
        course.setCategory(category);
        course.setCourseInfo(courseInfo);
        course.setMonths(months);
        course.setFees(fees);
        
        CoursesDAO cdao = new CoursesDAOImpl();
        boolean result = cdao.insertCourse(course);
        
        if(result) {
            req.setAttribute("success", "Course added!");
            RequestDispatcher rd = req.getRequestDispatcher("admin-add-course.jsp");
            rd.forward(req, resp);
        } else {
            req.setAttribute("error", "Failed to add course");
            RequestDispatcher rd = req.getRequestDispatcher("admin-add-course.jsp");
            rd.forward(req, resp);
        }
    }
}
