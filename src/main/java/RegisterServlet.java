import user.*;
import db_connection.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String identity = req.getParameter("identity");
        String email = null;
        String password = req.getParameter("password");
        String firstName = req.getParameter("first_name");
        String lastName = req.getParameter("last_name");
        String role = req.getParameter("role");

        UserDatabase userRegister = new UserDatabase(Connector.getConnection());
        email = req.getParameter("identity") + "@ukzn.ac.za";

        if(role != ""){

            Student student = new Student(identity, email, firstName, lastName);
            User user = new User(student.getId(), student.getStudentID(), email, firstName, firstName, password, role);

            if (userRegister.RegisterStudent(student, user)) {
                resp.sendRedirect("login.jsp");
            }else{
                String errorMessage = "User not registered";
                HttpSession session = req.getSession();
                session.setAttribute("errorMessage", errorMessage);
                resp.sendRedirect(req.getContextPath() + "/register");
            }
        }
        else if(role == ""){
            role = "lecturer";
            Staff staff = new Staff(identity, email, firstName, lastName);
            User user = new User(staff.getId(), staff.getStaffId(), email, firstName, firstName, password, role);

            if (userRegister.RegisterStaff(staff, user)) {
                resp.sendRedirect("login.jsp");
            }else{
                String errorMessage = "User not registered";
                HttpSession session = req.getSession();
                session.setAttribute("errorMessage", errorMessage);
                resp.sendRedirect(req.getContextPath() + "/register");
            }
        }
        else{
            PrintWriter out = resp.getWriter();
            out.println("No Role");
            out.println(role);
        }
    }
}