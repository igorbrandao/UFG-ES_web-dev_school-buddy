package entity;

import javax.persistence.*;

@Entity
@Table(name = "classes")
public class Class {

    @Id
    private String pk_class_name;
    private Integer total_students;
    private Integer total_subjects;
    private boolean is_active;

    public Class() {
    }

    public Class(String pk_class_name, Integer total_students, Integer total_subjects) {
        this.pk_class_name = pk_class_name;
        this.total_students = total_students;
        this.total_subjects = total_subjects;
        this.is_active = true;
    }

    public String getPk_class_name() {
        return pk_class_name;
    }

    public Integer getTotal_students() {
        return total_students;
    }

    public Integer getTotal_subjects() {
        return total_subjects;
    }

    public boolean is_active() {
        return is_active;
    }

    public void set_is_active(boolean is_active) {
        this.is_active = is_active;
    }
}
