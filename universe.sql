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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    diameter numeric(4,1),
    number_of_stars integer NOT NULL,
    visible_to_naked_eye boolean NOT NULL,
    constellation text NOT NULL,
    name VARCHAR NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name VARCHAR,
    planet_name text,
    diameter integer NOT NULL,
    density integer
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
    name VARCHAR NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    gravity numeric(4,1) NOT NULL,
    distance_from_sun numeric(4,1) NOT NULL,
    number_of_moons integer NOT NULL,
    star_name text
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
    name VARCHAR,
    galaxy_name text,
    type text NOT NULL,
    colour text NOT NULL,
    visible_to_naked_eye boolean NOT NULL
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_planet_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'barred spiral', 106.0, 200, true, 'Sagittarius', 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 'spiral', 60.0, 40, true, 'Andromeda', 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'spiral', 60.0, 40, true, 'Triangulum', 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 'irregular', 14.0, 30, true, 'Dorado/Mensa', 'Large Magellanic');
INSERT INTO public.galaxy VALUES (5, 'dwarf irregular', 7.0, 3, true, 'Tucana/Hydrus', 'Small Magellanic Cloud');
INSERT INTO public.galaxy VALUES (6, 'peculiar', 50.0, 750, false, 'Virgo', 'Sombrero');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth', 3476, 3);
INSERT INTO public.moon VALUES (9, 'Deimos', 'Mars', 13, 0);
INSERT INTO public.moon VALUES (10, 'Amalthea', 'Mars', 200, 0);
INSERT INTO public.moon VALUES (11, 'Thebe', 'Mars', 90, 0);
INSERT INTO public.moon VALUES (12, 'Europa', 'Jupiter', 3138, 3);
INSERT INTO public.moon VALUES (13, 'Ganymede', 'Jupiter', 5262, 2);
INSERT INTO public.moon VALUES (14, 'Callisto', 'Jupiter', 5262, 2);
INSERT INTO public.moon VALUES (15, 'Hlmalta', 'Jupiter', 170, 0);
INSERT INTO public.moon VALUES (16, 'pan', 'Jupiter', 20, 0);
INSERT INTO public.moon VALUES (17, 'Atlas', 'Jupiter', 40, 0);
INSERT INTO public.moon VALUES (18, 'Prometheus', 'Jupiter', 80, 0);
INSERT INTO public.moon VALUES (19, 'Pandora', 'Jupiter', 100, 0);
INSERT INTO public.moon VALUES (20, 'Janus', 'Jupiter', 190, 0);
INSERT INTO public.moon VALUES (21, 'Epimetheus', 'Jupiter', 120, 0);
INSERT INTO public.moon VALUES (22, 'Mlmas', 'Jupiter', 394, 0);
INSERT INTO public.moon VALUES (23, 'Enceladus', 'Saturn', 504, 1);
INSERT INTO public.moon VALUES (24, 'Tethys', 'Saturn', 1048, 0);
INSERT INTO public.moon VALUES (25, 'Dione', 'Saturn', 1120, 1);
INSERT INTO public.moon VALUES (26, 'Rhea', 'Saturn', 1530, 1);
INSERT INTO public.moon VALUES (27, 'Titan', 'Saturn', 5150, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 4879, 3.7, 57.9, 0, 'Sun');
INSERT INTO public.planet VALUES ('Venus', 2, 12104, 8.9, 108.2, 0, 'Sun');
INSERT INTO public.planet VALUES ('Earth', 3, 12756, 9.8, 149.6, 1, 'Sun');
INSERT INTO public.planet VALUES ('Mars', 4, 6792, 3.7, 228.0, 2, 'Sun');
INSERT INTO public.planet VALUES ('Jupiter', 5, 142984, 23.1, 778.5, 92, 'Sun');
INSERT INTO public.planet VALUES ('Saturn', 6, 120536, 9.0, 142.0, 83, 'Sun');
INSERT INTO public.planet VALUES ('Uranus', 7, 51118, 8.7, 287.0, 27, 'Sun');
INSERT INTO public.planet VALUES ('Neptune', 8, 49528, 11.0, 455.0, 14, 'Sun');
INSERT INTO public.planet VALUES ('Pluto', 9, 2376, 0.7, 596.4, 5, 'Sun');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 'Milky Way', 'Red Supergiant', 'Red', true);
INSERT INTO public.star VALUES (2, 'Sirius', 'Milky Way', 'White Dwarf', 'Blue', true);
INSERT INTO public.star VALUES (3, 'Antares', 'Milky Way', 'Red Dwarf', 'Red', true);
INSERT INTO public.star VALUES (4, 'Arcturus', 'Milky Way', 'Red Dwarf', 'Red', true);
INSERT INTO public.star VALUES (5, 'Procyon', 'Milky Way', 'White Supergiant', 'White', true);
INSERT INTO public.star VALUES (6, 'Vega', 'Milky Way', 'White Dwarf', 'White', true);
INSERT INTO public.star VALUES (7, 'Sun', 'Milky Way', 'Yellow Dwarf', 'Yellow', true);


--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 9, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_name_key2; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key2 UNIQUE (name);


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
-- Name: moon moon_planet_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_name_fkey FOREIGN KEY (planet_name) REFERENCES public.planet(name);


--
-- Name: planet planet_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_name_fkey FOREIGN KEY (star_name) REFERENCES public.star(name);


--
-- Name: star star_galaxy_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_name_fkey FOREIGN KEY (galaxy_name) REFERENCES public.galaxy(name);


--
-- PostgreSQL database dump complete
--
