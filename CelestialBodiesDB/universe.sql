--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    has_life boolean DEFAULT false
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_holes_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_holes_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_holes_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_black_holes boolean DEFAULT true,
    has_life boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    number_of_moons integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_planets integer,
    description text,
    galaxy_id integer,
    distance_in_light_years numeric(4,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_holes_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Stagittarius A', 'The super massive black hole at the center of our galaxy', 1, false);
INSERT INTO public.black_hole VALUES (2, 'Gaia BH1', 'One of the closest blackholes. Its size is approximately 10 times the size of our solar system', 1, false);
INSERT INTO public.black_hole VALUES (3, 'Gaia H2', 'One of the closest black holes. Its size is approximately 10 times the size of our solar system', 1, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'The closest galaxy to ours', true, false);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Elliptical', 'The 2nd closest galaxy to ours', true, false);
INSERT INTO public.galaxy VALUES (4, 'Segue 1', 'Satellite of the Milky Way at a distance of 75 thousand light-years', true, false);
INSERT INTO public.galaxy VALUES (5, 'Sag DEG', 'Satellite of part of the Milky Way at a distance of 70 thousand light-years', true, false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Satellite of the Milky Way at a distance of 160 thousand light-years', true, false);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy we live in.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth''s moon', 'Earth''s single natural satelite', false, 2);
INSERT INTO public.moon VALUES (2, 'Deimos', 'Mars'' smallets moon. Orbital period: 30h', false, 5);
INSERT INTO public.moon VALUES (3, 'Phobos', 'Mars'' largest moon. Circles the planet three times a day', false, 5);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active world in the solar system, with lava fountains that are dozens of kilometers high', false, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 'Thought to have an iron core, a rocky mantle and an ocean of salty water that might be one of the best places to look for life beyond Earth', false, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in our solar system and the only moon with its own magnetic field', false, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The mosr heavily cratered object in our solar system', false, 6);
INSERT INTO public.moon VALUES (8, 'Ariel', 'Thought to consist of roughly equal amounts of water ice and silicate rock. CO2 has also been detected', false, 8);
INSERT INTO public.moon VALUES (9, 'Belinda', NULL, false, 8);
INSERT INTO public.moon VALUES (10, 'Bianca', NULL, false, 8);
INSERT INTO public.moon VALUES (11, 'Caliban', NULL, false, 8);
INSERT INTO public.moon VALUES (12, 'Cordelia', NULL, false, 8);
INSERT INTO public.moon VALUES (13, 'Cressida', NULL, false, 8);
INSERT INTO public.moon VALUES (14, 'Cupid', NULL, false, 8);
INSERT INTO public.moon VALUES (15, 'Desdemona', NULL, false, 8);
INSERT INTO public.moon VALUES (16, 'Despina', NULL, false, 9);
INSERT INTO public.moon VALUES (17, 'Galatea', NULL, false, 9);
INSERT INTO public.moon VALUES (18, 'Halimede', NULL, false, 9);
INSERT INTO public.moon VALUES (19, 'Hippocamp', NULL, false, 9);
INSERT INTO public.moon VALUES (20, 'Laomedeia', NULL, false, 9);
INSERT INTO public.moon VALUES (21, 'Larissa', NULL, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 'The one blue marble that holds all life known to exist so far.', true, 1, 2);
INSERT INTO public.planet VALUES (3, 'Mercury', 'The closest planet to the Sun', false, 0, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second closest planet to the Sun', false, 0, 2);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'A gas monster. The biggest plannet in our solar system', false, 95, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 'That one with the rings', false, 146, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Mostly known because of memes', false, 27, 2);
INSERT INTO public.planet VALUES (9, 'Neptune', 'The farthest planet from the sun. Poor pluto.', false, 14, 2);
INSERT INTO public.planet VALUES (5, 'Mars', 'The planet humans dream of colonizing', false, 2, 2);
INSERT INTO public.planet VALUES (12, 'TOI-1452b', '70% bigger than Earth and made up of 30% water, this exoplanet is considered a prime target for future atmospheric characterization. Orbits a red dwarf 100 light-years away.', false, 0, 8);
INSERT INTO public.planet VALUES (14, 'WASP-39 b', 'Officially named ''Bocaprins'', considered a ''hot Jupiter'', this exoplanet is known for having substantial amounts of water and CO2 in its atmosphere.', false, 0, 9);
INSERT INTO public.planet VALUES (15, 'WASP-103 b', 'THe first non-spherical exoplanet discovered, known as the rugby-ball planet. Scientists believe it was shapped by tidal forces', false, 0, 10);
INSERT INTO public.planet VALUES (16, 'TYC 8998-760-1 b', 'A gas giant with a companion planet. As a new planet, it radiates a glow that can be seen from ground-based telescopes', false, 0, 11);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'The Sun', 8, 'Our beautiful life-giver.', 1, 0.00);
INSERT INTO public.star VALUES (3, 'Alpha Centauri C', NULL, NULL, 1, 4.24);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', NULL, NULL, 1, 4.36);
INSERT INTO public.star VALUES (5, 'Alpha Centauri B', NULL, NULL, 1, 4.36);
INSERT INTO public.star VALUES (6, 'Bernard''s Star', NULL, NULL, 1, 6.00);
INSERT INTO public.star VALUES (7, 'WISE 0855-714', NULL, NULL, 1, 7.25);
INSERT INTO public.star VALUES (8, 'TOI-1452', NULL, 'A red dwarf 100 light years away. Belongs to the Draco Constellation', NULL, NULL);
INSERT INTO public.star VALUES (9, 'WASP-39', NULL, 'A start slightly smaller than the Sun situated in the constellation of Virgo, approximately 700 light-years from Earth.', NULL, NULL);
INSERT INTO public.star VALUES (10, 'WASP-103', NULL, 'A star slightly younger than the Sun, situated 1800 light-years away in the Hercules constellation.', NULL, NULL);
INSERT INTO public.star VALUES (11, 'TYC 8998-760-1', NULL, 'A young sun-like star situated in the constellation of Musca, at 310 light-years from Earth.', NULL, NULL);


--
-- Name: black_holes_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_holes_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 38, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_holes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_holes_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_holes_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

