CREATE TABLE requests (id SERIAL PRIMARY KEY, sender_id INT, space_id INT, status VARCHAR(11), message VARCHAR(280));

CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(30));

CREATE TABLE spaces (id SERIAL PRIMARY KEY, name_of_space VARCHAR(100), available BOOLEAN, user_id INT, description VARCHAR(240), price_per_night INT);