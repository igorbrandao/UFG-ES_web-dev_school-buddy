package entity;

import javax.persistence.Table;
import java.math.BigInteger;

@javax.persistence.Entity
@Table(name = "tasks_evaluations")
public class TaskEvaluations {

    private final BigInteger fk_task_number;
    private final Integer fk_student_enrollment;
    private final Float grade;
    private final Integer bimester;

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

    public Integer getBismester() {
        return bimester;
    }


}