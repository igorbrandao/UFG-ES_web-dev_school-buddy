package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigInteger;
import java.sql.Timestamp;

@Entity
@Table(name = "activity")
public class Activity {

    @Id @GeneratedValue
    private final BigInteger activity_number;

    private Timestamp start_date;
    private Timestamp end_date;
    private String title;
    private Float weight;
    private String description;
    private final String subject_name;
    private final Integer subject_teacher;


    public Activity(BigInteger activity_number, Timestamp start_date, Timestamp end_date, String title, Float weight, String description, String subject_name, Integer subject_teacher) {
        this.activity_number = activity_number;
        this.title = title;
        this.start_date = start_date;
        this.end_date = end_date;
        this.weight = weight;
        this.description = description;
        this.subject_name = subject_name;
        this.subject_teacher = subject_teacher;
    }

    public BigInteger getactivity_number() {
        return activity_number;
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
