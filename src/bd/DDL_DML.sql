CREATE TYPE user_type_enum AS ENUM ('admin', 'aluno', 'professor');

CREATE TABLE users
(
  enrollment integer UNIQUE NOT NULL,
  user_type user_type_enum NOT NULL,
  pk_email character varying(50) NOT NULL,
  hashed_pass character varying(50) NOT NULL,
  name character varying(100) NOT NULL,
  age integer NOT NULL,
  address character varying(150) NOT NULL,
  phone character varying(15) NOT NULL,
  CONSTRAINT pkey_users PRIMARY KEY (pk_email)
);

CREATE TABLE subjects
(
  cpk_name character varying(20) NOT NULL,
  cpk_teacher integer NOT NULL,
  CONSTRAINT pkey_subjects PRIMARY KEY (cpk_name, cpk_teacher)
);

CREATE TABLE classes
(
  pk_name character varying(20) NOT NULL,
  total_students integer NOT NULL,
  total_subjects integer NOT NULL,
  is_active boolean NOT NULL,
  CONSTRAINT pkey_classes PRIMARY KEY (pk_name),
  CONSTRAINT valid_total_students CHECK (total_students > 0),
  CONSTRAINT valid_total_subjects CHECK (total_subjects > 0)
);

CREATE TABLE classes_students
(
  fk_class character varying(20) NOT NULL,
  fk_student integer NOT NULL
);

CREATE TABLE classes_subjects
(
  fk_class character varying(20) NOT NULL,
  cfk_subject_name character varying(20) NOT NULL,
  cfk_subject_teacher character varying(20) NOT NULL
);

CREATE TABLE tasks
(
  pk_number bigint NOT NULL,
  start_date timestamp NOT NULL,
  end_date timestamp NOT NULL,
  weight float NOT NULL,
  description character varying(500) NOT NULL,
  cfk_subject_name character varying(20) NOT NULL,
  cfk_subject_teacher character varying(20) NOT NULL,
  CONSTRAINT pkey_tasks PRIMARY KEY (pk_number),
  CONSTRAINT check_valid_date_interval CHECK (start_date < end_date)
);

CREATE TABLE tasks_evaluations
(
  fk_task bigint NOT NULL,
  fk_student character varying(50) NOT NULL,
  grade float,
  CONSTRAINT check_valid_grade CHECK (grade >= 0 and grade <= 10)
);

ALTER TABLE classes_students ADD CONSTRAINT fkey_classes FOREIGN KEY (fk_class) REFERENCES classes (pk_name);
ALTER TABLE classes_students ADD CONSTRAINT fkey_students FOREIGN KEY (fk_student) REFERENCES users (pk_email);

ALTER TABLE classes_subjects ADD CONSTRAINT fkey_classes FOREIGN KEY (fk_class) REFERENCES classes (pk_name);
ALTER TABLE classes_subjects ADD CONSTRAINT fkey_subjects FOREIGN KEY (cfk_subject_name, cfk_subject_teacher) REFERENCES subjects (cpk_name, cpk_teacher);

ALTER TABLE tasks ADD CONSTRAINT fkey_subjects FOREIGN KEY (cfk_subject_name, cfk_subject_teacher) REFERENCES subjects (cpk_name, cpk_teacher);

ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_tasks FOREIGN KEY (fk_student) REFERENCES tasks (pk_number);
ALTER TABLE tasks_evaluations ADD CONSTRAINT fkey_students FOREIGN KEY (fk_student) REFERENCES users (pk_email);

CREATE FUNCTION check_if_user_is_student() RETURNS trigger AS $check_if_user_is_student$

    BEGIN

        IF NEW.fk_student != 'aluno' THEN
            RAISE EXCEPTION 'o usuario desta coluna deve ser um aluno!';
        END IF;

        RETURN NEW;
		
    END;
	
$check_if_user_is_student$ LANGUAGE plpgsql;

CREATE TRIGGER check_if_user_is_student BEFORE INSERT OR UPDATE ON tasks_evaluations FOR EACH ROW EXECUTE PROCEDURE check_if_user_is_student();

CREATE TRIGGER check_if_user_is_student BEFORE INSERT OR UPDATE ON classes_students FOR EACH ROW EXECUTE PROCEDURE check_if_user_is_student();

--INSERTS

-- Admin Insert
INSERT INTO users VALUES (
  1,
  'admin',
  'admin@dummy.email',
  '',
  'Escola da Tia Renata',
  20,
  'SQN 215 Bloco J Nº 0 Ap. 107 Asa Norte Brasília Distrito Federal',
  '(61)1234-5678'
);
