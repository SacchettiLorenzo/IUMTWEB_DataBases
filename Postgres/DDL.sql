
BEGIN TRANSACTION ;

-- Tabella Movies
CREATE TABLE movies (
                        id SERIAL PRIMARY KEY,
                        name TEXT NOT NULL,
                        date DATE,
                        tagline TEXT,
                        description TEXT,
                        minute INT,
                        rating FLOAT
);

-- Tabella Actors
CREATE TABLE actors (
                        id SERIAL PRIMARY KEY,
                        name TEXT NOT NULL
);

-- Tabella Countries
CREATE TABLE countries (
                           id SERIAL PRIMARY KEY,
                           country TEXT NOT NULL
);

-- Tabella Crew
CREATE TABLE crew (
                      id SERIAL PRIMARY KEY,
                      name TEXT NOT NULL
);

-- Tabella Genres
CREATE TABLE genres (
                        id SERIAL PRIMARY KEY,
                        genre TEXT NOT NULL
);

-- Tabella Languages
CREATE TABLE languages (
                           id SERIAL PRIMARY KEY,
                           language TEXT NOT NULL
);

-- Tabella Themes
CREATE TABLE themes (
                        id SERIAL PRIMARY KEY,
                        theme TEXT NOT NULL
);

-- Tabella Studios
CREATE TABLE studios (
                         id SERIAL PRIMARY KEY,
                         studio TEXT NOT NULL
);

-- Tabella Actors_Movies (associazione Film-Attori)
CREATE TABLE actors_movies (
                               movie_id INTEGER,
                               actor_id INTEGER,
                               role TEXT,
                               PRIMARY KEY (movie_id, actor_id),
                               CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                   REFERENCES public.movies (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
                               CONSTRAINT actor_fk FOREIGN KEY (actor_id)
                                   REFERENCES public.actors (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION
);

-- Tabella Countries_Movies (associazione Film-Paesi)
CREATE TABLE countries_movies (
                                  movie_id INTEGER,
                                  country_id INTEGER,
                                  PRIMARY KEY (movie_id, country_id),
                                  CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                      REFERENCES public.movies (id)
                                      ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
                                  CONSTRAINT country_fk FOREIGN KEY (country_id)
                                      REFERENCES public.countries (id)
                                      ON DELETE NO ACTION
                                      ON UPDATE NO ACTION
);

-- Tabella Crew_Movies (associazione Film-Crew)
CREATE TABLE crew_movies (
                             movie_id INTEGER,
                             crew_id INTEGER,
                             role TEXT,
                             PRIMARY KEY (movie_id, crew_id),
                             CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                 REFERENCES public.movies (id)
                                 ON DELETE NO ACTION
                                 ON UPDATE NO ACTION,
                             CONSTRAINT crew_fk FOREIGN KEY (crew_id)
                                 REFERENCES public.crew (id)
                                 ON DELETE NO ACTION
                                 ON UPDATE NO ACTION
);

-- Tabella Genres_Movies (associazione Film-Generi)
CREATE TABLE genres_movies (
                               movie_id INTEGER,
                               genre_id INTEGER,
                               PRIMARY KEY (movie_id, genre_id),
                               CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                   REFERENCES public.movies (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
                               CONSTRAINT genre_fk FOREIGN KEY (genre_id)
                                   REFERENCES public.genres (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION
);

-- Tabella Languages_Movies (associazione Film-Lingue)
CREATE TABLE languages_movies (
                                  movie_id INTEGER,
                                  language_id INTEGER,
                                  type TEXT,
                                  PRIMARY KEY (movie_id, language_id),
                                  CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                      REFERENCES public.movies (id)
                                      ON DELETE NO ACTION
                                      ON UPDATE NO ACTION,
                                  CONSTRAINT language_fk FOREIGN KEY (language_id)
                                      REFERENCES public.languages (id)
                                      ON DELETE NO ACTION
                                      ON UPDATE NO ACTION
);

-- Tabella Themes_Movies (associazione Film-Temi)
CREATE TABLE themes_movies (
                               movie_id INTEGER,
                               theme_id INTEGER,
                               PRIMARY KEY (movie_id, theme_id),
                               CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                   REFERENCES public.movies (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION,
                               CONSTRAINT theme_fk FOREIGN KEY (theme_id)
                                   REFERENCES public.themes (id)
                                   ON DELETE NO ACTION
                                   ON UPDATE NO ACTION
);

-- Tabella Studios_Movies (associazione Film-Studi)
CREATE TABLE studios_movies (
                                movie_id INTEGER,
                                studio_id INTEGER,
                                PRIMARY KEY (movie_id, studio_id),
                                CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                    REFERENCES public.movies (id)
                                    ON DELETE NO ACTION
                                    ON UPDATE NO ACTION,
                                CONSTRAINT studio_fk FOREIGN KEY (studio_id)
                                    REFERENCES public.studios (id)
                                    ON DELETE NO ACTION
                                    ON UPDATE NO ACTION
);

-- Tabella Oscar_Awards
CREATE TABLE oscar_awards (
                              movie_id INTEGER,
                              year_film INT,
                              year_ceremony INT,
                              ceremony INT,
                              category TEXT,
                              person_name TEXT,
                              winner BOOLEAN,
                              PRIMARY KEY (movie_id, category, year_film),
                              CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                  REFERENCES public.movies (id)
                                  ON DELETE NO ACTION
                                  ON UPDATE NO ACTION
);

-- Tabella Rotten_Tomatoes
CREATE TABLE rotten_tomatoes (
                                 movie_id INTEGER,
                                 critic_name TEXT,
                                 top_critic BOOLEAN,
                                 publisher_name TEXT,
                                 review_type TEXT,
                                 review_score FLOAT,
                                 review_date DATE,
                                 review_content TEXT,
                                 PRIMARY KEY (movie_id, critic_name, review_date),
                                 CONSTRAINT movie_fk FOREIGN KEY (movie_id)
                                     REFERENCES public.movies (id)
                                     ON DELETE NO ACTION
                                     ON UPDATE NO ACTION
);


COMMIT;

ROLLBACK ;


SELECT * FROM movies LIMIT 10;

COPY movies (id, name, date, tagline, description, minute, rating)
FROM '/Users/federicosantorsola/Desktop/normalized_tables/movies.csv'
DELIMITER ','
CSV HEADER;
