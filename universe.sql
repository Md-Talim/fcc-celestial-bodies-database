--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(15,2) NOT NULL,
    is_spiral boolean NOT NULL,
    description text,
    has_life boolean
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
    planet_id integer NOT NULL,
    description text,
    radius integer,
    is_round boolean,
    has_shine boolean,
    age numeric(10,2)
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
    name character varying NOT NULL,
    description text,
    star_id integer NOT NULL,
    has_life boolean,
    is_spiral boolean,
    distance_from_earth integer
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
-- Name: space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_object (
    space_object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    object_type character varying(50) NOT NULL,
    is_visible boolean NOT NULL,
    discovery_year integer,
    has_shine boolean
);


ALTER TABLE public.space_object OWNER TO freecodecamp;

--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_object_space_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_object_space_object_id_seq OWNER TO freecodecamp;

--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_object_space_object_id_seq OWNED BY public.space_object.space_object_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age numeric(10,2),
    is_main_sequence boolean NOT NULL,
    has_life boolean,
    description text
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
-- Name: space_object space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object ALTER COLUMN space_object_id SET DEFAULT nextval('public.space_object_space_object_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700.00, true, 'Our home galaxy containing the Solar System.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000.00, true, 'Nearest spiral galaxy to the Milky Way.', false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000.00, true, 'A member of the Local Group.', false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 76000.00, true, 'Known for its prominent spiral arms.', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 49000.00, false, 'Has a bright nucleus and a prominent dust lane.', false);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 14000.00, false, 'A satellite galaxy of the Milky Way.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth only natural satellite.', 1737, true, true, 4.53);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'A small, irregularly shaped moon of Mars.', 11, false, false, 4.50);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller and outermost moon of Mars.', 6, false, false, 4.50);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'The most volcanically active moon in the Solar System.', 1821, true, false, 4.50);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'An icy moon with a subsurface ocean.', 1560, true, true, 4.50);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the Solar System.', 2634, true, true, 4.50);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Heavily cratered and ancient surface.', 2410, true, false, 4.50);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'The only moon with a thick atmosphere.', 2575, true, false, 4.50);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'The second-largest moon of Saturn.', 764, true, false, 4.50);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'Famous for its two-tone coloration.', 734, true, false, 4.50);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'Covered in ice cliffs.', 561, true, false, 4.50);
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 'Highly eccentric orbit around Neptune.', 170, true, false, 4.50);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 'An icy moon with many craters.', 761, true, false, 4.50);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 'The largest moon of Uranus.', 789, true, false, 4.50);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'The darkest moon of Uranus.', 584, true, false, 4.50);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'The brightest moon of Uranus.', 578, true, false, 4.50);
INSERT INTO public.moon VALUES (17, 'Miranda', 7, 'Known for its bizarre, patchwork surface.', 235, true, false, 4.50);
INSERT INTO public.moon VALUES (18, 'Charon', 11, 'The largest moon of Pluto.', 606, true, false, 4.50);
INSERT INTO public.moon VALUES (19, 'Vulcanus', 10, 'A fictional moon of Kepler-22b.', 500, true, true, 2.00);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'Neptunes largest moon, orbits retrograde.', 1353, true, false, 4.50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The smallest planet in the Solar System.', 1, false, false, 77);
INSERT INTO public.planet VALUES (2, 'Venus', 'Known for its thick, toxic atmosphere.', 1, false, false, 41);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known planet with life.', 1, true, false, 0);
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red Planet, potential for past life.', 1, false, false, 78);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet with a massive storm.', 1, false, false, 628);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famous for its extensive ring system.', 1, false, false, 1275);
INSERT INTO public.planet VALUES (7, 'Uranus', 'An ice giant with a tilted rotation axis.', 1, false, false, 2721);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The farthest known planet in the Solar System.', 1, false, false, 4347);
INSERT INTO public.planet VALUES (9, 'Vulcan', 'A fictional planet near Sirius.', 2, false, false, 9);
INSERT INTO public.planet VALUES (10, 'Coruscant', 'A fictional city-covered planet.', 3, false, false, 0);
INSERT INTO public.planet VALUES (11, 'Proxima b', 'An exoplanet in the habitable zone.', 4, false, false, 4);
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 'A potentially habitable exoplanet.', 5, false, false, 600);


--
-- Data for Name: space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_object VALUES (1, 'Andromeda Galaxy', 'Galaxy', true, NULL, true);
INSERT INTO public.space_object VALUES (2, 'Black Hole M87', 'Black Hole', false, 2019, false);
INSERT INTO public.space_object VALUES (3, 'Voyager 1', 'Space Probe', false, 1977, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4.60, true, true, 'The star at the center of our Solar System.');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 0.24, true, false, 'The brightest star in the night sky.');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8.00, false, false, 'A red supergiant in the Orion constellation.');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 4.85, true, false, 'Part of the closest star system to the Sun.');
INSERT INTO public.star VALUES (5, 'Vega', 2, 0.45, true, false, 'A bright star in the constellation Lyra.');
INSERT INTO public.star VALUES (6, 'Antares', 1, 11.00, false, false, 'A red supergiant in the constellation Scorpius.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_object_space_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_object_space_object_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_object space_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_name_key UNIQUE (name);


--
-- Name: space_object space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_pkey PRIMARY KEY (space_object_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_start_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_start_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

