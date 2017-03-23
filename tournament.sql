-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP TABLE IF EXISTS players;
DROP TABLE IF EXISTS matches;
DROP TABLE IF EXISTS standings;
DROP TABLE IF EXISTS pairings;

CREATE TABLE players(
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE matches(
  id serial PRIMARY KEY,
  winner integer references players(id),
  loser integer references players(id)
);
