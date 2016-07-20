package entity;

import javax.persistence.*;

//TODO ANNOTATE!
@Table(name = "classes_subjects")
public class ClassSubjects {

    private String fk_class_name;
    private String cpk_subject_name;
    private Integer cpk_teacher_enrollment;

    public ClassSubjects() {
    }

    public String getFk_class_name() {
        return fk_class_name;
    }

    public void setFk_class_name(String fk_class_name) {
        this.fk_class_name = fk_class_name;
    }

    public String getCpk_subject_name() {
        return cpk_subject_name;
    }

    public void setCpk_subject_name(String cpk_subject_name) {
        this.cpk_subject_name = cpk_subject_name;
    }

    public Integer getCpk_teacher_enrollment() {
        return cpk_teacher_enrollment;
    }

    public void setCpk_teacher_enrollment(Integer cpk_teacher_enrollment) {
        this.cpk_teacher_enrollment = cpk_teacher_enrollment;
    }

}
