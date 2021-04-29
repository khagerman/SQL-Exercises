DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(15) UNIQUE,
    password VARCHAR(15),
  region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    content TEXT NOT NULL,
    region_id INTEGER NOT NULL REFERENCES regions,
    category_id INTEGER NOT NULL REFERENCES category,
    user INTEGER NOT NULL REFERENCES users,
 
);