package entity;

public class ClassStudents {

    private final Integer fk_student_enrollment;
    private final String fk_class_name;

    public ClassStudents(Integer fk_student_enrollment, String fk_class_name) {
        this.fk_student_enrollment = fk_student_enrollment;
        this.fk_class_name = fk_class_name;
    }

    public Integer getFk_student_enrollment() {
        return fk_student_enrollment;
    }

    public String getFk_class_name() {
        return fk_class_name;
    }
}
