import course.Project;
import db_connection.Connector;
import db_connection.CourseDatabase;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;

@WebServlet("/create-project")
@MultipartConfig
public class ProjectServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ServletFileUpload fileUpload = new ServletFileUpload(new DiskFileItemFactory());
        String path = "C:\\Users\\Sibonelo Njokweni\\IdeaProjects\\ukzn-projects-management-and-allocation\\uploads\\";
        String module = "";
        String desc = "";
        String marks = "";
        try {
            List<FileItem> files = fileUpload.parseRequest(req);


            for (FileItem item : files) {
                item.write(new File(path + item.getName()));
                if(item.isFormField()) {
                    String s = item.getString();
                    System.out.println(s);
                }
            }
        } catch (FileUploadException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }




        CourseDatabase _db = new CourseDatabase(Connector.getConnection());

        Project project = new Project(module, desc, marks);

        if(_db.addProject(project)){
            resp.sendRedirect("projects.jsp");
        }else{
            resp.sendRedirect("new-project.jsp");
        }
    }
}
