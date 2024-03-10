INSERT INTO
  users (first_name, last_name, username, password)
VALUES
  ("Claudine", "Gay", "claudine", "password"),
  ("Reid", "Hoffman", "reid", "password");

INSERT INTO
  universities (name, type, location, year)
VALUES
  (
    "Harvard University",
    "private Ivy League research university",
    "Cambridge, Massachusetts",
    "1636"
  );

INSERT INTO
  companies (name, industry, location)
VALUES
  ("LinkedIn", "technology", "Sunnyvale, California");

INSERT INTO
  users_schools (
    user_id,
    school_id,
    affiliation_start_date,
    affiliation_end_date,
    type_of_degree
  )
VALUES
  (1, 1, "1993-01-01", "1998-12-31", "PhD");

INSERT INTO
  users_companies (
    user_id,
    company_id,
    affiliation_start_date,
    affiliation_end_date,
    tittle
  )
VALUES
  (
    2,
    1,
    "2003-01-01",
    "2007-02-01",
    "CEO and Chairman"
  );