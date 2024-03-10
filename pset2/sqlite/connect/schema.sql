DROP TABLE IF EXISTS users_users;
DROP TABLE IF EXISTS users_schools;
DROP TABLE IF EXISTS users_companies;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS universities;
DROP TABLE IF EXISTS companies;

CREATE TABLE users (
  id INTEGER,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE universities (
  id INTEGER,
  name TEXT NOT NULL,
  type TEXT NOT NULL,
  location TEXT NOT NULL,
  year DATE NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE companies (
  id INTEGER,
  name TEXT NOT NULL,
  industry TEXT NOT NULL,
  location TEXT NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE users_users (
  id INTEGER,
  left_user_id INTEGER,
  right_user_id INTEGER,
  PRIMARY KEY(left_user_id, right_user_id),
  FOREIGN KEY(left_user_id) REFERENCES users(id),
  FOREIGN KEY(right_user_id) REFERENCES users(id)
);

CREATE TABLE users_schools (
  id INTEGER,
  user_id INTEGER,
  school_id INTEGER,
  affiliation_start_date DATE,
  affiliation_end_date DATE,
  type_of_degree TEXT,
  PRIMARY KEY(id),
  FOREIGN KEY(user_id) REFERENCES users(id),
  FOREIGN KEY(school_id) REFERENCES universities(id)
);

CREATE TABLE users_companies (
  id INTEGER,
  user_id INTEGER,
  company_id INTEGER,
  affiliation_start_date DATE,
  affiliation_end_date DATE,
  tittle TEXT,
  PRIMARY KEY(id)
);