package entity;

import javax.persistence.*;

//TODO ANNOTATE!
@Table(name = "classes_students")
public class ClassStudents {

    private Integer fk_student_enrollment;
    private String fk_class_name;

    public ClassStudents() {
    }

    public Integer getFk_student_enrollment() {
        return fk_student_enrollment;
    }

    public void setFk_student_enrollment(Integer fk_student_enrollment) {
        this.fk_student_enrollment = fk_student_enrollment;
    }

    public String getFk_class_name() {
        return fk_class_name;
    }

    public void setFk_class_name(String fk_class_name) {
        this.fk_class_name = fk_class_name;
    }
}
