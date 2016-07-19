package entity;

import javax.persistence.Table;

@javax.persistence.Entity
@Table(name = "classes_subjects")
public class ClassSubjects {


    private final String fk_class_name;


    private final String cpk_subject_name;


    private final Integer cpk_teacher_enrollment;

    public ClassSubjects(String cpk_subject_name, Integer cpk_teacher_enrollment, String fk_class_name) {
        this.cpk_subject_name = cpk_subject_name;
        this.cpk_teacher_enrollment = cpk_teacher_enrollment;
        this.fk_class_name = fk_class_name;
    }

    public String getCpk_subject_name() {
        return cpk_subject_name;
    }

    public Integer getCpk_teacher_enrollment() {
        return cpk_teacher_enrollment;
    }

    public String getFk_class_name() {
        return fk_class_name;
    }
}