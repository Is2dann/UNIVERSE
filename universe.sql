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
-- Name: earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth (
    earth_id character varying(10) NOT NULL,
    description text NOT NULL,
    distance_from_sun numeric,
    name character varying(10)
);


ALTER TABLE public.earth OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text NOT NULL
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
    planet_id integer,
    name character varying(30),
    distance_from_earth numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    description text NOT NULL
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
    star_id integer,
    name character varying(30),
    distance_from_earth numeric,
    has_life boolean,
    age_in_millions_of_years integer,
    description text NOT NULL
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
    galaxy_id integer,
    name character varying(30),
    distance_from_earth numeric,
    age_in_millions_of_years integer,
    description text NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth VALUES ('Earth', 'Our home planet', 149.6, NULL);
INSERT INTO public.earth VALUES ('Venus', 'Second planet from Sun', 108.2, NULL);
INSERT INTO public.earth VALUES ('Mars', 'The red planet', 227.9, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 12000, 'This is our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 0.10758, 10000, 'This is a Dwarf spheroidal galaxy and a satellite of our Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Draco II', 0.0701, 13500, 'Draco II / Leavens 4 is a dwarf satellite galaxy orbiting the Milky Way discovered by the Pan-STARRS1 3π survey in 2015.');
INSERT INTO public.galaxy VALUES (4, 'Tucana III', 0.2445, 9000, 'The Tucana Dwarf galaxy is a dwarf galaxy in the constellation Tucana.');
INSERT INTO public.galaxy VALUES (5, 'Segue I', 0.075, 11000, 'Segue 1 is a dwarf spheroidal galaxy or globular cluster situated in the Leo constellation and discovered in 2006 by Sloan Digital Sky Survey.');
INSERT INTO public.galaxy VALUES (6, 'Sagittarius', 0.078, 12000, 'The Sagittarius Dwarf Spheroidal Galaxy (Sgr dSph), also known as the Sagittarius Dwarf Elliptical Galaxy (Sgr dE or Sag DEG), is an elliptical loop-shaped satellite galaxy of the Milky Way.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Phobos', 0.68, false, 4300, 'Phobos is the innermost and larger of the two natural satellites of Mars, the other being Deimos.');
INSERT INTO public.moon VALUES (2, 3, 'Deimos', 0.69, false, 4600, 'Deimos is the smaller and outer of the two natural satellites of Mars, the other being Phobos.');
INSERT INTO public.moon VALUES (3, 4, 'Europa', 0.120, true, 4500, 'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 97 known moons of Jupiter. It is also the sixth-largest moon in the Solar System.');
INSERT INTO public.moon VALUES (4, 4, 'Io', 0.120, false, 4500, 'Io, or Jupiter I, is the innermost and second-smallest of the four Galilean moons of the planet Jupiter.');
INSERT INTO public.moon VALUES (5, 4, 'Ganymede', 0.120, false, 4500, 'Ganymede, or Jupiter III, is the largest and most massive natural satellite of Jupiter, and in the Solar System.');
INSERT INTO public.moon VALUES (6, 4, 'Callisto', 0.120, false, 4500, 'Callisto, or Jupiter IV, is the second largest moon of Jupiter, after Ganymede.');
INSERT INTO public.moon VALUES (7, 5, 'Titan', 0.189, false, 4200, 'Titan is the largest moon of Saturn and the second largest in the Solar System. It is the only moon known to have an atmosphere denser than the Earths and is the only known object in space other than Earth on which there is clear evidence that stable bodies of liquid exist.');
INSERT INTO public.moon VALUES (8, 5, 'Enceladus', 0.189, false, 4300, 'Enceladus is the sixth-largest moon of Saturn and the 18th-largest in the Solar System.');
INSERT INTO public.moon VALUES (9, 5, 'Mimas', 0.189, false, 4400, 'Mimas, also designated Saturn I, is the seventh-largest natural satellite of Saturn.');
INSERT INTO public.moon VALUES (10, 6, 'Titania', 0.215, false, 4600, 'Titania, also designated Uranus III, is the largest moon of Uranus.');
INSERT INTO public.moon VALUES (11, 6, 'Miranda', 0.215, false, 4200, 'Miranda, also designated Uranus V, is the smallest and innermost of Uranus five round satellites.');
INSERT INTO public.moon VALUES (12, 6, 'Umbriel', 0.215, false, 4100, 'Umbriel is the third-largest moon of Uranus.');
INSERT INTO public.moon VALUES (13, 7, 'Triton', 0.238, false, 4000, 'Triton is the largest natural satellite of the planet Neptune.');
INSERT INTO public.moon VALUES (14, 7, 'Thalassa', 0.238, false, 3800, 'Thalassa, also known as Neptune IV, is the second-innermost satellite of Neptune.');
INSERT INTO public.moon VALUES (15, 7, 'Hippocamp', 0.238, false, 4000, 'Hippocamp, also designated Neptune XIV, is a small moon of Neptune discovered on 1 July 2013.');
INSERT INTO public.moon VALUES (16, 8, 'Ursula', 123, false, 5000, 'Ursula is the only moon of Ursa, the name derives of the being in wedlock, therefore Ursula is the wife of Ursa.');
INSERT INTO public.moon VALUES (17, 9, 'Dracona', 303, true, 7400, 'Dracona is a habited moon of Draconus. Draconian royalty has their holiday villages on this moon.');
INSERT INTO public.moon VALUES (18, 9, 'Eragos', 303, false, 6800, 'Eragos is called the chiller as the surface temperature is definitely lower then on Draconus, the moon is currently uninhabited, but being terraformed to sell ski paradises for the rich');
INSERT INTO public.moon VALUES (19, 11, 'Hex', 452, true, 6800, 'According to Magican myth, this moon is where female Magicans are from.');
INSERT INTO public.moon VALUES (20, 12, 'Diablos', 245, false, 2000, 'Being between two very hot stars, the temperatures on this moon are so high, it could have been a star itself. The surface is always on fire. If Sagiter would be inhabited, the people here would only see a fireball crossing their sky 4 times each day.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 0.102, false, 4500, 'Mercury is the first planet from the Sun. It is a rocky planet with a trace atmosphere. While it is the smallest and least massive planet of the Solar System, its surface gravity is slightly higher than that of Mars.');
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0.86, false, 4500, 'Venus is the second planet from the Sun. It is often called Earths "twin" or "sister" planet, being orbital neighbours as well as Venus having the most similar mass and size to Earth among the planets of the Solar System.');
INSERT INTO public.planet VALUES (3, 1, 'Mars', 0.68, true, 4500, 'Mars is the fourth planet from the Sun. It is also known as the "Red Planet", because of its orange-red appearance.');
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', 0.125, false, 4500, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than 2.5 times that of all the other planets in the Solar System combined and slightly less than one-thousandth the mass of the Sun.');
INSERT INTO public.planet VALUES (5, 1, 'Saturn', 0.189, false, 4500, 'Saturn is the sixth planet from the Sun and the second largest in the Solar System, after Jupiter. It is a gas giant, with an average radius of about nine times that of Earth.');
INSERT INTO public.planet VALUES (6, 1, 'Uranus', 0.215, false, 4500, 'Uranus is the seventh planet from the Sun. It is a gaseous cyan-coloured ice giant. Most of the planet is made of water, ammonia, and methane in a supercritical phase of matter, which astronomy calls "ice" or volatiles.');
INSERT INTO public.planet VALUES (7, 1, 'Neptune', 0.238, false, 4500, 'Neptune is the eighth and farthest known planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet.');
INSERT INTO public.planet VALUES (8, 2, 'Ursa', 123, false, 6800, 'Ursa is the largest planet of the star Dubhe and can be found in the Ursa Major II galaxy. Naturally this planet is fictive');
INSERT INTO public.planet VALUES (9, 3, 'Draconus', 303, true, 7500, 'Draconus is the only planet of Thuban aka Alpha Draconis. The planet situated between Alpha and Omega Draconis the eyes of the Great Dragon on our sky. Being between two stars there is always daytime on this planet, hence the name. Life on this planet is scarse, because of the heat. The local humanoids are living underground.');
INSERT INTO public.planet VALUES (10, 4, 'Tucanus', 184, false, 1600, 'Tucanus is a young planet. One of the youngest in this system.');
INSERT INTO public.planet VALUES (11, 5, 'Magicus', 452, true, 6800, 'Magicus is the only planet in the system Kaecilius that has life despite the 102 planets in this system. The "Magicanus" species who lives here are magic wielders and they roam this planet for almost 1 billion years now.');
INSERT INTO public.planet VALUES (12, 6, 'Sagiter', 245, false, 2200, 'Life on Sagiter is impossible as it is situated between two suns that are 24 times hotter than our Sun. The temperature on the terrain is over 700 degrees when its cold.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'The Sun', 0.1496, 4600, 'The Sun is the star at the centre of the Solar System.');
INSERT INTO public.star VALUES (2, 2, 'Dubhe', 123, 2800, 'Dubhe is a multiple star system, specifically a red giant, in the constellation Ursa Major, also known as the Great Bear or the Big Dipper');
INSERT INTO public.star VALUES (3, 3, 'Thuban', 303, 2800, 'A prominent star in the constellation Draco II is Thuban (Alpha Draconis), also known as Thuban.');
INSERT INTO public.star VALUES (4, 4, 'Danfeng', 184, 3100, 'A prominent star in the Tucana constellation is Alpha Tucanae, also known as Danfeng.');
INSERT INTO public.star VALUES (5, 5, 'Kaecilius', 452, 6800, 'Kaecilius is a non-existent star in the Segue I Dwarf galaxy. I named it as Segue I does not have any named stars as of this time');
INSERT INTO public.star VALUES (6, 6, 'Kaus Australis', 286, 2320, 'Epsilon Sagittari or formally named as Kaus Australis is a binary star system in the Sagittarius constellation');
INSERT INTO public.star VALUES (7, 6, 'Nunki', 228, 2320, 'Sigma Sagittari also known as Nunki is a binary star system in the Sagittarius constellation');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: earth earth_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_description_key UNIQUE (description);


--
-- Name: earth earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_pkey PRIMARY KEY (earth_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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
-- PostgreSQL database dump complete
--

