DROP TABLE IF EXISTS detailed_table;
DROP TABLE IF EXISTS summary_table;

CREATE TABLE detailed_table (
    actor_id INT,
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    film_id INT,
    title VARCHAR(255),
    description TEXT,
    category_id INT,
    genre VARCHAR(25)
);

CREATE TABLE summary_table(
title VARCHAR(255) PRIMARY KEY,
first_name VARCHAR(45),
last_name VARCHAR(45),
genre VARCHAR(25)
);


