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