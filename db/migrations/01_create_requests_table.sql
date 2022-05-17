CREATE TABLE requests (id SERIAL PRIMARY KEY, sender_id INT, space_name VARCHAR(255), space_id INT, approved BOOLEAN, message VARCHAR(280));
