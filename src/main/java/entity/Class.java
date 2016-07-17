package entity;

public class Class {

    private final String class_name;
    private final Integer total_students;
    private final Integer total_subjects;
    private boolean is_active;

    public Class(String class_name, Integer total_students, Integer total_subjects) {
        this.class_name = class_name;
        this.total_students = total_students;
        this.total_subjects = total_subjects;
        this.is_active = true;
    }

    public String getClass_name() {
        return class_name;
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
