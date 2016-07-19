package entity;

import java.math.BigInteger;

/**
 * Created by alunoinf on 18/07/2016.
 */
public class TaskEvaluations {
    private final BigInteger task_number; // número da tarefa que vem de task
    private final Integer student;       // nome do estudante
    private final Float grade;          // nota da tarefa
    private final Integer bimester;   //  bimestre

    public TaskEvaluations(BigInteger task_number, Integer student, Float grade, Integer bismester) {
        this.task_number = task_number;
        this.student = student;
        this.grade = grade;
        this.bimester = bismester;
    }

    public BigInteger getTask_number() {
        return task_number;
    }

    public Integer getStudent() {
        return student;
    }

    public Float getGrade() {
        return grade;
    }

    public Integer getBismester() {
        return bimester;
    }


}
//select subject_name from task where task_number = this.tasknumber