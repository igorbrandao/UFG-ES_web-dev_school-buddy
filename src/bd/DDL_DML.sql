CREATE TYPE user_type_enum AS ENUM ('admin', 'aluno', 'professor');

CREATE SEQUENCE student_enrollment START 100000;
CREATE SEQUENCE teacher_enrollment START 200000;

CREATE TABLE users
(
  pk_enrollment integer NOT NULL,
  user_type user_type_enum NOT NULL,
  email character varying(50) UNIQUE NOT NULL,
  hash character varying(50) NOT NULL,
  name character varying(100) NOT NULL,
  address character varying(150) NOT NULL,
  phone character varying(15) NOT NULL,
  CONSTRAINT pkey_users PRIMARY KEY (pk_enrollment)
);

CREATE TABLE classes
(
  pk_class_name character varying(20) NOT NULL,
  total_students integer NOT NULL,
  total_subjects integer NOT NULL,
  is_active boolean NOT NULL,
  CONSTRAINT pkey_classes PRIMARY KEY (pk_class_name),
  CONSTRAINT valid_total_students CHECK (total_students > 0),
  CONSTRAINT valid_total_subjects CHECK (total_subjects > 0)
);

CREATE TABLE classes_students
(
  ref_class_name character varying(20) NOT NULL,
  fk_student_enrollment integer NOT NULL
);

CREATE TABLE classes_subjects
(
  ref_class_name character varying(20) NOT NULL,
  cpk_subject_name character varying(30) NOT NULL,
  cpk_teacher_enrollment integer NOT NULL,
  CONSTRAINT pkey_classes_subjects PRIMARY KEY (cpk_subject_name, cpk_teacher_enrollment)
);

CREATE TYPE task_type_enum AS ENUM ('atividade','prova');

CREATE SEQUENCE task_sequence START 1;

CREATE TABLE tasks
(
  pk_task_number bigint NOT NULL,
  task_type task_type_enum NOT NULL,
  title character varying(50) NOT NULL,
  start_date timestamp NOT NULL,
  end_date timestamp NOT NULL,
  weight float NOT NULL,
  description character varying(500) NOT NULL,
  ref_subject_name character varying(30) NOT NULL,
  ref_subject_teacher_enrollment integer NOT NULL,
  CONSTRAINT pkey_tasks PRIMARY KEY (pk_task_number),
  CONSTRAINT check_valid_date_interval CHECK (start_date < end_date)
);

CREATE TABLE tasks_evaluations
(
  fk_task_number bigint NOT NULL,
  fk_student_enrollment integer NOT NULL,
  grade float NOT NULL,
  bimester integer NOT NULL,
  CONSTRAINT check_valid_grade CHECK (grade >= 0 and grade <= 10)
);

ALTER TABLE classes_students ADD CONSTRAINT fkey_students_classes_students FOREIGN KEY (fk_student_enrollment) REFERENCES users (pk_enrollment);

ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_tasks_tasks_evaluations FOREIGN KEY (fk_task_number) REFERENCES tasks (pk_task_number);
ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_students_tasks_evaluations FOREIGN KEY (fk_student_enrollment) REFERENCES users (pk_enrollment);

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