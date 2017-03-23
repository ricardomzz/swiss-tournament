-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

CREATE TABLE players(
  id serial PRIMARY KEY,
  name text
);

CREATE TABLE matches(
  id serial PRIMARY KEY,
  winner integer references players(id),
  loser integer references players(id)
);


CREATE VIEW wins AS
SELECT winner as id, count(winner)
from matches
group by winner;

CREATE VIEW losses AS
SELECT loser as id, count(loser)
from matches
group by loser;

--The standings view uses coalesce to ensure a value is always present
--if a player has no matche or no wins the expression coalesces to 0
CREATE VIEW standings AS
SELECT players.id, players.name,coalesce(wins.count,0) AS wins,
coalesce(wins.count,0)+coalesce(losses.count,0) AS matches
FROM players LEFT JOIN wins ON
 players.id = wins.id LEFT JOIN losses ON players.id = losses.id;
