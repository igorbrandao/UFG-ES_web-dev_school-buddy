package entity;

import java.math.BigInteger;
import java.sql.Timestamp;

public class Task {

    private final BigInteger task_number;
    private Timestamp start_date;
    private Timestamp end_date;
    private Float weight;
    private String description;
    private final String subject_name;
    private final Integer subject_teacher;

    public Task(BigInteger task_number, Timestamp start_date, Timestamp end_date, Float weight, String description, String subject_name, Integer subject_teacher) {
        this.task_number = task_number;
        this.start_date = start_date;
        this.end_date = end_date;
        this.weight = weight;
        this.description = description;
        this.subject_name = subject_name;
        this.subject_teacher = subject_teacher;
    }

    public BigInteger getTask_number() {
        return task_number;
    }

    public Timestamp getStart_date() {
        return start_date;
    }

    public void setStart_date(Timestamp start_date) {
        this.start_date = start_date;
    }

    public Timestamp getEnd_date() {
        return end_date;
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
