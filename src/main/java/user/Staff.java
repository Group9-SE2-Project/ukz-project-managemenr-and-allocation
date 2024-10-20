package user;

public class Staff {
    int Id;
    String staffId;
    String Email;
    String FirstName;
    String LastName;

    public Staff() {}

    public Staff(int Id, String staffId, String Email, String FirstName, String LastName) {
        this.Id = Id;
        this.staffId = staffId;
        this.Email = Email;
        this.FirstName = FirstName;
        this.LastName = LastName;
    }

    public Staff(String staffId, String Email, String FirstName, String LastName) {
        this.staffId = staffId;
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
    public String getStaffId() {
        return staffId;
    }
    public void setStaffId(String staffId) {
        this.staffId = staffId;
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

