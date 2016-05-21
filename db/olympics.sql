DROP TABLE events;
DROP TABLE event_registers;
DROP TABLE athletes;
DROP TABLE nations;

CREATE TABLE nations(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  flag VARCHAR( 255 )
);

CREATE TABLE athletes(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  nation_id INT4 REFERENCES nations( id )
);

CREATE TABLE events(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR( 255 ),
  gold_athlete_id INT4 REFERENCES athletes( id ),
  silver_athlete_id INT4 REFERENCES athletes( id ),
  bronze_athlete_id INT4 REFERENCES athletes( id )
);

CREATE TABLE event_registers(
  id SERIAL4 PRIMARY KEY,
  athlete_id INT4 REFERENCES athletes( id ),
  event_id INT4 REFERENCES athletes( id )
);
