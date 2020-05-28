DROP TABLE castings;
DROP TABLE movies;
DROP TABLE stars;

CREATE TABLE movies (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(255)
);


CREATE TABLE stars (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

CREATE TABLE castings (
    id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(id) ON DELETE CASCADE,
    star_id INT REFERENCES stars(id) ON DELETE CASCADE,
    fee INT
);
