CREATE TYPE user_type_enum AS ENUM ('admin', 'aluno', 'professor');

CREATE TABLE users
(
  enrollment integer UNIQUE NOT NULL,
  user_type user_type_enum NOT NULL,
  pk_email character varying(50) NOT NULL,
  password character varying(50) NOT NULL,
  name character varying(100) NOT NULL,
  address character varying(150) NOT NULL,
  phone character varying(15) NOT NULL,
  CONSTRAINT pkey_users PRIMARY KEY (pk_email)
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
  fk_class character varying(20) NOT NULL,
  fk_student integer NOT NULL,
  CONSTRAINT valid_fk_student CHECK (fk_student > 99999 and fk_student < 199999)
);

CREATE TABLE classes_subjects
(
  fk_class character varying(20) NOT NULL,
  cpk_subject_name character varying(30) NOT NULL,
  cpk_teacher integer NOT NULL,
  CONSTRAINT pkey_subjects PRIMARY KEY (cpk_subject_name, cpk_teacher),
  CONSTRAINT valid_cpk_teacher CHECK (cpk_teacher > 199999)
);

CREATE TABLE tasks
(
  pk_task_number bigint NOT NULL,
  start_date timestamp NOT NULL,
  end_date timestamp NOT NULL,
  weight float NOT NULL,
  description character varying(500) NOT NULL,
  cfk_subject_name character varying(30) NOT NULL,
  cfk_subject_teacher integer NOT NULL,
  CONSTRAINT pkey_tasks PRIMARY KEY (pk_task_number),
  CONSTRAINT check_valid_date_interval CHECK (start_date < end_date),
  CONSTRAINT valid_cfk_subject_teacher_task CHECK (cfk_subject_teacher > 199999)
);

CREATE TABLE tasks_evaluations
(
  fk_task bigint NOT NULL,
  fk_student integer NOT NULL,
  grade float,
  CONSTRAINT check_valid_grade CHECK (grade >= 0 and grade <= 10),
  CONSTRAINT valid_fk_student_evaluation CHECK (fk_student > 99999 and fk_student < 199999)
);

ALTER TABLE classes_students ADD CONSTRAINT fkey_classes_classes_students FOREIGN KEY (fk_class) REFERENCES classes (pk_class_name);
ALTER TABLE classes_students ADD CONSTRAINT fkey_students_classes_students FOREIGN KEY (fk_student) REFERENCES users (enrollment);

ALTER TABLE classes_subjects ADD CONSTRAINT fkey_classes_classes_subjects FOREIGN KEY (fk_class) REFERENCES classes (pk_class_name);

ALTER TABLE tasks ADD CONSTRAINT fkey_subjects FOREIGN KEY (cfk_subject_name, cfk_subject_teacher) REFERENCES classes_subjects (cpk_subject_name, cpk_teacher);

ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_tasks_tasks_evaluations FOREIGN KEY (fk_task) REFERENCES tasks (pk_task_number);
ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_students_tasks_evaluations FOREIGN KEY (fk_student) REFERENCES users (enrollment);

--INSERTS

-- Admin Insert
INSERT INTO users VALUES (
  1,
  'admin',
  'admin@dummy.email',
  'admin321',
  'Escola da Tia Renata',
  'SQN 215 Bloco J Nº 0 Ap. 107 Asa Norte Brasília Distrito Federal',
  '(61)1234-5678'
);