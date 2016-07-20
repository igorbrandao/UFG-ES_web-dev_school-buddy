package entity;

import javax.persistence.*;
import java.math.BigInteger;
import java.sql.Timestamp;

@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO, generator="task_number")
    @SequenceGenerator(name="task_number", sequenceName="TASK_ID_SEQUENCE", allocationSize=1)
    private BigInteger pk_task_number;
    private String task_type;
    private String title;
    private Timestamp start_date;
    private Timestamp end_date;
    private Float weight;
    private String description;
    private String cfk_subject_name;
    private Integer cfk_subject_teacher;

    public Task(String task_type, String title, Timestamp start_date, Timestamp end_date, Float weight, String description, String cfk_subject_name, Integer cfk_subject_teacher) {
        this.task_type = task_type;
        this.title = title;
        this.start_date = start_date;
        this.end_date = end_date;
        this.weight = weight;
        this.description = description;
        this.cfk_subject_name = cfk_subject_name;
        this.cfk_subject_teacher = cfk_subject_teacher;
    }

    public Task() {
    }

    public BigInteger getPk_task_number() {
        return pk_task_number;
    }

    public void setPk_task_number(BigInteger pk_task_number) {
        this.pk_task_number = pk_task_number;
    }

    public String getTask_type() {
        return task_type;
    }

    public void setTask_type(String task_type) {
        this.task_type = task_type;
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

    public String getCfk_subject_name() {
        return cfk_subject_name;
    }

    public void setCfk_subject_name(String cfk_subject_name) {
        this.cfk_subject_name = cfk_subject_name;
    }

    public Integer getCfk_subject_teacher() {
        return cfk_subject_teacher;
    }

    public void setCfk_subject_teacher(Integer cfk_subject_teacher) {
        this.cfk_subject_teacher = cfk_subject_teacher;
    }
}