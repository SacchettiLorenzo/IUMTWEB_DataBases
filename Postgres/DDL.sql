
BEGIN TRANSACTION ;

CREATE TABLE Movies(
    id INTEGER,
    name TEXT,
    tagline TEXT,
    description TEXT,
    minute INTEGER,
    rating FLOAT,
    link TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Actors(
    id SERIAL,
    name TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Actors_Movies(
    movie_id INTEGER,
    actor_id INTEGER,
    role TEXT,
    PRIMARY KEY (movie_id,actor_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT actor_fk FOREIGN KEY (actor_id)
        REFERENCES public.actors (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE Countries(
    id SERIAL,
    country TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Countries_Movies(
    movie_id INTEGER,
    country_id INTEGER,
    PRIMARY KEY (movie_id,country_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT country_fk FOREIGN KEY (country_id)
        REFERENCES public.countries (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE Crews(
    id SERIAL,
    name TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Crew_Movies(
    movie_id INTEGER,
    crew_id INTEGER,
    PRIMARY KEY (movie_id,crew_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT crew_fk FOREIGN KEY (crew_id)
        REFERENCES public.crews (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE Genres(
    id SERIAL,
    genre TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Genres_Movies(
    movie_id INTEGER,
    genre_id INTEGER,
    PRIMARY KEY (movie_id,genre_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT genre_fk FOREIGN KEY (genre_id)
        REFERENCES public.genres (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TYPE Language_Type AS ENUM ('Language', 'Primary language','Spoken language');

CREATE TABLE Languages(
    id SERIAL,
    type Language_Type,
    language TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Languages_Movies(
    movie_id INTEGER,
    language_id INTEGER,
    PRIMARY KEY (movie_id,language_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT language_fk FOREIGN KEY (language_id)
        REFERENCES public.languages (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TYPE Release_Type AS ENUM ('Theatrical', 'Digital', 'Physical', 'Premiere',
       'Theatrical limited', 'TV');

CREATE TABLE Releases(
    id SERIAL,
    country TEXT,
    date DATE,
    type Release_Type,
    rating TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Release_Movies(
    movie_id INTEGER,
    release_id INTEGER,
    PRIMARY KEY (movie_id,release_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT release_fk FOREIGN KEY (release_id)
        REFERENCES public.releases (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE Studios(
    id SERIAL,
    studio TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Studios_Movies(
    movie_id INTEGER,
    studio_id INTEGER,
    PRIMARY KEY (movie_id,studio_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT studio_fk FOREIGN KEY (studio_id)
        REFERENCES public.studios (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE Themes(
    id SERIAL,
    theme TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Themes_Movies(
    movie_id INTEGER,
    theme_id INTEGER,
    PRIMARY KEY (movie_id,theme_id),
    CONSTRAINT movie_fk FOREIGN KEY (movie_id)
        REFERENCES public.movies (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT theme_fk FOREIGN KEY (theme_id)
        REFERENCES public.themes (id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);


COMMIT;

ROLLBACK ;

