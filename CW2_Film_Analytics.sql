-- ============================================================
--  CW2 Film Analytics Database
--  MySQL / MariaDB compatible
-- ============================================================

-- Drop and recreate database
DROP DATABASE IF EXISTS film_analytics;
CREATE DATABASE film_analytics;
USE film_analytics;

-- ============================================================
--  TABLE CREATION
-- ============================================================

CREATE TABLE people (
    person_id   INT          PRIMARY KEY,
    first_name  VARCHAR(50)  NOT NULL,
    last_name   VARCHAR(50)  NOT NULL,
    gender      CHAR(1)      NOT NULL   -- 'M' or 'F'
);

CREATE TABLE movies (
    movie_id    INT            PRIMARY KEY,
    title       VARCHAR(200)   NOT NULL,
    year        INT            NOT NULL,
    runtime     INT            NOT NULL,  -- minutes
    rank        DECIMAL(3,1)   NOT NULL,
    votes       INT            NOT NULL
);

CREATE TABLE genres (
    genre_id    INT          PRIMARY KEY,
    genre_name  VARCHAR(50)  NOT NULL
);

CREATE TABLE movie_actors (
    movie_id    INT  NOT NULL,
    person_id   INT  NOT NULL,
    PRIMARY KEY (movie_id, person_id),
    FOREIGN KEY (movie_id)  REFERENCES movies(movie_id),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE movie_directors (
    movie_id    INT  NOT NULL,
    person_id   INT  NOT NULL,
    PRIMARY KEY (movie_id, person_id),
    FOREIGN KEY (movie_id)  REFERENCES movies(movie_id),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE movie_writers (
    movie_id    INT  NOT NULL,
    person_id   INT  NOT NULL,
    PRIMARY KEY (movie_id, person_id),
    FOREIGN KEY (movie_id)  REFERENCES movies(movie_id),
    FOREIGN KEY (person_id) REFERENCES people(person_id)
);

CREATE TABLE movie_genres (
    movie_id    INT  NOT NULL,
    genre_id    INT  NOT NULL,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id)  REFERENCES movies(movie_id),
    FOREIGN KEY (genre_id)  REFERENCES genres(genre_id)
);

-- ============================================================
--  DATA INSERTION
-- ============================================================

-- People
INSERT INTO people VALUES
(1,  'Maya',   'Stone',    'F'),
(2,  'Lila',   'Chen',     'F'),
(3,  'Sara',   'Okafor',   'F'),
(4,  'Nina',   'Patel',    'F'),
(5,  'Clara',  'Reed',     'F'),
(6,  'Ewan',   'McGregor', 'M'),
(7,  'Robert', 'Carlyle',  'M'),
(8,  'Jordan', 'Vale',     'M'),
(9,  'Noah',   'Price',    'M'),
(10, 'Liam',   'Hart',     'M'),
(11, 'Owen',   'Shaw',     'M'),
(12, 'Daniel', 'Frost',    'M');

-- Movies
INSERT INTO movies VALUES
(1,  'Shadow City',     1965, 142,  7.2,  8500),
(2,  'Desert Song',     1968, 118,  6.4,  4200),
(3,  'Iron Verdict',    1972, 130,  7.1, 12000),
(4,  'Silent Harbour',  1978, 165,  7.8, 15500),
(5,  'Pixel Dreams',    1981, 110,  8.0, 21000),
(6,  'Autumn Hearts',   1986, 121,  7.6, 12500),
(7,  'Broken Lines',    1991, 128,  8.7, 11800),
(8,  'Trainspotting',   1996,  94,  8.9, 25000),
(9,  'Midnight Mosaic', 1999, 138,  8.5, 16000),
(10, 'Studio Nights',   2001, 102,  7.9, 11200),
(11, 'Hidden Circuit',  2003, 149,  8.4, 14500),
(12, 'Nation at Dawn',  2005, 201,  7.3,  9800),
(13, 'Chasing Rain',    2007, 115,  8.3, 22000),
(14, 'No Man''s Voice', 2008, 133,  7.0,  3000),
(15, 'Council of Six',  2009, 125,  6.9,  5400);

-- Genres
INSERT INTO genres VALUES
(1,  'Thriller'),
(2,  'Crime'),
(3,  'Western'),
(4,  'Romance'),
(5,  'Action'),
(6,  'Mystery'),
(7,  'Sci-Fi'),
(8,  'Drama'),
(9,  'Fantasy'),
(10, 'Comedy'),
(11, 'War'),
(12, 'History'),
(13, 'Family'),
(14, 'Musical');

-- ============================================================
--  BRIDGE TABLE DATA
-- ============================================================

-- movie_actors
INSERT INTO movie_actors VALUES
-- Movie 1: Shadow City
(1, 1),(1, 2),(1, 8),
-- Movie 2: Desert Song
(2, 1),(2, 10),(2, 11),
-- Movie 3: Iron Verdict
(3, 8),(3, 11),(3, 12),
-- Movie 4: Silent Harbour
(4, 1),(4, 3),(4, 8),(4, 10),
-- Movie 5: Pixel Dreams
(5, 1),(5, 5),(5, 8),
-- Movie 6: Autumn Hearts
(6, 1),(6, 4),(6, 9),
-- Movie 7: Broken Lines
(7, 1),(7, 2),(7, 7),
-- Movie 8: Trainspotting
(8, 6),(8, 7),(8, 1),(8, 3),
-- Movie 9: Midnight Mosaic
(9, 1),(9, 6),(9, 4),(9, 11),
-- Movie 10: Studio Nights
(10, 6),(10, 7),(10, 1),(10, 5),
-- Movie 11: Hidden Circuit
(11, 8),(11, 1),(11, 2),(11, 12),
-- Movie 12: Nation at Dawn
(12, 3),(12, 4),(12, 10),
-- Movie 13: Chasing Rain
(13, 1),(13, 6),(13, 5),
-- Movie 14: No Man's Voice
(14, 1),(14, 2),(14, 9),
-- Movie 15: Council of Six
(15, 1),(15, 8),(15, 6),(15, 7),(15, 5);

-- movie_directors
INSERT INTO movie_directors VALUES
-- Movie 1: Shadow City
(1, 8),
-- Movie 2: Desert Song
(2, 9),
-- Movie 3: Iron Verdict
(3, 8),
-- Movie 4: Silent Harbour
(4, 8),
-- Movie 5: Pixel Dreams
(5, 8),
-- Movie 6: Autumn Hearts
(6, 5),
-- Movie 7: Broken Lines
(7, 1),
-- Movie 8: Trainspotting
(8, 11),
-- Movie 9: Midnight Mosaic
(9, 5),
-- Movie 10: Studio Nights
(10, 1),
-- Movie 11: Hidden Circuit
(11, 8),
-- Movie 12: Nation at Dawn
(12, 9),
-- Movie 13: Chasing Rain
(13, 1),
-- Movie 14: No Man's Voice
(14, 1),
-- Movie 15: Council of Six
(15, 8),(15, 1),(15, 9),(15, 5),(15, 11),(15, 12);

-- movie_writers
INSERT INTO movie_writers VALUES
-- Movie 1: Shadow City
(1, 8),
-- Movie 2: Desert Song
(2, 9),
-- Movie 3: Iron Verdict
(3, 12),
-- Movie 4: Silent Harbour
(4, 8),
-- Movie 5: Pixel Dreams
(5, 8),
-- Movie 6: Autumn Hearts
(6, 9),
-- Movie 7: Broken Lines
(7, 1),
-- Movie 8: Trainspotting
(8, 12),
-- Movie 9: Midnight Mosaic
(9, 5),
-- Movie 10: Studio Nights
(10, 1),
-- Movie 11: Hidden Circuit
(11, 8),
-- Movie 12: Nation at Dawn
(12, 9),
-- Movie 13: Chasing Rain
(13, 1),
-- Movie 14: No Man's Voice
(14, 12),
-- Movie 15: Council of Six
(15, 1),(15, 9);

-- movie_genres  (No entry for movie 14 as per brief)
INSERT INTO movie_genres VALUES
(1,  1),(1,  2),           -- Shadow City:     Thriller, Crime
(2,  3),(2,  4),           -- Desert Song:     Western, Romance
(3,  5),(3,  2),           -- Iron Verdict:    Action, Crime
(4,  6),(4,  1),           -- Silent Harbour:  Mystery, Thriller
(5,  7),                   -- Pixel Dreams:    Sci-Fi
(6,  4),(6,  8),           -- Autumn Hearts:   Romance, Drama
(7,  8),                   -- Broken Lines:    Drama
(8,  8),(8,  2),           -- Trainspotting:   Drama, Crime
(9,  9),                   -- Midnight Mosaic: Fantasy
(10, 10),                  -- Studio Nights:   Comedy
(11, 7),(11, 1),           -- Hidden Circuit:  Sci-Fi, Thriller
(12, 11),(12, 12),         -- Nation at Dawn:  War, History
(13, 13),(13, 14),         -- Chasing Rain:    Family, Musical
-- (14 - no genre)
(15, 5);                   -- Council of Six:  Action


-- ============================================================
--  15 COURSEWORK QUESTIONS
-- ============================================================

-- Q1: How many female actors are listed in the dataset?
-- (female people who appear in movie_actors)
SELECT COUNT(DISTINCT p.person_id) AS female_actor_count
FROM   people p
JOIN   movie_actors ma ON ma.person_id = p.person_id
WHERE  p.gender = 'F';

-- Q2: What is the length of the longest running film?
SELECT MAX(runtime) AS longest_runtime_minutes
FROM   movies;

-- Q3: How many movies have more than 5 directors?
SELECT COUNT(*) AS movies_with_more_than_5_directors
FROM (
    SELECT   movie_id
    FROM     movie_directors
    GROUP BY movie_id
    HAVING   COUNT(person_id) > 5
) AS sub;

-- Q4: Which movie has the most directors?
SELECT   m.title, COUNT(md.person_id) AS director_count
FROM     movies m
JOIN     movie_directors md ON md.movie_id = m.movie_id
GROUP BY m.movie_id, m.title
ORDER BY director_count DESC
LIMIT 1;

-- Q5: Sum the total votes for films in the genre Thriller.
SELECT SUM(m.votes) AS total_thriller_votes
FROM   movies m
JOIN   movie_genres mg ON mg.movie_id = m.movie_id
JOIN   genres g        ON g.genre_id  = mg.genre_id
WHERE  g.genre_name = 'Thriller';

-- Q6: How many movies star BOTH Ewan McGregor AND Robert Carlyle?
SELECT COUNT(*) AS movies_with_both
FROM (
    SELECT movie_id
    FROM   movie_actors ma
    JOIN   people p ON p.person_id = ma.person_id
    WHERE  (p.first_name = 'Ewan'   AND p.last_name = 'McGregor')
        OR (p.first_name = 'Robert' AND p.last_name = 'Carlyle')
    GROUP BY movie_id
    HAVING COUNT(DISTINCT ma.person_id) = 2
) AS sub;

-- Q7: How many directors have directed themselves as actors in a film MORE THAN 4 times?
SELECT COUNT(*) AS directors_self_acted_more_than_4
FROM (
    SELECT   md.person_id
    FROM     movie_directors md
    JOIN     movie_actors    ma ON ma.movie_id  = md.movie_id
                               AND ma.person_id = md.person_id
    GROUP BY md.person_id
    HAVING   COUNT(*) > 4
) AS sub;

-- Q8: Number of movies released per decade (1960-2009)
SELECT
    CASE
        WHEN year BETWEEN 1960 AND 1969 THEN '1960-69'
        WHEN year BETWEEN 1970 AND 1979 THEN '1970-79'
        WHEN year BETWEEN 1980 AND 1989 THEN '1980-89'
        WHEN year BETWEEN 1990 AND 1999 THEN '1990-99'
        WHEN year BETWEEN 2000 AND 2009 THEN '2000-2009'
    END AS decade,
    COUNT(*) AS movie_count
FROM  movies
WHERE year BETWEEN 1960 AND 2009
GROUP BY decade
ORDER BY decade;

-- Q9: How many movies have more female actors than male actors?
SELECT COUNT(*) AS movies_more_female_than_male
FROM (
    SELECT
        ma.movie_id,
        SUM(CASE WHEN p.gender = 'F' THEN 1 ELSE 0 END) AS female_count,
        SUM(CASE WHEN p.gender = 'M' THEN 1 ELSE 0 END) AS male_count
    FROM  movie_actors ma
    JOIN  people p ON p.person_id = ma.person_id
    GROUP BY ma.movie_id
    HAVING female_count > male_count
) AS sub;

-- Q10: Based on ratings with 10,000+ votes, what is the top movie genre
--      by average rank? (higher rank = better movie)
SELECT   g.genre_name, AVG(m.rank) AS avg_rank
FROM     genres g
JOIN     movie_genres mg ON mg.genre_id  = g.genre_id
JOIN     movies m        ON m.movie_id   = mg.movie_id
WHERE    m.votes >= 10000
GROUP BY g.genre_id, g.genre_name
ORDER BY avg_rank DESC
LIMIT 1;

-- Q11: Surname of any actors who have starred in 10 or more different film genres.
SELECT   p.last_name
FROM     people p
JOIN     movie_actors ma  ON ma.person_id = p.person_id
JOIN     movie_genres mg  ON mg.movie_id  = ma.movie_id
GROUP BY p.person_id, p.last_name
HAVING   COUNT(DISTINCT mg.genre_id) >= 10;

-- Q12: How many movies have an actor who also wrote AND directed that same movie?
SELECT COUNT(DISTINCT ma.movie_id) AS movies_triple_role
FROM   movie_actors    ma
JOIN   movie_directors md ON md.movie_id  = ma.movie_id
                          AND md.person_id = ma.person_id
JOIN   movie_writers   mw ON mw.movie_id  = ma.movie_id
                          AND mw.person_id = ma.person_id;

-- Q13: Which decade has the highest average ranked movies?
--      (return the first year of that decade)
SELECT   FLOOR(year / 10) * 10 AS decade_start,
         AVG(rank)              AS avg_rank
FROM     movies
GROUP BY decade_start
ORDER BY avg_rank DESC
LIMIT 1;

-- Q14: How many movies are missing a genre?
SELECT COUNT(*) AS movies_without_genre
FROM   movies m
WHERE  NOT EXISTS (
    SELECT 1
    FROM   movie_genres mg
    WHERE  mg.movie_id = m.movie_id
);

-- Q15: How many movies have a director who was also a writer for the film
--      AND is listed as an actor in movie_actors BUT did NOT act in that specific film?
SELECT COUNT(DISTINCT md.movie_id) AS qualifying_movies
FROM   movie_directors md
JOIN   movie_writers   mw ON mw.movie_id  = md.movie_id
                          AND mw.person_id = md.person_id
-- person IS an actor (exists somewhere in movie_actors)
JOIN   movie_actors    ma_any ON ma_any.person_id = md.person_id
-- but did NOT act in THIS movie
WHERE  NOT EXISTS (
    SELECT 1
    FROM   movie_actors ma_this
    WHERE  ma_this.movie_id  = md.movie_id
      AND  ma_this.person_id = md.person_id
);
