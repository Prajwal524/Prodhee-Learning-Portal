package in.ps.studentapp.servlet;

import java.io.IOException;
import java.util.ArrayList;

import in.ps.studentapp.dao.CoursesDAO;
import in.ps.studentapp.dao.CoursesDAOImpl;
import in.ps.studentapp.dto.Courses;
import in.ps.studentapp.dto.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/mycourses")
public class MyCourses extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
                         HttpServletResponse resp)
            throws ServletException, IOException {

        Student s =
            (Student) req.getSession().getAttribute("student");

        if(s == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        CoursesDAO dao = new CoursesDAOImpl();

        ArrayList<Courses> courseList =
            dao.getCoursesByStudentId(s.getId());

        req.setAttribute("courseList", courseList);

        req.getRequestDispatcher("mycourses.jsp")
           .forward(req, resp);
    }
}