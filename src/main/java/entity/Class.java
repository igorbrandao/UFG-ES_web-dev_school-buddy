package entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "classes")
public class Class {

    @Id
    private String pk_class_name;
    private Integer total_students;
    private Integer total_subjects;
    private Boolean is_active;

    @ManyToMany
    @JoinTable(name="classes_students", joinColumns=
            {@JoinColumn(name="fk_class_name")}, inverseJoinColumns=
            {@JoinColumn(name="fk_student_enrollment")})
    private List<User> students;

    /*
    @ManyToMany
    @JoinTable(name="classes_subjects", joinColumns=
            {@JoinColumn(name="fk_class_name")}, inverseJoinColumns=
            {@ //COMPOSITE JoinColumn(name="cpk_subject_name")})
    private List<ClassSubjects> subjects;
    **/

    public Class() {
    }

    public Class(String pk_class_name, Integer total_students, Integer total_subjects, Boolean is_active, List students) {
        this.pk_class_name = pk_class_name;
        this.total_students = total_students;
        this.total_subjects = total_subjects;
        this.is_active = is_active;
        this.students = students;
    }

    public String getPk_class_name() {
        return pk_class_name;
    }

    public void setPk_class_name(String pk_class_name) {
        this.pk_class_name = pk_class_name;
    }

    public Integer getTotal_students() {
        return total_students;
    }

    public void setTotal_students(Integer total_students) {
        this.total_students = total_students;
    }

    public Integer getTotal_subjects() {
        return total_subjects;
    }

    public void setTotal_subjects(Integer total_subjects) {
        this.total_subjects = total_subjects;
    }

    public Boolean is_active() {
        return is_active;
    }

    public void setIs_active(boolean is_active) {
        this.is_active = is_active;
    }
}
