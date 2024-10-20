package db_connection;
import course.Course;
import course.Module;
import course.Project;

import java.sql.*;

public class CourseDatabase {
    Connection con;

    public CourseDatabase(Connection con) {
        this.con = con;
    }

    public boolean addModule(Module module) {
        boolean result = false;
        try{
            String query = "INSERT INTO module(ModuleCode, ModuleName, CourseId) " +
                    "VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, module.getModuleCode());
            ps.setString(2, module.getModuleName());
            ps.setInt(3, module.getCourseId());
            ps.executeUpdate();
            result = true;
        }catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    public boolean addProject(Project project) {
        boolean result = false;

        try{
            String query = "INSERT INTO project(ModuleName, Description, Marks) VALUES(?,?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, project.getModuleName());
            ps.setString(2, project.getDescription());
            ps.setString(3, project.getMarks());

            ps.executeUpdate();
            result = true;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean addCourse(Course course) {
        boolean status = false;

        try{
            String query = "INSERT INTO course(CourseCode, CourseName, Duration) " +
                    "VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, course.getCourseCode());
            ps.setString(2, course.getCourseName());
            ps.setInt(3, course.getDuration());
            ps.executeUpdate();
            status = true;
        }catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
