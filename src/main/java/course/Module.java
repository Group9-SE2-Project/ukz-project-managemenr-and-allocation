package course;

public class Module {
    int Id;
    String ModuleCode;
    String ModuleName;
    int CourseId;

    public Module(){}

    public Module(int Id, String ModuleCode, String ModuleName, int CourseId) {
        this.Id = Id;
        this.ModuleCode = ModuleCode;
        this.ModuleName = ModuleName;
        this.CourseId = CourseId;
    }

    public Module(String courseName, String courseCode, int courseID) {
        this.CourseId = courseID;
        this.ModuleName = courseName;
        this.ModuleCode = courseCode;
    }

    public int getId() {
        return Id;
    }
    public void setId(int Id) {
        this.Id = Id;
    }
    public String getModuleCode() {
        return ModuleCode;
    }
    public void setModuleCode(String ModuleCode) {
        this.ModuleCode = ModuleCode;
    }
    public String getModuleName() {
        return ModuleName;
    }
    public void setModuleName(String ModuleName) {
        this.ModuleName = ModuleName;
    }
    public int getCourseId() {
        return CourseId;
    }
    public void setCourseId(int CourseId) {
        this.CourseId = CourseId;
    }
}
