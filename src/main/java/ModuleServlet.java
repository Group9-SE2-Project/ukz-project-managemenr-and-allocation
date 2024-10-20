import course.Module;
import db_connection.Connector;
import db_connection.CourseDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/new-module")
public class ModuleServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String courseName = req.getParameter("moduleName");
        String courseCode = req.getParameter("moduleCode");
        int courseID = Integer.parseInt(req.getParameter("courseId"));

        CourseDatabase _db = new CourseDatabase(Connector.getConnection());
        Module module = new Module(courseName, courseCode, courseID);
        if(_db.addModule(module)) {
            resp.sendRedirect("modules.jsp");
        }else{
            String errorMessage = "Module not added";
            HttpSession session = req.getSession();
            session.setAttribute("errorMessage", errorMessage);
            resp.sendRedirect(req.getContextPath() + "/new-module.jsp");
        }
    }
}
