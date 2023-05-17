--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Homebrew)
-- Dumped by pg_dump version 14.7 (Homebrew)

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: FavoriteTrails; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."FavoriteTrails" (
    id text NOT NULL,
    user_id text NOT NULL,
    trail_id text NOT NULL
);


ALTER TABLE public."FavoriteTrails" OWNER TO jared;

--
-- Name: RecentTrails; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."RecentTrails" (
    id text NOT NULL,
    user_id text NOT NULL,
    trail_id text NOT NULL
);


ALTER TABLE public."RecentTrails" OWNER TO jared;

--
-- Name: Trail; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."Trail" (
    id text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    name text NOT NULL,
    recent_trail_id text,
    favorite_trail_id text
);


ALTER TABLE public."Trail" OWNER TO jared;

--
-- Name: TrailOrg; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."TrailOrg" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."TrailOrg" OWNER TO jared;

--
-- Name: Trailbucks; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."Trailbucks" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    user_id text NOT NULL,
    trail_org_id text NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE public."Trailbucks" OWNER TO jared;

--
-- Name: User; Type: TABLE; Schema: public; Owner: jared
--

CREATE TABLE public."User" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."User" OWNER TO jared;

--
-- Data for Name: FavoriteTrails; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."FavoriteTrails" (id, user_id, trail_id) FROM stdin;
\.


--
-- Data for Name: RecentTrails; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."RecentTrails" (id, user_id, trail_id) FROM stdin;
\.


--
-- Data for Name: Trail; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."Trail" (id, latitude, longitude, name, recent_trail_id, favorite_trail_id) FROM stdin;
\.


--
-- Data for Name: TrailOrg; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."TrailOrg" (id, name) FROM stdin;
\.


--
-- Data for Name: Trailbucks; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."Trailbucks" (id, created_at, user_id, trail_org_id, amount) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public."User" (id, created_at, updated_at, first_name, last_name, email, password) FROM stdin;
clgmu9rlt000081396nu0brjk	2023-04-18 22:31:03.425	2023-04-18 22:31:03.425	Jared	Vandeventer	Vanthedev@gmail.com	$2b$12$FtRJiT8iIGbuSEL.r9FK8OyxGMCGd1JPARrndD4glLpcd/hQOw3Uu
clgmushew000081t2yelpt83q	2023-04-18 22:45:36.68	2023-04-18 22:45:36.68	Bob	Dole	Bobdole@gmail.com	$2b$12$6wnvzNoVA83609gwkCGrm.7HdBMncCS9ufWlrqhhsMmagIaPf184G
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: jared
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: FavoriteTrails FavoriteTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_pkey" PRIMARY KEY (id);


--
-- Name: RecentTrails RecentTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_pkey" PRIMARY KEY (id);


--
-- Name: TrailOrg TrailOrg_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."TrailOrg"
    ADD CONSTRAINT "TrailOrg_pkey" PRIMARY KEY (id);


--
-- Name: Trail Trail_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_pkey" PRIMARY KEY (id);


--
-- Name: Trailbucks Trailbucks_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Trailbucks_user_id_key; Type: INDEX; Schema: public; Owner: jared
--

CREATE UNIQUE INDEX "Trailbucks_user_id_key" ON public."Trailbucks" USING btree (user_id);


--
-- Name: FavoriteTrails FavoriteTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RecentTrails RecentTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trail Trail_favorite_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_favorite_trail_id_fkey" FOREIGN KEY (favorite_trail_id) REFERENCES public."FavoriteTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trail Trail_recent_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_recent_trail_id_fkey" FOREIGN KEY (recent_trail_id) REFERENCES public."RecentTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trailbucks Trailbucks_trail_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_trail_org_id_fkey" FOREIGN KEY (trail_org_id) REFERENCES public."TrailOrg"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trailbucks Trailbucks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jared
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

