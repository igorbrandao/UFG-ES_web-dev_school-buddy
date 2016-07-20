package entity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "classes")
public class Class {

    @Id
    private String pk_class_name;
    private Integer total_students;
    private Integer total_subjects;
    private Boolean is_active;
    //private Set<ClassStudents> students = new HashSet<>();
    //private Set<ClassSubjects> subjects = new HashSet<>();

    public Class() {
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
