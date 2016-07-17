package entity;

public class ClassSubjects {

    private final String subject_name;
    private final Integer teacher;
    private final String class_name;

    public ClassSubjects(String subject_name, Integer teacher, String class_name) {
        this.subject_name = subject_name;
        this.teacher = teacher;
        this.class_name = class_name;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public Integer getTeacher() {
        return teacher;
    }

    public String getClass_name() {
        return class_name;
    }
}
