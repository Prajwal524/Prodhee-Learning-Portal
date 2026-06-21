package in.ps.studentapp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import in.ps.studentapp.dao.CoursesDAO;
import in.ps.studentapp.dao.CoursesDAOImpl;
import in.ps.studentapp.dto.Courses;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchCourses")
public class SearchCourses extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchQuery = req.getParameter("searchQuery");
        CoursesDAO cdao = new CoursesDAOImpl();
        ArrayList<Courses> courseList = new ArrayList<>();
        
        if(searchQuery != null && !searchQuery.trim().isEmpty()) {
            ArrayList<Courses> allCourses = cdao.getCourses();
            String query_lower = searchQuery.toLowerCase().trim();
            for(Courses course : allCourses) {
                if(course.getCourseName().toLowerCase().contains(query_lower) ||
                   course.getCourseInfo().toLowerCase().contains(query_lower) ||
                   course.getCategory().toLowerCase().contains(query_lower)) {
                    courseList.add(course);
                }
            }
        } else {
            courseList = cdao.getCourses();
        }
        
        req.setAttribute("courseList", courseList);
        req.setAttribute("searchQuery", searchQuery != null ? searchQuery : "");
        req.getRequestDispatcher("courses.jsp").forward(req, resp);
    }
}
