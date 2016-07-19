package entity;

import javax.persistence.Table;
import java.math.BigInteger;
import java.sql.Timestamp;

@javax.persistence.Entity
@Table(name = "task")
public class Task {

    private BigInteger task_number;
    private String task_type;
    private String title;
    private Timestamp start_date;
    private Timestamp end_date;
    private Float weight;
    private String description;
    private final String subject_name;
    private final Integer subject_teacher;

    public Task(String task_type, String title, Timestamp start_date, Timestamp end_date, Float weight, String description, String subject_name, Integer subject_teacher) {
        this.task_type = task_type;
        this.title = title;
        this.start_date = start_date;
        this.end_date = end_date;
        this.weight = weight;
        this.description = description;
        this.subject_name = subject_name;
        this.subject_teacher = subject_teacher;
    }

    public Task(BigInteger task_number, Task task) {
        this.task_number = task_number;
        this.task_type = task.getTask_type();
        this.title = task.getTitle();
        this.start_date = task.getStart_date();
        this.end_date = task.getEnd_date();
        this.weight = task.getWeight();
        this.description = task.getDescription();
        this.subject_name = task.getSubject_name();
        this.subject_teacher = task.getSubject_teacher();
    }

    public String getTask_type() {
        return task_type;
    }

    public void setTask_type(String task_type) {
        this.task_type = task_type;
    }

    public BigInteger getTask_number() {
        return task_number;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getStart_date() {
        return new Timestamp(start_date.getTime());
    }

    public void setStart_date(Timestamp start_date) {
        this.start_date = start_date;
    }

    public Timestamp getEnd_date() {
        return new Timestamp(end_date.getTime());
    }

    public void setEnd_date(Timestamp end_date) {
        this.end_date = end_date;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public Integer getSubject_teacher() {
        return subject_teacher;
    }

}