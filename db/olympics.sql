DROP TABLE events;
DROP TABLE event_registers;
DROP TABLE athletes;
DROP TABLE nations;

CREATE TABLE nations(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  acronym VARCHAR( 3 ),
  flag VARCHAR( 510 )
);

CREATE TABLE athletes(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  nation_id INT4 REFERENCES nations( id ) ON DELETE CASCADE
);

CREATE TABLE events(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  gold_athlete_id INT4 REFERENCES athletes( id ) ON DELETE CASCADE,
  silver_athlete_id INT4 REFERENCES athletes( id ) ON DELETE CASCADE,
  bronze_athlete_id INT4 REFERENCES athletes( id ) ON DELETE CASCADE
);

CREATE TABLE event_registers(
  id SERIAL4 PRIMARY KEY,
  athlete_id INT4 REFERENCES athletes( id ) ON DELETE CASCADE,
  event_id INT4 REFERENCES athletes( id ) ON DELETE CASCADE
);
