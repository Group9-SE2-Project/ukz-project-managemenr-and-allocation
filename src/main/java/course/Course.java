package course;

public class Course {
    int Id;
    String CourseCode;
    String CourseName;
    int Duration;

    public Course() {}

    public Course(int Id, String CourseCode, String CourseName, int Duration) {
        this.Id = Id;
        this.CourseCode = CourseCode;
        this.CourseName = CourseName;
        this.Duration = Duration;
    }
    public Course(String CourseCode, String CourseName, int Duration) {
        this.CourseCode = CourseCode;
        this.CourseName = CourseName;
        this.Duration = Duration;
    }
    public int getId() {
        return Id;
    }
    public void setId(int Id) {
        this.Id = Id;
    }
    public String getCourseCode() {
        return CourseCode;
    }
    public void setCourseCode(String CourseCode) {
        this.CourseCode = CourseCode;
    }
    public String getCourseName() {
        return CourseName;
    }
    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }
    public int getDuration() {
        return Duration;
    }
    public void setDuration(int Duration) {
        this.Duration = Duration;
    }
}
