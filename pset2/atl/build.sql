-- Drop tables with foreign keys first
DROP TABLE IF EXISTS check_ins;
DROP TABLE IF EXISTS airlines_concourses;
DROP TABLE IF EXISTS flights;
DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS concourses;
DROP TABLE IF EXISTS airports;

CREATE TABLE passengers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE check_ins (
  id INTEGER,
  passenger_id INTEGER NOT NULL,
  date_time DATETIME NOT NULL,
  flight_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (passenger_id) REFERENCES passengers (id),
  FOREIGN KEY (flight_id) REFERENCES flights (id)
);

CREATE TABLE airlines (
  id INTEGER,
  name TEXT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE concourses (
  id INTEGER,
  concourse TEXT CHECK(concourse IN("A", "B", "C", "D", "E", "F", "T")),
  PRIMARY KEY (id)
);

CREATE TABLE airlines_concourses (
  airline_id INTEGER,
  concourse_id INTEGER,
  PRIMARY KEY (airline_id, concourse_id),
  FOREIGN KEY (airline_id) REFERENCES airlines (id),
  FOREIGN KEY (concourse_id) REFERENCES concourses (id)
);

CREATE TABLE flights (
  id INTEGER,
  flight_number TEXT NOT NULL,
  airline_id INTEGER NOT NULL,
  departing_airport_code TEXT NOT NULL,
  arriving_airport_code TEXT NOT NULL,
  departure DATETIME,
  arrival DATETIME,
  PRIMARY KEY (id),
  FOREIGN KEY (airline_id) REFERENCES airlines (id),
  FOREIGN KEY (departing_airport_code) REFERENCES airports (code),
  FOREIGN KEY (arriving_airport_code) REFERENCES airports (code)
);

CREATE TABLE airports (
  id INTEGER,
  name TEXT NOT NULL,
  code TEXT NOT NULL UNIQUE,
  country_code TEXT,
  PRIMARY KEY (id)
);
DELETE FROM passengers;
DELETE FROM airlines;
DELETE FROM concourses;
DELETE FROM airlines_concourses;
DELETE FROM airports;
DELETE FROM flights;
DELETE FROM check_ins;

INSERT INTO
  passengers (first_name, last_name, birth)
VALUES
  ("Amelia", "Earhart", "1984"),
  ("John", "Doe", "1978"),
  ("Barbara", "Morrison", "1992"),
  ("Christina", "Rosenvinge", "1970");

INSERT INTO
  airlines (name)
VALUES
  ("Delta");

INSERT INTO
  concourses (concourse)
VALUES
  ("A"),
  ("B"),
  ("C"),
  ("D"),
  ("E"),
  ("F"),
  ("T");

INSERT INTO
  airlines_concourses (airline_id, concourse_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7);

INSERT INTO
  airports (name, code)
VALUES
  ("Logan International Airport", "BOS"),
  (
    "Hartsfield-jackson Atlanta International Airport",
    "ATL"
  );

INSERT INTO
  flights (
    flight_number,
    airline_id,
    departing_airport_code,
    arriving_airport_code,
    departure,
    arrival
  )
VALUES
  (
    300,
    1,
    "ATL",
    "BOS",
    "2023-08-03 18:46:00",
    "2023-08-03 21:09:00"
  );

INSERT INTO
  check_ins (passenger_id, date_time, flight_id)
VALUES
  (1, "2023-08-03 15:03:00", 1);