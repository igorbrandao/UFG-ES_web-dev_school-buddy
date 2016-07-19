package entity;

import java.math.BigInteger;

public class TaskEvaluations {
    private final BigInteger fk_task_number; // número da tarefa que vem de task
    private final Integer fk_student_enrollment;       // nome do estudante
    private final Float grade;          // nota da tarefa
    private final Integer bimester;   //  bimestre

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
//select subject_name from task where fk_task_number = this.tasknumber