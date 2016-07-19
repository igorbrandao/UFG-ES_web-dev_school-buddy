package entity;

/**
 * Created by alunoinf on 18/07/2016.
 */
public class ClassStudents {

    private final Integer student;
    private final String class_name;

    public ClassStudents(Integer student, String class_name) {
        this.student = student;
        this.class_name = class_name;
    }

    public Integer getStudent() {
        return student;
    }

    public String getClass_name() {
        return class_name;
    }
}
