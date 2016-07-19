package entity;

import javax.persistence.*;
import java.math.BigInteger;

//TODO ANNOTATE!
@Table(name = "tasks_evaluations")
public class TaskEvaluations {

    private BigInteger fk_task_number;


    private Integer fk_student_enrollment;


    private Float grade;


    private Integer bimester;

    public TaskEvaluations() {
    }

    public TaskEvaluations(BigInteger fk_task_number, Integer fk_student_enrollment, Float grade, Integer bismester) {
        this.fk_task_number = fk_task_number;
        this.fk_student_enrollment = fk_student_enrollment;
        this.grade = grade;
        this.bimester = bismester;
    }

    public BigInteger getFk_task_number() {
        return fk_task_number;
    }

    public Integer getFk_student_enrollment() {
        return fk_student_enrollment;
    }

    public Float getGrade() {
        return grade;
    }

    public Integer getBimester() {
        return bimester;
    }

}