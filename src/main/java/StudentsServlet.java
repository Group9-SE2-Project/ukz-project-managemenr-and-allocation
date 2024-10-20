import db_connection.Connector;
import db_connection.UserDatabase;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class StudentsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDatabase _db = new UserDatabase(Connector.getConnection());

        try {
            req.setAttribute("students", _db.getStudents());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
