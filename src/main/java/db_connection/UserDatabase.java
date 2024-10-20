package db_connection;
import user.Staff;
import user.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import user.User;

public class UserDatabase {
    Connection conn;

    public UserDatabase(Connection conn) {
        this.conn = conn;
    }


    // Saving Student
    public boolean RegisterStudent(Student student, User user) {
        boolean set = false;

        try{
            String query = "INSERT INTO students(StudentID, Email, FirstName, LastName) " +
                    "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, student.getStudentID());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getFirstName());
            ps.setString(4, student.getLastName());
            ps.executeUpdate();

            query = "SELECT * FROM students WHERE StudentID = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, student.getStudentID());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                student = new Student();
                student.setId(rs.getInt("Id"));
                student.setStudentID(rs.getString("StudentID"));
                student.setEmail(rs.getString("Email"));
                student.setFirstName(rs.getString("FirstName"));
                student.setLastName(rs.getString("LastName"));
            }


            query = "INSERT INTO users(UserID, AuthID, Email, FirstName, LastName, Password, Role) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement _ps = conn.prepareStatement(query);
            _ps.setInt(1, student.getId());
            _ps.setString(2, student.getStudentID());
            _ps.setString(3, student.getEmail());
            _ps.setString(4, student.getFirstName());
            _ps.setString(5, student.getLastName());
            _ps.setString(6, user.getPassword());
            _ps.setString(7, user.getRole());

            _ps.executeUpdate();

            set = true;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return set;
    }

    // Saving Lecturer
    public boolean RegisterStaff(Staff staff, User user) {
        boolean valid = false;

        try{
            String query = "INSERT INTO staff(StaffID, Email, FirstName, LastName) " +
                    "VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, staff.getStaffId());
            ps.setString(2, staff.getEmail());
            ps.setString(3, staff.getFirstName());
            ps.setString(4, staff.getLastName());

            ps.executeUpdate();

            query = "SELECT * FROM staff WHERE StaffID = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, staff.getStaffId());

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                staff = new Staff();
                staff.setId(rs.getInt("Id"));
                staff.setStaffId(rs.getString("StaffID"));
                staff.setEmail(rs.getString("Email"));
                staff.setFirstName(rs.getString("FirstName"));
                staff.setLastName(rs.getString("LastName"));
            }

            query = "INSERT INTO users(UserID, AuthID, Email, FirstName, LastName, Password, Role) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement _ps = conn.prepareStatement(query);
            _ps.setInt(1, staff.getId());
            _ps.setString(2, staff.getStaffId());
            _ps.setString(3, staff.getEmail());
            _ps.setString(4, staff.getFirstName());
//            _ps.setString(5, staff.getLastName());
//            _ps.setString(6, user.getPassword());
//            _ps.setString(7, user.getRole());

            _ps.executeUpdate();
            valid = true;
        }catch (Exception e) {
            e.printStackTrace();
        }
        return valid;
    }

    // Authenticate User
    public User LoginUser(String Identity, String Password) {
        User user = null;

        try{
            String query = "SELECT * FROM users WHERE AuthID = ? AND Password = ?";
            PreparedStatement ps = this.conn.prepareStatement(query);

            ps.setString(1, Identity);
            ps.setString(2, Password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String role = rs.getString("Role");
                user = new User();

                if(role.equals("student")) {
                    user.setAuthID(rs.getString("StudentID"));
                }
                else if(role.equals("staff")) {
                    user.setAuthID(rs.getString("StaffID"));
                }

                user.setId(rs.getInt("Id"));
                user.setAuthID(Identity);
                user.setEmail(rs.getString("Email"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setRole(rs.getString("Role"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    // Students List
    public List<Student> Students(){
        List<Student> students = new ArrayList<>();

        try{
            String query = "SELECT * FROM students";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int Id = rs.getInt("Id");
                String StudentID = rs.getString("StudentID");
                String Email = rs.getString("Email");
                String FirstName = rs.getString("FirstName");
                String LastName = rs.getString("LastName");

                students.add(new Student(Id, StudentID, Email, FirstName, LastName));
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return students;
    }
    public ResultSet getStudents() throws SQLException {
        String query = "SELECT * FROM students";

        Statement s = conn.createStatement();
        ResultSet rs = s.executeQuery(query);
        return rs;
    }
}
