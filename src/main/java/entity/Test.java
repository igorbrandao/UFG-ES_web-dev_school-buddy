package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigInteger;
import java.sql.Timestamp;

@Entity
@Table(name = "test")
public class Test {

    @Id @GeneratedValue
    private final BigInteger test_number;


    private Timestamp test_date;
    private String title;
    private Float weight;
    private String description;
    private final String subject_name;
    private final Integer subject_teacher;


    public Test(BigInteger test_number, Timestamp test_date, String title, Float weight, String description, String subject_name, Integer subject_teacher) {
        this.test_number = test_number;
        this.title = title;
        this.test_date = test_date;
        this.weight = weight;
        this.description = description;
        this.subject_name = subject_name;
        this.subject_teacher = subject_teacher;
    }


    public BigInteger getTest_number() {
        return test_number;
    }

    public Timestamp getTest_date() {
        return test_date;
    }

    public void setTest_date(Timestamp test_date) {
        this.test_date = test_date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
