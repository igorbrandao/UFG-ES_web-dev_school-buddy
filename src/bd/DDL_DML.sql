CREATE TYPE user_type_enum AS ENUM ('admin', 'aluno', 'professor');

CREATE TABLE users
(
  pk_enrollment INTEGER                      NOT NULL,
  user_type     user_type_enum               NOT NULL,
  email         CHARACTER VARYING(50) UNIQUE NOT NULL,
  hash          CHARACTER VARYING(50)        NOT NULL,
  name          CHARACTER VARYING(100)       NOT NULL,
  address       CHARACTER VARYING(150)       NOT NULL,
  phone         CHARACTER VARYING(15)        NOT NULL,
  CONSTRAINT pkey_users PRIMARY KEY (pk_enrollment)
);

CREATE TABLE classes
(
  pk_class_name  CHARACTER VARYING(20) NOT NULL,
  total_students INTEGER               NOT NULL,
  total_subjects INTEGER               NOT NULL,
  is_active      BOOLEAN               NOT NULL,
  CONSTRAINT pkey_classes PRIMARY KEY (pk_class_name),
  CONSTRAINT valid_total_students CHECK (total_students > 0),
  CONSTRAINT valid_total_subjects CHECK (total_subjects > 0)
);

CREATE TABLE classes_students
(
  pk_class_student_id   INTEGER               NOT NULL,
  ref_class_name        CHARACTER VARYING(20) NOT NULL,
  fk_student_enrollment INTEGER               NOT NULL,
  CONSTRAINT pkey_classes_students PRIMARY KEY (pk_class_student_id)
);

CREATE TABLE classes_subjects
(
  cpk_subject_name       CHARACTER VARYING(30) NOT NULL,
  cpk_teacher_enrollment INTEGER               NOT NULL,
  ref_class_name         CHARACTER VARYING(20) NOT NULL,
  CONSTRAINT pkey_classes_subjects PRIMARY KEY (cpk_subject_name, cpk_teacher_enrollment)
);

CREATE TYPE task_type_enum AS ENUM ('atividade', 'prova');

CREATE SEQUENCE task_sequence START 1;

CREATE TABLE tasks
(
  pk_task_id                     INTEGER                NOT NULL,
  task_type                      task_type_enum         NOT NULL,
  title                          CHARACTER VARYING(50)  NOT NULL,
  start_date                     TIMESTAMP              NOT NULL,
  end_date                       TIMESTAMP              NOT NULL,
  weight                         FLOAT                  NOT NULL,
  description                    CHARACTER VARYING(500) NOT NULL,
  ref_subject_name               CHARACTER VARYING(30)  NOT NULL,
  ref_subject_teacher_enrollment INTEGER                NOT NULL,
  CONSTRAINT pkey_tasks PRIMARY KEY (pk_task_id),
  CONSTRAINT check_valid_date_interval CHECK (start_date < end_date)
);

CREATE TABLE tasks_evaluations
(
  pk_task_evaluation_id INTEGER NOT NULL,
  fk_task_number        INTEGER NOT NULL,
  fk_student_enrollment INTEGER NOT NULL,
  grade                 FLOAT   NOT NULL,
  bimester              INTEGER NOT NULL,
  CONSTRAINT check_valid_grade CHECK (grade >= 0 AND grade <= 10),
  CONSTRAINT pkey_classes_students PRIMARY KEY (pk_task_evaluation_id)
);

ALTER TABLE classes_students
  ADD CONSTRAINT fkey_students_classes_students FOREIGN KEY (fk_student_enrollment) REFERENCES users (pk_enrollment);

ALTER TABLE tasks_evaluations
  ADD CONSTRAINT fkey_tasks_tasks_evaluations FOREIGN KEY (fk_task_number) REFERENCES tasks (pk_task_id);
ALTER TABLE tasks_evaluations
  ADD CONSTRAINT fkey_students_tasks_evaluations FOREIGN KEY (fk_student_enrollment) REFERENCES users (pk_enrollment);

--INSERTS

-- Admin Insert
INSERT INTO users VALUES (
  1,
  'admin',
  'admin@dummy.email',
  '4acb4bc224acbbe3c2bfdcaa39a4324e', --admin321
  'Escola da Tia Renata',
  'SQN 215 Bloco J Nº 0 Ap. 107 Asa Norte Brasília Distrito Federal',
  '(61)1234-5678'
);