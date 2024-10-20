package user;

public class Student {
    int Id;
    String StudentID;
    String Email;
    String FirstName;
    String LastName;

    public Student() {
    }

    // Collection Of All Fields
    public Student(int Id, String StudentID, String Email, String FirstName, String LastName) {
        this.Id = Id;
        this.StudentID = StudentID;
        this.Email = Email;
        this.FirstName = FirstName;
        this.LastName = LastName;
    }

    // Registration Fields
    public Student(String StudentID, String Email, String FirstName, String LastName) {
        this.StudentID = StudentID;
        this.Email = Email;
        this.FirstName = FirstName;
        this.LastName = LastName;
    }


    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getStudentID() {
        return StudentID;
    }

    public void setStudentID(String StudentID) {
        this.StudentID = StudentID;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

}
