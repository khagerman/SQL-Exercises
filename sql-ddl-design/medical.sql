DROP DATABASE IF EXISTS  medical_db;

CREATE DATABASE medical_db;

\c medical_db

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
 first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birthday DATE, 
);

CREATE TABLE visit
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors,
  patient_id INTEGER REFERENCES patients,
  date DATE NOT NULL
);
CREATE TABLE disease
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  discription TEXT
);
CREATE TABLE diagnosis
(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visit ON DELETE NULL,
  disease_id INTEGER REFERENCES disease ON DELETE NULL,
  notes TEXT
);

INSERT INTO doctors
  (first_name, last_name, specialty)
VALUES
  ('Jane','Doe' 'Internal medicine');


INSERT INTO patients
  (first_name, last_name, birthday)
VALUES
  ('Bob', 'Smith', 1970-08-22),
  ('Susie', 'Johnson', 1980-11-22);

INSERT INTO visit
  (doctor_id, patient_id, date)
VALUES
  (1, 2, '2021-01-22');

INSERT INTO disease
  (name, discription)
VALUES
  ('Chicken Pox', 'A highly contagious viral infection causing an itchy, blister-like rash on the skin.'),
  ('Airplane ear', 'Airplane ear (ear barotrauma) is the stress on the eardrum that occurs when the air pressure in the middle ear and the air pressure in the environment are out of balance.');
INSERT INTO diagnosis
(visit_id, disease_id)
VALUES
(1, 2)
  