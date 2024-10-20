import course.Course;
import db_connection.CourseDatabase;
import db_connection.Connector;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/new-course")
public class CourseServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseName = req.getParameter("courseName");
        String courseCode = req.getParameter("courseCode");
        int courseDuration = Integer.parseInt(req.getParameter("courseDuration"));

        CourseDatabase _db = new CourseDatabase(Connector.getConnection());

        Course course = new Course(courseCode, courseName, courseDuration);
        if(_db.addCourse(course)) {
            resp.sendRedirect("courses.jsp");
        }else{
            String errorMessage = "Course not added";
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", errorMessage);
            resp.sendRedirect(req.getContextPath() + "/newCourse");
        }
    }
}