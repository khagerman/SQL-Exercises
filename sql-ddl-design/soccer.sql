DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT NOT NULL,
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT  NOT NULL,
    team_id INTEGER REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE seasons 
(
id SERIAL PRIMARY KEY,
start_date DATE,
 end_date DATE
); 

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams,
    away_team_id INTEGER REFERENCES teams,
    date DATE,
     referee_id INTEGER REFERENCES referees,
    season_id INTEGER REFERENCES seasons
)
CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    match_id  INTEGER REFERENCES matches,
    winning_team_id INTEGER REFERENCES teams
);