\c nc_flix

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_slug VARCHAR(255) ,
    decscription VARCHAR(255) NOT NULL
);

INSERT INTO genres (genre_slug, decscription)
VALUES 
('family', 'Fun for everyone!'),
('comedy', 'A giggle a minute'),
('romance', 'I feel it in my fingers, I feel it in my toes'),
('fantasy', 'There be elves and witches'),
('action', 'Shooty shooty, punchy punchy'),
('drama', 'Plot driven story time'),
('crime', 'Watch out, there''s gangsters about'),
('sci_fi', 'Your scientists were so preoccupied with whether they could...');

SELECT * FROM genres; 


-- JUNCTION TABLE
CREATE TABLE movie_genres (
    movie_genres_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id)
);

INSERT INTO movie_genres
  (movie_id, genre_id)
VALUES
  (1, 1),  
  (2, 2), 
  (3, 3),
  (3, 1),
  (4, 3),
  (5, 3),
  (6, 3),
  (7, 3),
  (7, 1),  
  (7, 4),
  (8, 3),
  (9, 3),
  (10, 2),
  (11, 3),
  (11, 1),
  (11, 5),
  (12, 3),
  (13, 3),
  (14, 3),
  (15, 3),
  (16, 3),
  (16, 2),
  (17, 3),
  (18, 3),
  (19, 3),
  (19, 6),
  (20, 3),
  (21, 3),
  (22, 3),
  (22, 7),
  (22, 8),
  (23, 3),
  (24, 3),
  (25, 3) ;

SELECT title, genre_slug FROM movie_genres
JOIN movies ON movie_genres.movie_id = movies.movie_id
JOIN genres ON movie_genres.genre_id = genres.genre_id;


/* SELECT * FROM northcoders_skills
JOIN northcoders ON northcoders_skills.northcoder_id = northcoders.northcoder_id
JOIN skills ON northcoders_skills.skill_id = skills.skill_id; */

/* Movies can often be associated with more than one genre. Create a many to many relationship between the genres table and the movies using a junction table.

Insert some data about the film genres. Feel free to use the information in the table below: */