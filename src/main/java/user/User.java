package user;

public class User {
    int Id;
    int UserID;
    String AuthID;
    String Email;
    String FirstName;
    String LastName;
    String Password;
    String Role;

    public User() {}

    public User(int Id, int UserID, String AuthID, String Email, String FirstName, String LastName, String Password,  String Role) {
        this.Id = Id;
        this.UserID = UserID;
        this.AuthID = AuthID;
        this.Password = Password;
        this.Role = Role;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
    }
    public User(int UserID, String AuthID, String Email, String FirstName, String LastName, String Password, String Role) {
        this.UserID = UserID;
        this.AuthID = AuthID;
        this.Password = Password;
        this.Role = Role;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
    }
    public int getId() {
        return Id;
    }
    public void setId(int Id) {
        this.Id = Id;
    }
    public int getUserID() {
        return UserID;
    }
    public void setUserID(int UserID) {
        this.UserID = UserID;
    }
    public String getAuthID() {
        return AuthID;
    }
    public void setAuthID(String AuthID) {
        this.AuthID = AuthID;
    }
    public String getPassword() {
        return Password;
    }
    public void setPassword(String Password) {
        this.Password = Password;
    }
    public String getRole() {
        return Role;
    }
    public void setRole(String Role) {
        this.Role = Role;
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
    public String getEmail() {
        return Email;
    }
    public void setEmail(String Email) {
        this.Email = Email;
    }
}

