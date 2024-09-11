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
    name character varying(60) NOT NULL,
    plan_w_civil integer,
    diameter numeric(20,3),
    info text,
    visited boolean,
    colonised boolean
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
    name character varying(60),
    types_minerals integer,
    age numeric(12,3),
    info text,
    visited boolean,
    colonised boolean,
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
    name character varying(60),
    moons integer,
    age numeric(12,3),
    info text,
    visited boolean,
    colonised boolean,
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(100),
    cant_planets integer,
    age numeric(12,3),
    info text,
    visited boolean,
    colonised boolean
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    planets integer,
    age numeric(12,3),
    info text,
    visited boolean,
    colonised boolean,
    galaxy_id integer NOT NULL
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 3, 100000.000, 'Our galaxy with a few known planets with civilizations.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5, 220000.000, 'Our neighboring galaxy with possible civilizations.', false, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 0, 50000.000, 'A galaxy known for its unique shape, no known civilizations.', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 2, 76000.000, 'A spiral galaxy with at least two planets with civilizations.', true, false);
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 1, 90000.000, 'A galaxy that is relatively close, known to have one planet with civilization.', false, false);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 4, 60000.000, 'An elliptical galaxy with several planets hosting civilizations.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 5, 4500.000, 'Earths only natural satellite, with varied geology.', true, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 4500.000, 'One of Mars two moons, with a reddish surface.', true, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 4500.000, 'Mars smaller moon, with a smooth surface.', true, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 10, 4500.000, 'One of Jupiters moons, known for its volcanic activity.', true, false, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 7, 4500.000, 'A moon of Jupiter with a possible subsurface ocean.', true, false, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6, 4500.000, 'The largest moon in the solar system, orbiting Jupiter.', true, false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 8, 4500.000, 'Jupiters moon with an old and heavily cratered surface.', true, false, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 9, 4600.000, 'Saturns largest moon, with a thick atmosphere and liquid lakes.', true, false, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 4600.000, 'A moon of Saturn with a heavily cratered surface.', true, false, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 4600.000, 'A small moon of Saturn with geysers and a subsurface ocean.', true, false, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 4500.000, 'Neptunes largest moon, known for its retrograde orbit.', false, false, 8);
INSERT INTO public.moon VALUES (12, 'Nereid', 3, 4500.000, 'A moon of Neptune with a highly eccentric orbit.', false, false, 8);
INSERT INTO public.moon VALUES (13, 'Charon', 7, 4500.000, 'Plutos largest moon, with a large, cratered surface.', false, false, 9);
INSERT INTO public.moon VALUES (14, 'Hydra', 2, 4500.000, 'One of Plutos smaller moons, discovered in 2005.', false, false, 9);
INSERT INTO public.moon VALUES (15, 'Nix', 3, 4500.000, 'A small moon of Pluto, discovered in 2005.', false, false, 9);
INSERT INTO public.moon VALUES (16, 'Ceres I', 4, 4600.000, 'A moon of the dwarf planet Ceres, rich in minerals.', false, false, 10);
INSERT INTO public.moon VALUES (17, 'Ceres II', 5, 4600.000, 'Another moon of Ceres with significant geological features.', false, false, 10);
INSERT INTO public.moon VALUES (18, 'Eris I', 6, 5500.000, 'A moon of Eris with a rocky, cratered surface.', false, false, 11);
INSERT INTO public.moon VALUES (19, 'Eris II', 7, 5500.000, 'A smaller moon of Eris with a smooth surface.', false, false, 11);
INSERT INTO public.moon VALUES (20, 'Ganymedes', 8, 4600.000, 'A moon of Jupiter with a strong magnetic field and ice-covered surface.', true, false, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 4500.000, 'Closest planet to the Sun with no moons.', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 4600.000, 'Hot and hostile planet with thick atmosphere.', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4543.000, 'The only known planet with life, home to humans.', true, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 4500.000, 'The red planet with possibilities for colonization.', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 4600.000, 'The largest planet in the solar system, a gas giant.', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 4600.000, 'Known for its beautiful ring system, a gas giant.', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 4500.000, 'An ice giant that rotates on its side.', false, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 4500.000, 'The farthest planet in the Solar System, a cold ice giant.', false, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 0, 4500.000, 'A potentially habitable exoplanet orbiting Proxima Centauri.', false, false, 5);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', 1, 5500.000, 'A rocky exoplanet orbiting Alpha Centauri B.', false, false, 2);
INSERT INTO public.planet VALUES (11, 'Sirius Bc', 2, 200.000, 'A small planet orbiting the brightest star, Sirius.', false, false, 3);
INSERT INTO public.planet VALUES (12, 'Sirius Ad', 3, 201.000, 'A gas planet with massive storms, orbiting Sirius.', false, false, 3);
INSERT INTO public.planet VALUES (13, 'Vega Prime', 3, 400.000, 'A young, vibrant planet with the potential for life in Vega system.', true, true, 6);
INSERT INTO public.planet VALUES (14, 'Vega Alpha', 2, 450.000, 'An icy planet with two moons, orbiting Vega.', true, false, 6);
INSERT INTO public.planet VALUES (15, 'Betelgeuse A', 0, 8000.000, 'A massive gas planet orbiting the dying Betelgeuse star.', false, false, 4);
INSERT INTO public.planet VALUES (16, 'Betelgeuse B', 1, 7999.000, 'A lone moon orbiting a mysterious planet in the Betelgeuse system.', false, false, 4);
INSERT INTO public.planet VALUES (17, 'Centauri Zeta', 2, 5500.000, 'A small planet with two moons in the Alpha Centauri system.', false, false, 2);
INSERT INTO public.planet VALUES (18, 'Gliese 581g', 0, 7700.000, 'A potentially habitable planet in the Gliese system.', false, false, 2);
INSERT INTO public.planet VALUES (19, 'Barnard b', 0, 7500.000, 'A cold super-Earth exoplanet orbiting Barnard star.', false, false, 2);
INSERT INTO public.planet VALUES (20, 'Kepler-22b', 1, 6000.000, 'A possible water world orbiting within its star habitable zone.', false, false, 5);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 1, 'Solar System', 8, 4600.000, 'Our home solar system in the Milky Way.', true, false);
INSERT INTO public.solar_system VALUES (2, 2, 2, 'Alpha Centauri System', 1, 5500.000, 'A system with Alpha Centauri as the main star in Andromeda galaxy.', false, false);
INSERT INTO public.solar_system VALUES (3, 3, 3, 'Sirius System', 2, 200.000, 'The system around the brightest star in the night sky, located in the Sombrero galaxy.', false, false);
INSERT INTO public.solar_system VALUES (4, 4, 4, 'Betelgeuse System', 0, 8000.000, 'A dying star system with no known planets in the Whirlpool galaxy.', true, false);
INSERT INTO public.solar_system VALUES (5, 5, 2, 'Proxima Centauri System', 1, 4500.000, 'Part of the Alpha Centauri system with one known planet in the Andromeda galaxy.', false, false);
INSERT INTO public.solar_system VALUES (6, 6, 5, 'Vega System', 3, 455.000, 'A relatively young system with three known planets in Messier 81 galaxy, potentially colonizable.', true, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 8, 4600.000, 'The star at the center of our solar system.', true, false, 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 5500.000, 'A star system closest to our solar system, has one known planet.', false, false, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 200.000, 'The brightest star in the night sky with two known planets.', false, false, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 0, 8000.000, 'A red supergiant star nearing the end of its life, no known planets.', true, false, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4500.000, 'Part of the Alpha Centauri system with one known planet.', false, false, 2);
INSERT INTO public.star VALUES (6, 'Vega', 3, 455.000, 'A relatively young star with three known planets, potential for colonization.', true, true, 5);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: solar_system unique_solar_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT unique_solar_system_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

