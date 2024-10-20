import db_connection.Connector;
import user.Student;
import user.User;
import db_connection.UserDatabase;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String studentId = req.getParameter("identity");
        String password = req.getParameter("password");

        UserDatabase _db = new UserDatabase(Connector.getConnection());
        User user = _db.LoginUser(studentId, password);


        if (user != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("dashboard.jsp");
        }else{
            resp.sendRedirect("login.jsp");
        }
    }
}