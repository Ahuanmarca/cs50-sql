PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE passengers (
    id INTEGER,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    birth DATE NOT NULL,
    PRIMARY KEY (id)
);
INSERT INTO passengers VALUES(1,'Amelia','Earhart',1984);
INSERT INTO passengers VALUES(2,'John','Doe',1978);
INSERT INTO passengers VALUES(3,'Barbara','Morrison',1992);
INSERT INTO passengers VALUES(4,'Christina','Rosenvinge',1970);
CREATE TABLE check_ins (
  id INTEGER,
  passenger_id INTEGER NOT NULL,
  date_time DATETIME NOT NULL,
  flight_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (passenger_id) REFERENCES passengers (id),
  FOREIGN KEY (flight_id) REFERENCES flights (id)
);
INSERT INTO check_ins VALUES(1,1,'2023-08-03 15:03:00',1);
CREATE TABLE airlines (
  id INTEGER,
  name TEXT NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO airlines VALUES(1,'Delta');
CREATE TABLE concourses (
  id INTEGER,
  concourse TEXT CHECK(concourse IN("A", "B", "C", "D", "E", "F", "T")),
  PRIMARY KEY (id)
);
INSERT INTO concourses VALUES(1,'A');
INSERT INTO concourses VALUES(2,'B');
INSERT INTO concourses VALUES(3,'C');
INSERT INTO concourses VALUES(4,'D');
INSERT INTO concourses VALUES(5,'E');
INSERT INTO concourses VALUES(6,'F');
INSERT INTO concourses VALUES(7,'T');
CREATE TABLE airlines_concourses (
  airline_id INTEGER,
  concourse_id INTEGER,
  PRIMARY KEY (airline_id, concourse_id),
  FOREIGN KEY (airline_id) REFERENCES airlines (id),
  FOREIGN KEY (concourse_id) REFERENCES concourses (id)
);
INSERT INTO airlines_concourses VALUES(1,1);
INSERT INTO airlines_concourses VALUES(1,2);
INSERT INTO airlines_concourses VALUES(1,3);
INSERT INTO airlines_concourses VALUES(1,4);
INSERT INTO airlines_concourses VALUES(1,5);
INSERT INTO airlines_concourses VALUES(1,6);
INSERT INTO airlines_concourses VALUES(1,7);
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
INSERT INTO flights VALUES(1,'300',1,'ATL','BOS','2023-08-03 18:46:00','2023-08-03 21:09:00');
CREATE TABLE airports (
  id INTEGER,
  name TEXT NOT NULL,
  code TEXT NOT NULL UNIQUE,
  country_code TEXT,
  PRIMARY KEY (id)
);
INSERT INTO airports VALUES(1,'Logan International Airport','BOS',NULL);
INSERT INTO airports VALUES(2,'Hartsfield-jackson Atlanta International Airport','ATL',NULL);
COMMIT;
