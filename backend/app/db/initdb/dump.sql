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
-- Name: FavoriteTrails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FavoriteTrails" (
    id text NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."FavoriteTrails" OWNER TO postgres;

--
-- Name: Notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Notification" (
    id text NOT NULL,
    trail_id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Notification" OWNER TO postgres;

--
-- Name: RecentTrails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RecentTrails" (
    id text NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."RecentTrails" OWNER TO postgres;

--
-- Name: Trail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Trail" (
    id text NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    name text NOT NULL,
    recent_trail_id text,
    favorite_trail_id text,
    trail_org_id text NOT NULL
);


ALTER TABLE public."Trail" OWNER TO postgres;

--
-- Name: TrailOrg; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TrailOrg" (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."TrailOrg" OWNER TO postgres;

--
-- Name: Trailbucks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Trailbucks" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    user_id text NOT NULL
);


ALTER TABLE public."Trailbucks" OWNER TO postgres;

--
-- Name: Transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Transactions" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    amount integer NOT NULL,
    trail_id text NOT NULL,
    user_id text NOT NULL,
    trail_org_id text NOT NULL,
    confirmation_number text NOT NULL
);


ALTER TABLE public."Transactions" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    is_new boolean DEFAULT true NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Data for Name: FavoriteTrails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FavoriteTrails" (id, user_id) FROM stdin;
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Notification" (id, trail_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: RecentTrails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RecentTrails" (id, user_id) FROM stdin;
\.


--
-- Data for Name: Trail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Trail" (id, latitude, longitude, name, recent_trail_id, favorite_trail_id, trail_org_id) FROM stdin;
clhcomc6h000381jjrkbmq480	39.081311	-108.55511	Escalante Hall	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc6m000581jjfdb44l3e	39.77254061900148	-105.6836636555616	Bill Moore Lake/Empire Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc6r000781jjv70uup8k	39.69431572808335	-105.7322963051044	Argentine Central Grade Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc6u000981jjvmqdof83	39.68276290914723	-105.7019484866507	Waldorf Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc6x000b81jjgs9g5x2e	39.7369853814434	-105.683919082555	Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc70000d81jjk971n3vj	38.6784615838257	-108.9840624845919	Gateway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc74000f81jjx48vf8oa	39.74310766117691	-105.4068068637245	Oxbow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc77000h81jjm42fwcgz	39.1477048016563	-107.4357624230313	Clear Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc79000j81jj2vvg9kb2	38.97833606259678	-107.2766589611794	Raggeds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc7c000l81jjw3t8wne4	39.56694008536825	-105.0413373692384	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc7e000n81jjmwqqhueb	39.61350151923438	-105.0258709197366	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc7y000p81jjpzkyrxpp	39.58725813545636	-104.9223924661118	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc81000r81jjapx7vd3j	39.62127131444773	-104.9966064450342	Big Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc85000t81jjxe16fj7r	39.62379299401235	-105.0172526811506	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc87000v81jj38wywsmx	39.61615194026093	-104.9812284792531	Big Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8a000x81jjfpt7fqgm	39.59730159258433	-105.0219398525023	Lee Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8c000z81jjqc9mw8r0	39.9064328005329	-106.1047212495836	Williams Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8e001181jjg25h67ot	39.87393920888626	-106.0208507570588	Keyser Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8g001381jjmjjw8i59	39.8538829044771	-106.0166514166605	Kinney Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8j001581jjlglx1bee	39.89355599704069	-105.9564506377812	Lake Evelyn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8m001781jj1mkucfli	39.88853968899166	-105.9253174390785	Byers Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8o001981jjyd719u7k	38.61985809896257	-104.8883638267238	Aiken Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8q001b81jj08rcl5bb	39.54561868239885	-107.3342153904774	Red Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8s001d81jj5ju3gke5	37.76200255196959	-107.4666337229632	Pole Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8u001f81jjqgpjhqj8	39.55531063080257	-104.7879282027626	Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8w001h81jj6fasr3bm	39.51587470152513	-104.775193283991	Bar CCC Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc8y001j81jj7xe563jo	39.47892332080166	-104.7710799740455	Stroh Ranch Soccer Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc90001l81jjfbtxzgqx	39.50099249127597	-104.763203259879	McCabe Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc92001n81jj482fkey1	39.56307052453158	-104.7840513111155	Norton Farms Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc93001p81jjcqydkqrb	39.54047141360306	-104.774148041047	Baldwin Gulch? Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc95001r81jjh7frrm36	39.5245295101497	-104.7776319626515	Railbender Skate Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc96001t81jjfsb9m2fm	39.51686589017423	-104.7530049247495	Town Hall Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc98001v81jjk1zqus7i	39.49172947009057	-104.7339636162279	Tallman Meadow Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc99001x81jj05jzqi0v	40.02903107800252	-105.0466311194063	Coal Creek Trailhead at Lawsc	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9b001z81jjtewamwtk	39.5515273697813	-107.3403070370002	Glenwood Springs Community Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9c002181jjq7ms7r4u	39.47296179352794	-107.270484758657	CMC Park & Ride Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9e002381jjii9edhtj	38.47498550288521	-107.8851686659325	West Main Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9f002581jjmlcmhue4	39.40246386298671	-107.2121162471056	Carbondale Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9h002781jjp1uwtaf9	39.92605875438278	-105.8589034693936	St. Louis Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9i002981jjmzsxpfwk	37.59129617291437	-108.026412052373	Salt Creek Trailhead Upper	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9j002b81jj7bt7ol1x	39.9336882817277	-105.8491502829792	Lower Creekside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9l002d81jj6t89o366	37.90709340198553	-105.6490498765763	Liberty Gate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9m002f81jjy17igscc	40.29300036217407	-108.9676500258957	Plug Hat Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9o002h81jjq7cvf684	39.39946406358698	-107.1553074412163	Catherine Bridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9p002j81jjhk937d06	39.37315746371483	-107.0857870991648	Hooks Lane Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9r002l81jjcpi6nxry	39.91892504062992	-105.8331315095816	Elk Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9t002n81jjrsiehznm	39.25058600316166	-106.8823155433921	Intercept Lot Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9u002p81jjsie5weja	39.85615823800639	-105.65810422966	James Peak Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9w002r81jjkxn8f48a	37.80508277400404	-108.063240313824	Navajo Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9x002t81jjh7v4y6ja	37.5074888264525	-108.8816652980794	Mockingbird Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomc9y002v81jjrzoanzpi	37.34737955190263	-108.9324421149594	Cannonball Mesa OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca0002x81jjmbx24ywu	39.95157449964702	-105.5949357906636	Hessie Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca1002z81jj63ybfkjl	40.00971966619483	-105.5688053066898	Rainbow Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca3003181jj1hnoxcf9	39.19164047771046	-106.8172027906483	Rio Grande Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca4003381jjecizovt6	38.50868871047719	-106.1891947657529	Greens Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca6003581jjuxb447df	39.02031972160506	-106.7560135570231	Taylor Pass/Express Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca7003781jj54unrsy5	39.1986188038189	-107.3028706765291	Coal Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomca9003981jj90q8buwq	38.4482262388813	-105.2467530084045	Floral Avenue Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcaa003b81jjwinwljs6	38.46184242115913	-105.2515676247735	Dakota Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcac003d81jjn5hursul	38.53805819711527	-105.9900512741022	Salida Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcad003f81jj22q4q47l	38.46921863424536	-105.249575714412	Washington Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcaf003h81jj50q2pr3b	38.43367689999718	-105.2649326012158	Tunnel Drive Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcah003j81jj10tsmel6	38.43798484071448	-105.2397743940239	River Front Recreation Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcak003l81jjhupsqbig	38.46529160154711	-105.3090991478821	Canyon Rim Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcam003n81jjzf00fqv5	38.40984627047647	-105.3133527395238	The Temple Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcan003p81jjlw6jimip	38.43869877024284	-105.2251557778929	Sell Avenue Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcap003r81jjhv5pcxrh	38.43765354048843	-105.2054328249314	Raynolds/Ash Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcaq003t81jjmhsfwwyc	38.41917744240039	-105.1785520160336	Mackenzie Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcas003v81jjkn9yujr0	38.41869074431999	-105.2603873892811	Ecology Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcat003x81jj6sba4kgk	40.08075110204319	-105.5351584747781	Red Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcav003z81jj8gdew58v	40.10552664532182	-105.4881069616751	South Saint Vrain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcaw004181jjn3dh355p	40.13014488692259	-105.5764681462772	Coney Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcay004381jjblme5y3w	40.12118661715478	-105.5239568669512	Beaver Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb0004581jj439pp95h	40.17424178158531	-105.5333617103355	Saint Vrain Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb2004781jj99gm5jvg	40.20483700287694	-105.4766358474288	Bright Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb3004981jj4tqsw5lj	40.23486580953036	-105.4477478715609	Bright Extension Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb5004b81jjyscw36o3	40.2500487467314	-105.4106686428118	Coulson Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb6004d81jjqtoc2otk	37.77001495199998	-103.512839173442	Vogel Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb8004f81jj0try5n7q	40.18760902742002	-105.4136779821028	Dry Saint Vrain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcb9004h81jjty47jezw	40.10646283366979	-105.322399054373	Lefthand OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbb004j81jjelvolaxi	40.95808873933951	-105.1636757888575	Red Mountain Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbc004l81jjtq5ys33m	40.43115768381294	-106.0069113819642	Teller City Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbe004n81jjzrmdf6z6	39.96078038882993	-105.396200954713	Forsythe Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbg004p81jjl1w2gujf	39.95727961963195	-105.447297153632	Front Range Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbh004r81jjsx97lpq6	39.94683428371982	-105.5176711167476	West Magnolia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbi004t81jjpii48yji	39.32763740745536	-106.1296276902796	Kite Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbk004v81jjncrt3wrp	39.57390978341127	-107.4345915969603	Storm King Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbl004x81jjyhdrzjtt	39.5858835728983	-107.5383147411718	Colorow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbn004z81jjfj377lpx	39.81718318414548	-105.213335560916	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbp005181jjo2xouleu	39.83801392260775	-105.0618123910411	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbq005381jjg96go0zb	39.89649078627584	-104.9418486402035	Grange Hall Creek Trailhead at Carpenter Park	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbs005581jj0eh3ilxr	39.54139734901919	-107.3217552915783	Doc Holliday Grave	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbu005781jjyma0hdo3	39.63633108056331	-104.8712657594505	West Shades Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbv005981jjinnwh3dt	39.63519027122491	-104.8599049675328	Lake Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbx005b81jjirmvid2p	39.63435986363518	-104.8634797088827	Mountain Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcbz005d81jjl33rgrri	39.52779995152299	-107.2571029222452	Lookout Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc0005f81jje2f2e8w0	38.65797854460062	-105.8133229188241	Badger Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc1005h81jjkg0quti1	38.54096237554723	-105.0298153754736	Beaver Creek Lower Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc3005j81jjbnb7ed8x	38.5706987582105	-105.012119251574	Beaver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc4005l81jjmpu593q8	38.57142429691991	-105.0866903142481	Holbert Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc6005n81jjwnsdk356	39.36139450990733	-107.1889563219152	Bull Pen Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcc8005p81jjxal88an6	40.58174096180004	-107.3774189358989	Greenwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcca005r81jjot9vm2r1	40.57631622608424	-107.3650654717965	North Access Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccb005t81jjx7140al1	39.33955223278906	-107.1583078944039	BLM Crown Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccd005v81jjkjf0uwj6	39.32068173535386	-107.1348487434812	Prince Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcce005x81jj8eqcsatj	38.57040042161714	-107.3323078521963	Commissary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccg005z81jjwjy4zqfp	39.97828077833432	-107.6199140405568	Oyster Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcch006181jjsrcly96m	39.33242304609315	-107.1515848227015	Skill Saw/Creek Side Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccj006381jjas0m2szj	39.40420496089853	-107.2109546305196	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcck006581jjhavtxlt2	40.07143146594709	-105.229463169401	Boulder Reservoir Parking	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccm006781jj2ecsch7f	39.30385637557028	-105.0878534157317	Rim Road / Jackson Creek Trailhead #681	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccn006981jjow71jttr	38.56763562194468	-105.9837100262245	North Backbone Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccp006b81jj6qa5rmho	38.92694182690004	-104.7545551629209	Cottonwood Creek Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccq006d81jjrr8y6sk0	38.31305452279755	-106.1433886032671	Rawley 12 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccs006f81jj6xxazumf	37.12399831207172	-106.3692528050602	Elk Creek Trailhead, Trail 731	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcct006h81jjikuj9l8s	37.27844978489318	-106.4795604165481	Upper South Fork Trailhead #720	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccv006j81jjs27jftgc	37.9589756470622	-106.4312576055782	Storm King Picnic Site Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccw006l81jjvvue1k5j	39.41622272120529	-107.2207175200511	Red Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccy006n81jjftfiqa4h	37.81154373432279	-106.3774566978349	Natural Arch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomccz006p81jj7bv1ecxo	39.80474936729083	-105.7124627061037	Bill Moore Lake/Empire Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd1006r81jj6ltulaxl	40.08734671056244	-105.2263202279863	Boulder Reservoir (55th St) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd2006t81jjljqztitd	38.95095132376066	-104.7763180310308	Rampart Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd4006v81jjqqnd8w0y	40.02786063722306	-105.5249063563051	Sourdough Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd5006x81jjij3s9xgi	39.0112091100664	-104.8060087032067	Mary Kyer Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd7006z81jjybs5i0zg	39.77087013817096	-105.8537052750757	Jones Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcd8007181jja5xggxez	39.47846454251999	-107.1616164777469	Fisher Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcda007381jjxge4o1cq	37.84508485781542	-104.5770349477396	Cuchara Canyon - Wilson Crossing Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdb007581jjetb4jmoh	40.4504085133472	-108.3832538621991	Twelve Mile Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdd007781jjfrye16l0	40.47388045661954	-108.0577240250512	West Juniper Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcde007981jjfkcb6b7k	38.03191645438702	-108.0461992176754	Leopard Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdg007b81jjm1crno5r	37.80583643864708	-104.5908339955643	Cuchara Canyon - Sheep Crossing Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdi007d81jjv6bzwwd3	40.4961350771484	-108.2624653956927	South Cross Mountain East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdj007f81jjn50t4wu5	38.32086425684066	-105.3466253757707	Bear Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdl007h81jjkbkxmy1j	40.50624348499484	-108.1189736899928	Thornburg Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdm007j81jjek8862lt	38.53225576293907	-105.4900772960535	Little Crampton Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdo007l81jjce0c3fxx	38.60104361536706	-105.6810659328255	Waugh Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdq007n81jje68fspk4	39.67787260125325	-105.6600849360091	Hells Hole Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdr007p81jjd8sbfqry	38.7761060890132	-107.8851858189296	Lawhead Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdt007r81jjjd9rqi8m	39.17380019831234	-109.0180574560743	Jouflas Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdu007t81jj3ansq1ca	38.61547330184115	-107.8854179340514	Eagle-Wave Trailheads Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdw007v81jj8wkydt5v	39.72751331757289	-108.2882462438351	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdy007x81jj1ulet8zo	40.46257280388409	-108.3503287169163	South Cross Mountain West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcdz007z81jjihqs9s08	39.20481499137199	-106.9715180406238	Upper Divide Lot	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce1008181jjsevaaqxi	39.20851597552225	-106.9573422904237	South Rim Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce2008381jjlu4v86go	38.70411363020911	-107.6032020454605	Young's Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce3008581jjv1jz3m74	38.73764119392111	-105.609643926512	31 Mile Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce5008781jjm85grng1	39.58586426294627	-106.6944830998694	Salt Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce6008981jjuprddso2	38.17695165437025	-107.1649140664297	Powderhorn Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomce8008b81jj2iu9p2c7	39.20684065622203	-106.9551648889434	Lot 8 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcea008d81jjty7vk67c	40.37785270191306	-107.8242961514612	Duffy Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcec008f81jjn98nr0qc	39.66510604829917	-105.6326247193475	South Chicago Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomced008h81jj3uv9cnhd	39.71488537931678	-105.5546417505577	Barbour Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcee008j81jj9odbd6it	39.18719953533662	-106.8525975349666	Maroon Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomceg008l81jjdyx0bkj8	39.60657531970707	-105.7276240367355	Silver Dollar Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomceh008n81jj2y37xp3w	39.18642998269943	-106.8369011575326	Water Plant Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcej008p81jji0eekcka	39.97633402029547	-107.6354547973596	East Beaver Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcek008r81jj6qxptckq	39.60958380227219	-105.7181495911395	Naylor Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcem008t81jjffxlplmz	39.59649370475434	-105.7102835190776	Bierstadt Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcen008v81jjc3jf2gxq	39.59721013362934	-105.7129336882757	Guanella Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcep008x81jjes2m87dc	39.81244715233559	-105.6615415597915	Loch Lomond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcer008z81jjdlhp9kh5	39.65734891977191	-105.5934273642962	Captain Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomces009181jjo7kpmzee	39.18905306009502	-106.824173039501	West Ajax Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomceu009381jj0fycadlx	39.56131350991376	-107.2497460094865	Grizzly Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcev009581jjzdilk131	39.62010065192478	-105.5102462311617	Bear Creek Guard Station Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcew009781jj2yd5erdu	40.04122594628586	-107.526691033315	Fawn Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcey009981jjaxm5rjf6	40.00736798865738	-107.5699494934071	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcez009b81jjcertdhmk	39.61412573977963	-105.5350253864098	Camp Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf1009d81jjmulp9wp5	39.16433434622674	-106.7890228521918	JH Smith Interpretive Loop	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf2009f81jjxbsiovsj	39.52178872291539	-105.5367819774768	Meridian Trailhead #604	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf3009h81jjm3yk2bfr	39.17124305298975	-106.7920917565081	North Star Beach Gate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf5009j81jjvd3xtp4g	39.56834424739124	-105.3834169120549	Cub Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf6009l81jjxldxo2my	39.52454955577298	-107.7868372788029	Rifle Information Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf7009n81jjhic50cdg	39.47272684251753	-104.9157830183884	Daniels Park East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcf8009p81jjahk6wo5s	39.65639219157831	-105.5958827685359	Echo Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfa009r81jj2harvdle	39.47291860880505	-104.9215767825187	Daniels Park West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfb009t81jj46gaz5lb	39.59859854687414	-105.6405559290992	Summit Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfc009v81jjwobsj7ei	39.49107103575457	-104.8700329939958	Glendale Farm Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfe009x81jjihpqny0e	39.52424676146119	-104.9999476595545	Pronghorn Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcff009z81jjsprne7yw	39.51416804870909	-104.9202970837995	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfh00a181jjttyvyqrm	39.52820801611875	-104.8864805653648	Bluffs Regional Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfj00a381jjc67v19yg	39.49903880477006	-104.9112870776441	Backcountry Wilderness Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfk00a581jjbg40filo	38.23710316781613	-104.7299564832027	Red Gate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfn00a781jjmxiasgao	39.49123572460226	-104.8998180587518	Coyote Ridge Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfp00a981jja6ox83h0	39.50395215408183	-104.9413957156052	East-West (Grigs Rd) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfq00ab81jjfv6gcumq	39.64283065126991	-105.5928765791701	Lower Goliath Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfs00ad81jjws6no6pb	39.54629339976135	-105.0276203318468	Redstone Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcft00af81jjzcys6lch	39.54779962369311	-104.8873689751433	Cook Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfv00ah81jj9jax30jw	39.60313927799702	-104.9298760406954	Centennial Link Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfw00aj81jjso1flwry	39.63280571288482	-105.6040581606827	Upper Goliath Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfy00al81jjxqdhnd3w	40.44084613106228	-104.813210707766	Poudre River Learning Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcfz00an81jjydtk3oi7	40.13565748225265	-105.1904874601634	Lagerman Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg100ap81jj9651r68u	39.58373940850876	-105.0286778769152	South Platte Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg200ar81jj8dy2zojh	39.59514723988357	-105.0260970242421	Reynold's Landing Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg400at81jjz0molza3	39.56833526181209	-105.0452266773853	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg500av81jjhigmzirf	38.25323279279028	-104.6054837199762	Moffat Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg700ax81jjg0eia9k5	38.25977955217149	-104.6171625945377	Main Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcg800az81jj6tbvhm6n	38.26672638151078	-104.6232203644289	Pearl Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcga00b181jjvdhjo3u7	39.56730294867562	-105.0568796319283	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgb00b381jjc3h47xw3	38.26574365597693	-104.657659190199	City Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgd00b581jjxtze06xa	39.98236008893337	-105.5192173167835	Caribou Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcge00b781jj7qyavxbr	38.26960784242046	-104.6330568253919	Dutch Clark Stadium Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgg00b981jjdoivz91e	38.29826715438413	-104.6016545963601	Haaff Elementary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgi00bb81jjchdo0lko	38.30563795403921	-104.6020797335263	Montebello Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgj00bd81jjy0gi6tjk	38.28450043629689	-104.6009708895376	Brickyards Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgl00bf81jjootw0p7a	38.2780807239196	-104.6020403157821	East 13th Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgm00bh81jjxr29zybh	38.25608525266554	-104.5896615131987	Confluence Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgo00bj81jj2yjvsdwp	39.60751500329296	-105.038810414239	Columbine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgq00bl81jj8xg4urgh	39.9792832063013	-105.5080446693929	Mud Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgr00bn81jjvx433636	39.642615880755	-105.0157772225993	Mary Carter Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgt00bp81jjfkogibf4	40.10403486074914	-106.3945121090029	Wolford Mountain South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgu00br81jj2b9o4ltg	37.7573003915054	-108.1280977714105	Geyser Spring Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgw00bt81jj1rcyqil1	38.26805798257402	-104.7084069479957	Anticline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgx00bv81jj8k96ktin	40.44242475661067	-104.7882553666594	Signature Bluffs Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcgz00bx81jjyughtgwe	38.87277846164474	-106.8993118223734	Strand Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch100bz81jjj5wq4t90	39.98296653171523	-105.1273087091008	Harney-Lastoka Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch200c181jjusexap4s	39.81453208783817	-104.879893217042	Gateway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch300c381jjg6pbcfb3	39.92881064803038	-105.166702452609	Coalton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch500c581jj65s26m4o	39.57839685382194	-104.7979749270571	Broncos Parkway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch700c781jjkghmtyqx	39.67098951839242	-104.8895721612198	Wabash Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomch800c981jj81ht39t2	40.14104388717815	-105.1741613790328	Blue Skies Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcha00cb81jj7wy78gmi	40.16943746014462	-105.1373571219702	Golden Ponds Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchc00cd81jjqrtvaxi6	39.64989251417763	-105.1466570876536	Pelican Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchd00cf81jj8w7hrvfx	39.65592327161099	-105.1420324255779	Bear Creek Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchf00ch81jjq4osf4dp	40.06301337922164	-105.2007796873146	Twin Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchg00cj81jj8qnld3xn	39.65331523121868	-105.1486008787368	Fishermans Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchi00cl81jjd7nq8n6j	37.93945839603928	-107.3150098550083	Cinnamon Pass ATV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchk00cn81jjbmpyf9g0	39.64842512030118	-105.1544437526251	Bear Creek Lake Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchl00cp81jjf5v1fkp0	39.64919087267286	-105.172941524979	Owl Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchn00cr81jjiy5834rg	39.72036837309325	-106.4051044229213	Piney Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcho00ct81jj76lcurnp	39.65225772999296	-105.1682367412486	Mt. Carbon North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchq00cv81jju0ndx20y	39.73570582895739	-105.3848442445312	Cannonball Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchr00cx81jjhe8k8tv4	40.21202440576339	-105.2894022992873	Bitterbrush Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcht00cz81jj9ddd5cea	40.57140161072859	-107.3735468267696	East Beach Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchv00d181jjur3se192	40.0801165302644	-105.5332163267903	Brainard Gateway/Red Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchw00d381jjdt9twjhw	40.46407248572217	-104.9095592009362	Eastman Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomchy00d581jj2vj2hsop	40.47242567496321	-104.9439119228962	Frank State Wildlife Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci000d781jjz2rfya62	40.24649561879157	-105.2238834161121	Rabbit Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci100d981jje3962vz9	40.04571203284637	-105.1805185697402	Wally Toevs Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci300db81jjis1n3l0v	40.05090460963806	-105.1785978337263	Heatherwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci400dd81jj4gq0s2g9	40.04410275739767	-105.1840428480499	Cottonwood Marsh Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci600df81jjdgeldyzj	38.90857389571126	-104.8265138276252	Tech Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci700dh81jj1ymnziaz	38.92500481624742	-104.8570070639056	Vindicator Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomci800dj81jjfxwo17xx	39.95557675524252	-105.3223522468606	Ethel Harrold Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcia00dl81jjtqyw2u1r	39.95124436680153	-105.3377029077677	Walker Ranch Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcib00dn81jjz5r41i1u	40.55861670184945	-105.0231480349405	Prospect Ponds South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcid00dp81jjyje546nn	39.95795401296745	-105.3386257110106	Meyer's Homestead Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcif00dr81jj85oq1rut	40.25630490456891	-105.8159054886545	Tonahutu Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcih00dt81jj9jf6aium	40.56415387681941	-105.0294701496862	Prospect Ponds North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcii00dv81jjsjau7dl5	40.01578095302762	-105.3409971097184	Betasso Trailhead East	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcik00dx81jj2czr49mi	40.01575354664524	-105.3441724939654	Betasso Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcil00dz81jj6bko0t1d	40.0135391281688	-105.3435051968941	Bummer's Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcin00e181jjvg0077jq	40.21134032861882	-105.2729591975668	Picture Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcip00e381jjh4oyor1s	40.14930901244364	-105.300113529618	Wapiti Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcir00e581jj5q8bqj56	40.14796651334353	-105.3001428427051	Lichen Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcis00e781jjonp9xos0	40.20283877162623	-105.1572550541384	Agricultural Heritage Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomciu00e981jjjmi35pha	40.05935165639189	-105.3197743012328	Anne U White Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomciw00eb81jjfl1en7cd	40.01592059046096	-105.1894276386965	Legion Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomciy00ed81jj34g1ang2	40.04767182157607	-105.3413444321345	Bald Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj000ef81jj33pliori	39.98003381396565	-105.0910485656403	Public Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj100eh81jj4pqwf6wi	39.97332766538226	-105.1150142250129	Aquarius Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj300ej81jjeksc0ccg	39.95301390487178	-105.1662408986368	Superior Townhall Trilhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj500el81jjf9669zmh	40.09401185039456	-105.173348122876	Monarch Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj600en81jj2rq3ahtn	40.08920189792394	-105.168504163994	Niwot Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj700ep81jj1f4fkv8y	40.10317011825441	-105.1598446129154	Lefthand Valley Grange Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcj900er81jj0xz6jy1y	40.01513031221391	-105.325712131212	Boulder Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcja00et81jja77tur13	39.69637775428638	-105.1920215556168	Rooney Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjc00ev81jjkpmpxi9p	40.01342097120791	-105.3099367830177	Elephant Buttress Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjd00ex81jj8nc12u2w	40.22766720802221	-105.2961756018154	Antelope Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjf00ez81jjimbigflx	40.18393678834255	-105.1764614159185	Pella East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjg00f181jjnjyrcn0s	40.60759100830585	-105.1137321291031	Poudre Trail - Taft Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcji00f381jjtjqj9axn	39.69056454627052	-105.1521731277053	Green Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjj00f581jj9pu1yczq	39.68700189500479	-105.1547908288822	Hayden Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjk00f781jj3rpyurj7	39.7455657654864	-105.2204543954214	Triceratops Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjm00f981jj742r3zzu	39.77378888583053	-105.2373605865885	Tucker Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjn00fb81jj2i66fkb0	40.56337609180297	-107.3855054369405	Ski Beach Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjp00fd81jjx1bo9c7x	40.01222163175423	-105.2027423647212	Sombrero Marsh Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjq00ff81jj8ycqjxdg	39.7502592738937	-105.2291461634612	Chimney Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjs00fh81jjfeyvjjc1	39.93074822131449	-105.2942414854388	Eldorado Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjt00fj81jjdj92eyer	39.05561170753951	-108.4602976285772	Corn Lake Boat Ramp Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjv00fl81jj6u43aiv3	38.29997055526031	-104.8210140897917	Pueblo Reservoir SWA Northeast Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjw00fn81jjh2wszcgq	38.29053907681514	-104.8647880402251	Ten Trail South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcjy00fp81jjuapco08w	39.77927602291969	-105.1902438775954	Tony Grampsas/Easley Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck000fr81jjrd1z26az	40.60338061338918	-105.1710814566077	Reservoir Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck100ft81jjcucwddnv	39.77449996546562	-105.1273768597708	Prospect Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck300fv81jjja6vthul	39.77399651765618	-105.1165205347026	Miller Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck400fx81jjmxnb4jvc	39.7754273270745	-105.1089454364873	Kipling Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck600fz81jjng1gc016	39.9437498911917	-104.8530257921604	Brighton Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck700g181jjakzu4t3g	39.88574356213975	-104.9074962327113	Elaine T. Valente Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomck800g381jjmt4ucypx	39.77446515180774	-105.1099801587842	Kipling West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcka00g581jj2ns9xmq8	39.92947923924836	-105.2901048657871	Fowler/Rattlesnake Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckb00g781jjhfk964zs	39.77517178775087	-105.09900293396	Anderson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckc00g981jjkzsozepf	39.78513297713123	-105.074387336458	Otis Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcke00gb81jj7pvpcomg	38.98899720729089	-104.8985000270866	Stanley Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckf00gd81jjnxmg3ofp	39.78364278953613	-105.0827456711467	Johnson Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckh00gf81jj5fgh3qng	40.32890863204632	-105.6023722486883	Park & Ride Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcki00gh81jjbfyafhwt	39.67227380486754	-105.2049721168009	Red Rocks North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckj00gj81jjw9v7pedh	39.78557185658953	-105.0675950693605	Creekside Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckl00gl81jjt2n3w0e5	40.48615216075304	-104.9586356598634	River Bluffs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckm00gn81jjbrw3adv8	40.36731877385539	-105.2852633901012	Ramsay-Shockey Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcko00gp81jjwsz7manu	40.3594829310226	-105.2783594852871	Blue Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckp00gr81jjt3064ou1	39.51841423882387	-104.9595561028771	Red-tail Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckr00gt81jjdb2143l8	39.64490429488887	-104.0759797758702	Richmil Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcks00gv81jjkapyfwgr	39.84813374305076	-105.3619198947501	Mountain Lion Trailhead at Ranch Pond	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcku00gx81jjj1ko9fo3	39.81721938508601	-105.1187884934179	Oak Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckv00gz81jjkdwd6mtj	38.82898664142701	-104.8792899785902	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckx00h181jjdxwgykzv	39.84613455325508	-105.3784555439879	Bridge Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomckz00h381jjfo55k3zf	40.6056158145057	-105.0959454784319	North Shields Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl000h581jjjl517dw0	39.24149143279821	-105.2657168405167	Cheesman Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl200h781jja98l3aov	39.13624433686364	-105.1919595685411	Sheep Nose Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl300h981jj9oi0w2zc	39.80415602872903	-105.0868279016264	Memorial Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl400hb81jjuhp0vp1t	37.81384791083628	-106.9151675606654	Deep Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl700hd81jjui6hiw81	37.54597989287861	-106.5032819152367	Burro Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcl900hf81jj3nd7vxw0	39.85065413154106	-105.360378317413	Nott Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcla00hh81jjbvjt6jph	39.79797545150645	-105.0572093474732	Lewis Ralston Gold Site Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclc00hj81jjfi3m69yy	39.8312701597082	-105.1978523460013	Tucker Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcld00hl81jj2laxz7qu	40.60401786633403	-105.0861620511122	Magpie Meander/Soft Gold Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclf00hn81jjq8v99lzp	40.31038348795397	-105.6403774730467	Glacier Gorge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclg00hp81jja27a761j	39.84594343592158	-105.218100103839	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclh00hr81jjw5x0e20v	39.83213002982719	-105.1639944114001	Indiana Equestrian Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclj00ht81jjd2r35d8w	37.19790601462881	-108.4841858232126	Farming Terrace Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcll00hv81jjygip0itj	39.85811445765115	-105.4473950824637	Coyote Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclm00hx81jjc6khk5f0	39.84157534104617	-105.1022184098209	Two Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclo00hz81jjyxgk13hs	39.87599365591629	-105.4492330265654	Raccoon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclp00i181jj5ofzdxkw	40.69846084495154	-105.4415937896045	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclq00i381jjsgcc8nu0	39.85004939446707	-105.445406625981	Mule Deer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcls00i581jjx40bow46	37.45948106917896	-107.8566332367612	Lower Hermosa Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclu00i781jjxin3t2kg	39.82477727081792	-105.0378872816854	Little Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclw00i981jjv10kw950	40.78305153463432	-105.2152220764413	Eagle's Nest Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomclx00ib81jjzgul2i00	40.6220873408922	-105.1397680887869	Lions Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcly00id81jj25jfgix0	39.83570047624193	-105.0476181454173	Wolff Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm000if81jj20c90rbt	39.85283288447033	-105.1302242975004	Standley Lake South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm100ih81jjmmimr24g	39.86599765886698	-105.4139741520024	Snowshoe Hare Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm300ij81jjlm6shxsr	39.57496115628861	-106.1110193123427	Tenmile Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm500il81jj8yqydhb0	39.54133077043481	-106.0423765196924	Gold Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm600in81jj7vzuhexg	39.87430559760833	-105.0949195300924	Big Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm700ip81jjkktkdpzv	39.64377355126576	-106.3634209972768	Spraddle Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcm900ir81jjuoin042b	39.86396320509053	-105.0889610205787	Niver Canal South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcma00it81jjb94f8bjy	39.87221999438871	-105.1033290107662	Big Dry Creek (Westbrook) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmc00iv81jjv7bbakfb	39.51068321621679	-105.5673684299437	Deer Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcme00ix81jj1ojlbl21	37.22024837432202	-107.8602937332908	Animas River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmf00iz81jj3esgjvts	39.09077951644043	-108.6900983768802	White Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmh00j181jjuirek6d3	40.81346838499659	-105.709457888542	Killpecker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmi00j381jjkwawrfxx	39.86472293091055	-105.4031860654631	Buffalo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmk00j581jj5b24svr4	40.48354957866782	-105.0159598305094	Fossil Creek Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmm00j781jjh778yt1d	38.19141702959678	-107.4931426492956	East Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmn00j981jjr74ytxdo	40.33542173289332	-105.4720550791922	Homestead Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmp00jb81jj32i0lg8n	40.33646951071529	-105.4761218772449	Limber Pine Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmq00jd81jjasad75px	39.19622977562511	-105.344936539031	Sheep Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcms00jf81jjlvbxudai	39.83295891037103	-105.4086336213259	Black Bear Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmu00jh81jjd5q50g2v	37.49301587345695	-106.8014524636397	Lobo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmv00jj81jjh5czgy6z	39.86650836736585	-105.0948554506616	Niver Canal Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmx00jl81jjbjqwtm3g	38.84435956131735	-106.4467350254658	Cottonwood Pass Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcmz00jn81jjiycfgs77	39.83148381559796	-105.4100694718353	Visitor Center Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn100jp81jjpcxeimxf	40.54177539877517	-106.683831040129	Powerline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn200jr81jjer7cm8jc	39.83600421985197	-105.4052475479721	Horseshoe Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn400jt81jj9c1d975o	37.29405744791923	-107.9397823874317	Barnroof Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn500jv81jjcr3ksczd	38.31203268081132	-104.8875885443028	Pueblo Reservoir SWA Northwest Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn700jx81jjsjl3ueuf	37.32255251335666	-107.9473180813708	Perins Peak SWA North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcn800jz81jj9xrx3wgc	39.84273501248175	-105.0420866665962	U.S. 36 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcna00k181jjqlszmmda	39.83118373131676	-105.4104389336176	Beaver Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnb00k381jjo45i2bh3	38.96105950367229	-108.230847659509	Kannah Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnd00k581jjkz5alr5w	39.0757847818676	-107.9674778473056	Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcne00k781jjmvidnixn	39.87786297987395	-105.1216646067018	Greenway/BDC Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcng00k981jjdix0rzh8	37.65970873796157	-103.5710631654093	Withers Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnh00kb81jj0g65kjdq	39.40315623872202	-106.443653438906	Holy Cross City Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnj00kd81jjolg0f7nl	39.88795473303374	-105.1294603055869	Westminster Hills Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnl00kf81jjl7e1vr0r	40.60177912447586	-105.0861189818242	McMurray/Salyer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnn00kh81jj9w9rj1zt	39.89362339329884	-105.1187962813094	Westview Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcno00kj81jjei62jdi2	40.01646374819278	-107.2382311149241	Skinnyfish Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnq00kl81jjlwsk90oi	39.8310821005672	-105.4219799805164	Slough Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnr00kn81jjfsyxrbgl	39.87856302430136	-105.1323896425116	Greenway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcns00kp81jj44irtzks	39.76336914137399	-107.6940752705747	Three Forks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnu00kr81jjo18s8fqu	39.32747116511055	-105.0874479482134	Flat Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnw00kt81jj6g3w1zmo	39.90012735134989	-105.0457715606648	Legacy Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnx00kv81jjb62pd9ua	40.15387631573883	-107.2237106647107	East Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcnz00kx81jjozy1efmb	38.9119390072666	-105.2559601182193	Shootin' Star Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco000kz81jjs8hapnvq	39.90291216588616	-105.644092554973	East Portal Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco200l181jj14w3y3kr	39.88774838433132	-105.0633658138769	Big Dry/ Farmers' Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco300l381jju1snl244	38.0531227314416	-107.0648868180724	Mineral Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco500l581jjr43jj1br	39.83552248519325	-105.4297673760429	Blue Grouse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco600l781jjbrbnl7v3	39.9277874848992	-105.0096633847992	Big Dry Creek Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomco800l981jjd0odz03p	39.95727005236686	-105.0111561475287	McKay Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcoa00lb81jj981c3kg8	39.89492606711455	-105.02435048434	Mushroom Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcob00ld81jjmdbvbm6j	37.63417552233658	-108.3331768581929	Lower Stoner Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcod00lf81jjxgz4unx2	39.91713979629127	-105.0326609849872	Metzger Farm Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcoe00lh81jj9evv8ebz	39.56613689057842	-106.4012993299347	West Two Elk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcog00lj81jj885tr8xg	37.30641522155148	-106.4827512591158	Lake Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcoh00ll81jjig0sg7ni	38.06075673368218	-106.9326266814194	Cebolla Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcom00ln81jjhmaxkhn4	39.18691284047001	-109.0190510443594	Rabbit Valley Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcot00lp81jjpqw8la1w	39.23110563910146	-107.0956211930536	Hell Roaring Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcp000lr81jjrlrrx13t	40.87544307017617	-106.1993077570243	Harvey's Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcp600lt81jjqwhe9fgl	40.86995587752913	-106.2013238673425	North Sand Hills Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpd00lv81jjr1lgab6e	38.91356318492917	-105.2852363466376	Florissant Fossil Beds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpi00lx81jjkz33u8e6	39.94515063905256	-104.9208397195599	Springvale Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpn00lz81jjw3msrp6w	38.73829087788396	-108.621388132213	Carson Hole Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpq00m181jjcnke6zyg	38.61540462646511	-107.8933410141816	Wave Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpr00m381jj7n3j7x5f	39.93082220091085	-104.9579130169755	Lee Lateral Ditch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpt00m581jj6vp5rn3r	38.64855557893848	-107.9188187778115	NCA Entrance-Carnation Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpv00m781jjk6np6ys8	39.876602691005	-104.9186768404826	S Platte Rvr Trlhd at Sprat Platte Fishing Facility Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpw00m981jj4tfylk8f	38.65119237273029	-106.0513464954753	Siedel's Suckhole Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpy00mb81jjuftnevpo	39.61413444353656	-107.1392231330594	Bair Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcpz00md81jj64zoohwt	39.66602566112247	-107.5257584520772	Centennial (East Elk) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcq200mf81jjbt6azlba	39.8811856348834	-104.9699186728231	Grange Hall Creek Trlhd at Lambertson Lakes Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcq900mh81jjzryp718j	38.82680604234984	-108.4526714160483	Cactus Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqd00mj81jjwerp22ot	39.85478236211414	-104.9396159175485	S Platte River Trail at Thornton’s Trailhead Par	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqi00ml81jjcaadfpun	39.86662556558421	-104.9971078239033	Niver Creek Trailhead at Anythink Library	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqm00mn81jjcra97utw	39.92598875618171	-105.0708786930612	The Field Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqq00mp81jjyn9gk67i	39.92972408975497	-105.0346560365255	Broomfield County Commons Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqv00mr81jjgww0b62n	37.7014384327646	-105.3816550918407	Stanley Creek Trailheads Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcqy00mt81jj6tvtjc09	39.92078107143291	-105.1088577674462	Interlocken East Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr000mv81jj8px0b76g	39.97950485615139	-105.0301922995585	Anthem Community Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr200mx81jj7lyax9rq	39.90841377431432	-105.8000403407693	Twin Bridges Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr400mz81jjvg27byyl	39.91673653343888	-105.7867061503251	Winter Park Town Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr600n181jj17l4s63i	39.54608788200383	-105.2725607901887	Meyer Ranch Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr700n381jjrt15pl6i	40.64414525575159	-104.3418459961702	Crow Valley Recreation Area Birdwalk Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcr900n581jjbsv1k6ou	40.6462798139567	-104.3432269235931	Mourning Dove Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrb00n781jjzdysmtl4	37.30282452378233	-107.8727667323355	Animas Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrc00n981jjd9fc5ifs	40.80808551636847	-103.9893313648428	Pawnee Buttes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrd00nb81jj8mtpgc5d	40.13700821611275	-105.1161622861816	Left Hand Creek Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrf00nd81jj5flfnb4x	40.14498251529891	-105.1067018567752	Kanemoto Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrg00nf81jj6a2rtz9y	40.15374337767116	-105.0753679142497	N 119th St Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrj00nh81jjtc2p0a9r	40.15414244885765	-105.0372562919412	Sandstone Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrl00nj81jjaxcnbnqo	40.14886853080786	-105.0547514951863	County Line Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrm00nl81jjl162ps2t	40.60450362761484	-105.0960455047722	Poudre Trail - Shields St. Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcro00nn81jj3092bgyh	40.15365714051912	-105.1004456335119	Dickens Park West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrp00np81jj6hzj533s	40.15406525711407	-105.0961051911488	Dickens Park East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrr00nr81jj4ci2d0yj	39.94370318638816	-105.0730386585375	Outlook Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrt00nt81jjct1dxswi	39.93016151811553	-105.0940066956619	Zang Spur Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcru00nv81jjn1hb28x4	39.60245756198636	-106.0129567029751	Snake River Inlet Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrw00nx81jj38p6m2he	40.0193997934367	-105.1024278169306	Erie Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcry00nz81jju9xjm5yv	40.03361211281052	-105.0735219404429	Thomas Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcrz00o181jj6466fpxl	39.53008764311623	-105.9980911158558	Horseshoe Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs100o381jjbzfe4zom	39.48537193813688	-105.9966956628927	Reiling Dredge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs200o581jjzzsdlxia	39.50912173892385	-106.1423521570722	Wheeler Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs400o781jjacm5cg3y	39.94695463915295	-105.1091443410167	Stearn's Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs600o981jjsyjy5o60	40.1616418967523	-105.1207205728448	Izaak Walton Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs800ob81jjna63v910	39.97889689932735	-105.071495736831	Rock Creek East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcs900od81jjlareiof5	39.99289179409637	-105.0609206991271	Flagg Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsb00of81jjr16oq6eb	40.16337360907281	-105.1299232219535	Rogers Grove Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsc00oh81jj56wnwkwc	40.51167709383	-106.0106551844023	Moose Visitor Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcse00oj81jjhqqrohn9	40.19568416832689	-105.0893107411891	Rough & Ready Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsf00ol81jj39lrlix0	40.17808432349788	-105.087972514332	Clark Centennial Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsh00on81jjhpxrnukq	40.18240332892576	-105.0645929323558	Stephen Day Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsi00op81jjl795vlu3	40.58276486702435	-106.0277370774774	Custer Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsj00or81jjpsb3ea7v	37.33137452229378	-107.9028423469915	Junction Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsl00ot81jjkh1bzf09	40.14870319958094	-105.1411800738368	Willow Farm Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsn00ov81jjltc1r3f6	40.71495714419326	-106.0242833546311	Jack Dickens Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcso00ox81jjjl3psjzj	39.78185857250158	-105.2299236193907	West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsp00oz81jjihcvy2pv	40.86958221076785	-106.1264354119731	Mendenhall Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsr00p181jjse43bovl	40.52324192216853	-106.1304907423254	Owl Mountain SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcss00p381jjpj4yc6tx	40.69097129765432	-106.4782111790993	Delaney Butte Lakes SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsu00p581jjayaoyi7q	39.93723702054563	-105.1429310145612	Autrey Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsv00p781jjhnu56ewq	39.49099850334164	-105.0936816983398	Waterton Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsx00p981jjq2gwhojq	39.40050587192379	-105.1679042940925	South Platte River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcsy00pb81jjgn2o707d	39.94280798619827	-105.1599330925148	Purple Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct000pd81jj75626asm	39.03935836307614	-107.986312851132	Grand Mesa Discovery Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct100pf81jju0ht0adg	39.34499131512519	-105.2573346567279	Little Scraggy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct300ph81jjoehq76sw	39.33823278364812	-105.401323689651	Rolling Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct400pj81jjug68xvuh	39.30611047314522	-105.5155894016757	North Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct600pl81jjrohzyikp	39.34745022796548	-105.6191320863106	Long Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct700pn81jjy81b71b3	39.36255528898967	-105.6875887604424	Rock Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomct900pp81jjph84tpgt	39.41366168170865	-105.7547559346673	Kenosha Pass East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctb00pr81jjebzc9z0a	39.93840425574638	-105.155235338288	North Pool Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctc00pt81jj7osg4r36	39.53316530559162	-106.0973961297499	Miners Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctd00pv81jjjattjtla	39.28491099628536	-106.4468504411726	Timberline Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctf00px81jjxlxugju0	39.15180605087802	-106.4192724477728	Mount Massive Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctg00pz81jjeut17405	39.15170255741008	-106.4123077218854	Mt. Elbert Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcth00q181jjniskf40m	39.07422854871051	-106.3106884499372	Twin Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctj00q381jjhswbbwry	38.86555212527674	-106.241226181411	North Cottonwood - Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctk00q581jjnud3fmcv	38.29128983292981	-104.8528836458023	Pueblo Reservoir South Access Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctm00q781jjh0orpbsz	37.51688269563601	-108.5748519490083	Sage Hen Mountain Bike Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctn00q981jjuz227vx1	38.71675613843961	-106.2001759237704	Chalk Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcto00qb81jjsk91qdue	38.59682754481791	-106.1970385774814	Shavano/Tabeguache Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctq00qd81jjd6ct5bh1	38.52283228514491	-106.2758424880979	Fooses Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctr00qf81jj0m2b1xpd	38.49617080663123	-106.3251161634151	Monarch Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctt00qh81jjsu7j6flk	39.93012932058687	-105.1591839400526	Rock Creek Regional West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctu00qj81jj1bjozom5	38.29587293023617	-106.5158600006444	Razor Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctv00ql81jjabcrmvho	38.24009526207983	-106.5581526261352	Lujan Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomctx00qn81jj07ytdas5	38.02361605659055	-106.8363403362507	Eddiesville South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcty00qp81jjoh92x6l1	37.79433482729473	-107.5462686478381	Stony Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu000qr81jjiifa9pym	37.74251212842432	-107.7119218894097	Little Molas Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu100qt81jj3bc83zft	39.06410338836936	-106.4033896745366	Willis Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu300qv81jjwyhvuzbo	40.19193995862263	-105.1243151366496	Garden Acres Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu400qx81jjo5qo3anl	38.98260555629357	-106.4429970056969	South Winfield Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu600qz81jj0kazzsi5	38.9599738298083	-106.4607684973701	Clear Creek South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu700r181jjniwdj8qu	38.87290520021725	-106.4266729319306	Texas Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcu900r381jj608qulrt	38.8277853533985	-106.4095189773495	Cottonwood Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcua00r581jjye3gc7ze	38.56412197365322	-106.3146032872558	Boss Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuc00r781jjukw1cbii	38.6194680330224	-106.3551202453995	Hancock Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcud00r981jjnbl3cwsw	39.40823654478278	-105.3471559389081	Pine Valley Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcue00rb81jj793apjw5	39.41295937331763	-105.2544487674116	Cathedral Spires Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcug00rd81jjgbgq1r7e	39.81873740711195	-105.2865423619106	White Ranch West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuh00rf81jjvhxfvgrj	39.81870457812327	-105.2924778323383	White Ranch Overflow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuj00rh81jjwv4q4ti0	39.73196113714511	-105.248870435548	Colorow Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuk00rj81jjpbeztq3q	39.74269105930748	-105.2347678461506	Chimney Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcul00rl81jjfy43ytt0	39.73064093680134	-105.2484209318103	Lookout Mountain Nature Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcum00rn81jj6voo651n	39.73687163720056	-105.2454687368489	Windy Saddle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuo00rp81jj5a80s298	39.71611103327649	-105.2097495717977	Apex Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuq00rr81jjbxrcv418	39.65430891041505	-105.3666381748868	Stagecoach Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcur00rt81jjtfcewcmn	40.19202653800829	-105.1390526215166	Dawson Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcus00rv81jj7awicuyv	40.19684209337014	-105.1442869240207	Flanders Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuu00rx81jj5jp6wa8e	40.18993021431788	-105.0555166811303	Jim Hamm Nature Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuw00rz81jjaer9s1em	40.18175564163569	-105.1355260401016	Hover Acres Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcux00s181jjfhgm1xi8	39.73486396579431	-105.3637044885004	Big Easy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcuz00s381jjyvrwvd0v	39.74985094279108	-105.3831810173993	Centennial Cone West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv000s581jjljbq34xe	39.77178539827976	-105.346890194576	Centennial Cone Park North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv100s781jjoyiszpzq	39.73718538117249	-105.3716901992472	Mayhem Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv300s981jjabsa3i2u	39.7662238982525	-105.2141337166179	Golden Cliffs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv500sb81jjxfzjfss3	39.7794635296415	-105.2292641246879	North Table Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv600sd81jj0gn95rex	39.55119133587214	-105.1391674127367	South Valley South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv700sf81jjqthk24d5	39.5660860425533	-105.1530753194984	South Valley North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcv900sh81jj0iz778qb	39.54336154349858	-105.1517442276139	Deer Creek Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcva00sj81jjaeabm158	39.5522958829298	-105.1101198085462	Hildebrand Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvc00sl81jjw056ap3s	39.69454228402208	-105.2048746084218	Matthews Winters Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcve00sn81jjq1k4ja0j	39.66313710476037	-105.3585228081055	Lewis Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvf00sp81jj8fkyncow	39.73710059050855	-105.1709242190929	Camp George West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvh00sr81jjq3pgypl2	39.73044413812972	-105.1862050875257	Westblade Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvi00st81jjrf4q93q0	39.74221605214977	-105.1889445199404	South Table Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvk00sv81jje7qyl36z	39.46684804624834	-105.2391976880005	Reynolds Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvl00sx81jjv43lx090	39.46058311737033	-105.2288069435626	Chickadee Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvn00sz81jjcltporbh	39.46179746198249	-105.2307764862763	Songbird Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvo00t181jjhov4gi7d	39.72917278813161	-105.1444451887065	Welchester Tree-Grant Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvp00t381jjpl0vczsm	39.75494371191171	-105.1070779864562	Crown Hill Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvr00t581jjtl311mfk	39.75507879499067	-105.1021125869395	Garland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvt00t781jjuxydhm76	39.79773802949855	-105.1646458151033	Van Biber West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvu00t981jj1vw7bcxp	39.79741860014563	-105.1399665453106	Ward Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvv00tb81jj4vugoozv	39.54507612933472	-105.3224653260874	Flying J Ranch Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvx00td81jjpiw2uf7u	39.53513030793364	-105.3127372039242	Shadow Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcvy00tf81jjllev6p9b	39.63865349644373	-105.3233622214072	Hiwan Heritage Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw000th81jjy2x9q0o8	40.84351711146529	-106.944579343267	Hahns Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw100tj81jjgtu3wwhg	40.31563327533641	-105.2237142083413	Sundance South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw300tl81jj5is1brc8	40.31662480209846	-105.2121917550198	Fawn Hollow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw400tn81jjcfco8umz	40.35064733041222	-105.2231009280733	Sundance North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw600tp81jj9qbcr2ku	40.51835827306024	-105.1678699296008	Blue Sky Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw700tr81jjzhxysdh5	40.34102869902864	-105.4729177715806	Kruger Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcw900tt81jjik3g9qp4	39.35171310619461	-106.3679534962739	West Tennessee Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwa00tv81jj2kvpjxk1	39.3693221514694	-106.3855207284281	Slide Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwc00tx81jj6fl50z0c	39.25939567881809	-106.4590791243386	Colorado Midland Centennial Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwd00tz81jjkgaxkqhv	39.24839172800917	-106.4702975246698	Windsor Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwe00u181jjpfb5gu0x	39.24723913158389	-106.4693217685772	Native Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwf00u381jj3xrl17zy	39.26122332234493	-106.3528622267804	Turquoise Lake Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwh00u581jj614etd6w	39.08155328756331	-106.3829233382129	Twin Lakes Historic District Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwj00u781jjpu42dt95	39.18770318418106	-106.3973702133667	Willow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwk00u981jjlgdhyy1q	39.92997390676314	-105.1508349329346	Rock Creek Regional East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwl00ub81jjhfmhylw9	38.93809485854339	-106.2554003907408	Wapaca - Lienhart Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwn00ud81jjoiwwwo7w	39.06928701646894	-106.4337601740635	Black Cloud Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwo00uf81jj58x3d6ib	39.11565198459833	-106.5379279388894	North Fork Lake Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwq00uh81jjld6w14z1	39.10825250846526	-106.5641237328008	Independence Pass Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwr00uj81jjmb0wxjn6	39.08169121240429	-106.5370822794168	Graham Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwt00ul81jjyalc3qf9	39.01902544227416	-106.5341312220667	Sayer's Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwu00un81jjyz785bbi	39.06788248212019	-106.504939165111	La Plata Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwv00up81jjkypwcxw4	38.99244643345401	-106.4745310584601	North Fork Clear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwx00ur81jjer3992ba	38.96483862276084	-106.4603313592936	Silver Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcwy00ut81jjbogq80gg	38.99583506964813	-106.4039477784362	Sheep Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx000uv81jjv3stmliy	38.95449510280702	-106.4092625578382	Pear Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx100ux81jjcgd0tsu1	38.99808015285866	-106.3749995477637	Missouri Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx300uz81jjvvc86vhh	38.99839960245696	-106.3758615398046	Vicksburg Mining Camp	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx400v181jj1ca3y175	38.99993297005112	-106.2306246085148	Pine Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx600v381jjc032lost	38.87073639855883	-106.2661312415688	North Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx700v581jjk8s1rf8f	39.0542043652891	-106.2020023471523	Hayden Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcx900v781jj2396r273	39.43028116452691	-106.1654405047059	Mayflower Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxa00v981jjk40y1vsm	39.92140016513099	-105.1554029685207	South Pool Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxc00vb81jj0pefg1fp	39.57581603262631	-106.1139067964706	North Tenmile Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxd00vd81jjfsg15qdg	39.65151704332093	-105.1843613205775	Mount Glennon Access	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxf00vf81jjsbi7mm81	39.58877622744787	-106.106021762746	Meadow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxg00vh81jjji3r3107	40.15988009458774	-105.1279555556735	Rogers Grove Park South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxi00vj81jjowijvt5p	37.976579044155	-105.5052813945531	South Colony Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxj00vl81jjdikwc7pr	39.85281037016212	-105.909650677406	St. Louis Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxk00vn81jj61v76nrp	40.78311276167801	-106.7229527092686	Slavonia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxm00vp81jjheoeb6rc	40.67889031933959	-105.8543341139129	West Branch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxn00vr81jjpijgrdq3	40.74399184114566	-105.8759001135604	Rawah Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxp00vt81jjl5b8rrhk	40.79799485024315	-105.9287887087041	Link-McIntyre Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxq00vv81jjqwymgrvq	40.30641435154508	-105.5370820375432	Twin Sisters Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxs00vx81jjpyzeg6et	40.30668450783595	-105.5379482008268	Lily Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxt00vz81jj7jkj9hjk	40.7669832771763	-105.3509270731624	Lone Pine Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxv00w181jj3ksfx5vv	40.84295693745658	-105.3345765313801	Cherokee SWA Lower Unit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxw00w381jjqacmdxj5	40.82801078272818	-105.3501647074607	North Rabbit Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxy00w581jjifghudml	40.87963308228666	-105.4023319426117	Cherokee SWA Middle Unit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcxz00w781jjk88zdfdw	40.59977848164282	-106.6049228271545	Newcomb Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy000w981jj30o6csug	40.43002275942897	-106.6586266757411	Basecamp Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy200wb81jj5iyaxk8w	40.07274246426594	-107.3449762909698	Snell Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy300wd81jjvgnnkhfo	40.4053019771362	-106.0338950688486	Illinois Ditch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy500wf81jj1kfci74b	40.37258876870096	-105.9771025347215	Illinois River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy600wh81jj7dmncr2f	40.38660090454631	-105.9660064801961	Jack Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy800wj81jj7cpwqu5v	40.37291482311034	-106.0913648976214	Snyder Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcy900wl81jj0bh4oj77	39.82378693129277	-106.1054907102387	Ute Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyb00wn81jjj9byzdnb	39.81221198877111	-106.0507350020774	Ute Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyc00wp81jjkx4emv86	37.02194484729718	-106.4491232036624	CDNST - Cumbres Pass North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcye00wr81jjamj3l665	37.71233970909071	-107.5180392747348	Beartown Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyf00wt81jjqzhw3ofr	39.66105614389301	-105.7844097520833	Grays Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyg00wv81jj0op681t0	39.69152188579143	-105.8052038925253	Bakerville / Loveland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyi00wx81jjrg9f8t3x	39.702420313907	-105.8543140279051	Herman Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyj00wz81jj2wns4z12	39.79801043522602	-105.7768958715478	Berthoud Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyl00x181jjwphajq9t	39.93509843360584	-105.6822127938838	Rollins Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcym00x381jjoqx5sje8	40.11138440142444	-105.7472049562792	Monarch Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyn00x581jjkeg1y8mk	40.2402583348734	-105.8256096542371	East Shore Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyp00x781jjwguajwfg	40.25654063622307	-105.8146581865768	North Inlet Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyq00x981jjurjfp9oo	39.86999530475015	-105.1845706385025	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcys00xb81jjgqr16u7q	40.34965252831282	-106.0899301311527	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyt00xd81jjpjshial2	40.32798499612985	-106.2121758249717	Troublesome Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyv00xf81jj9hte19j6	40.40134188097932	-106.6183512900525	Rabbit Ears Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyw00xh81jjppyyklxs	40.75371095903441	-106.7326122706752	North Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyx00xj81jjpp5l2wn9	39.88288414567744	-106.3358562568464	Green Mountain Camp Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcyz00xl81jjr7yypafe	39.8369796684058	-106.3108427937471	Surprise Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz000xn81jjd1nvtsp8	39.83728699632495	-106.3160539100858	Cataract Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz200xp81jjv85vyjhi	39.8395737437921	-106.3139004555672	Eaglesmere Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz300xr81jjle6tcy6i	39.51784094652829	-106.1467939265882	Gore Range Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz500xt81jjmu4we2g8	39.61931006433664	-106.1103041671818	Lily Pad Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz600xv81jjwzk0jpjz	39.6156726254116	-106.0745700712664	Salt Lick Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz800xx81jjqrysnwq8	39.79720066365645	-105.0340926972248	Lowell Street Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcz900xz81jjn1asgaw2	39.6059017399953	-106.0752443397991	Old Dillon Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczb00y181jj4kjgley2	39.57553645473965	-106.071550331985	Dickey Day Use Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczc00y381jjhx8dki4b	39.5877731854013	-106.0935273341164	Willow Preserve Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomcze00y581jj7hots8gl	39.62019764484675	-106.1099074605912	Buffalo Cabin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczf00y781jj3hnatosv	39.76875221912213	-104.8774370800033	Sand Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczh00y981jj3pwfkvnk	39.62389320758508	-106.0819595274635	Mesa Cortina Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczi00yb81jj9erkfp9h	39.71086814489833	-106.1671942078695	Rock Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczk00yd81jjytimumbl	40.59205074440035	-105.0710433876487	Gustav Swanson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczl00yf81jjhjkg1h9c	39.80466970828008	-106.2299603917731	Brush Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczn00yh81jjpkgrvumi	39.82311441391102	-106.2070620429631	Doig Meadow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczo00yj81jjdrly6cnu	39.65291262461384	-106.0728743999233	Angler Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczq00yl81jjvxhdc47r	39.757281978594	-106.1347481643988	Columbine Landing Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczr00yn81jj5bg4kqu2	39.63501314837405	-106.0536808428757	Ptarmigan Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczt00yp81jju1pq1ujn	39.64637738779182	-106.0225879677516	Straight Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczv00yr81jjer8b0kbt	39.63609753369706	-106.0363842944649	Oro Grand North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczw00yt81jjsnnv8qsl	39.60975838579273	-105.9925920126986	Oro Grande South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomczy00yv81jj8wdp34u6	39.59954260409432	-105.9749728532358	Keystone Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0000yx81jjtk1zsfkb	39.75840749373774	-104.8573531461429	Bluff Lake Loop	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0100yz81jjtp9jh9hf	39.66357753734935	-105.878849650846	Loveland Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0300z181jjzwd3kiwb	39.60147440172432	-105.8471163683313	Lenawee Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0500z381jjslbusn93	39.60872484666968	-105.800047087651	Argentine Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0600z581jjcqfzyfxm	39.59210800296419	-105.8710423678056	Peru Creek Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0800z781jjgehxpjp9	39.46187973963848	-106.003727105727	Laurium (Baldy) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0900z981jj1c5pwoub	39.41025283050691	-105.9684488044719	Boreas Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0b00zb81jja69216kq	39.36182857850689	-106.0630319369168	Hoosier Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0c00zd81jj6o68vzqh	39.43606355440241	-106.0887602686889	Upper Crystal Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0e00zf81jjhr0xj8d6	39.4743440454219	-106.0497729907342	Burro Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0f00zh81jjgf5g8psl	39.40109849254601	-106.0792480856982	McCullough Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0g00zj81jjsfi421yx	39.38675956874858	-106.1002042170237	Blue Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0i00zl81jj57yn9ybr	40.15692373796097	-105.0452742050797	Sandstone Ranch Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0k00zn81jjk7gad7g3	39.48785956751627	-106.0672815044742	Peaks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0l00zp81jjju7ag8wm	39.49433227947335	-106.068541844607	Siberian Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0n00zr81jjbr4l4fq5	39.56893622100419	-106.0996986839939	Rainbow Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0o00zt81jjzhe6j0ka	39.58863879096396	-106.044180398738	Sapphire Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0q00zv81jj8pz050g0	39.82866236103656	-106.2189445699557	Grandview Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0r00zx81jjwb18xpe2	39.38223527015502	-106.06306122495	Quandary Peak Lower Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0t00zz81jj2fexhn44	39.41296971885307	-106.1754692831531	Clinton Reservoir South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0u010181jj01991v6c	39.41540136105485	-106.1711325299643	Clinton Reservoir North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0w010381jj41h37kjn	39.79113472982986	-104.9169564348297	Wetland Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0x010581jj3fyd4r2k	39.46832089975095	-106.0122037414915	Mount Baldy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd0z010781jj0apfeoz6	39.75521138321458	-104.8431726926429	Sand Creek Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd10010981jj9516eare	39.75385882745174	-104.8017597248607	Morrison Nature Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd12010b81jjg6dig2cf	39.60436666728035	-106.0022529771691	Bob Craig Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd14010d81jjstqphhns	39.61074508098275	-106.0155691385746	Dillon Cemetery Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd15010f81jjh5pjzk3t	39.73700520808861	-106.1358239906744	Boulder Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd16010h81jj666b2f8b	39.76171790221682	-106.1197392363395	Acorn Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd18010j81jjuy9h22bj	38.94935833122845	-106.1430784091957	Fourmile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd19010l81jj8ssaf3dg	38.83824914408805	-106.0278563910404	Midland East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1b010n81jj3m90csvu	38.38081151249824	-105.847563628293	Kerr Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1d010p81jjjmexz3qu	38.33005569667037	-105.8170777025629	Hayden Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1e010r81jjeq16p2ta	38.3172683170526	-105.7557005234565	Big Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1g010t81jjtccaxpxz	38.43746794269592	-105.9555716125534	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1h010v81jjc9e6q2p7	38.44493860088208	-106.1051734550405	Mears Junction Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1i010x81jj7m231lqx	38.4765637763808	-106.0019702648475	Methodist Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1k010z81jjsg4i5kt9	38.46349868263574	-105.961508131273	Columbine Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1l011181jj2s6g3k5c	38.48436463863356	-106.1847383060888	Pass Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1n011381jjynhr3cle	38.71361738445913	-106.2327176034974	Agnes Vaille Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1o011581jjpnpc33ds	38.81496002173746	-106.3345182373551	Denny Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1q011781jjltigz3qj	38.80353111532633	-106.3748530991033	Ptarmigan Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1r011981jjbkyhtqek	38.76478489558436	-106.3358154911271	Green Timber Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1t011b81jjhlcoz68k	38.70535542469603	-106.3391118002869	Grizzly Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1u011d81jj8b7b7n14	38.63940194494923	-106.3617640086929	Alpine Tunnel Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1w011f81jjock4lbcy	38.64845493229952	-106.3396689269966	Pomeroy Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1x011h81jjqb6qb4vs	38.53155816962575	-106.3235651091878	Waterdog Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd1z011j81jjxsoa9iwv	38.36365952080939	-106.1772882266128	Silver Creek (Rainbow) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd20011l81jjwaw9u0eg	38.3949403535426	-106.2474669362356	Marshall Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd22011n81jjrtixmuhd	38.91108467555848	-105.9776071348216	Sevenmile Creek Access	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd23011p81jj06aukpoz	38.67213039278855	-106.1615915419382	Browns Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd25011r81jjny4fqo6g	39.38495751456215	-106.061721737334	Quandary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd26011t81jj5l81l9t6	40.76669731279923	-107.439936898632	Sherman Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd28011v81jjmu0pejfa	40.76134739611093	-107.4206665573184	Taylor Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2a011x81jjcj5no0gf	40.76365456599837	-107.4235995958818	Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2b011z81jj4xchkhy2	40.76505019024665	-107.4284928194501	Aspen Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2d012181jjsst3hfdj	40.79645457185062	-107.2856112009309	Lost Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2e012381jjl46gp3xq	40.81029593651868	-107.2980973507605	West Prong Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2f012581jjdbebbah0	40.80479900358817	-107.2922806275657	South Fork Slater Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2h012781jj948z4jvm	40.83291081979125	-107.4053892247826	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2j012981jjmr1z5a8t	40.80648106126696	-107.2465473419867	Sawtooth Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2k012b81jj6ayeiequ	40.80032397217228	-107.2197053782799	Grizzly Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2m012d81jjjk9lih51	40.82773764146375	-107.1318679524045	Adams Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2n012f81jjbnsutfwn	40.81069692814533	-107.1319638012038	Adams Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2p012h81jjokahap7f	40.81743187273903	-107.4269509448423	The Gap Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2r012j81jjlzuif1f7	40.75889391470879	-107.3448862300479	Black Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2t012l81jj1wh7nify	40.75783771193459	-107.3336404697053	Campground Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2u012n81jjd4ybzf8y	40.75004907179093	-107.3240100441031	Sawmill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2v012p81jj4p1k581o	40.74269795334507	-107.3650630569036	The Dike Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2x012r81jjl6x7g6w9	40.71566577458363	-107.29074400331	North Fork Elkhead Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd2y012t81jj1hrjh4us	40.76160492322087	-107.1350218640813	California Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd30012v81jj86vqast2	40.76439051191365	-107.0496362775332	Sand Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd31012x81jj9jeh1re3	40.85036597177049	-106.9954658711446	Prospector Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd33012z81jjojw81dge	40.87697641251998	-106.9944180988719	Nipple Peak East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd34013181jjdv78k4xl	40.84470641201094	-107.121530729573	Nipple Peak West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd35013381jjmr4y9kx7	40.8715187590385	-106.9385591771106	Elkhorn South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd37013581jjulfx3q65	40.98903192312459	-106.9718792967065	Elkhorn North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd38013781jjflm7tm1e	40.9670352541909	-106.9183604927806	Pioneer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3a013981jjgbstptih	40.89969910374483	-106.9406717090738	Circle Bar Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3b013b81jjh3b9xpn5	40.98534185065117	-106.9396871256547	Whiskey Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3d013d81jjfy48mdue	40.82930223576449	-106.9033323789544	Ellis South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3e013f81jjtew6ccrl	40.90042220074164	-106.8437803678919	Hare Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3g013h81jjpg3n9oe5	40.9138265803229	-106.8561923674334	Big Red Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3h013j81jjvn3x5uwd	40.89107311815373	-106.8733380842981	Manazanares Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3j013l81jjkly386rt	40.83096267150529	-106.7828145588244	Diamond Park North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3l013n81jjrt5orvlv	40.76784109180205	-106.815501338646	Hinman Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3m013p81jj8tjej7ua	40.74926098637539	-106.8444245484903	Coulton Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3o013r81jj86qzk0no	40.8215322376474	-106.7775644199635	Diamond Park South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3p013t81jjacqn8qir	40.77338149404788	-106.7669089017671	Seedhouse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3r013v81jjlqo09dlu	40.77207420364427	-106.7741454032622	North Fork Elk River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3s013x81jjhe4jdgjj	40.76240859122217	-106.7734950200124	Burn Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3t013z81jjt95w837d	40.68016745332014	-106.8416023721812	Roaring Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3v014181jjbovdfrl1	40.69003626034201	-106.803765103264	Chilton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3w014381jjuphj04ut	40.76982323487066	-106.7631979834203	Lower Three Island Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd3y014581jjkbcr05x9	40.75041832383764	-106.8261882172424	South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd40014781jjq18euwdf	40.76632568804786	-106.7460975986377	Upper Three Island Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd41014981jjao1tpfl5	40.58236058334054	-106.8963970545389	Red Dirt Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd43014b81jje34jm91n	40.55621086898266	-106.8413135602141	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd44014d81jj4iy6spei	40.5600584276127	-106.8500558829949	Hot Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd46014f81jjt4cda0rz	40.56718442652644	-106.886909119203	Mad Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd47014h81jjum3c59ee	40.56918845380287	-106.8159548716365	Summit Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd49014j81jj2h9w0cr6	40.59124446748248	-106.8191973470072	Elk Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4a014l81jjjpbieprv	40.54419685095499	-106.6850638567178	Buffalo Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4c014n81jjrv6zmp8h	40.48167491223263	-106.7763158521227	Fish Creek Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4d014p81jjx2sfbjuo	40.48240481741873	-106.7810408206468	Uranium Mine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4f014r81jjgvi2k7ro	40.47168479198951	-106.621525240768	Percy Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4g014t81jj1x5y6w3d	40.61042212512655	-106.6093558764888	Grizzly Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4i014v81jj1kdq3stc	40.65841773407081	-106.5803382489398	Rainbow Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4j014x81jjq5j5qukv	40.74767072720025	-106.5885695351728	Lone Pine South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4l014z81jjdi1089xx	40.72221070001426	-106.5788963049422	Red Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4m015181jjxxj05yo4	40.67992867443067	-106.5833846174461	Pitchpine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4n015381jj9foyemms	40.7856382682623	-106.892023190461	Pearl Lake Connection Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4p015581jjt28wdgjx	40.99263530868978	-106.7953915910397	Tie Hack Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4r015781jjmltilqyc	40.99680684896159	-106.8156586033239	Encampment Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4s015981jje5r7jfa0	40.94641846809212	-106.6529483206176	Beaver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4u015b81jjrrsgfdca	40.97712031088419	-106.6907187498807	Buffalo Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4w015d81jjh33iggpu	40.93135799767994	-106.6199100195912	Seven Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4x015f81jjqcocn0q7	40.89490011867161	-106.5818524225178	Helena Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd4z015h81jj9lp8furf	40.74648427298683	-106.5962265298584	Lone Pine North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd51015j81jj8rojhasr	40.74979154045333	-106.6124466451319	Katherine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd52015l81jjfxs64c3u	40.95189642654483	-106.3434798938232	Routt Access Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd54015n81jjqeevahi4	40.97932293724148	-106.2544907487382	Pinkham Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd55015p81jjrwmuqjow	40.50221972338534	-105.8887327395941	American Lakes (Crags Campground) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd57015r81jjknkhi2h6	40.49010846380619	-105.9034757719039	Lake Agnes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd59015t81jjqfmhsa6l	40.59058221753906	-105.9467070565888	Ruby Jewel Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5b015v81jja9i4dw9w	40.51794763220282	-105.7708175826984	Corral Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5c015x81jjkzna4ffb	40.55187985249949	-106.0298017440979	Beaver Lodge Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5e015z81jj7tvsrq7h	40.45979093510104	-105.9183080013037	Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5f016181jjte3hw1a9	40.44321508138896	-105.9796927793152	South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5h016381jjftwhpoxo	40.40388255639771	-105.9327970327132	Jack Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5i016581jjzu2uu0e2	40.38535694481549	-106.3447436716253	Hyannis Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5k016781jja1s83gae	40.40031319455099	-106.2592926669902	Grassy Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5m016981jj1tdd5leo	40.35584748146699	-106.2371015176201	Longs Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5n016b81jjiiv1u99m	40.34883959294849	-106.0958751539639	Parkview Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5o016d81jjfkqy9itt	40.16748454752231	-106.1758347311195	Wheatley Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5q016f81jj7vhat1ik	40.48061864587653	-105.8222372708223	La Poudre Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5s016h81jj94qf8i4j	40.63438338892461	-105.8070575627282	Big South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5t016j81jjzh3h101g	40.55294211846854	-105.7814009464794	Peterson Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5v016l81jj9vxd2u7a	40.63450002458202	-105.5317778688594	Jacks Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5w016n81jjfaptp5up	40.57037289475642	-105.5883298654255	Stormy Peaks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5y016p81jjctp5c34v	40.57928428811192	-105.6182171676947	Beaver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd5z016r81jjdjsvopuu	40.64988363768004	-105.698282810915	Browns Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd61016t81jjzp32p0ks	40.6982374403367	-105.540864887792	Lower Dadd Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd63016v81jjhgkf6ye3	40.60983312166218	-105.7571204056633	Zimmerman Crown Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd64016x81jjc5hyyccx	40.71425827098431	-105.7349363881769	Roaring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd66016z81jjba4k5dhw	40.74348073731553	-105.6532554276732	Swamp Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6k017181jjoh1mvx5t	40.80854537667575	-105.6704364273083	North Lone Pine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6m017381jjyrk43bau	40.77747793780491	-105.5382087724845	Lady Moon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6n017581jjof6kf4v6	40.78007420832964	-105.5382695686679	Mount Margaret Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6p017781jjxxqcafht	39.72514401669601	-104.7540039037167	Coal Creek Arena Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6q017981jjjq5unehp	39.72277951167036	-104.84702989471	Del Mar Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6s017b81jjictt0kr6	39.60938628440461	-104.8786804470967	Silo Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6t017d81jjtoql31zj	39.60689043891678	-104.9034923886765	William McKinley Carson Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6v017f81jjjo4xc4p2	39.56187931991352	-104.7879547608417	Cottonwood Metro District Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6w017h81jjtnqnjr1g	39.234156146566	-107.0801056679196	Capitol Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd6y017j81jjr5ulk62v	40.48204373787298	-106.8354603093395	Stables Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd70017l81jj5ijhit4d	40.48473816275504	-106.8379693460626	9th Inning Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd72017n81jjowscbtnz	40.45394676535706	-106.9169722925837	Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd73017p81jjtbv2udtb	37.30294030161915	-107.8800559022335	Jacobs Cliff Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd75017r81jjbdjrdwyb	40.57234175946784	-105.0394648037021	Kingfisher Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd76017t81jjaqvhg6to	37.29367320922343	-107.8722101384398	Rec Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd78017v81jjbz8sm3lu	37.295095990988	-107.8697964815672	Animas River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd79017x81jjmrdmtjp9	37.25327137302585	-107.8788616188226	Smelter Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7b017z81jje4g5uxve	37.23559040339845	-107.8667264457673	Carbon Junction Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7c018181jj0vv6glw0	37.26080864289786	-107.8781539315446	Animas River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7e018381jjdg5x1hh4	37.2880310995819	-107.8616606233276	Lion's Den Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7f018581jj4kgfh6u5	37.28421976445964	-107.8671919293525	Chapman Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7h018781jjf153h1v9	37.26434799568449	-107.8718589882028	Horse Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7i018981jjd6u3bztn	37.23045347492589	-107.8620317329973	Big Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7k018b81jjv9b62pk2	37.29317246220067	-107.8395104520975	Skyridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7l018d81jjr8w2aqdr	40.56193388382666	-105.0710843616188	Mallards Nest Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7n018f81jjy1t3i6ad	37.22383316375596	-107.8563498116439	Sale Barn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7p018h81jjsphitii5	40.56779853875158	-105.0228960722727	Riverbend Ponds - South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7q018j81jj8xx4kb1c	37.27585689101603	-107.8941333398779	Perins Peak (Tech Center) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7s018l81jjyws3dmw3	37.27729379457453	-107.8858108730172	Perins Peak (Ella Vita) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7t018n81jj62m11g21	37.26906069541291	-107.9139573534585	Perins Peak (Twin Buttes) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7v018p81jjggklnish	37.36837721689293	-108.5822132557548	Geer Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7x018r81jj05xuqoco	37.36105477247124	-108.5886056101082	Carpenter Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd7y018t81jjawtp5wph	37.30228161572732	-108.6641420403296	Mud Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd80018v81jjgnb5d2za	37.33412270971316	-108.5934904596727	Hawkins Preserve Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd82018x81jjbrlgaz3l	37.34100255826726	-108.5966837448702	Mesa View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd83018z81jj7k13r3m4	40.38218758174502	-105.0729608108948	King's Crossing Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd84019181jjckh2wr6u	37.35254318923277	-108.5689320384759	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd86019381jjc12mztpf	40.38466752062531	-105.0758832805745	Barnes Softball Complex Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd87019581jj6hfzzqzw	40.38757125083328	-105.0793869972345	Fairgrounds Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd89019781jjofkoky4i	40.39744439145284	-105.1109049693993	Service Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8a019981jjl6tq6aku	40.41942171411326	-105.1244072317685	Mehaffey Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8c019b81jj0onh6f57	40.45144981518255	-105.0918014111491	Sunset Vista Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8d019d81jjue20yt4x	40.41766186824036	-105.0469125474306	Seven Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8f019f81jjn5uthzh3	40.39304095948889	-105.0680601305623	Loveland Civic Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8h019h81jj02ob8jzr	40.37054908171059	-105.1413100550967	Lon Hagler Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8i019j81jjj08tu5b5	40.36912075118881	-105.1493906978608	Lon Hagler SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8k019l81jjkwa7uqih	40.36198985450137	-105.1480133955889	Lon Hagler SWA South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8m019n81jj6nf699fs	40.7681275911868	-105.6060075126351	Molly Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8n019p81jjudwudrps	40.74623694034225	-105.5401682544445	Elkhorn Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8p019r81jjg8q2kuad	37.35335411082176	-108.5490955163364	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8q019t81jjpoxmy1nh	37.34301677589411	-108.2990292511667	Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8s019v81jj7upkvb33	37.34541145352343	-108.2881083996893	Boyle Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8t019x81jjb3s12e16	39.83562578253408	-106.8520598935931	Winter Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8v019z81jjtosi3wrq	39.74272823257436	-106.7049485260219	Bocco Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8w01a181jj6nvgr1qb	39.63681614264826	-107.7052286659107	Dry Rifle Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd8y01a381jjpqvai6li	40.45017968773021	-104.7349152125511	Poudre Ponds Recreational Fishery Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9001a581jjqdhs31lq	40.68953172181759	-105.3103559438121	Hewlett Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9101a781jjbiz9gm7l	40.6947338318783	-105.2843063228881	Greyrock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9301a981jjlo74iq5c	40.68855219709538	-105.3480053784507	Young Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9401ab81jj5evqwovc	40.56651461391714	-105.5551668038229	Signal Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9601ad81jjhubde27g	40.47561797721522	-105.4604165211091	Dunraven Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9701af81jj4eku11z5	40.31510370681212	-105.4051675237938	Lion Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9901ah81jj9ipshwuk	40.31369215145049	-105.5353384301904	Lily Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9a01aj81jjinn45uwh	40.11134128179705	-105.3064975889362	Buckingham Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9c01al81jjeuchno6s	40.11011772389914	-105.282687612979	Interim Joder Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9d01an81jjggffywi7	40.079836468784	-105.2628157316161	Boulder Valley Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9f01ap81jjqcatrqcv	40.08026050532943	-105.2356393148819	Eagle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9h01ar81jj1k2z4pma	40.10483145419575	-105.2657864924214	Left Hand Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9i01at81jjsyeletya	40.07045661684879	-105.2826093673776	Foothills Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9k01av81jjg7sbprab	40.44140464837766	-104.7031239482815	Island Grove Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9m01ax81jjqd7am59u	40.05085295841107	-105.2825786595727	Wonderland Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9n01az81jjxme4qtgt	40.06205229120593	-105.1318486772015	East Boulder Trail at White Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9p01b181jjzryeag45	40.0216337846382	-105.1587752775093	Teller Farm South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9r01b381jjk8dewmgo	40.03977349401953	-105.1425473017319	Teller Farm North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9t01b581jj7gy13iqf	40.0625965059166	-105.2888783813519	Four Mile Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9u01b781jj80qyrp9d	40.00458496786433	-105.4055356869045	Boulder Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9w01b981jjcs9pfs06	39.93804341581768	-105.2565646950331	Doudy Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9y01bb81jjyl3fr1pd	39.92431928694761	-105.2355682863642	Flatirons Vista Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomd9z01bd81jjvo45g32c	39.97924339879034	-105.2746926944079	NCAR Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda101bf81jj1ze9thqh	39.96026092160476	-105.2368215159069	South Boulder Creek West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda301bh81jju81lif7e	39.99731162326638	-105.2802233760418	Enchanted Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda401bj81jjhyp2zfpe	40.00499254539537	-105.3065627673034	Flagstaff Summit West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda501bl81jjznffnrv1	40.00412936263699	-105.3033386994732	Flagstaff Summit East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda701bn81jjq5wgf2fg	40.00177235842055	-105.2969453254078	Crown Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomda901bp81jjppi75dbq	39.99734635792731	-105.3090884219317	Realization Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdaa01br81jjr7nzgot4	39.99886723790564	-105.2828409642023	Chautauqua Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdac01bt81jj1tt7vu4m	39.99752416713532	-105.2926535246591	Gregory Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdad01bv81jj4cgcse9b	40.00886144093614	-105.3253327143447	Chapman Drive Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdae01bx81jjx3t9pmm0	39.99103639743766	-105.319247224389	Lost Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdag01bz81jjddnbj219	40.00650882920792	-105.2945675550402	Halfway House Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdah01c181jjpuyormnd	40.0059747203189	-105.2929004952259	Panorama Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdai01c381jjxbn3epcm	40.01405026841074	-105.2953488187677	Settler's Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdak01c581jjpd7udfxi	40.02008939175775	-105.2978591859639	Centennial Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdal01c781jjznj66lqc	40.03949548630127	-105.1852534595951	Sawhill Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdao01c981jjay76vt24	40.03998822124595	-105.2369916014674	Cottonwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdaq01cb81jj7y39na1c	39.9998087950777	-105.2150385806717	Bobolink Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdar01cd81jj03awbeji	39.98278377876868	-105.2145758469661	Cherryvale Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdat01cf81jjk9cr5lla	39.92890838876391	-105.2331363204033	Greenbelt Plateau Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdav01ch81jjzistr4sy	39.95271549260303	-105.2312973286237	Marshall Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdaw01cj81jj049p59yi	39.9995841267929	-105.1910792066247	Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdax01cl81jjdjb74tur	39.9387260612471	-105.2581417592803	South Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdaz01cn81jjikjcf15s	39.99509945759324	-105.6342802433483	Fourth of July Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb001cp81jjyvcyt9uf	39.61263016176636	-107.8099447274276	Rifle Arch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb201cr81jjmcbfw4ad	40.10141011095544	-105.1916003664772	Dodd Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb301ct81jjvhv7d3ke	40.32976248646852	-106.0199124347929	Illinois Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb501cv81jj081oujky	40.3237682125167	-105.9085158730036	Bowen Gulch Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb601cx81jjlcei46c6	40.27817549648982	-105.8623961175303	Supply Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb801cz81jj5zs7idr1	40.30681507238092	-105.9669079661412	Lost Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdb901d181jjh65rcub8	40.30014604972262	-105.9197643925804	North Supply Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbb01d381jj940ow7uy	40.28226146813468	-106.0845415937876	Trail Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbc01d581jjuh3uhalm	40.25727006892172	-106.1092658838369	Bill Miller Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbe01d781jjxoy3qnj9	40.21511448105667	-106.1408388787202	Elk Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbf01d981jjt989zsh2	40.16334107249067	-106.1081038597518	McQueary Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbh01db81jjbrwoh987	40.20669600626098	-105.8427460353142	Shadow Mountain Dam Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbi01dd81jjphv0wcp4	40.04448849955956	-105.7321677785521	Junco Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbk01df81jjhne1ghlc	39.98653294187298	-105.7429235573594	Devils Thumb Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbm01dh81jjytpfgvyw	40.12937706744302	-105.7642038014059	Roaring Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbn01dj81jjnzk4batd	40.13717792259362	-105.5857633969696	Buchanan Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbp01dl81jjiy88cezq	40.12995298869222	-105.5241716935653	Middle Saint Vrain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbr01dn81jj7ygb2qj3	39.8989020811627	-105.7078589657575	Rogers Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbs01dp81jjkk29hlpw	39.92375822742699	-105.6686242743271	Forest Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbu01dr81jjq2ankycm	40.44199116777182	-104.7576288009011	Rover Run Dog Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbv01dt81jjd5tk4w77	39.88197597411692	-105.7547897574264	Bonfils-Stanton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbw01dv81jjm5kniw24	39.88060037741199	-105.7417702674718	Jim Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdby01dx81jjxyhnmaky	39.89793601307276	-105.8700216787879	Mt. Nystrom Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdbz01dz81jjdebwr861	39.79660659521556	-106.024939822728	Darling Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc101e181jjclro70rk	39.79075210392774	-106.0245914353894	Williams Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc201e381jjftwww47b	39.74034554876621	-106.0277411181365	South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc401e581jjfej7aqil	40.57502099217866	-105.0236955824638	Riverbend Ponds - Cherly Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc501e781jjkn04mhdw	40.57790505059104	-105.0330330506215	Riverbend Ponds - Cairnes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc701e981jj17a6ltv7	40.56514977588612	-105.0074719348928	Colorado Welcome Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdc801eb81jjtrhqkqh1	40.56622225741099	-105.0166775341739	Running Deer Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdca01ed81jjmy0jc6e6	40.76229126930931	-103.3024429676361	West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcb01ef81jjr1n727wg	40.97696029340506	-105.0939765379398	Soapstone Prairie North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcd01eh81jjh5meqseu	40.94387743208389	-105.0841327235441	Soapstone Prairie South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcf01ej81jjyxmx9r45	40.55092218965569	-105.1429012936682	Dixon Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcg01el81jjopg8r4oy	40.56525205702538	-105.1138956541818	Red Fox Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdci01en81jjjnkdelq9	40.55641004832118	-105.1002603477216	Rolland Moore Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcm01ep81jjq3f0icu5	40.53941444309308	-105.12743811344	Spring Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcq01er81jj4k02h9z9	40.7714623539898	-103.2731135793394	Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcv01et81jjmwq5udtp	40.75816791479777	-103.2682484315344	East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdcz01ev81jj32q6ifes	40.26687591785106	-103.7993067747572	Riverside Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdd301ex81jjyfugaehw	40.38685562095629	-104.0920796912652	Prairie Wetland Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdd901ez81jjoy0910cz	40.39263034580566	-104.0932619270124	North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddd01f181jjeot4abcw	40.39114262973643	-104.0931051462791	Pelican Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddh01f381jjwy1wk87q	40.38301850251447	-104.0922127305821	Visitors Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddj01f581jjxeoeea7x	40.53761647282645	-105.0009697962802	Arapaho Bend - Strauss Cabin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddl01f781jjjc98skxb	40.5319388314765	-105.0010646189885	Arapaho Bend - Big Bass Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddm01f981jjkqo1ra62	40.52487711745395	-104.9966124459941	Arapaho Bend - Harmony Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddo01fb81jj8wt00c9r	40.61063627552508	-105.0633728956141	Redwing Marsh Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdds01fd81jjenzl37vd	40.60670236951379	-105.1354450736541	Reservoir Ridge - Foothills East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddw01ff81jj8685dzf6	40.59909630930036	-105.0814790516334	Legacy Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomddz01fh81jj21flsbal	40.634694858652	-105.1683767282533	Watson Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomde301fj81jjo825fqmy	40.64012981359395	-105.1718926364063	Watson Lake North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomde601fl81jj43ko6ahn	40.48263466214891	-104.9034461235842	Windsor Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomde801fn81jjx6uawski	40.35195288614874	-104.4263199548034	Centennial Valley SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomde901fp81jj8t6n6ysh	40.36988168713901	-104.4624664507446	Centennial Valley SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeb01fr81jjwjwd70o3	40.39203932413574	-104.4933141912111	Nakagawa SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdec01ft81jjnnurn9pk	40.42632399582706	-104.5977172079494	Mitani-Tokuyasu SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdee01fv81jj89f88p37	40.17049627266303	-104.9853062481938	Pelican Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdef01fx81jjwb66gvhw	40.42031001629818	-105.8114936558571	Milner Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeg01fz81jjoorxnqsy	40.43481695688955	-105.7303403046762	Chapin Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeh01g181jjzmzg50pe	40.41219347514427	-105.7329789431348	Tundra Communities Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdej01g381jjqf38vhv5	40.43123975687082	-105.5010149098678	Cow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdek01g581jj8qrxelqv	40.39645596360086	-105.5130908421749	Lumpy Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdel01g781jjd0n3bqkz	40.4106198477923	-105.637154295614	Alluvial Fan Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomden01g981jj0mikx3k6	40.40719506605662	-105.6262955838644	Lawn Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeo01gb81jjrdyxbadw	40.38700736412621	-105.6099290929712	Deer Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeq01gd81jjg7dyjhvj	40.37288454792347	-105.6140875220576	Upper Beaver Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomder01gf81jjiprcc2g2	40.3584132603085	-105.5840577603569	Moraine Park Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdet01gh81jjueacmy35	40.3561696935252	-105.6157504587515	Cub Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdeu01gj81jj1wjp9nrd	40.35487391191195	-105.631132064621	Fern Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdev01gl81jjnwbl3czr	40.34159440644769	-105.6054473817332	Hollowell Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdex01gn81jj0ypa0sda	40.32052262495205	-105.6237378625826	Bierstadt Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdey01gp81jjy9t1odrg	40.32004359014177	-105.6200712734995	Storm Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf001gr81jj5ahxpzpz	40.32033000319456	-105.6085212531259	Sprague Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf201gt81jja8jin32a	40.27214283272786	-105.5566871600007	Longs Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf301gv81jjzkag9tla	40.31193940307725	-105.6457030301206	Bear Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf401gx81jj9me6lgkr	40.31198406634261	-105.6460609322816	Bear Lake Loop Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf601gz81jjk8w3oym5	40.20845064870004	-105.561105675715	Finch Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf801h181jjd1tqjy7a	40.20780496521594	-105.5665164574141	Wild Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdf901h381jjwonhocye	40.23943452755919	-105.799926500634	East Inlet Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfb01h581jj0k3iv3nv	40.26592927984279	-105.8325744054586	Kawuneeche Visitor Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfc01h781jj88nebu76	40.27708566232107	-105.8501065582875	Sun Valley Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfd01h981jjpac3ph3q	40.30732702975121	-105.8412546664714	Green Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdff01hb81jjljx56gfd	40.31609701379188	-105.8435892078623	Onahu Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfg01hd81jj7hwbsexf	40.3445693042629	-105.8585232520766	Coyote Valley Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfi01hf81jjmwufj7p7	40.35480347157988	-105.8575438600006	Bowen / Baker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfj01hh81jjb4hu6ta7	40.37257537606287	-105.8546959161819	Holzwarth Historic Site	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfl01hj81jjorgonfdo	40.39981792039278	-105.8474437870293	Timber Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfm01hl81jj1f21s170	40.40166926882564	-105.8487228179756	Colorado River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfo01hn81jjmles0mbu	40.39910023047728	-105.6411205584473	Beaver Ponds Boardwalk	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfp01hp81jjn2msfdgu	40.39355803726913	-105.6555234628467	Hidden Valley Accessible Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfr01hr81jj7eao4097	40.08592238854723	-105.2071443902209	Coot Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfs01ht81jjawpx6may	39.47233927172673	-106.0380621509087	Illinois Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfu01hv81jj8e1p04ro	39.57020002029864	-106.05249360766	Blue River Inlet Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfw01hx81jjiuayuakq	39.15378673342033	-106.4634693622537	North Halfmoon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfx01hz81jjbcdt16vx	39.49510975135489	-106.0482245968124	Breckenridge Recreation Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdfz01i181jjdpo62lgu	39.76747205061213	-107.1021182205074	Sheep Creek Parking Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg101i381jjb2xol7z4	39.47847925343655	-106.0402553135865	Carter Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg201i581jjgp4jba10	39.50238019019798	-106.0522863982613	Iowa Hill Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg301i781jj074csprz	39.48340218489565	-106.0097386784373	B&B Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg501i981jjwi2cm2et	39.51498642044705	-106.0264095793916	Gold Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg601ib81jj6m1bta6u	39.44365289618244	-105.9974526255947	Bakers Tank Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg801id81jjo969pugu	39.56970836590801	-106.0850205363745	Miners Creek Lower Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdg901if81jjfot79fa4	39.57104587928436	-106.07419929767	Summit Medical Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgb01ih81jjoqtx68yx	39.54032212932432	-106.0362126980942	Swans Nest Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgc01ij81jjxhm6n5r1	39.53823614392478	-106.1411588365012	Officers Gulch South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdge01il81jjvruktub6	39.53998863047576	-106.1430220505519	Officers Gulch North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgg01in81jjue769n79	39.47448390854469	-106.01550762697	Sallie Barber (Baldy) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgi01ip81jjdi2rqb50	39.60018163863649	-106.0042283181048	Soda Ridge Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgj01ir81jj8ss6ewwp	39.58794354005116	-106.0155029814897	Whispering Pines Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgl01it81jj6px0lfhg	39.60818749114993	-106.0717941089238	Fisherman Access Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgm01iv81jjbtno4itc	39.59978173796288	-106.084463769123	Giberson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgn01ix81jj0ac58bbx	39.61291594139639	-106.0130003027968	Tenderfoot Track Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgp01iz81jj836iu5ou	39.61058486674868	-106.0218761618207	Dillon Nature Preserve Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgr01j181jja10258sj	38.96561301120857	-107.5341258280788	Hubbard Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgt01j381jj6u6uv3bx	39.05714842615696	-107.5881783637691	Terror Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgu01j581jjouh6v3j7	39.09269067221305	-107.6455823166059	Overland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgw01j781jjn56zmh19	38.86112649007927	-107.1637720452053	Cliff Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgy01j981jj3qqdakuq	38.86350823118509	-107.160832627095	Horse Ranch Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdgz01jb81jj91qtwgzh	38.95891052373273	-107.2631313980164	Dark Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh001jd81jjfu74zy76	38.87081942434972	-107.2089481179978	Lost Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh201jf81jjf10mh5q1	38.6963012850571	-107.0506664088974	Mill Creek Trailhead (North)	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh401jh81jjy45bb9za	38.80804870470789	-107.2938467867237	Little Robinson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh501jj81jj3qfcyxu3	39.82383106926454	-107.099387623431	Hack Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh601jl81jjmpyo8yf4	39.62657265160992	-107.1054366052333	Glenwood Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh701jn81jjvt11qip6	38.81328883839325	-107.3123783176556	Throughline / Coal Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdh901jp81jjqu1r1kpw	38.49278316960016	-107.5610971762414	Crystal Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdha01jr81jjyi28hulq	38.54757509228791	-107.3175915420357	Coal Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhc01jt81jj5ld3d5pu	38.6395159058637	-107.1848458329739	Rainbow Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhe01jv81jjoxhfnosw	38.65906731068209	-107.3096062954697	Soap Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhg01jx81jjgkdh4v8j	38.80137235102566	-107.0865287021363	Swampy Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhh01jz81jjg3ibu13c	38.81186657836477	-107.0865978917274	Beaver Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhj01k181jjeaz34b0v	38.96405363106881	-106.9884383633453	Lower Copper Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhl01k381jj4wv7mi69	39.11921880590306	-106.8560965792999	Conundrum Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhm01k581jjiov8wfo3	39.90544940816405	-106.765210665736	Shorties Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdho01k781jj278fnqad	38.9992954312748	-107.0030627494993	Rustler Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhp01k981jj6glyj8db	39.00954744336229	-107.0113113666186	Bellview Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhr01kb81jjhnbc2zpf	39.92321558779027	-106.7373976791683	McCoy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdht01kd81jjbz9h8vxb	38.8563509010564	-106.9356881558073	Whetstone Vista Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhu01kf81jjastp6rf1	38.9867955744992	-106.7578885274238	Mount Tilton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhw01kh81jj4mzhm2x2	38.82114181221231	-106.8687364234521	Caves Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhy01kj81jjzttxwix8	38.85911886199343	-106.8052061643708	Deadman Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdhz01kl81jjk86g0wje	39.40203996316318	-106.0512012246629	Lower McCullough Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi101kn81jjmw4yazva	38.75136568182231	-106.4347554016105	Garden Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi201kp81jj5mcto5mn	38.75775449780184	-106.6801042950937	Summerville Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi401kr81jjiuili47h	38.65569359203398	-106.5755131659955	Gold Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi601kt81jjjtu8ik62	38.76916099352635	-106.6195293745669	South Lottis Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi701kv81jjlgi5zouu	38.52147598064978	-106.4160151085544	Canyon Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdi901kx81jj1364mfa2	38.52679961057999	-106.4820714102028	Waunita Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdia01kz81jjbvy32pdw	38.43875603877905	-106.3814506523842	Agate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdib01l181jjy4l0mxtw	38.35403162033321	-106.415992996149	Long Branch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdid01l381jjxcb5tszh	38.02466342999947	-106.8412451824748	Stewart Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdif01l581jj3wcxgnbg	37.97871053621682	-107.1700981018917	Tumble Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdig01l781jj4e0clcwd	38.05169637781	-107.0886264228711	Rough Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdii01l981jjdf9r8w7y	38.02203801109048	-107.1880109852008	Deer Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdij01lb81jj8ccvagsq	38.02926651334184	-107.1586228624032	Brush Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdik01ld81jjsfanh03g	38.17707853969785	-107.3232453883272	Little Elk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdim01lf81jjdmmgotdy	38.0431489686905	-107.3106501805509	Crystal Larson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdin01lh81jjf023fafp	38.20691423463013	-107.3854554675426	Big Blue Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdip01lj81jjd6fq60u8	38.19113943941128	-107.423256819502	Fall Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdiq01ll81jjd29ji4ye	38.22512955503471	-107.386636309935	Alpine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdis01ln81jj6irddtfk	38.22066564954638	-107.4662748964578	Alpine / Little Cimarron Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdiu01lp81jj2o0yiq9w	38.06255746501031	-107.4220317864172	Nellie Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdiv01lr81jjelcl93oq	38.03068233254477	-107.4913435307717	Matterhorn Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdix01lt81jja25kkf60	39.42949140706339	-105.0637265094344	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdiy01lv81jj311c8wc3	39.42911556096117	-105.0686826145314	Roxborough State Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj001lx81jjk0drlm0t	39.96173834835566	-104.7606243157673	Bruderlin Stone House Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj101lz81jj4qgn51u2	39.9382223692339	-104.7518327790463	Neidrach Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj201m181jjio4xpgyf	39.93853686412917	-104.7517866422443	Prairie Welcome Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj401m381jjjs53shv4	40.43502829160291	-105.04073559154	Swim Beach Access Point	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj501m581jjw8czc70k	40.42533970586354	-105.0442747977838	Heinricy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj701m781jjzklt6fei	40.4502068548828	-105.0411468833014	Willows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj801m981jjzapxs0zo	40.01750298447526	-106.798419603622	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdj901mb81jjje29okes	39.91805511213551	-106.8024901214172	Stiffel Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjb01md81jj33x1jyni	39.33021300163994	-104.737495886692	Canyon View Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjc01mf81jjmjdc1oab	39.33123825442474	-104.7388229981935	Juniper Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdje01mh81jj7ks1xb9o	39.34877468194343	-104.7642458539579	Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjf01mj81jjv8pt06bx	39.35959834334601	-104.7684123340484	Lucas Homestead Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjg01ml81jj3peqv3b3	39.35283981126874	-104.7661440438378	Westside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdji01mn81jjh48u7r10	39.333371567782	-104.7446264483225	Inner Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjk01mp81jjqchftl91	39.52089595156029	-105.0774110838968	Platte River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjl01mr81jjxtknyswp	39.52853702132019	-105.089764838699	Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjm01mt81jjhj242a6a	39.49471560987796	-105.0917360252696	Wetlands Connector South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjo01mv81jjzbzjpbn5	39.5606570362857	-105.0666408956664	Dam Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjp01mx81jjf77csg26	39.53982395550387	-105.0503053463593	Plum Creek Access	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjr01mz81jjj5zv2ayj	39.5451307847856	-105.0858805693864	Deer Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjt01n181jjds5tuxsq	40.03171525190663	-106.8464445416549	King Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdju01n381jjmb3uc87i	39.62526489025053	-104.846302133419	Cottonwood Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjw01n581jj227diwa3	39.61364082896887	-104.816445637454	12-Mile South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjx01n781jj80trmnmu	39.62346127408186	-104.8307908505503	12-Mile North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdjy01n981jjpoh4pyrl	39.65084855539893	-104.8523340656143	Tower Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk001nb81jjhnftv8o4	39.64455650090149	-104.8465297848464	Smoky Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk101nd81jjlp79izh9	39.63223474606465	-104.8355713740518	Shop Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk301nf81jj5fffh8ju	40.03148437465852	-106.7823842152654	King Mt Trailhead (Highway 131)	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk401nh81jj4nxwblrn	38.73726694459289	-104.8287467109726	Campground Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk601nj81jjukbtrwac	38.73129088599654	-104.821118593027	Limekiln Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk701nl81jjmc13rmyw	38.73494721275818	-104.8196142124684	Coyote Run Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdk901nn81jj1qqdgkap	38.6875510440544	-107.5968786836339	East Shore Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdka01np81jjk1n7qd8m	38.67917829528041	-107.6053655410881	Indian Fire Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkb01nr81jjnml2abvc	38.67879434210811	-107.6052367151581	West Shore Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkd01nt81jjdqdjjzwn	39.9305115106224	-105.3399512116409	Crescent Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdke01nv81jjgdejn8wc	39.93149391327695	-105.281640571816	Eldorado Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkg01nx81jjciu1zws5	39.85646791417106	-106.7996699952107	Pisgah Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkh01nz81jj0oe6yver	39.83111770513229	-106.6409175249526	Windy Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkj01o181jju8xxmd7j	39.39042714054808	-107.2752761557183	Lorax Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkl01o381jjz13rjo1r	38.92792935531153	-105.4967247414605	Coyote Ridge Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkm01o581jj61ik9tfr	39.31965102617422	-107.2779227534485	Thompson Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdkz01o781jj33oi71wj	39.62260698642356	-106.9073737191322	The Maze Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl101o981jjs8ofmfyc	39.65765736695982	-106.8148182421858	Boneyard Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl201ob81jjhum5j6ts	39.65093905192835	-107.0651127748488	Ute Trail Trailhead (Dotsero)	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl401od81jjh6j4ljt1	40.15152155105294	-105.9999200579507	Hogback Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl501of81jjct2rgsr1	40.10830981875986	-106.0320981576764	Jacques Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl601oh81jjzgdvyyk8	39.28078445766024	-108.8426199178566	Mack Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl801oj81jjj8vvapnf	39.27185874916103	-108.836701058783	Highline Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdl901ol81jjrpqrf808	39.05746622387359	-108.46287537256	Corn Lake Picnic Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdla01on81jjxx41aw4e	40.00172061336319	-105.8392462073477	The Phases Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlc01op81jj8bzezxiq	39.06025416255247	-108.4881497513188	Wildlife Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdld01or81jjvo91e158	39.07763040265944	-108.6084474090635	Tail Race Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdle01ot81jjdrzgmpno	39.07928022346933	-108.6089822660558	Duke Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlg01ov81jjcl582dvz	39.08119743845391	-108.6101895381706	King Fisher Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlh01ox81jji8m56rzb	39.08362367720603	-108.6115384408757	Osprey Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlj01oz81jjyfyv5zqs	39.14892570548284	-108.744160499933	Fruita Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlk01p181jjtzxpfd47	39.16723593615917	-108.3026468155453	Old Orchard Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlm01p381jjug12zekv	38.06773994096049	-102.9350330778324	Red Shin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdln01p581jj7kawukz2	38.07101281601049	-102.9285377573974	Red Shin East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlp01p781jjnbmop0ks	38.08309727386728	-102.96212550849	Red Shin North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlq01p981jjnleqonbc	38.27247250431395	-104.7706237360114	Northshore Marina Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdls01pb81jjm4wuabyy	38.25122207589071	-104.7356973079025	Arkansas Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlt01pd81jjodcayula	38.27502465352161	-104.7744806911378	Eagle View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlv01pf81jj7t3k42pb	38.27831281248299	-104.7513247725541	Juniper Breaks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlw01ph81jjfji0cop9	38.27060671376429	-104.709073718573	Pueblo Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdly01pj81jjmghfzdpa	38.26140848112896	-104.7023111206365	Osprey Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdlz01pl81jj6vx4lvu8	38.27025381131326	-104.715128305695	Rock Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm001pn81jjz2xekqyq	38.2945821840547	-104.8696750439048	Ten Trail North  Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm201pp81jjtjrjgplz	38.3042286325333	-104.8569052238748	Pueblo Reservoir SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm301pr81jj5wqllw1q	37.61589101299044	-104.8360285584747	Hogback Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm501pt81jj5vwiiq2k	37.60284327164561	-104.8323499303098	Cuerno Verde Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm601pv81jj1fh84uzs	37.6128523286061	-104.8418337958998	Wetland Walk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm801px81jjcxpwz4wj	40.57841146613565	-105.1787054126702	Well Gulch Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdm901pz81jj9ear4ujv	40.56436976015152	-105.1746041076925	Arthur's Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmb01q181jjnwdzl34y	37.40939620096307	-108.2648597315394	Quarry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmc01q381jjsk6d4dlx	37.40462958472777	-108.2785333356185	Chicken Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmd01q581jj62fztjmf	38.89456433129031	-105.1846828484246	Black Bear Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmf01q781jjl9yf09z4	38.90247682031084	-105.1833657576841	Grouse Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmg01q981jj7weiextn	38.87893444642294	-105.1803308074128	Wapiti Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmh01qb81jj7305ijjj	38.87875126151183	-105.1763644419017	School Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmj01qd81jjkohqljwz	38.87897286862432	-105.1787860428067	Preacher's Hollow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdml01qf81jjnlpkhdp8	38.88127577559236	-105.1814089398478	Outlook Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmm01qh81jjin90rgop	38.88441872074756	-105.1827428484303	Lost Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmn01qj81jji1ke142z	38.88408973504965	-105.1798826524753	Livery Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmp01ql81jjmxgrrdfs	38.88628839781387	-105.1799804356351	Elk Meadow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmq01qn81jj4a0mzh26	38.88949393335335	-105.1816373895507	Homestead Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdms01qp81jjkryd52rr	38.89093078549484	-105.1790350978368	Peak View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmt01qr81jjs88ayq6s	38.88194153999756	-105.1736581535224	Dragonfly Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmv01qt81jj415ccbed	38.8381526306836	-105.1739580714754	Dome Rock SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmx01qv81jj2mrfq6rm	37.05602865003925	-107.4137230086869	Piedra Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdmy01qx81jj8d8qdrul	37.02514849516045	-107.4050434514981	Windsurf Beach Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn001qz81jjg8m364iw	37.0445151586875	-107.4071614061125	Watchable Wildlife Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn101r181jjqauj3qt1	38.22212797627834	-107.7348956645785	Ridgway Marina Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn201r381jjti9ia1ws	38.21993716195259	-107.7382608486094	Twin Fawn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn401r581jj87x4glx5	38.21996149013881	-107.7314205819291	Mear's Bay Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn501r781jjghfgum42	38.21245741151391	-107.733730960327	Forest Discovery Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn701r981jjsxxdxcf9	38.21302390168002	-107.7342721597056	Wapiti Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdn901rb81jjvhtn2kso	38.24396248247528	-107.7596514111194	Enchanted Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdna01rd81jjnq8k0p4z	38.20239166950058	-107.7347338262811	Cookie Tree Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnc01rf81jjgpwek654	38.19000377689109	-107.7472190843411	Confluence Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnd01rh81jjgwdrb4s3	39.67615902494385	-107.6993919539853	Rifle Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnf01rj81jjeixpwaw4	39.67380519587179	-107.6997068858561	Squirrel Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdng01rl81jjalj2dl2a	40.16715590748328	-104.9828647207222	Bald Eagle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdni01rn81jjgxlx69qi	40.16831972655286	-104.9838659919718	Muskrat Run Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnj01rp81jj1g9wygvg	39.31471378405649	-106.6384421722134	Chapman Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnl01rr81jj6szpypi7	40.28669775498231	-106.860589530563	Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnm01rt81jjikf5897b	40.2687456321554	-106.881630510623	Wetlands Waterfowl Viewing	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdno01rv81jjhpr8ssbt	40.27254151556421	-106.8764397089288	Lakeside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnp01rx81jjbiwehidu	40.28679975390325	-106.8319292751131	Stagecoach Dam11812 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnq01rz81jjnky26voc	40.27534117346422	-106.8423771313145	Morrison Cove Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdns01s181jj5tel1m4y	40.26878286823138	-106.8760101070221	Elk Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnt01s381jjvtcry7wm	39.49459270208622	-105.3807124866942	Mason Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnv01s581jj7qhxjv58	39.49726715936933	-105.3820958853119	Davis Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnw01s781jj55tr218m	40.80619401832686	-106.956391815289	Tombstone Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdny01s981jjix46ersm	40.80875493952362	-106.9683041487081	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdnz01sb81jjpf9vkaxe	40.79639787970064	-106.9481433529162	Willow Creek South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo101sd81jjxt8pedxa	38.71240842730964	-108.0400886236907	Sweitzer Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo201sf81jjq66wy1xu	39.53916908664194	-106.754491529502	Meadows Day Use Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo301sh81jjgxka5fkz	37.14437392138556	-104.5701148148639	Levsa/Reilly Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo501sj81jjxne133pq	37.13330323476949	-104.5605953538927	South Shore Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo701sl81jj1kpuvzu3	37.14473257714605	-104.5685350803846	Carpios Cove Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdo801sn81jjqwfl9b1z	37.1454937202435	-104.5696230150748	Park View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdoa01sp81jjjiqai9c0	37.13304845677894	-104.6096275816604	Reilly Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdob01sr81jjopw90a85	37.11831769347884	-104.6037148371387	Longs Canyon Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdod01st81jj7bi0450m	37.13486872433513	-104.539581892772	Sunset Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdoe01sv81jj4geep020	39.21379414352106	-107.8118877176908	Pioneer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdog01sx81jj9uxvkuig	40.49101283587068	-107.312436531213	Yampa Headquarters Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdoh01sz81jjhujz2551	39.07225626592767	-107.1816813098116	Beaver Lake SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdoi01t181jjwos6v94z	37.68435729393306	-105.7357220491592	San Luis Lakes SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdok01t381jj8vtnrs96	40.3600298377501	-104.1087380729476	Andrick Ponds SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdom01t581jjbxtxzvbv	39.3696409212261	-107.0430056162768	Basalt SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdon01t781jjaimxcaw4	38.5424951539604	-106.021631142389	Frantz SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdop01t981jjdtautotd	40.00994910930398	-105.8405758475629	Fraser River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdor01tb81jj3jjzu58u	40.60853316212901	-106.2818658626073	Moose-Goose Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdos01td81jjngp66oei	38.54406149706884	-106.0062197492411	Sands Lake SWA West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdou01tf81jj3oq208mj	38.54338835795923	-106.0059005543346	Sands Lake SWA South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdov01th81jj5k53pduk	38.5435246354279	-106.0026206926623	Sands Lake SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdox01tj81jj93nv6a0s	38.54571186638879	-106.0133916903485	Mount Shavano SWA West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdoz01tl81jjz0j9kaj7	38.54559862809952	-106.0108541248655	Mount Shavano SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp101tn81jjix44t7vr	38.54348140857611	-106.0201419156404	Frantz SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp201tp81jjn8v22ajt	39.65100977292394	-105.4156495948825	Bergen Peak SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp301tr81jj6rf7ii1l	39.67171573957253	-105.410491931464	Bergen Peak SWA North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp501tt81jj8v8vx1qt	40.377720677731	-104.6722456275933	Brower SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp601tv81jj7ibrk6x1	39.95017550270357	-105.5045419765278	West Magnolia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp801tx81jje9p8ecvz	40.80120215180709	-105.5582785049447	Dowdy Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdp901tz81jjeli7p0dv	39.19794864588522	-105.5534795157246	Ute Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpa01u181jj690n9w7i	39.12486400333077	-106.9046694826607	East Maroon Wilderness Portal Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpc01u381jjbuljld7w	39.09856790703241	-106.940599576586	Maroon Lake Day Use Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpd01u581jjmiv9rztb	39.103200899169	-106.9342934062231	West Maroon Portal Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpf01u781jjs0bm2foj	39.20008716202115	-106.9940872243527	East Snowmass Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdph01u981jj6vs5nh9a	39.0246536522954	-107.0507474823731	East Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpi01ub81jjzl3rywvd	39.07924013118274	-107.0859519703381	Geneva Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpk01ud81jjd13wdlui	39.24811296806187	-107.0552109619117	Hay Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpl01uf81jjejuineyd	39.09421055447256	-106.659822372228	New York Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpm01uh81jj46tpi7df	39.09231473070913	-106.6442721482326	Tabor Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpo01uj81jj8goxuowc	39.07715079446873	-106.611742951364	Grizzly Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpq01ul81jj8m67hjv2	39.03096809297985	-106.6152680396471	Petroleum Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpr01un81jj3rrgze8y	39.02938252693814	-106.8078723716719	Pearl Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpt01up81jj0o4wwxio	39.04280604269201	-106.8081368599194	Cathedral Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpu01ur81jjfteimble	39.12177054406342	-106.624342474539	Lost Man Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpv01ut81jjm9vvbgy7	39.125631655986	-106.6470522358439	Braille Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpx01uv81jj51nrhi6i	39.1169287024459	-106.6958843200193	Grottos Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdpz01ux81jjcpdlt2su	39.11955126174214	-106.722529344633	Weller Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq001uz81jjpmfzl3u1	39.30298095246259	-106.6531717036893	Twin Meadows / Spruce Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq201v181jjj31ovxq6	39.18252232655205	-106.8143052021191	East Ajax Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq301v381jjbko89v3y	39.18132427416298	-106.8119705972007	Ute Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq501v581jj7sugbhpc	39.03899386679819	-107.1731534331017	Yule Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq601v781jj9qeooop6	38.98916195718843	-107.0650972428968	Yule Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq701v981jje17720x9	39.06726099476502	-107.1849034844821	Raspberry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdq901vb81jjm19ddrna	39.08030023320274	-107.1030709621524	Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqa01vd81jjx0w0en79	39.23483330209701	-107.2019090559541	Avalanche Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqc01vf81jj7mvurexz	39.17921478885476	-107.2323999906114	East Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqd01vh81jjxupn2iwl	39.14055491872312	-107.2588995777261	Placita Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqf01vj81jjpahxf3xf	39.07390444658802	-107.1841984772561	Carbonate Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqh01vl81jj0vrpehx5	39.07744449562338	-107.1458453318357	North Lost Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqi01vn81jj8gz3vz3f	39.30400145540615	-107.1247011994545	Thomas Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqj01vp81jj8l8fovvv	39.27024598283709	-107.2273355643027	Perham Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdql01vr81jjku5mc4yy	39.19193504595884	-107.2789871368642	Braderich Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqn01vt81jjqqwnajbb	39.24456342306151	-106.5302840424334	Frying Pan / Lily Pad Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqo01vv81jj5y5agix7	39.23980328172132	-106.5929694272378	South Fork Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqq01vx81jjv93b3g4n	39.29480387801726	-106.6032384258684	Granite Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqr01vz81jj694d1ihu	39.26310037811823	-106.6303487687558	Chapman Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqt01w181jjq531sfht	39.29921819292257	-106.6523328910951	Sawyer Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqv01w381jjxpgnz25x	39.28554490857211	-106.6360925797281	Chapman Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqx01w581jjayoswncc	39.31164778483761	-106.6442150788524	Chapman Campground Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdqy01w781jjvjmijdyx	39.29194235174156	-106.5268296531156	Lyle Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr001w981jj7ci8ghai	39.35639412886779	-106.8191670391019	Rocky Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr201wb81jje2t4cdki	39.34999875548458	-106.5876473786563	Josephine Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr301wd81jjr5b6s5iw	39.36540214212631	-106.6333219985507	Last Chance Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr501wf81jjssxjpv1w	39.35923107877237	-106.5405744609114	Savage Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr701wh81jjc36otm0l	39.42272921703096	-106.6394783213768	Eagle Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr801wj81jja338ig8j	39.37973582753396	-106.6489127926229	Tellerium Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdr901wl81jjq2svlfm0	39.43639799807929	-106.683936672492	Mount Thomas Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrb01wn81jjjpg2v12e	39.37579750330465	-106.8165362631647	Ruedi Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrc01wp81jjq16g74a9	39.43834347682528	-106.8942957054174	Red Tables Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdre01wr81jjhtdn8k9r	39.37750173162945	-106.9830554422756	Basalt SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrf01wt81jjwh50b7rf	39.46214976744465	-107.0569771674136	Basalt Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrg01wv81jj4cfew5y9	39.46783221272511	-106.7771418425809	Antones Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdri01wx81jjxboy5e0t	39.60618550731881	-106.6499731052023	Squaw Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrj01wz81jjzbfun1gp	39.50515203738998	-106.6833154101363	Yeoman Park Discovery Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrl01x181jjvkb0qzpb	39.49228036643919	-106.6585947242995	Fulford / Lake Charles Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrm01x381jjxpptue2o	39.50399268937001	-106.6783172386762	Brown's Loop Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdro01x581jjsqamkuvw	39.53928263073109	-106.6168278413936	Middle Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrp01x781jj1s7qd2aj	39.52200803487979	-106.6303338455064	New York Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrr01x981jjwpxzsob9	39.58575341105296	-106.596027944513	East Lake Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrs01xb81jj4wiv7g5f	39.58931408895937	-107.1901613203157	Hanging Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdru01xd81jj9kxs4rwl	39.81528296696982	-107.1839517434878	Hilltop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrw01xf81jj1099xebf	39.82645773049464	-107.296017347731	Indian Camp Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdry01xh81jjba7h524n	39.84328227298654	-107.3347772694209	Budges Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdrz01xj81jj6128nk4n	39.85010695832332	-107.3191194893614	Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds101xl81jjenwatvq3	39.7965585750496	-107.1618213765562	Sweetwater Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds201xn81jjsg18ijpd	39.80044102997829	-107.1597936299577	Ute/Sweetwater Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds401xp81jjbz9kac0n	39.91002327794013	-107.1601514249845	South Derby Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds501xr81jjkbgb0j1u	39.9543037143597	-107.0647718383455	Stump Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds701xt81jj760kwamz	39.57140270344392	-107.2916935129922	No Name Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomds801xv81jjsnjytpxg	39.6216346634767	-107.4180916100893	Keyser Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsa01xx81jjcbfcex55	39.8228225730676	-107.4359750204176	Crater Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsb01xz81jje1mbd3hu	39.76972860225172	-107.4132116430116	Patterson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsd01y181jjhadrt5uf	39.95182333946933	-105.8141959009378	Fraser River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsf01y381jj30sl45st	39.66500518994685	-107.6253717423905	Mansfield Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsg01y581jj27nf5glb	39.72467688198025	-107.6399823704019	Upper Cherry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsi01y781jjhniszq7n	39.67513034021946	-107.6366366691255	Lower Cherry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsj01y981jjvy4rb2hy	39.8648336249539	-107.5340241292472	South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsl01yb81jj3tfawkmg	39.8397363110925	-107.5491877379153	Cliff Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsm01yd81jjtugfhftp	39.30546184427885	-107.5648699751708	Cayton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsn01yf81jjihavul5l	39.32608744673612	-107.675226339015	Northern Boundary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsp01yh81jjyrkzu06d	39.24228780431523	-107.5871331102537	Owens Loop Eastern Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsq01yj81jj4xveusqj	39.25126020197686	-107.6171858276647	Owens Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsr01yl81jj6njk63x7	39.28248951887355	-107.6644927115033	Hightower Northern Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdst01yn81jjt56p6bgi	39.25000073103364	-107.644437069677	Hightower Southern Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsv01yp81jjuib5a6we	39.41129234865497	-107.802419287812	Battlement East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsw01yr81jj46sdv5xl	39.94581492941697	-105.8140427277843	Outdoor Info. Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsy01yt81jjkzbv7t1s	40.25187614566052	-105.8525492549578	Grand Lake Metro Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdsz01yv81jjcck5kfxf	39.40127859103377	-107.9468568726446	Battlement Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt101yx81jjjhhwhdc1	39.11533703045324	-107.7895226416798	Western Monument Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt201yz81jjus1oetlp	39.10488316392469	-107.7818897296438	Upper East Leon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt301z181jjpwzwdedm	39.01079391449917	-107.8612174162621	West Green Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt401z381jjpv7pso0q	39.04628931278001	-107.8739563469337	Eureka Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt601z581jjixxm4hqz	39.06214288415246	-108.0467570727038	Lake of the Woods Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt701z781jjcovalx3b	39.02894217349573	-108.0215835630705	Land of Lakes Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdt901z981jjccit81mp	39.04250225576775	-107.9979402217512	West Crag Crest Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdta01zb81jj2aexbe13	39.0487548011064	-107.9369827951824	Crag Crest East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtc01zd81jjvht0tie4	38.9554695437866	-108.1026967978263	Flowing Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtd01zf81jjxa3x5iai	39.01239313571349	-108.2332707532141	Coal Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtf01zh81jjnbh7qotl	39.00040168568992	-108.1826189895799	Coal Creek East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtg01zj81jjgqwg0mx8	39.00204974205783	-108.1321727511511	Raber Cow Camp Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdth01zl81jjqdtb42dy	38.99099359075164	-108.0965964591923	Carson Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtj01zn81jj75geu3z4	38.99659623072937	-108.1116144992396	Carson Lake West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtk01zp81jj9sce3kn4	39.04657009176603	-108.0909149506113	Glacier Spring Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtm01zr81jjce9aaqop	38.8522111179807	-108.7943545344296	Little Dolores Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdto01zt81jjiwv3ekrp	38.84379421949935	-108.7329112672988	Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtp01zv81jjuxyo1qot	38.78426428980318	-108.675819725704	Wildcat Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtr01zx81jj98foc5qb	38.67841989448436	-108.7251282842786	Divide Forks/Rim ATV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdts01zz81jjn7yut9lz	38.57020040554873	-108.4256573698062	Middle Point Escalante Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtu020181jjqcet1iqv	38.67970770506312	-108.5208272334945	Black Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtv020381jjfmex0yku	38.35146293316382	-108.5005716014782	Indian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtx020581jj5f1s2hsv	38.3940756618671	-108.4495614645323	Copper King Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdty020781jjavmdsc68	38.08652850775096	-108.3199448940113	Thunder Trails Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdtz020981jjo7y1c9qo	38.01149565384665	-108.2842699963382	Thunder Trails South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu1020b81jj2nr9xkh7	37.90652524123384	-108.2414381397785	Lone Cone Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu2020d81jjosr4fyv2	37.88421886941276	-108.0562418983834	Woods Lake SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu4020f81jjfyka3toq	37.88209376026965	-108.0186282519876	Rock of Ages Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu5020h81jjtqxsdb3u	37.89402661881399	-108.0010571716093	Wilson Mesa West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu7020j81jjxdzgeiut	39.16346097521414	-108.3415147654509	Coal Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu8020l81jjtbl7vayb	37.88683754192293	-107.9107958380224	Ames Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdu9020n81jjqhsr1zod	37.94732659302266	-107.8779050492917	Galloping Goose North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdub020p81jjq4lszml8	37.92155420983892	-107.9000049977657	Ilium Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduc020r81jjhq1gu7ph	37.80492381607542	-107.8516603541608	Hope Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdue020t81jjpwfg55hh	37.81301103271048	-107.9069066325844	Lizard Head Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdug020v81jj9o29xte5	37.87939493660515	-107.9241801827971	Wilson Mesa East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduj020x81jjtv97o15m	37.96442577174822	-107.9022023585434	Deep Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduk020z81jjmrvbslvc	37.95418010822837	-107.8295221845845	Mill Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdum021181jjiyrxkv17	37.95202800055023	-107.8455181398361	Eider Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdun021381jjghno95wu	37.98958031819456	-107.7795717161175	Wrights Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdup021581jjpv8p7lo1	37.99482382111005	-107.7847884900964	Blue Lakes (Southern) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduq021781jji3lr3nah	38.03471745414101	-107.8070315806062	Blue Lakes (Northern) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdus021981jjhuuftocc	37.99398883682336	-107.7005049378474	Weehawken Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdut021b81jja2n2e6vt	37.93313580272943	-107.6834369206112	Richmond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduv021d81jjhia1znhb	37.82327882905503	-103.7714474511684	Santa Fe Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdux021f81jjv676au5s	37.95948346263128	-107.6622301745189	Hayden Ironton Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomduy021h81jjg0qxnkzp	38.56374429681412	-108.3862363827644	Dinosaur Quarry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv0021j81jjgaoa1a1g	38.30565086811271	-107.9631238153735	Simms Mesa Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv2021l81jjapcjwrjx	39.11886074235499	-108.3887424942867	Mount Garfield Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv3021n81jjsyf1rmit	38.36633625317265	-108.1923904101459	Old Roubideau Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv4021p81jjxvv833u7	38.38433703334144	-107.9404346176753	Lower Spring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv6021r81jjiz9d0rtw	38.00291470402744	-107.661939690934	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv7021t81jjr3qmt8cb	38.0572606364491	-107.6661931930775	Horsethief Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdv9021v81jjeoocsott	38.06153918691047	-107.6602753644492	Dexter Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdva021x81jjjp5vux5y	38.09121772307943	-107.6719648084254	Baldy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvc021z81jjk3uf4lsu	38.1111289303651	-107.5533247889836	Wetterhorn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvd022181jjjqlnd1u9	38.23835094928928	-107.5294862478489	Clear Lake/Rowdy Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvf022381jjbrle8pbo	38.23276286545755	-107.5391592616215	Silver Jack Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvh022581jjmhgtspau	38.55559810632879	-106.0380329937417	Mount Ouray SWA North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvi022781jjq3y4kej0	38.55331456947689	-106.0353835785756	Mount Ouray SWA South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvk022981jjd5pr7y53	39.79695709100235	-105.0350971081686	Lowell Ponds SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvl022b81jjhfsenk8a	39.18869251149238	-108.1098202597639	Jerry Creek Reservoir SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvn022d81jjd6jvz1xr	39.45472026620804	-105.0539345782713	Sharptail Ridge SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvp022f81jj6c3qa6w8	39.10537486116759	-108.650580016561	Walter Walker Wildlife Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvq022h81jjk4c0235y	40.39229357317137	-104.9972852592838	Big Thompson Ponds SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvs022j81jjz4gh7t6b	38.79427558224252	-106.113614414354	Champion SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvu022l81jj4th9i28r	38.44137700700439	-107.8709926336662	Chipeta Lakes SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvv022n81jjjn9fmoao	38.20223244255833	-106.7350933417879	Dome Lakes SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvw022p81jj05iyt4ph	37.73566146974294	-106.7329840295349	Coller SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdvz022r81jj3q7kdn0t	37.21471067259449	-106.9950576334694	Echo Canyon Reservoir SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw0022t81jjabv718nb	40.42020313311897	-106.8386511831569	Chuck Lewis SWA West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw2022v81jjnrw0278x	40.42913517376785	-106.8264224740958	Chuck Lewis SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw3022x81jjrupf5a5x	38.7318633916416	-108.1628016889456	Escalante SWA - Lower Roubideau Tract Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw5022z81jjnridi3fu	40.0459966118967	-106.174522334772	Kemp Breeze SWA Fisherman's Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw6023181jjyq7hlzfz	40.06416833677673	-106.190651885844	Kemp Breeze SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw8023381jjlipy2q4l	40.57070770921562	-106.2815708543578	Yarmony Ranch SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdw9023581jjb2ll8t0d	39.65335459333747	-106.9388189875355	Gypsum Ponds SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwb023781jjzw2g0kbn	39.16722714153136	-108.8088630174619	Horsethief Canyon SWA West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwc023981jjlgugt4km	39.15711225609953	-108.7849510607323	Horsethief Canyon SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwe023b81jjtv0ipx9e	39.16407787877394	-108.7897296207023	Horsethief Canyon SWA North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwf023d81jjg155rag1	40.27119956149386	-107.4304154747469	Indian Run SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwh023f81jjk2dqyvvr	40.27003482283864	-107.4174279618742	Indian Run SWA East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwj023h81jjws63xttj	36.99837283839905	-104.3654430708704	Lake Dorothey SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwk023j81jj0sozi201	38.11027640770613	-107.0349895570127	Mason Family SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwl023l81jjkgpzi34a	39.61986631788903	-105.4753712402865	Mount Evans SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwn023n81jjvr04v46f	39.10002666972834	-104.2091584314152	Ramah Reservoir SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwo023p81jjskwt63qx	39.98500077192925	-107.6434174733587	Oak Ridge SWA - Lake Avery Unit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwq023r81jjas2g8vdw	40.02206456987803	-107.6757803428188	Oak Ridge SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwr023t81jj33vm4x7m	39.44212234721692	-108.0483150547939	Parachute Ponds SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwt023v81jj10eszxm8	40.90866886362789	-102.6712263007947	Red Lion SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwv023x81jji5j26j4y	40.76453236806861	-106.4640826463032	Lake John SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwx023z81jjyre78alg	38.25581349037419	-104.5991967781438	Runyon Lakes SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdwy024181jjuyya2ajc	37.58228487407774	-106.0945631499476	Rio Grande SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx0024381jjg97ayo9t	37.248426247359	-104.8041579904116	Dochter Tract Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx1024581jjpapwmaso	37.25925411747796	-104.8667874676046	Sakariason Tract Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx2024781jjsfmdt88i	40.84199280716025	-102.8505495102712	Tamarack Ranch SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx4024981jjbaqm61g0	39.96862888352834	-106.5485111925447	Radium SWA - Trail Creek Unit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx6024b81jjczubxba8	39.08016372422687	-108.5791876756953	West Lake SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx8024d81jjfrff0v5c	37.50807748898269	-107.2261244348971	Williams Creek Reservoir SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdx9024f81jjxw38yz5g	40.10811366430164	-105.9799674862465	Windy Gap Watchable Wildlife Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxb024h81jjhr1fafl3	40.49779584487001	-107.3739752024121	Yampa River SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxc024j81jjdj3hrb91	37.77152602897271	-107.3572780386658	Lost Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxe024l81jj142660dy	37.85779898440151	-106.9745785521859	Miners Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxf024n81jj04fb2l6s	37.82951006077772	-106.9801974428801	Shallow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxh024p81jjcn8s5sjj	39.55994985830365	-106.256580180816	Mount Holy Cross Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxi024r81jjah79u5ew	37.95523512584455	-106.9665296238689	San Luis Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxk024t81jj3tde4i87	37.75969770127719	-107.3428041152514	Ute Creek Trailhead #819	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxl024v81jjne9cn3np	37.72213550499931	-107.2592928250929	Thirty Mile Trailhead #814	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxn024x81jj8s9e8rgv	37.73621440589854	-107.1004513734642	Fern Creek Trailhead # 815	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxo024z81jjgs7rv7i6	37.77151871847656	-107.1423844618347	Texas Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxq025181jjjs0rqmhu	37.68405926039895	-107.0320412576394	Trout Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxs025381jj5q9ljolh	37.61582130189647	-107.0449636825686	Copper Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxu025581jj3h3pqyep	37.68201661255392	-106.9991392027885	Ivy Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxv025781jjjzcwfm8u	37.71544406845365	-106.9018842883062	Pierce Elliott Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxw025981jjt6i1quis	37.70473197604627	-106.6465281990647	Alder Bench Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxy025b81jjv633mp4j	37.81297697549314	-106.7375844444352	East Bellows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdxz025d81jjylcjiglv	37.87241694086607	-106.7878088039724	Wheeler Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy1025f81jjx9qn6zss	37.84849606774599	-106.9237298929428	Wason Park / Inspiration Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy2025h81jjiwnr288l	37.82802146091868	-106.8888510910606	Farmer's Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy3025j81jjbx0a1ljt	37.90347062642998	-106.9189778890673	Phoenix Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy5025l81jj08rgjvey	37.83988793471183	-106.963045383578	Mckenzie (#804) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy6025n81jja0vrzhfr	37.54175162659132	-106.8025786623696	Big Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy8025p81jjwl5z2g1p	37.55419242086223	-106.8026756739334	Hope Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdy9025r81jj3di8hrys	37.58123150800076	-106.6499279497862	Cross Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyb025t81jjczlmh87g	37.55478097749488	-106.4016761255673	West Frisco Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyd025v81jju486geqm	37.5566405822017	-106.3963693828445	Middle Frisco Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdye025x81jjnnsis7go	37.64271451331224	-106.8048731335723	Highline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyg025z81jj7j6y1akg	37.6359145295938	-106.6738785737121	Trout Trailhead #831	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyh026181jjb4dlbhbr	37.64807973208588	-106.651957125839	Beaver Mountain Trailhead #933	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyj026381jj7vhil3si	37.61477399869742	-106.6848526766995	Tewksberry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyl026581jj20xynkin	37.5609480339655	-106.6901340065942	Tewksberry South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdym026781jj44rghlpr	37.61552383734626	-106.8392599878419	Hunter Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyn026981jj8np5wt70	37.56218637821939	-106.7696888331784	Lake Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyp026b81jjoznu4fx2	37.46035206779368	-106.4147501972673	South Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyq026d81jj1jn8lhqr	37.44754552049189	-107.504842708302	Pine River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyr026f81jjsjz3g5nn	37.62991130015423	-107.806448543819	Purgatory Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyt026h81jjbeyolv5z	37.65273996372224	-107.7735522979601	Spud Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyv026j81jjr5uttcn8	37.72934010316666	-107.7114709002945	Andrews Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyw026l81jjp4yi0jhw	37.47730020732141	-107.6314979722456	Endlich Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdyy026n81jji3fhahk4	37.46341113269092	-107.6822487114992	Transfer Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz0026p81jj25khjcx8	37.53067917879871	-107.6804167842499	Lime Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz1026r81jjb02h7ipq	37.8066511200287	-107.7739615836036	Ice Lake Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz3026t81jjjm7kh7hg	37.73191590989227	-107.7502271254808	West Lime Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz4026v81jjvx2iajir	37.66001028057712	-107.8003828411168	Cascade Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz6026x81jjdtex21c7	37.35600760326219	-107.3254162118118	First Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz7026z81jjeefdkfan	37.34651044615669	-107.7032080840585	Shearer Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdz9027181jj0i1mx62l	37.36807951537813	-107.8394293790525	Haflin Creek Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdzc027381jjyir85p81	37.33122072965837	-107.9387957143858	Dry Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdzi027581jjk9qvrn0b	37.34018092143637	-107.9082441976107	Logchutes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdzo027781jjtgypegzv	37.46378868520233	-107.97460384993	Clear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdzu027981jjclb0o46i	37.6299063784251	-107.9158371640254	Upper Hermosa Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomdzz027b81jjj48765q7	37.59227857726415	-107.8242395513026	Elbert Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome04027d81jjidut2c13	37.51162294522355	-107.8200180979289	Goulding Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome08027f81jjs8z0imo5	37.45174248177963	-108.0114384337416	Kennebec Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0a027h81jjp348q05a	37.50146952774671	-108.5518716692012	Can Do Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0c027j81jjxcxeu15q	37.47105591277874	-108.5178234189873	McPhee Overlook Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0d027l81jjocnfp83u	37.5775406748189	-108.2938732817811	Loading Pen Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0f027n81jjt29j5t8e	37.69700567637365	-108.1952495810575	Stoner Mesa Trailhead Upper	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0j027p81jjtu09doqn	37.70010771967979	-108.2550556927043	Gobble Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0n027r81jjhap7rjvw	37.72721545466749	-108.2230240356001	Willow Divide OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0q027t81jjtum88cio	37.75201738733175	-108.2315239957908	Fish Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0u027v81jj3io571hu	37.79688289831748	-108.0387128922245	Kilpacker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0w027x81jjdhmhnz74	37.74398853755253	-108.1476024449721	Johnny Bull Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0x027z81jjpv5a06td	37.78141141906905	-108.0281488136524	Calico Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome0z028181jjhw7nd2nu	37.79637629545158	-107.9375139637175	Cross Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome10028381jjoula91ad	37.79205904590152	-107.9372066326958	East Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome12028581jjw0uen8ng	37.58689045147484	-108.1639015149271	Priest Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome13028781jj1pdmpgme	37.57558374084764	-108.1814497544412	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome14028981jjbwr5bxj6	37.50857610252443	-108.1237752427094	Gold Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome16028b81jjwmq2symt	37.63644823710767	-108.0633219901842	Salt Creek Trailhead Lower	\N	\N	clhcomc69000081jjgqd2cncx
clhcome17028d81jjpwfuae0n	37.46840142029689	-108.2080357072683	Big Al Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome19028f81jjq9aezdwr	37.46196671752934	-108.0950863616852	Sharkstooth Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1a028h81jjn1nweey6	37.46945443487699	-108.2103981230276	Upper Chicken Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1c028j81jju6k57twu	37.46925288587303	-108.198799094142	Aspen Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1e028l81jj7fbi790e	37.45585944444059	-108.2189597611185	Box Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1f028n81jjtl4l6juk	37.3028950778359	-107.3363611038776	Sheep Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1g028p81jjxi9d3vc8	37.43015431791169	-107.1942472528491	Cross Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1i028r81jjlrbnvz3u	37.19005597820408	-107.3105893231843	Great Kiva Loop	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1j028t81jjuvz568hi	37.53373978843673	-107.251729431666	Poison Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1k028v81jjymyc5992	37.5411741916933	-107.1979604580875	Williams Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1m028x81jj0yzvx9bl	37.51230917912816	-107.1477739233859	Middle Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1n028z81jj3uay4nvp	37.4790161314741	-107.1020221469643	Piedra Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1p029181jjrnoii6z8	37.3258082429566	-107.1427265530043	Newt Jack Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1q029381jjlwyjsk3n	37.4091602452549	-107.0529558773676	Fourmile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1s029581jjbw0rxvy7	37.37709781805108	-106.9667741454544	Jackson Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1t029781jjq1h5lf1m	37.45771526720227	-106.9191164565403	West Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1v029981jjxec7idux	37.44265460202771	-106.8773826178485	Treasure Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1x029b81jj8zdum88v	37.41971323773159	-106.7813160756399	Silver Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome1z029d81jjbl8oh9wu	37.38714454021565	-106.8467906762597	Sand Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome20029f81jja1k3xabw	37.30901723648677	-106.9010887638709	Coal Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome21029h81jjrh15diuu	37.30196132556291	-106.8053296453984	Little Blanco Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome23029j81jjxddco70r	37.22032591103673	-106.7241082718489	Fish Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome24029l81jjqriqld51	37.20391434973838	-106.7624160408225	Opal Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome26029n81jjzmxyicxu	37.20262500348829	-106.7912817849298	Leche Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome27029p81jjxujae3eh	37.13260203236364	-106.8088838967353	Buckles Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome28029r81jjm3guia8a	37.10712828988361	-106.8206370798937	Navajo Peak West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2a029t81jj0ytir65q	37.08642785456471	-106.7548452963608	Navajo Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2b029v81jj7w5wlbn2	37.03245196611604	-106.5543079012967	Chama Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2c029x81jjhkapm496	37.08801947136934	-106.4491896423603	Red Lake Upper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2e029z81jj4v7l24sh	37.0862220096019	-106.4121193504264	Red Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2f02a181jjcatmerb6	37.11594972509438	-106.382450646952	Duck Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2h02a381jjav2moxrd	37.11970604367994	-106.3766641769022	Elk Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2j02a581jjjb80q298	37.13351206281461	-106.3595266562634	Hidden Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2k02a781jje4805vf7	37.18710167078044	-106.4495122989293	Ruybalid Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2m02a981jjy1o7v90v	37.23152212597872	-106.464094410119	Lower South Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2n02ab81jj4s59xk8w	37.30223169792067	-106.6055333388437	Conejos River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2o02ad81jjap9njavb	37.31849407980036	-106.5946637088715	Adams Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2q02af81jjlz5a45a2	37.36298322634852	-106.6700326956638	Treasure Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2r02ah81jj6tbv6g0s	37.29096457352124	-106.4964826363591	Bear Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2t02aj81jjeser7cj2	37.2611928096206	-106.4662545423773	Valdez Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2u02al81jj2bp6apnt	37.38799894258638	-106.3859502919599	Big Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2w02an81jjswkto9yp	37.28609166892197	-106.4416651022681	Willow Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2y02ap81jjlumssshv	37.3923266091583	-106.3821847475724	Alamosa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome2z02ar81jjjf6hy4a1	37.62355239433654	-105.4729569879803	Lily Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3102at81jjlzh9oh1q	37.63747821066958	-105.4715396882767	Huerfano Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3202av81jj0q4q9osq	37.96209154272828	-106.55465852994	Perry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3402ax81jjms4k230w	37.97178740189412	-106.5805069716296	Bower's Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3502az81jj9ksqkdc2	37.9433578188123	-106.6230593532644	Upper Deep Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3602b181jj2he54kqy	37.93814215274895	-106.6940636279104	South Fork Saguache Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3802b381jjxagec0ds	38.28037197944636	-106.3018220273945	Middle Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3902b581jj5bggfaqq	38.21157621471858	-105.8230235730218	Black Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3b02b781jjzvumx6bf	38.17976071229654	-105.8130417765414	Garner Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3d02b981jjic43190y	38.17126874815254	-105.8080372531101	Major Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3e02bb81jji3bgqu83	38.13155410256569	-105.7886465832921	Cotton Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3f02bd81jjg48bdaih	38.07864446730102	-105.7604746991879	Rito Alto Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3h02bf81jjtl8shyzh	38.10051770436554	-105.7705911142236	Wild Cherry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3j02bh81jjvu3ofd4a	38.01873041254505	-105.685750869367	North Crestone Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3k02bj81jjoh3bm970	37.98885816014933	-105.6627503688289	Willow Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3m02bl81jjnjk6yh4q	37.93025512254521	-105.457214838793	Grape Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3n02bn81jjz0htikl3	38.05198201432051	-105.5356252655454	Horn Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3o02bp81jjpni800nt	38.26643685961908	-105.6839290108633	Rainbow (Lake Creek) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3q02br81jj9va2cw7h	38.25374925102803	-105.6726219416649	Rainbow (Duckett Creek) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3r02bt81jj1xcqbhw9	38.1380932220899	-105.6006617371966	Gibson Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3s02bv81jjr4jqcdlx	37.9645426940689	-105.5457994967978	South Colony Spur Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3u02bx81jjyxvaz06j	37.25461909785628	-105.1094716867967	North Fork-Purgatoire Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3w02bz81jjqeb96c77	37.32656825748911	-105.1435134317557	Indian Creek - Bear Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3y02c181jjk3kxh5xw	37.35196016049225	-105.1275651636641	Baker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome3z02c381jjetkfpnp2	37.37190811490314	-105.1062215630335	Spring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4002c581jj45rhywvo	37.45752490630033	-105.1279460764816	Indian Creek North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4202c781jjd69s5piv	37.34858394962013	-105.0243673464429	Cordova Summit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4402c981jj07frmmvi	37.39865209196248	-104.9749406375981	Wahatoya Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4502cb81jjepmmznjx	37.87839271035936	-104.9580358420168	Bartlett Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4702cd81jjnkx55nho	37.92141447827183	-104.9673902379274	Greenhorn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4802cf81jja69xbf1p	37.89391921706557	-105.0416051662261	Greenhorn-Barlett Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4902ch81jjz7oc0kmv	37.8890340242447	-105.0992335939572	Turkey Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4b02cj81jjdaurp22i	37.89190281244313	-105.1065634673808	West Cisneros Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4c02cl81jjug2zxv1o	37.91686155465622	-105.1753168661377	Pole Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4e02cn81jjichb7kb2	37.98177226856746	-105.0744118766779	East Cisneros Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4f02cp81jj0h3qx0gs	38.03733726480585	-105.0872305491498	St. Charles Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4h02cr81jjabi97uno	37.9857269252987	-105.0558947809135	Lake Isabel North Shore Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4j02ct81jjykawy7ol	37.94839997775416	-104.9959233643019	Millset East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4k02cv81jj035ov53f	37.99579501531546	-105.0021694692579	South San Carlos Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4l02cx81jjr41hvwbi	38.03566649251901	-105.0848939932706	Lion Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4n02cz81jjb6jz07dg	38.01507756527536	-105.0073623864307	North San Carlos Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4o02d181jjz5vnq6se	38.05488484022541	-105.0681248405946	Squirrel Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4q02d381jj31yiu48e	37.86140863882484	-103.7305630100577	Sierra Vista Overlook Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4r02d581jjva94nd60	38.04291772593321	-105.0043583374658	Tower Trail Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4t02d781jjq669w1a9	38.05047975286166	-105.0015238239954	Devil's Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4v02d981jjh00h7d9v	38.05661923700124	-105.0728874834436	Second Mace Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4w02db81jj54bpuz87	38.0908129583112	-105.0887967031076	Silver Circle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome4y02dd81jjhng7eks6	38.0989980042359	-105.0983021978704	North Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5002df81jjo5pa34ah	38.19597055267955	-105.1098524416611	Lewis Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5102dh81jjyp895i7d	38.26677139178155	-105.1888377157801	Newlin Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5202dj81jj5fsynee3	38.30537139621692	-105.2555554819871	East Bear Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5402dl81jjrvrxawft	38.33013118677155	-105.2352184397326	Stultz Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5502dn81jj725fcvza	38.37376601087323	-105.229662870755	Tanner Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5702dp81jjaijcubs0	37.00249374037481	-107.4758964797352	Sambrito Wetlands Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5802dr81jjwxrftr4a	37.13540709551573	-103.0156476964923	Carrizo Canyon Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5a02dt81jjgpeyqsxk	38.04373496371616	-103.4316822662693	Big Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5c02dv81jj9l4tgwuu	38.97061910159805	-106.0580081957565	North Salt Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5d02dx81jjlmfdi0z5	39.03105133335401	-106.1051671820914	Lynch Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5f02dz81jjiwmv96ra	39.06825227969547	-106.1164168492566	Rich Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5g02e181jj4d8bwkq5	39.20822570784225	-106.10069679875	Limber Grove Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5i02e381jjre4dy3pg	39.40690871427326	-105.9630932576029	Gold Dust Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5j02e581jjsntujm2l	39.41268007377154	-105.7585717345214	Kenosha Pass West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5l02e781jjlq13xybw	39.03791130531587	-105.5253654079619	Puma Point Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5n02e981jjjx4h1z8p	39.43603841220815	-105.5908868570153	Ben Tyler Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5o02eb81jjurp4n9b2	39.28437870877978	-105.50855248186	Lost Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5q02ed81jjclprmanf	39.15372992264045	-105.4780577906099	Twin Eagles Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5s02ef81jjarev66oh	39.17303093659046	-105.3755556651648	Goose Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5t02eh81jjphrvg9ma	39.24623893649282	-105.3544375325564	Wigwam Trailhead #609	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5v02ej81jj0phmu59k	39.13729461767706	-105.461209952258	Lizard Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5w02el81jjf014njzr	39.06551810867003	-105.3611004909588	Platte Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5y02en81jjuo7a4sy9	39.06521670363364	-105.3665213288998	Longwater Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome5z02ep81jj4ik7hzqd	39.02559475418217	-105.354829379461	Platte River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6002er81jj9aqi4x6k	38.96023044181698	-105.3746016243762	Hard Rock Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6202et81jjc2m8vzff	39.0578567080621	-105.2185016461984	Signal Butte Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6402ev81jjpfdt7n9s	39.49165444287363	-105.8240039751815	Gibson Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6502ex81jjf2w8ifhy	39.4752118701543	-105.7684390520944	Burning Bear South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6702ez81jjg9la98z1	39.51080260486983	-105.7106955515658	Burning Bear East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6902f181jjnnixdy4a	39.48167849003929	-105.6932661618413	Threemile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6a02f381jj8tyvpglu	39.47502811340058	-105.685121512819	Geneva Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6c02f581jj7ncoh17s	39.40556585651076	-105.5069211677458	Brookside / Payne Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6d02f781jjv80tqi5p	39.34212539409497	-105.3356956217095	Buffalo (Colorado Trail) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6f02f981jjtk21ppkj	39.35046444579811	-105.3430925010953	Gashouse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6g02fb81jjb7bnbl0l	39.36544424067608	-105.3779814067885	Miller Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6i02fd81jj76z9hcc9	39.38222367195119	-105.3682448851491	Buck Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6k02ff81jjjityte5z	39.22292256807506	-105.2788347376975	Upper Cheesman Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6l02fh81jj2ej24cy4	39.2206623982992	-105.2793410220321	Goose Creek Arm Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6n02fj81jjnurg1uwi	39.58252251174456	-105.3608609808204	Lower Maxwell Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6o02fl81jjwaq3pf75	39.56247571494375	-105.3767609606928	Upper Maxwell Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6p02fn81jjaeojqdbc	39.37862824385125	-105.1052015097708	Indian Creek Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6r02fp81jjxpcecev0	39.37923221697606	-105.1005952200938	Indian Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6t02fr81jj2cjnee2c	39.37621947188801	-105.0956830027672	Rampart Entrance Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6u02ft81jjz932nd5t	39.30142780844433	-105.1725723851697	Sugar Creek Lower Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6w02fv81jjer1tnjoj	39.32202895955423	-105.1290604531076	Sugar Creek Upper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6y02fx81jj9urb2e4s	39.28175731844957	-105.1040350132153	Cabin Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome6z02fz81jjq24xx5fe	39.28676537403085	-105.0922901597662	Dutch Fred Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7102g181jjwanm6usi	38.2729322710826	-104.6001836178332	Fountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7202g381jjgly55f6u	39.34722146901126	-105.0851387030026	Sunset Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7402g581jjbh96nkfj	39.31544991736124	-105.0657812665402	Tomahawk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7602g781jj3txlez6m	39.0459413749461	-105.0778015412362	Red Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7702g981jjj7xanci9	39.08704227563159	-105.0986253660441	Manitou Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7902gb81jjup1q3n8u	39.0182465631916	-105.0412655785168	Lovell Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7b02gd81jjtr1g5k0o	38.97783992740259	-105.0090212012024	Rainbow Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7c02gf81jjl0xf5mob	38.98019470242936	-104.9590186363581	Rampart Reservoir Dikeside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7e02gh81jj1dzc74bx	38.9287292739992	-105.0526026628749	North Catamount Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7f02gj81jjltcytnn7	38.87371601292684	-105.1238944589894	Crags Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7h02gl81jj8q5788tw	38.85681883543361	-104.9319154787011	The Incline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7j02gn81jj4zp1k9do	38.85579288176655	-104.9338542675818	Barr Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7k02gp81jjg2ew5tbf	38.83425898884306	-105.1374535113243	Horsethief Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7l02gr81jj9b9hhewi	39.83986350363185	-106.4223935809614	Elliott's Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7n02gt81jjwzurij6j	39.83442535292578	-106.373995533937	Gore Range Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7o02gv81jjd5tezeb0	39.81491770423388	-106.4281384285685	Soda Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7q02gx81jj4ifwlf74	39.71058158200867	-106.4238285247908	Lower Piney Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7r02gz81jjzj48ubkc	39.70994420483387	-106.3807596940337	East Lost Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7t02h181jj7ck7eh7o	39.69778486827487	-106.4366435854985	West Lost Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7v02h381jj8a4kldcc	39.64605262478426	-106.5167291412994	Buck Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7x02h581jjfqzszz47	39.6399230369399	-106.5390081595562	Avon Singletree Connector Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7y02h781jjt8d5c71v	39.65085008432158	-106.541640648187	West Avon Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome7z02h981jjhz4kssh8	39.6571191406171	-106.5492334755719	O'Neal Spur Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8102hb81jj4jx17v8g	39.37414241557548	-106.4564968607949	Lonesome Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8202hd81jjwl16jrsu	39.38105092927805	-106.4866793769227	Sopris Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8302hf81jjcm06gi1j	39.39038299651181	-106.4706673866585	Missouri Lake / Fancy Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8502hh81jj1sssxx6q	39.9558317249218	-105.3563558783034	Gross Reservoir North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8602hj81jjkonvmvhm	39.42033504943222	-106.4766834147584	Hunky Dory Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8802hl81jjezaq45yy	39.5005507952331	-106.4329678266807	Half Moon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8902hn81jj73hjgh2i	39.42868569625211	-106.4110622676495	Whitney Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8b02hp81jj360j6l64	39.54876725593095	-106.4184092018279	Cross Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8d02hr81jjslmxd06g	39.57656634827035	-106.4176173586674	Martin Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8e02ht81jjuub75qvr	39.59681837500213	-106.5227547168516	Turquoise Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8f02hv81jj1h7s47eq	39.54601230549642	-106.2415683724256	Shrine Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8h02hx81jjrvu8t2gb	39.62779746002436	-106.2750118092486	Gore Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8i02hz81jjefl4nlel	39.54414687536202	-106.2205001633218	Black Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8k02i181jjyqi05ccq	39.62659262742856	-106.274949873964	Vail Pass / Tenmile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8l02i381jjv0ylrwkx	39.63915234806895	-106.2952499575813	Bighorn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8n02i581jjfnpv2qei	39.64298780594283	-106.3031347779099	Pitkin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8o02i781jjzllnho3p	39.65063933832423	-106.321009657681	Booth Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8q02i981jj5pk161w9	39.63682776583631	-106.4153268481519	North Trail (Buffehr Creek) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8r02ib81jjqk826e8m	39.59574576874515	-106.4299751479583	Game Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8t02id81jjum4oc9fm	40.18981534837103	-107.561545930164	Morapos Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8u02if81jjtmnbwtk0	40.02611738933739	-107.503621810662	Papoose Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8w02ih81jjlo0fq1an	39.89779678618067	-107.534966352291	Pelteir Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8x02ij81jjtcah62z1	40.0089322829219	-107.4251576911622	Marvine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome8z02il81jjm0pl8qud	40.02643482096575	-107.4967260394011	Ute Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9002in81jj12sqlty1	40.03886353841733	-107.4862316897463	Big Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9202ip81jjb5u1buuo	40.0641430471474	-107.3246953227104	Mirror Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9302ir81jjt0toqq4z	39.89422283954169	-107.5301025832789	Hill Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9502it81jjfpw6smxi	39.99403915346149	-107.2433102629567	Himes Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9602iv81jjlgot6etl	39.99065644255068	-107.2409380227775	Scotts Bay Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9802ix81jjbykuz2ip	39.99884273528198	-107.2308500238293	Trappers Outlet Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9902iz81jjr0inuv4y	39.99056114093194	-107.243328292406	Wall Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9a02j181jj4edfclej	39.99430600049293	-107.2369371736066	Scotts Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9c02j381jjxtqm28dy	40.02794303904471	-107.2727448196163	Big Fish Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9e02j581jjitl6jy9y	40.01818935875813	-107.2490152851237	Lake of The Woods Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9f02j781jj4sk7o1y8	40.07110832831855	-107.314022439935	Lily Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9h02j981jjb3t870ng	40.03773716297377	-107.2875795648715	Picket Pin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9i02jb81jjhtsfjfn1	40.23385263941061	-107.377612487239	Elk Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9k02jd81jjs7i3xuv8	40.15209977616345	-107.2535215622753	Cyclone Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9l02jf81jj4awyshqf	40.14181662509339	-107.2348620711399	Transfer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9m02jh81jjylsk5jap	40.02754578776737	-107.1234069740386	Stillwater Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9o02jj81jjxzljudy0	40.03235484133741	-107.1145059384637	Smith Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9p02jl81jj9cywt93a	40.04580414729315	-107.0751095018266	Mandall Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9r02jn81jjgznjc5ke	40.14971374308695	-107.138935889979	Sheriff Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9s02jp81jj49h7xpw4	40.16526471375293	-107.2183615766752	Baldy Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9u02jr81jj7ka3t6v9	40.04578527324674	-107.0161341779703	Gardner Park Wildlife Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9w02jt81jjy9tkkp8n	40.0551312807339	-107.0311620962166	Heart Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9y02jv81jjnxogskwi	40.16715138139283	-107.0582146757364	Allen Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcome9z02jx81jjhcef2pdu	40.27245083082673	-106.6142949567625	Routt Divide Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea102jz81jjbxrfgfje	40.29493347256801	-106.8006716373059	Lower Sarvis Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea202k181jj4avfxf53	40.25960722378275	-106.610984392221	Upper Sarvis Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea302k381jjspoayyj4	40.28863094699231	-106.8251982031784	Tailwater Anglers Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea502k581jje8n90bfv	40.22221303018203	-106.779599320172	Lower Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea602k781jjnj0gy51b	40.19760459089782	-106.6065084756942	Upper Silver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea702k981jj3wlrxx9c	40.17236077987445	-106.7469768868787	Morrison Divide North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomea902kb81jjy02hhoqx	40.10705408254218	-106.6872872062808	Morrison Divide South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeab02kd81jjh325l0kg	40.11151198003538	-106.6780785762238	Tepee Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeac02kf81jj5mg68v3e	40.08960821674431	-106.6246987584776	Tepee Creek East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeae02kh81jjy5wyaew4	40.22014056087419	-107.2214933072352	Gill Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeaf02kj81jjtf0gl5qi	37.38349699995184	-108.8039181347014	Rock Creek OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeah02kl81jjv6u49yan	37.34152958611628	-108.8177464324483	Sand Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeaj02kn81jjsk9o475c	37.39995936461756	-108.7752145930768	Sand Canyon Pueblo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeak02kp81jjjuu46fso	37.40918171054837	-109.0334644811187	Horseshoe-Hackberry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeal02kr81jjzk4hndca	37.39989553910531	-109.0403165747127	Holly Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomean02kt81jjdkje2r21	37.44351274587508	-108.9825812717847	Cutthroat Lower (4WD) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeao02kv81jjpre86fep	37.44622599993853	-108.973332996822	Cutthroat Upper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeaq02kx81jjde2evd1o	37.45423148755399	-108.971576223162	Painted Hand Pueblo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomear02kz81jjwkhxcz29	37.58508453092904	-108.919347692045	Lowry Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeat02l181jjev153h3n	37.19599736308101	-108.5377645866535	Wetherill Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeau02l381jjarjkqms0	37.27632210321938	-108.4830638877387	Geologic Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeaw02l581jjue0d7lzl	37.2795494708629	-108.4620350454592	Park Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeax02l781jj1lhzp2k7	37.3042599336005	-108.425370699282	Knife Edge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeaz02l981jjm7ps40t5	37.30701717068543	-108.4201006450238	Point Lookout Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb102lb81jj4yr80ot4	37.29677700898523	-108.4183507920313	Prater Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb202ld81jjd6c72aao	37.23799987429977	-108.5040073509281	Far View Sites Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb302lf81jj6fx0zvdg	37.16756857506079	-108.4699049796362	Soda Canyon Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb402lh81jj71y39iv1	39.10874509949028	-108.7014016675593	Lower Monument Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb602lj81jjet1d97o0	39.07783961856622	-108.727956810586	Upper Monument Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb702ll81jj0nbv63lh	39.06806815910861	-108.6601367253154	Wildwood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeb802ln81jj5ysc5dwm	39.05547990543041	-108.736937498812	Upper Liberty Cap Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeba02lp81jjdmb52ukp	39.03693958730538	-108.7089609734944	Ute Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebb02lr81jjh0ozi698	39.10111682852773	-108.7351285430618	Alcove Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebd02lt81jjdqzd864t	39.10480429138494	-108.7284307491422	Window Rock Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebe02lv81jjxexkec8i	39.10089892911266	-108.7348866715736	Canyon Rim Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebg02lx81jjfxlq4m8f	39.09600682177055	-108.7327805937565	Otto's Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebh02lz81jjcf76pewa	39.03333449129478	-108.6458354196877	Serpents Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebj02m181jj9r37pwl7	39.03191171450091	-108.6308364564349	Devils Kitchen Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebk02m381jjxbt47e2f	38.98667140521438	-108.6993072524831	Upper No Thoroughfare Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebm02m581jjr3gy8u41	37.75805955188679	-105.5011751117706	Point of No Return Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebn02m781jjm4gu4zpm	37.80089898845608	-105.5003703791071	Sand Ramp Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebp02m981jjm5tkd6m6	37.92455608760929	-105.4878046419965	Music Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebq02mb81jji8uwkjaz	37.73270658082612	-105.5123046262228	Great Sand Dunes Interpretive Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebs02md81jj00nc94s6	37.73420727801815	-105.5085796723558	Mosca Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebt02mf81jj4visz90t	37.73950532504691	-105.5171073622452	Dunes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebu02mh81jjd4w136dl	39.80573525982371	-107.7355874179324	Upper Three Forks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebw02mj81jjir44qwj4	38.07770649408864	-105.5663194862543	Alvarado Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebx02ml81jjj2nk89wb	38.08240432959239	-105.5644691615561	Comanche/Venable Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomebz02mn81jjc07kg2yq	37.92151516263251	-107.3373697354337	Williams Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec002mp81jjgb820fj5	38.56252484469582	-107.741910494813	Warner Point Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec202mr81jj9bjn625m	38.57631615061748	-107.7205314589938	Cedar Point Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec302mt81jjbwje7rnt	38.56204270736856	-107.677430544688	Deadhorse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec502mv81jj7lgdsunh	38.58672485836193	-107.7051512540815	North Vista Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec602mx81jj4438abud	38.58502962306508	-107.7088385429927	Chasm View Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec802mz81jjlb10jaxp	40.24383500951465	-108.9727541821485	Cold Desert Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomec902n181jj37kbz8s0	40.45010543038993	-108.5236358537239	The Steps Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecb02n381jjnokzdife	40.52397271817451	-109.0197420267742	Harpers Corner Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecd02n581jj6t56bhcy	40.72320785912311	-108.8877593830076	Gates of Lodore Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomece02n781jjc0gropsl	37.26520166640096	-107.0080212406479	Spa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecg02n981jjcnx7e7vl	37.26856133456273	-106.9988430677899	San Juan Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomech02nb81jjnupvbp4z	39.63292547943023	-106.5279716108159	Elk Lot Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecj02nd81jje2rqjd51	39.65307715641364	-106.5874575080605	Berry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecl02nf81jjwwfqttrg	39.64954991802862	-106.9922015425942	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecm02nh81jjbtpxsqx4	39.6435051518439	-107.0254234294066	Duck Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecn02nj81jj7io6w257	40.05614132156265	-105.0467785634052	Coal Creek Trailhead at Reliance Park	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecp02nl81jjm0a4nciz	40.04420507631124	-105.0425150670035	Coal Creek Trailhead at Erie Pkwy	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecq02nn81jjpk33yykc	38.92692609906495	-105.2817032514978	Hornbek Homestead Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecr02np81jj28twd6i5	39.40848722590683	-105.1713030847271	North Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomect02nr81jjp2op98bw	38.83086323867889	-106.1777230839041	Buena Vista Wildlife Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecv02nt81jj8rw81lzg	38.84148060491788	-106.1305398272307	Buena Vista Railroad Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecw02nv81jjdhukz013	38.81705965798837	-106.0866616659345	Collegiate Peaks Outlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecx02nx81jj5mrchuvk	38.83020698137988	-106.085759496947	Midland West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomecz02nz81jjdo9sv4x0	38.79209950669267	-106.0853473281495	Chinaman / Carnage Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed002o181jj6ixxzqjl	38.83122874864816	-105.9879682001251	Bald Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed202o381jj6q9y1tfw	38.84616824478367	-106.0176787492737	McGee Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed302o581jj7mmr9mgb	38.84931631473783	-105.982384658473	Mushroom Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed402o781jjdgf79ys9	39.93671469359635	-105.3726560110377	Osprey Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed602o981jjq5apv43r	38.98184452338706	-105.1062252596217	Lower Trout Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed702ob81jjrc14by8f	39.00246080331522	-105.1642551836677	Rule Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomed802od81jji5i0ubbf	39.26952907742604	-105.1049965580038	Devil's Head Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeda02of81jjq4bvoqjl	38.53116993493501	-106.0111388188231	Monarch Spur (Holman) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedc02oh81jjuelb7tpz	39.02598305753414	-105.2451235167165	Phantom Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedd02oj81jj95z1mme6	37.83651377115968	-106.2718075204044	Witches Canyon Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedf02ol81jjw3kfr4jn	37.83794888886505	-106.2942283063471	Witches Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedg02on81jj5282zzip	37.82784957756121	-106.2764849854614	Road 5207e Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedi02op81jj1zf1j5rt	37.84837285218813	-106.2766080345917	Iglesia de San Juan Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedj02or81jjwqsn74p0	37.84332781894711	-106.2858216019553	Penitente Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedk02ot81jjlakzf9ay	37.81683361600765	-106.283666491933	La Garita Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedm02ov81jjoxsmtpz7	38.51284598663546	-105.9805744266087	Salida Trails - Burmac Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedn02ox81jjh5rw0v02	38.50042091348639	-106.0041346763908	Little Rainbow (CR108) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedp02oz81jj774lwdaq	38.50221234823334	-106.0257751847268	Salida Trails - County Road 110 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedr02p181jjlpc0l6kk	38.75210908479742	-106.0657452401615	Ruby Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeds02p381jju1pzt6dr	38.45375845867567	-107.4139307104506	Curecanti Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedt02p581jjha28i4a1	38.45024205922616	-107.3452146382312	Pine Creek Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedv02p781jjaz4e5bmw	38.51503833662058	-107.0183333907687	Neversink Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedx02p981jjgxlsbv5e	38.46343818724073	-107.518823563307	Hermits Rest Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedy02pb81jjkod2p48i	38.45271825679676	-107.5443978534182	Mesa Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomedz02pd81jj4jvrrnle	40.00544824794245	-105.9179670492838	Red Dirt Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee102pf81jjcfrr2c4h	40.05316070503029	-105.9102477037023	Village Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee202ph81jjm9yq8tv5	40.06390378832899	-105.9189036113455	Ten Mile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee402pj81jjbf6dpoch	40.08222625243882	-105.9314880534824	Kaibab Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee502pl81jj1doe1gc5	37.72849606844888	-106.3104452996848	Elephant Rocks South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee702pn81jjuyoyu0qp	37.6853919460339	-106.352388935455	River Walk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomee902pp81jjn2o6swgu	37.6719819538797	-106.3507098634885	Chico Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeea02pr81jj0z0k4y9f	37.67122162401988	-106.3542851424499	Spruce Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeec02pt81jj3n1zjqoe	37.67264075261313	-106.3555815509288	Columbia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeed02pv81jjxu27xlvz	37.67890792235135	-106.3616050418125	Lookout Mountain Gateway	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeef02px81jjaob5rgsi	37.65768725771748	-106.3618031901717	Pronghorn North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeeh02pz81jjqbtnmwes	37.64450175906633	-106.3661617774017	Pronghorn South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeei02q181jjsqzdkhda	37.62981782167132	-106.2525476940987	Limekiln Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeek02q381jj0hjyzihr	37.53467199138522	-106.2266834134237	Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeel02q581jjoetduyhs	37.15363183256527	-105.81721341611	John James North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeen02q781jjb3542i2o	37.11235018095115	-105.8322612290593	John James South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeeo02q981jjpc91uw5o	37.92931144596446	-107.51426315366	Upper Lake Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeeq02qb81jjcdv8z0e5	37.92016308185534	-107.516487192721	American Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeer02qd81jjz21vwcek	40.6826606173153	-105.4648579629699	Mountain Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeet02qf81jj0usjihja	37.94376732158761	-107.4717441514353	Cooper Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeeu02qh81jjt2ergyip	37.88364171588159	-107.4856196164243	Cuba Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeev02qj81jjcn9t7koy	38.01952999250784	-107.358390331218	Alpine Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeex02ql81jjw85vjcff	38.01595178394562	-107.6631952795607	Portland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeez02qn81jjecj8vtqm	39.63022810890155	-104.8537531704221	Prairie Loop Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef002qp81jj0m0zu1mp	38.01609816501885	-107.6720219901391	Ice Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef202qr81jj5mr0lzxj	38.02200450325454	-107.6605323180553	Upper Cascade Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef302qt81jjnnx51era	38.02437826966635	-107.6628502164142	Lower Cascade Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef502qv81jjk8hlp3n2	38.02483572289345	-107.6658840714544	8th Avenue Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef702qx81jjmvnf7v42	38.02944931905726	-107.673047943327	Ouray Visitors Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomef802qz81jjs1fwe6t0	37.83474272177204	-106.6625818611412	La Garita SD Cut-off Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefa02r181jjn8f7qvsk	39.48698482499738	-105.0908893663337	South Platte Canyon Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefc02r381jj47h3grnv	39.52952395973841	-105.0541033089775	North Roxborough Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefd02r581jj0pvhi225	39.55056474371187	-105.0415695988159	High Line Canal Carder Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeff02r781jj46enip9f	39.56444248750532	-104.997144728692	High Line Canal County Line Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefg02r981jjd3lu6bva	39.56271835044329	-105.0238476517884	Fly'n B Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefi02rb81jj6n7tred9	39.56156635452982	-104.9412109660157	David A Lorenz Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefj02rd81jj47afuq4j	39.60061473357631	-104.9793224578426	Milliken Park	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefk02rf81jjp7yjb3oh	39.60014336102373	-104.9579844317375	deKoevend Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefm02rh81jjq58yxqik	39.57267762881408	-105.0104522068982	Writers Vista Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefn02rj81jj9fmx3kir	39.63500704757235	-104.9322665255396	High Line Canal Dahlia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefp02rl81jjgr9xaas5	39.60993024129454	-104.9408776086469	High Line Canal Orchard Rd Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefr02rn81jj5bz12eu0	39.64270430186046	-104.940727997512	Three Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefs02rp81jjrfhbfptq	37.79321339323045	-107.5777039967446	Highland Mary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefu02rr81jjt5mdr1or	39.65952800463929	-104.9381440257907	Eisenhower Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefv02rt81jj1d03pzh0	39.66630335032281	-104.9062917753273	Bible Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefw02rv81jjsvsm0g7d	39.70456702040323	-104.8617719060829	Expo Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefy02rx81jjoj9f0gww	39.68183446278734	-104.8869905250798	South Quebec Way Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomefz02rz81jjfxzpmx46	39.66390122005369	-105.202573667027	Trading Post Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg102s181jjg631slex	39.22469878323288	-106.3906256975508	Evergreen Lakes Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg202s381jjgke70hcp	39.54534434328938	-104.7827431097694	USMC CPL David M Sonka Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg302s581jj9v2m81b5	39.59360507960606	-104.8157931284817	Arapahoe Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg502s781jjstlreoh1	39.61535010319916	-104.675436134024	Aurora Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg702s981jjyyrzlwyi	39.62025434660661	-104.6552295597432	Triple Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeg802sb81jjrqhknk4z	40.86296667555742	-109.0222687076604	Beaver Creek Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomega02sd81jjo1clk7oz	39.34440093232487	-105.2837570327231	Shinglemill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegb02sf81jj9d7gajp2	37.78099559029566	-107.5795552332627	Highland Mary Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegd02sh81jjnv6hfr8l	37.78261525637941	-107.5805703031164	Cunningham Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomege02sj81jj1y6eppwo	37.97422829470622	-107.585222919565	Engineer Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegg02sl81jj1hg3w3qu	38.02156998315907	-107.3293938196866	Henson Creek ATV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegh02sn81jjcmy5b8uy	38.01074418597135	-107.3113883125513	Lake City Ski Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegj02sp81jjd21jfxl7	39.98975077115652	-106.5081664601973	Gore Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegl02sr81jj5grh7557	39.92062372893616	-106.1151546204232	Morgan Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegm02st81jj3a9q3vzj	39.74148012839868	-105.5147529319087	Harold A. Anderson Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomego02sv81jjit8i5z1i	38.88729759983789	-107.004737077408	Lower Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegq02sx81jj1njk6iqp	40.87819665109801	-106.9044003921878	Ellis North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegr02sz81jjjd1db4a4	39.01275573323728	-104.2631866609823	Paint Mines South Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegt02t181jjm4gp5372	39.0204478144247	-104.2741480448133	Paint Mines North Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegu02t381jj5woqpu4a	39.01476768742904	-104.2718018547709	Paint Mines West Overlook Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegw02t581jj8iw2mmtx	38.88151824934888	-104.9495905260717	Waldo Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegx02t781jj9p0jbdxe	38.7991378526225	-104.8835071371716	Lower Captain Jack's Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomegz02t981jjhc5g98y8	38.78879848517352	-104.9029231983018	Silver Cascade Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh002tb81jjqge6iudx	38.78883602727135	-104.9016689987855	Upper Columbine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh202td81jj76c8otff	38.79168760873105	-104.879084118865	Middle Columbine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh302tf81jju48vklfc	38.79141985707788	-104.8658853411273	Lower Columbine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh502th81jj0t03kgbc	38.79160630075224	-104.868679306697	Chamberlain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh602tj81jjyrrdaosk	38.79183552675634	-104.8870947693247	Mt. Cutler Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh702tl81jjg4yocp3k	38.85678141127314	-104.9287533743027	Iron Spring Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeh902tn81jj74rassrs	38.84276624177948	-104.9032052582377	Crystal Park Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehb02tp81jjm2zkg71y	38.82284902946359	-104.8903763430009	Section 16 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehc02tr81jjj6vrwr3n	38.85336173491723	-104.8794499827737	Red Rock Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehe02tt81jjyp0vcc73	38.84857990037618	-104.8732467298421	Hogback Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehf02tv81jj1tagfbmo	38.81897614639507	-104.8838189811824	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehh02tx81jj29chbi92	38.74256073427894	-104.9128957700683	Saint Peters Dome Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehi02tz81jjs0bz1lar	38.87761761624437	-104.7777317442392	North Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehk02u181jjzt42igw8	38.87991215409257	-104.7723858133734	Yucca Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehm02u381jjiudvkd0b	38.87789067445819	-104.7699779361413	Sentinel Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehn02u581jj5gpnbazt	38.87228951765499	-104.7647647475168	Council Grounds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehp02u781jjydd6x48x	38.86846534366145	-104.7604073527168	The Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehr02u981jjnyqy2nik	38.44387957688138	-107.6402313461287	Cerro Summit Recreation Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehs02ub81jj3td3b3bc	38.43920022285536	-107.6386343478034	Cerro Summit Recreation Area Upper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeht02ud81jjmjwmcq5u	39.07115611275915	-104.9321037979985	Mount Herman Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehv02uf81jjsrwbtqso	38.03954078397415	-107.6823454548849	Silvershield Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehx02uh81jj8pi17yj0	38.73147916949943	-104.9067011688248	Gray Back Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomehy02uj81jj9xlblbm8	38.73754094597189	-108.2674013455382	McCarty Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei002ul81jjjl8oi0tn	38.81087738134876	-108.2799351816543	Wells Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei102un81jjgafrdsgq	38.83302248760815	-108.4798677486865	Cactus Park Wilderness Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei302up81jjf1ehfav1	38.87203222220221	-108.5028569581809	Cactus Park Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei402ur81jj3what5je	38.74513521405474	-108.5498299336898	Upper Big Dominguez Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei602ut81jj5na0pv7n	38.8494099868105	-108.3724801253694	Bridgeport Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei702uv81jj7vmhktnm	39.79722594464378	-104.9310460454777	Sand Creek – Dahlia Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomei902ux81jjzq0rphpb	39.81243692714679	-104.9591393555165	Platte River Greenway (York) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeib02uz81jjeyye35wv	39.82357660490943	-104.9410981260679	Fernald Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeic02v181jj5tr4sig1	39.83933504942276	-104.9494927299297	Platte River Greenway (Steele St) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeid02v381jj2kfxl1kq	39.85209900111733	-104.9394006032327	Platte River Greenway (Gravel Lakes) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeif02v581jjzpvbnqh6	37.438460286343	-105.8030494732043	Rio Grande Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeih02v781jjju985gen	37.36850954204599	-105.7501762720895	Bluff Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeii02v981jj7jbvynok	39.59015911054105	-106.0068472793115	Soda Creek South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeik02vb81jj7jvtv3k8	39.56673283674149	-106.0489568707258	Blue River Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeil02vd81jja54q2xag	39.71547848749219	-105.3091945059499	Beaver Brook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomein02vf81jj195bgyg5	39.70250331620474	-105.2881725472691	Genesee Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeio02vh81jjm54mxwd1	39.70913437740915	-105.2979211222726	Bison Meadow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeip02vj81jjs7pz90s9	39.69571954652836	-105.3549713408959	Fillius Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeiq02vl81jjlaty6ed2	39.69067894989833	-105.3619633128422	Bergen Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeis02vn81jj12dbh8p6	39.6646231994416	-105.2788304899703	Corwina Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeit02vp81jj4j5akjsj	39.63547326607124	-105.332581337908	Dedisse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeiv02vr81jjfipwjvzr	39.66290749457407	-105.249238339428	Little Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeix02vt81jj4hz970wf	39.73343720590135	-105.2390613747462	Buffalo Bill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeiy02vv81jjzwlv5h21	39.73112278061237	-105.2413431105112	Lookout Mountain Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej002vx81jjn9dg73o5	39.66140370789702	-105.2847109664401	Panorama Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej102vz81jj1wzpw84k	39.65515872469349	-105.2885049646924	West Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej202w181jj8b11703a	39.63530575950018	-105.2793771229372	Pence Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelq02zj81jjbuzkidji	38.43040634630423	-107.9851268102815	Rimrocker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej402w381jjd2fzq6q0	39.76171319432118	-105.6923357934513	Paw Educational Site for Universal Design Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej502w581jjlfqs3g5v	39.12099519690466	-108.3207006448929	Palisade Rim Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej702w781jj4d4tmhxz	39.09698476273706	-108.3606539904659	Tilman Bishop Wildlife Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomej802w981jjog0n1z6k	39.431556362194	-107.8313011053709	Beaver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeja02wb81jj5rucbxmg	39.94449712985347	-108.7584038155001	East Four–Mile Draw Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejb02wd81jj2ajj7obo	40.04716052143105	-108.1431703506539	Smith Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejd02wf81jjsmsx5gvg	37.82218924052797	-106.6050422690994	Cathedral Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeje02wh81jjfkepjta2	37.9366994284967	-106.5618995583473	Miner's Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejg02wj81jj0zgs3xh5	37.755502298238	-106.6864209482241	West Alder Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeji02wl81jjfrmv7t5w	37.71858923853257	-106.6452715434783	Middle Alder Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejj02wn81jj6p6tw55j	37.73001652424421	-106.6214500372995	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejl02wp81jjbkb3hppz	37.56577577518281	-105.6953770016286	Blanca Wetlands Snipe Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejm02wr81jjw55isab6	37.55620975240924	-105.7064652144259	Blanca Wetlands Alkali Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejo02wt81jjn2hub97r	37.54753977678628	-105.7288522032944	Blanca Wetlands Axel Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejq02wv81jj5fe4av0m	37.5598172419156	-105.70498087075	Blanca Wetlands Watchable Wildlife Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejr02wx81jj1qzbvwsc	37.56607009286412	-105.7209195309285	Blanca Wetlands North Honker Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejt02wz81jjdp8it990	37.57077228005972	-105.6813691948515	Blanca Wetlands North Mallard Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeju02x181jjxji8lfis	37.55504220388664	-105.684418114825	Blanca Wetlands South Mallard Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejv02x381jjm6hswvre	40.41680517539702	-104.7873439080794	Funplex Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejx02x581jja0gq94jl	39.35454887797732	-106.3530571713924	Wurts Ditch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomejz02x781jjcc3xs4x8	37.48581275987812	-106.144622674654	Monte Vista Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek002x981jjm61u61v2	37.48151506105426	-106.281164016074	Bishop Rock Play Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek202xb81jj03fv0w5t	37.49161934958868	-105.8855418453504	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek302xd81jjgji27vxu	37.47626503830489	-105.8667299029157	Twin Peaks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek502xf81jjeq8s4i9g	37.4814308107408	-105.8681472011347	Blanca Vista Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek602xh81jjxpp2ienf	37.90080908443077	-107.4330046719604	Cataract Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek702xj81jjbgat4dty	37.34940959665951	-108.495253874891	Phils World Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomek902xl81jjefizxscr	37.37575182308661	-105.1008629375285	Dikes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeka02xn81jj5wcsnbq1	37.5046583680444	-105.0068027143326	School Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekc02xp81jjw4i0odwb	37.34907188253688	-105.0425061466329	Chaparral Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekd02xr81jjmzsoa5ma	37.34397881893684	-104.991261370507	Apishapa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekf02xt81jjc9plgge7	38.86729512211687	-106.9861363560535	Crested Butte Nordic Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekg02xv81jjs16p69yo	38.91927741881941	-106.9603809546016	Snodgrass Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekh02xx81jj9s4y0622	38.86059373246072	-106.9731349668985	Baxter Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekj02xz81jj3pe9mk8c	38.96731599874133	-107.0427683305409	Washington Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekl02y181jjoq9uamo3	38.98206775339211	-107.0071500034056	Washington Gulch (Gothic Campground) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekm02y381jjfbrpf47z	38.55897906162782	-106.9358967235773	Gunnison River SWA Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeko02y581jj3qqeozic	39.57686322500645	-106.0913154736734	Frisco Bay Marina Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekp02y781jjbbtxya1l	40.03977869213253	-107.9251016075927	Ute Park (Hill St.) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekr02y981jjn1306ixx	40.04902270571407	-107.913888938351	Sanderson Hills Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekt02yb81jjpse2ag05	40.03286217499649	-107.9184132777027	10th Street Bridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeku02yd81jjw3kndn0b	40.41804750195828	-104.7940368713844	71st Avenue Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekw02yf81jjghul01kf	40.1063096007957	-107.2967653218303	Lost Lakes-Pagoda Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeky02yh81jjqrrqxf3s	38.50550535419554	-106.9411956598844	Base Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomekz02yj81jjfbcknm7h	38.50506679875977	-106.951040509218	Kill Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel102yl81jjnjo4t0fk	38.49884092941251	-106.9875445833331	Motorcycle Terrain Park Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel202yn81jjahkzbpsl	38.46468537698511	-106.943433195041	Bambi's Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel302yp81jjhzgqfb7t	38.50058431164924	-106.9929940880081	McCabe Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel502yr81jjr6ynzvmy	38.17440725631744	-107.7325404974097	Ridgway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel602yt81jjmuchn6pq	39.13301269617774	-108.736227076508	Dinosaur Hill Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel802yv81jjqpo6uzfr	40.43521682162414	-104.7276993642223	Ramseier Farm Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomel902yx81jj8avby7mb	38.01797891447318	-107.6652466207089	Baby Bathtubs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelb02yz81jjb9qci9wy	38.01792108438316	-107.6775861779131	Box Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelc02z181jj5mxozgt8	38.00447869065764	-107.9463210923634	Whipple Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeld02z381jjpzyutnfe	39.3997935972878	-107.3379313985598	Sunlight Mountain Resort Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelf02z581jjxls73mze	38.42152880676326	-107.9192010192102	Mailbox Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelg02z781jjsy74is98	38.42121337963425	-107.9317360806298	Spring Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeli02z981jjcxlc2b4f	38.47088543402764	-107.884466508002	Cerise Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelk02zb81jj7nnxztey	38.46470157607137	-107.8792250379062	Riverbottom Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomell02zd81jjt9devjm0	38.44221554576089	-107.8727963805449	Chipeta Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeln02zf81jjq5rl40hg	38.42614048386601	-107.8607286516011	Valley Lawn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelo02zh81jjygxu6vgm	38.4555103474416	-107.8806340534767	Sunset Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelr02zl81jjrfgp568l	38.98855453004644	-108.617386621847	Bangs Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelt02zn81jjhik3icex	39.01817854009474	-108.6097740048245	Little Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelv02zp81jjwko268p9	39.05004684075013	-108.6054618702282	Tabeguache Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelw02zr81jjrgahgitl	38.51478833379528	-108.0112033634371	Dry Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomely02zt81jjyvlpfgw6	38.99322262239063	-108.6249165054687	Old Kiln Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomelz02zv81jj9npj22uc	39.00305467237282	-108.6076521836678	Third Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem002zx81jjm2obbq5a	39.02534061251558	-108.6057026776942	Gunny Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem202zz81jj0ogc1lie	39.04576621290309	-108.5867788028464	Mile Marker 12 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem4030181jj0h822zpy	38.99473346306888	-108.6425379290109	Ribbon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem5030381jjuuy72f35	39.14766723450258	-108.7466668291777	Snooks Bottom Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem6030581jj7dscloq2	39.0626878362725	-108.4522959301407	Clifton Nature Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem8030781jj7d6eqyew	39.05207809800957	-108.5460641828439	Eagle Rim Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomem9030981jj25b1kbgk	39.05532263919719	-108.5604555811064	Watson Island Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemb030b81jjijrt73tn	39.06754502766071	-108.5798136013491	Riverside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemc030d81jj8bpsyh57	39.08180477590578	-108.5917077061163	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeme030f81jj2d51d0ts	39.0893598122845	-108.6118174611243	Blue Heron Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemf030h81jja2mw7z94	39.08891263833821	-108.6190737262775	Monument View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemg030j81jjm1qxjiw4	39.15235614963834	-108.7313932409476	Heritage Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemi030l81jjek3kg4n2	39.0325231494511	-108.5250918614194	Orchard Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemk030n81jjap0b51fk	38.99184938348122	-108.4731651533183	Old Spanish Trail Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeml030p81jj6eylzmrg	38.78501929148593	-108.6030260710698	Divide Forks North ATV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemn030r81jjy8vcyx9i	39.75276190869655	-106.7653672414482	Blue Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemo030t81jjvpu4ock4	38.9736900189818	-108.4624722965752	East Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemq030v81jjxs6gqrh1	38.95285311445954	-108.4768961315716	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomems030x81jj099g159c	39.21662178933074	-108.9549433838612	Rabbits Ear Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemt030z81jj7pgyk0uj	39.18356367568328	-109.0102093833721	Practice Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemu031181jjnubr1hil	39.15850831564868	-109.0341570467007	McDonald Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemw031381jjku0rr83k	39.19354455042532	-109.0201160793083	Trail Through Time	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemx031581jjdqzstvgt	39.09663462136494	-108.842842107931	Mee Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomemz031781jj22kumwup	39.13714036578759	-108.8334339293008	Rattlesnake Arches Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen0031981jjvohvm1lz	39.05505225776071	-108.7449611184314	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen2031b81jjfv55d34u	39.05204798119159	-108.9044953227492	Knowles Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen3031d81jj1g83aa2o	39.0386783067664	-108.9550382275809	Jones Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen5031f81jjej3dmc5u	39.06636667163601	-108.6055291369596	Duck Pond Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen7031h81jj5h0e2wfi	39.07764041655523	-108.6181895838038	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen8031j81jjagdp5jb0	39.05750622852384	-108.465233428632	Corn Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomen9031l81jjt6newm2t	39.14407077787308	-108.7581992636229	Opal Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenb031n81jjsp3zbhor	39.15148582898798	-108.7629232584604	Fruita Paleo Area Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenc031p81jjcvlxe4mp	39.15582972402215	-108.7790755254292	Pollock Bench Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomene031r81jjldn7wnxl	39.13982109921379	-108.7561573682119	Devils Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenf031t81jjsgb7xron	39.2184787312175	-108.8823703687974	Troy Built Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeng031v81jj71cbag8k	39.21089135151411	-108.8716483948088	Mack Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeni031x81jj57ncwaug	39.17337221391722	-108.8296140889971	Rustler's Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenj031z81jj0k0pnz2d	39.19712887331028	-108.8586561813316	Lion Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenl032181jj86xbygwu	39.17788325994662	-108.8278153788688	Kokopelli Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenm032381jj1eo0rqcs	39.31006839843737	-108.7059490882753	North Fruita Desert Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeno032581jjrezlk6xp	39.33495921301236	-108.7004671582413	18 Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenp032781jjjldhr60i	38.09756030275104	-108.3510742448639	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenq032981jjxh2qjw81	38.14209498933164	-108.3354097976283	McKee Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomens032b81jj3gzf2gdj	38.27729901292118	-108.0784061882951	Spring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcoment032d81jjgo2eth4s	38.33407073456262	-108.1250645918066	Silesca Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenu032f81jjfbv81z3f	38.01533678721529	-108.0498928919795	Angell Lode Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenw032h81jjozcgxwxi	37.92982940447474	-107.7741656000201	Marshall Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeny032j81jjs5em0ddr	37.92253099344845	-107.7667604177156	Via Ferrata East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomenz032l81jjqfw9z2us	38.07409573738347	-108.0216862669527	Whiskey Charlie 62 South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo1032n81jjpdq7o2qn	38.10415754677289	-107.9586658498223	Whisky Charlie 62 Trailhead North	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo2032p81jjo37hj60q	37.96713452358265	-107.9705776979996	M59 River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo4032r81jjfnofbq03	37.98585636371174	-107.9908738476802	M59 River North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo5032t81jj8x5n9pzg	37.92860243968008	-107.7764979855068	Valley View Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo7032v81jjpn32dxqm	37.92727853559115	-107.9008027358798	Coal Chutes Loop West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeo8032x81jjeg1kjyc5	37.92838480301971	-107.8988170506354	Coal Chutes Loop East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoa032z81jjqm6gkfcp	40.24007644388613	-105.0011945059549	Founders Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeob033181jjpfdlkzzx	40.23329043692794	-105.0271445461037	Mead Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeod033381jjq5ytztxu	38.87033171713981	-106.993405814374	Woods Walk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoe033581jj1moca81q	37.93430241917549	-107.8119303489892	Bear Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeof033781jj6zwsnzmo	38.59501553837959	-107.8898703383878	Peach Valley Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoh033981jjpiy1mqrg	38.58661590942855	-107.854876614968	Sunset Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoj033b81jjl7ydeeo0	38.58004947081361	-107.8365970845115	Red Rocks Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeok033d81jjqnkuzqir	38.57294702199437	-107.8373157820833	Slanty Bridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeol033f81jjy80zslop	38.52133754544979	-107.8597780842252	Flat Top Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeon033h81jjsfmpt29a	38.54443138749525	-107.862740943848	Elephant Skin Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeop033j81jjqyjyb2jz	39.89837407949625	-105.7738963892305	Winter Park Public Works Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoq033l81jjqdnsw2y3	38.60597731494149	-107.8877888400948	Eagle Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeos033n81jjcl15d7hk	38.60402951771854	-107.8843966537391	Eagle Valley Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeot033p81jjzian953t	38.75149596454363	-107.9102903058874	Smith Mountain Sidewinder Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeov033r81jjtwkn41tq	38.77617014390896	-107.852847750873	Birthday Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeow033t81jjphkpk4ww	38.7705167444286	-107.8603046415502	Crocodile Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoy033v81jjs3ixy8h6	38.76728000935147	-107.8755936567252	Cool Rock Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeoz033x81jj3zs00cpa	38.7541915182684	-107.9085303792526	Smith Mtn Saddle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomep0033z81jjujl1iykt	38.76485363979304	-107.8881036745425	Sun Cliff Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomep2034181jjog3stzav	38.78062681033027	-107.8366102873804	West River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomep3034381jjyyyf9ewj	38.61103745358592	-107.8316806960748	Chukar Geological Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomep8034581jjubivxlx5	38.61336846559157	-107.8359041652365	Chukar Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomepd034781jj66jfn5d9	38.68236487869398	-107.864058363656	Ute Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeph034981jjif0e0quj	38.6299278500257	-107.8700686769119	Bobcat Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomepn034b81jjuzrrvdsh	38.64864961051206	-107.8668180168497	Duncan Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomepr034d81jjesegqqd3	39.82881285758899	-104.8594396644248	Army Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomepx034f81jjpa5i6j7k	39.81991432216723	-104.8629349310935	Lake Mary Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeq1034h81jj7s0a6rnj	39.81998761309139	-104.8611031195601	North Ladora Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeq4034j81jj01ffe1qy	39.81357973349995	-104.8606679906011	Prairie Ponds Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeq5034l81jj64zpvvpc	39.81244023499014	-104.8207604134397	Bluestem Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeq7034n81jjoloebjqx	39.81223851626603	-104.8883190966913	Prairie Gateway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeq9034p81jjc2qgfahv	39.87038966233112	-104.8466213929327	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqc034r81jjhippngye	39.79872212870728	-104.7904932086547	First Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqg034t81jjxsgsbmh6	38.17430344455573	-107.0958430219133	Ten Mile Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqk034v81jjqu3ckw64	38.1340837958898	-107.2849978579624	Devil's Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqo034x81jja5us6xob	38.13883415878432	-107.2864357693116	Lake Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqq034z81jjz265pkn7	38.06572568736203	-107.0641688498332	Powderhorn Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqr035181jj6mmpq5fq	38.16787276796664	-107.7472137945497	Dennis Weaver Memorial Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqt035381jjdh28vw11	38.14588613049275	-107.754919883507	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomequ035581jj2x5pu0vd	38.15242122460977	-107.7551629794884	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqv035781jjd3c66mlh	38.48532473569365	-108.0431821744488	Rim Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqx035981jjhf06595s	38.53794401053656	-108.0663113565312	Transfer Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeqy035b81jjjn7p0qq0	39.77569041245449	-106.7897104879139	Poison Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer0035d81jj0otgy2si	39.07904844419446	-104.5157083084942	Lovaca Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer1035f81jjg35jqteh	39.07447454467606	-104.5236310327789	Homestead Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer3035h81jjwkd59cdl	39.17426658533458	-104.7498330394355	Lincoln Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer5035j81jjxs7aw9j0	39.29460319062573	-104.9206698557803	Dawson Butte Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer6035l81jjtq8pemhc	39.2819566201517	-104.8929578927048	Columbine Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer8035n81jjsb0fp6dd	39.34090221758009	-104.8414059036917	Rhyolite Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomer9035p81jjg9fczerj	39.40568366039293	-104.8029855005655	Hidden Mesa (Pleasant View Dr) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerb035r81jjcnmcjk71	39.40945189406096	-104.7622522495865	Hidden Mesa (Parker Rd) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerc035t81jjtw8bvxsi	39.38799265985541	-104.8023295545472	Gateway Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerd035v81jjpwc37dx7	39.3810539645829	-104.9053180722474	Bison Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerf035x81jjsgmun1i5	39.3786653185128	-104.8935541393038	Ridgeline Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerg035z81jj1c4kb146	39.38163517771109	-104.8575764555874	Rock Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerh036181jjb3qobhke	39.064664736472	-104.792147104907	Fallen Timbers Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerj036381jjr9xhgrol	39.0681014220163	-104.7852893230921	Roller Coaster Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerk036581jjmkdgb10v	39.06058836744567	-104.7932396729023	Fox Run Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerm036781jjxrebyfkl	39.01357618485356	-104.737899114168	Black Forest South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomern036981jjv3vjyw6w	39.01633165175468	-104.736381909406	Black Forest Regional Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomero036b81jj517o5bik	38.71365448369708	-104.7166513003352	Fountain Creek Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerq036d81jj0455y4ky	38.71002979303687	-104.7165410793918	Fountain Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomers036f81jjd2tb98bf	38.6948773381839	-104.7078687334617	Fountain Creek (Grinde Dr) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomert036h81jjq7hmgz7x	38.72105807579895	-104.72578548218	Willow Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerv036j81jjge4n352f	38.77637707363064	-104.780947404506	Hwy. 85/87 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomerw036l81jj451mnvh7	39.03756736131631	-104.7201745767937	Cathedral Pines Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomery036n81jj0srpi4dj	40.228447064073	-105.3428077055554	Button Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes0036p81jjt47p0bdb	39.12342295621718	-104.9104461791194	Palmer Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes1036r81jjg8qa5g5d	39.0979656886899	-104.8710766091743	Hwy 105 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes3036t81jjuae6qj5y	39.09293393921521	-104.8694622944603	Monument Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes4036v81jjsz5ffwnd	39.0572346113074	-104.8582149632192	Baptist Rd Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes6036x81jjau66v5t9	39.02533192470455	-104.8402993632863	North Gate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes7036z81jjhhl30tmp	38.95980595954373	-104.8348733899654	Ice Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomes9037181jjsxkfa0s0	38.99881471905858	-104.6688030246403	Black Forest Section 16 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesb037381jj50bkm6bz	38.85707204110027	-104.8372566895887	Sondermann Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesc037581jjn1qu8867	38.72756606212278	-104.7315481322643	Ceresa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomese037781jjr35uuzge	38.73564723716147	-104.7098805252468	Widefield Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesf037981jjq9aykrak	38.61182775760228	-104.6781273039878	Clear Spring Ranch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesh037b81jjwf4tmhxo	39.07067715064298	-104.5756560511651	Woodlake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesj037d81jjqcyy6a6h	38.93676301918268	-104.6051680327337	Rock Island Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesl037f81jjmflt5jzv	38.86811368506556	-104.9242502477547	Rainbow Falls Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesm037h81jjr3cvgdgh	40.390852691816	-105.0883057470389	River's Edge Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeso037j81jjw3m5392b	40.3830178010117	-105.0633872762716	Old St. Louis Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesq037l81jjryx6zcwp	39.39510736818249	-104.90322827371	Paintbrush Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesr037n81jjh1vyycjl	39.40986209706566	-104.9061539445323	Butterfield Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomest037p81jjesg03d92	39.35519764447088	-104.8010379582073	Matney Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesv037r81jj8y6gi81z	39.37202561324484	-104.8103679576586	Founders Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesw037t81jj8eae2hbs	39.3888500641677	-104.8508267360763	Hangman's Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesx037v81jjpw6pwbtv	39.40630626667419	-104.8773156508629	East Plum Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomesz037x81jjid2o35za	39.36860067741251	-104.8487846891019	Memmen Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet0037z81jjq9xu7a0r	39.45249245139089	-104.7453921997123	Bingham Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet2038181jjnogtr0sn	39.45605307755752	-104.7661292556982	Cherry Creek (Pinery) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet3038381jjn7cj7zt8	38.91867163712435	-104.8140086615221	Pulpit Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet5038581jjhz8egd8v	38.8722729480987	-104.8851189857961	Scotsman Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet6038781jjdjysnfqp	38.86540219706886	-104.8903158778033	Spring Canyon South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet8038981jjaxt4216f	38.88094152349078	-104.8801929989541	Garden of the Gods Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomet9038b81jjzqgsuh6j	38.7436706428789	-104.694373027093	Bluestem Prairie Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometb038d81jjgvjkkpmi	38.93311781857592	-104.8181231729203	Edmundson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometc038f81jjcq7qa93z	38.92080102485163	-104.8265132638796	Golden Hills Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomete038h81jj81i1xkuj	38.9299152413777	-104.8709130617172	Wilson Ranch Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometf038j81jjza58y7z9	38.8916363154806	-104.8751957827414	Blair Bridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometh038l81jju20ehg7t	38.88169542132755	-104.8295647499059	Gossage Sports Complex Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometi038n81jjsvw0nj0x	38.84140379876607	-104.8594634730845	Naegele Rd & S 21st St Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometj038p81jjjrmac1c4	38.79082534937667	-104.9041976931306	Gold Camp Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometl038r81jjmjapd7w4	38.81696072071293	-104.8227102750314	Dorchester Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometn038t81jjoukuq872	38.82990291772818	-104.8310395147481	America the Beautiful Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometo038v81jjdi1ee7z7	38.84570347466618	-104.8297160285877	Monument Valley Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometq038x81jjxf48ogp8	38.88276857788126	-104.8026869336745	Portal Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometr038z81jjcl561au2	38.84063151317952	-104.8136239992378	Shooks Run Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomett039181jjjbqg4l4a	38.91072191916876	-104.7283379221431	High Chaparral Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometu039381jjs9onwq1k	38.53571776393255	-105.2154182507029	Oil Well Flats Upper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometw039581jje9p28u62	38.53645749455796	-105.2189519651897	Oil Well Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometx039781jjkyee72kk	38.53240416177551	-105.2040479653826	Fire Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcometz039981jjtmdl2h75	38.55730754169828	-105.2715443008586	Seep Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu0039b81jj3farw4a9	38.76868748038194	-105.3358844272233	Guffey Gorge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu2039d81jj8d73zsvx	38.6257650652073	-105.3723052341684	Deerhaven - Thompson Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu3039f81jjt2g8o6qz	38.61036220515208	-105.3494150832477	Deerhaven - Wilson Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu4039h81jjlinozbqk	38.6570489043967	-105.2611216570937	Log Cabin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu6039j81jj5o889fyk	38.7226101962584	-105.2804446086463	Booger Red Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu7039l81jjf0woof0t	38.41567658511494	-105.5861964106693	Texas Creek OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeu9039n81jjhhz85bu2	38.61588702940207	-105.225732270636	Shelf Road Equestrian Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeua039p81jjoqwk0wg2	38.61722819612311	-105.2296410013576	Shelf Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuc039r81jj6b75f9gq	38.53500010791173	-105.2216692922328	Marsh-Felch Quarry Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeud039t81jj7nobis16	38.43161697790048	-105.2536808351111	Eagle Wing Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeue039v81jj5auf5duo	38.40436229441424	-105.2712976045743	Lamba Chops Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeug039x81jjbm4pryev	38.40709052905796	-105.32611824705	Grape Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuh039z81jjqdjnz02w	38.46496920094489	-105.2916820785206	East Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuj03a181jjkl2b7qrx	38.43603023383311	-105.2421332175666	Centennial Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuk03a381jj5nqbhqhx	38.41268922470355	-105.1932390795411	SpringCreek Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuo03a581jjhh1k35cd	37.62162125444107	-105.5597595875038	Zapata Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeup03a781jj04wuj3t1	37.62788862721189	-105.5689566641175	Loop 4 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeur03a981jj1wxk1bk7	37.62031222319555	-105.5604360355156	Zapata Falls Campground Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeus03ab81jj02jxrat0	38.21466652075778	-106.0750781165199	Soda Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeut03ad81jj8vp6ry6c	39.86619721740521	-105.8216033147768	Vasquez Peak Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuv03af81jj2l0m3cuy	38.63315408970809	-105.3485543828874	Deerhaven - Deer Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuw03ah81jj341be63q	39.48400851508683	-106.0572281323282	Nordic Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuy03aj81jjpert0csb	39.47846884814747	-106.0531174361044	Snowflake Lift Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeuz03al81jjkigwx44r	40.44129011114086	-105.7547804060961	Alpine Visitor Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev103an81jj7avdwetq	40.39335462905715	-105.6953790942998	Ute Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev203ap81jjx64qoh4m	40.64381194223993	-105.5808731774347	Flowers 4WD Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev403ar81jjrog2jnd7	39.16784389732909	-104.8745208049184	Spruce Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev503at81jjsk23udvd	39.17973066154982	-104.8582061032155	Spruce Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev703av81jjv7f1ua4a	40.68279085453874	-105.4638979032983	Kreutzer Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomev903ax81jjmk605e5k	37.93875574353208	-107.6663409564102	Gray Copper Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevb03az81jjfp1vsu7q	39.42221807968079	-105.9092641438724	French Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevc03b181jjq7iqcjn7	40.62051702329595	-103.1811413951312	Overland Trail Recreation Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeve03b381jjv3z8dr2k	39.12465275387265	-106.5817227506923	Lost Man Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevf03b581jjnydy4zua	40.08955733693013	-105.0227364498578	Bulrush Wetland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevh03b781jj09ssabf4	38.5711401747629	-106.0759550552876	Big Bend OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevi03b981jj6lag8kkb	38.72464663279563	-107.5443972815381	Needle Rock Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevk03bb81jj87olfnqh	39.5749309490056	-107.8122002640771	Hubbard Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevm03bd81jjldpb0s3t	37.8053467119674	-108.7936093625487	Dolores Canyon Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevn03bf81jjewyd3gf9	40.44948872536282	-104.8882437614633	Kodak Watchable Wildlife Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevo03bh81jji8wo2ups	39.68262011518214	-105.5214515665398	Chief Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevp03bj81jjqf4jrw8x	37.59140271242149	-106.5047487133209	Shrader Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevr03bl81jjj9f7ic47	39.72550832574881	-105.6933085050754	Georgetown Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevs03bn81jjicvgdoir	37.82959957144882	-106.5195729376288	La Garita Creek Cut-Off Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevu03bp81jjl3m0620o	37.82748926017815	-106.6148634714995	Embargo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevv03br81jjp70ogwjl	39.18083197289086	-104.8535589287574	Greenland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevx03bt81jjgi565wyg	39.42848623770069	-106.0699485120198	Mayflower Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomevy03bv81jjti3lnpks	39.49987786665353	-105.3797113467163	Ranch Hand Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew003bx81jjgsw0n3h7	40.61840703914848	-105.5259979589737	Fish Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew203bz81jjfrtvudos	40.57638088539733	-105.5844120328591	Emmaline Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew403c181jjy2ybppqr	40.57404924817944	-105.593258692723	Emmaline Lake Primitive Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew503c381jjjiach101	39.72261986531421	-105.4122258223887	Floyd Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew703c581jj7oj6w82z	39.70403484870765	-105.6955043895151	Rutherford Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomew803c781jjm1rhbcqp	40.55437671639544	-105.9141456609326	Montgomery Pass West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewa03c981jjyt5gz3ap	37.95623138660154	-107.3029939756531	Red Mountain Gulch OHV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewb03cb81jje9xu9rdd	39.13537088331412	-105.1053179209625	Rainbow Falls OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewd03cd81jjs67lsz0t	38.5444638024408	-102.5048662786744	Sand Creek Massacre Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewe03cf81jj4ieo8cx2	39.36011532336183	-105.0790055244216	Mile and a Half Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewg03ch81jjkdjo08u1	39.35798389134494	-105.0787919289721	Garber Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewi03cj81jjd3iwppl1	39.68787776390567	-105.6994462926293	Silver Dale Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewk03cl81jjfqj366yv	38.47336345832273	-105.3078306031886	Made in the Shade Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewl03cn81jjui8rejq9	39.99411976253188	-105.1088163424519	Waneka Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewn03cp81jjw664d6qn	39.97824673583592	-105.1665367071099	Davidson Mesa Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewo03cr81jjkb6j241d	39.97849664043093	-105.1651020696326	Harper Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewq03ct81jjif66hl43	39.96534841617527	-105.1471506424158	Daughenbaugh Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomews03cv81jjxw736w4n	39.96893865072006	-105.1417056934454	Warembourg Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewt03cx81jj7ec9zsdt	40.07789130558647	-105.5844498781986	Long Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewv03cz81jjksjwtd59	40.0831865145284	-105.5817642102814	Mitchell Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeww03d181jjdo108urb	40.08365477819589	-105.5811848402239	Beaver Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewy03d381jjxjj91ucx	39.82571901870129	-105.6444386169733	St. Mary's Glacier Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomewz03d581jj0nqgna2z	39.6146650830361	-106.0644699776275	Dillon Dam Overlook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex103d781jjmsocvmj4	39.49735271770932	-106.1363606939098	Corn Lot Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex303d981jjgn1033d6	40.78768753096225	-108.7379388466974	Irish Canyon Accessible Petroglyph Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex403db81jjuvsf1y8j	40.32047201101841	-105.6078707821905	Sprague Lake Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex603dd81jj0u31qynm	39.65242665349173	-105.1622866859999	Muskrat Meadows Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex703df81jjrm26kko2	39.65150288432545	-105.1745417537804	Mt. Carbon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomex903dh81jjgfw9i8tz	39.65328632157477	-105.155800411052	North Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexa03dj81jj0l3jrpaj	39.91108104439353	-105.1839031869387	Rocky Flats National Wildlife Refuge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexc03dl81jjbtzcj9a1	40.13046419175257	-105.8446110046918	Doe Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexe03dn81jjdvwdp83p	40.53174066353035	-105.1628861823146	Soderberg Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexf03dp81jjum6q7er9	40.38391337096105	-106.6969225487749	Fox Curve Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexh03dr81jj9gkpl4yk	38.77534586068337	-105.0093696625365	South Slope Recreation Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexj03dt81jjiphuk7ki	40.36885825185983	-106.7420663376315	West Summit Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexk03dv81jj5kr1wdh8	40.38561692018983	-106.6808255549496	Walton Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexm03dx81jjb4jhtbth	40.37980402132127	-106.7164694834375	Bruce's Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexn03dz81jj7gmlgcsv	40.3916395239645	-106.6027739540801	Old Columbine Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexp03e181jj413i93sj	38.78599783734177	-108.0317892644804	North Delta OHV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexq03e381jjprhd14bo	38.78182966888121	-108.0145467393957	North Delta OHV East Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexr03e581jj286vqkfg	39.68034895319941	-105.1691106980044	Forsberg Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomext03e781jj18ljawkq	40.0526569136271	-107.4606500495319	Long Park / Lost Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexu03e981jj2a7lrdwk	40.14768776182918	-107.740180361896	Yellow Jacket Pass	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexw03eb81jjwg9n6i9d	39.93700510898662	-107.5651360982446	South Fork Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexx03ed81jj22y48cpk	39.93315326677778	-107.7712153540822	Miller Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomexy03ef81jjdva6j1jl	39.92191442175918	-107.899917324996	Hay Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey003eh81jjkn5gdb37	40.23074691089002	-107.593543844617	Morapos Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey103ej81jjucuvi3wt	39.68230393057409	-107.6497002121287	West Elk Alternate Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey303el81jjvigsmu4q	39.67705021259045	-107.5698153749947	Clinetop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey403en81jj72ykc98n	39.43641726181082	-107.5172792604076	East Divide Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey603ep81jju3x0wvya	39.36605150531743	-107.5908328158511	West Divide Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey703er81jj6dy68ij6	39.36861973118264	-107.3057109809301	Marion Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomey903et81jjkvhjjxkr	39.40327321761407	-107.3601804511065	Fourmile Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeya03ev81jjubg3tucb	39.50509972253319	-106.6779674100457	Yeoman Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyc03ex81jj2pb3l369	39.47426158363979	-106.3621052303019	Homestake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyd03ez81jj8z12i8ug	39.43618634679687	-106.3253598725901	Camp Hale Main Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyf03f181jjq09yp6xy	39.52806729456407	-106.2183327317194	Vail Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyh03f381jjd3z92dv3	39.7294098391511	-106.6780502261856	Muddy Pass Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyj03f581jj9dqmd49e	40.13588631937566	-105.297932095062	Corral Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyk03f781jjfbaxe74i	39.23080333039559	-106.2827415439079	CR 6C Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeym03f981jjfgnq546p	39.24964639574754	-106.2708805467457	Mineral Belt 5th St Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyn03fb81jjbfrxtdsj	39.25434870958504	-106.2690992603571	Mineral Belt 7th St Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyp03fd81jj8f5ibq32	39.25191576832999	-106.2946393460215	Ice Palace Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyr03ff81jj1qyya1yq	39.23944275162153	-106.3041997911984	Dutch Henry Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyt03fh81jjb0ox6gqc	39.24509579751195	-106.3078168916238	Lake County Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyu03fj81jj1pgfj2g2	38.90054271884597	-104.9915003741286	Crowe Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyw03fl81jjqzb4wqv0	38.93621915017402	-105.0182284995806	Mt Dewey Trail Parking	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyx03fn81jjbaldqthb	38.93395559525531	-105.0148357811582	Green Mountain Falls Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeyy03fp81jjo30gl4o5	38.92902177668616	-105.0088742424847	H.B. Wallace Reserve Parking	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez003fr81jjtarl472a	38.91452133890255	-104.9931952057191	Mt. Esther Chipita Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez103ft81jjjajh2b20	39.25201930405478	-106.3686734981382	Sugarloaf Dam Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez303fv81jjoyzmrwtl	39.23492512467742	-106.3018429372072	Colorado Mountain College Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez403fx81jjg9x31q5e	39.24502493400497	-106.3560225166798	Mt. Massive Golf Course Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez603fz81jjqxp84kh4	39.20193791290746	-106.8126507716792	BLM Red Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez703g181jjjn7bwtx1	39.20617836544861	-106.7977508656066	Hunter Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomez903g381jjg8eyomzb	39.3584162848509	-107.2918047393955	Spring Gulch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeza03g581jjdq10m1c4	39.31973097858765	-107.1368491638476	Dinkle Lake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezb03g781jjtnjr0i78	39.11849289542452	-106.8282965170464	Little Annie Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezd03g981jjis3wwq8s	39.15903694497967	-106.8432039224924	Midnight Mine Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomeze03gb81jjqlhsowns	39.05583113382857	-106.7996516071614	Ashcroft Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezf03gd81jji7wx98wk	39.13399124618428	-106.7563219845077	Dunbar Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezh03gf81jj161xduvb	39.18776299967005	-107.2342298278395	East Creek Lower Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezj03gh81jj1e4tngnu	39.35724647145732	-107.0377624563989	Basalt High School Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezk03gj81jj3iovee0t	39.07267415627832	-106.8035090865473	American Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezm03gl81jj7x6qce8y	39.36256356927429	-107.0875403326849	Nancy's Path Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezn03gn81jjbngcsm8z	39.33242877424005	-106.9860620936747	Arciero Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezo03gp81jjyzdvnj0d	39.27770714037063	-106.8883782632329	Woody Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezq03gr81jj28l6b7te	39.19171927798062	-106.8082828738852	Smuggler Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezr03gt81jjvsxoxkxv	39.21550585533493	-106.8421924892308	Sunnyside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezs03gv81jjuf79px7v	39.22616777488784	-106.9240717555422	Snowmass Recreation Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezu03gx81jjqz3s67a6	39.199204854556	-107.0013765201507	Snowmass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezv03gz81jjig3v9ta4	39.34683004433762	-107.0110237109999	Wingo Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezx03h181jjt47sg5mk	39.36047418248949	-107.0271892597454	Fisherman’s Park	\N	\N	clhcomc69000081jjgqd2cncx
clhcomezz03h381jjyqd8krpq	39.35485102044229	-107.013493546607	Arbaney Kittle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0103h581jjk0xkql97	39.211626959083	-106.839887573817	Henry Stein Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0203h781jjje1iheso	39.18964670035825	-106.8135134201544	Rio Grande Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0403h981jj4z3yu3w9	39.21113959675166	-106.9128720884679	Tom Blake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0603hb81jj7puvps4t	39.2538749196272	-107.2316031921109	Avalanche Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0703hd81jj5plulkug	39.34448100298074	-106.6147038352346	Elk Wallow Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0803hf81jjj9dlgob9	39.55013149303471	-106.4067042006726	Tigiwon Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0a03hh81jjgdhs2tr6	39.60656675381487	-106.4447642711966	Mountain Meadow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0b03hj81jj7c8e86ki	39.59410051241733	-106.4343013582932	Grouse Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0d03hl81jjwag6umx1	39.52184975168567	-105.9599174076917	Tiger Road Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0f03hn81jjv4xdtjxa	39.09756183616441	-107.8968666598636	Bonham Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0g03hp81jj83jkee5y	39.18078096962042	-107.7936436452688	Park Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0i03hr81jjav20piam	39.31698953567339	-107.9487844935661	Kimball Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0k03ht81jj8gu46k2q	39.02733299985525	-108.0306860320019	County Line Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0l03hv81jjquk7b9di	39.02851151134097	-108.0483872610508	Mesa Top Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0n03hx81jjxusohmbp	39.05426366330646	-108.0915565833486	West Bench Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0p03hz81jjjz1pltjy	38.95895179472731	-107.7427647888016	Leroux Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0q03i181jjie6my3ta	38.93163404723054	-107.6169610675394	Stevens Gulch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0s03i381jjm79vo30e	39.01896813151396	-107.9985226809982	Ward Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0t03i581jjyxt5y4w5	39.95590030724222	-105.8231304301385	Fraser Valley Sports Complex Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0v03i781jjhh975kr0	39.04279248355298	-108.0666949435113	Skyway Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0w03i981jj45ng7ngf	38.93864070872674	-106.153271087775	Vitamin B North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0y03ib81jji39gdj18	38.87481455493045	-106.143427984977	BLM Route 375 Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf0z03id81jj8rli1pn7	40.4571436216775	-105.4258986085368	Crosier Mountain Rainbow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1103if81jjvsddozxm	40.4423410276849	-105.3783736864388	Crosier Mountain Garden Gate Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1203ih81jjvttp5jtp	37.65353041553568	-108.0442489208427	Scotch Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1403ij81jjjhfd57jn	37.56009932180731	-108.4574165806508	House Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1503il81jjnov1oubd	39.59680830566231	-106.033685712415	Prospector Bouldering Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1603in81jjahab82gw	37.65452897136554	-108.3967025077384	Beaver Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1803ip81jjtuvrp83t	37.50213256647264	-108.4656223398139	Boggy Draw Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1903ir81jjovk0i3fk	37.59901943036822	-108.1125405380896	Roaring Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1b03it81jjz6w0m1we	37.41559144469027	-108.3125489971901	Chicken Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1c03iv81jjm6ft6r9j	37.33269665062927	-107.1258538251032	Coyote Hill Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1e03ix81jjig8b1boy	37.4756732035431	-106.8603352772625	Fall Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1f03iz81jjrllj957h	37.4830439706056	-106.7974308422492	CDNST - Wolf Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1h03j181jjg0ac9dpo	37.74271472941168	-107.7000232244466	Little Molas Lake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1i03j381jjoczuji10	37.73348777351988	-107.7108659892051	Andrews Lake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1j03j581jjmxngf59k	37.74761648213705	-107.6880820918046	Molas Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1l03j781jj2t9i9phs	37.52896184407781	-107.8163551790644	Haviland Lake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1m03j981jjzivbv85i	37.4748626230722	-107.5483303623924	Vallecito Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1n03jb81jjzpu1gwer	37.35375561699299	-108.0777304426081	La Plata Canyon Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1p03jd81jjmsm8amck	37.49744375521481	-107.2582790968937	Piedra Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1q03jf81jjwlajo7j9	37.40089548675736	-108.2693611266409	Vista Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1r03jh81jjanwl1f69	38.86062140916523	-107.0487165984109	Kebler Wagon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1t03jj81jj7zz4v741	38.77060253324564	-107.0191210438254	Carbon Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1v03jl81jjrps38cv8	38.90263655186487	-107.0111119961605	Slate River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1w03jn81jjen62boic	38.91547207005554	-107.0015476035606	Washington Gulch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1y03jp81jj57l6i0ps	38.86500443833113	-106.9128940429184	Brush Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf1z03jr81jjuv9a3hlp	38.82891628254345	-106.8354803805335	Cement Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2103jt81jjjf2ad4kl	37.77729902334892	-106.8344600597135	Pool Table Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2203jv81jj8ec368yw	37.7009430865346	-107.0298115508942	Middle Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2303jx81jjpwrj202j	38.92542003633977	-105.0938662051094	Elder-Fehn Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2503jz81jje6h08hxd	38.36809995346028	-107.4881874388626	Augie's Corral Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2603k181jjqbt6p00j	39.27528046970073	-107.6967820049255	Hightower Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2803k381jjqnwwf89j	39.22239872455512	-107.7823144082051	Aspen Nature Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2903k581jjhpr2845p	40.75241378863143	-106.8256913325221	Hinman Nordic Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2b03k781jjt2a21zhj	40.80817324962205	-106.9526988567784	Visitor Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2d03k981jjpao2mdwe	40.80595229461591	-106.9730244159417	Steamboat Lake Marina Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2e03kb81jj3kon25ev	37.93700948788797	-107.4605763650094	Burrows Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2g03kd81jjj372g16j	37.9389844340492	-107.6710945218782	Ironton Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2h03kf81jjefjvangx	37.81646494901427	-107.6513093920258	Silverton OHV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2j03kh81jjsr2z80jq	37.98870197573475	-107.6495499250677	Engineer Pass OHV Staging Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2l03kj81jjnjlxym2m	40.07151687987236	-106.6195455726505	Gore Flats Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2m03kl81jjf299ifrc	40.07775484487696	-106.5579750279745	Gore Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2o03kn81jjx3p8543d	40.51100188089447	-106.0268061588209	Michigan River Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2p03kp81jjsh7pbao9	40.50453990579474	-105.884070255494	American Lakes Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2r03kr81jjee2ontos	40.52047168273669	-105.8938697061424	Cameron Pass Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2t03kt81jjgbcri6n5	40.50244901660104	-105.9687901644565	Ranger Lakes Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2u03kv81jjb7e787ht	40.55542712256517	-105.9914005154126	Grass Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2w03kx81jjcyn5g1a0	40.5729757475511	-105.9878526548639	Ruby Jewel Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2x03kz81jji6jv4p0o	40.61446638289306	-106.0223986347203	Kelly Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf2y03l181jjatv6ltu4	40.5963188954541	-106.0077386352377	Mountain View Nature Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3003l381jjc2i2bqgw	40.53951121741073	-105.8821711683782	Zimmerman Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3103l581jjapn4q21f	40.21796263253911	-107.1524918006632	West Fish Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3303l781jjve8wy116	40.20245960770843	-107.067712797903	Dunckley Pass Ski Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3403l981jjaogqz7ut	39.14234293521541	-106.7743358148244	Difficult Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3603lb81jjlshiq29f	37.81548418508898	-106.9028340322611	Deep Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3703ld81jjnn6rmm9m	37.70306164576292	-106.9948205524537	Ivy/Lime Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3803lf81jjieqcgay5	37.7920235232622	-106.9806792820765	Sixmile Flats Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3903lh81jjwoewy3gv	37.93108754598015	-107.1629795796378	Spring Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3b03lj81jjlu8cn9gk	37.48007361305012	-106.2800263973653	Bishop Rock Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3d03ll81jjlynmqxij	37.5834117508289	-106.156514996095	Monte Vista Golf Course Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3e03ln81jjn24y6pnd	37.47171264955853	-106.3049826450661	Rock Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3f03lp81jjeefmdrls	37.2952059933174	-107.0600182872898	Cloman Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3h03lr81jjrjegpfik	37.84290249080851	-107.8834653342583	Priest Lake Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3i03lt81jjpha9ne0b	37.81196355003576	-107.8704288786267	Trout Lake Trestle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3k03lv81jjeca2vtjr	37.93878409335535	-107.8221590623752	Mahoney Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3l03lx81jju9f1eoxc	37.94793787347457	-107.8715447439484	Lawson Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3m03lz81jjnd9fn1uc	37.93548523642611	-107.8069054153519	Telluride Town Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3o03m181jj9tk0o0rh	37.25485523543784	-107.0130248684885	Yamaguchi Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3r03m381jj1w51ztj7	40.57964906007257	-105.8557515447262	Blue Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3s03m581jjk8sbw774	40.55711669205736	-105.8215474147143	Trap Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3u03m781jj0zqg25f5	40.5809981967809	-105.8529876584415	Long Draw Parking (Winter) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3v03m981jjm5ni95c2	38.68955243270503	-105.0544115407022	Skagway Reservoir Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3w03mb81jjl5g8lqoi	40.21193764961856	-105.5514057699253	Wild Basin Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3y03md81jj2af2cz4v	40.21978249013728	-105.5344599414858	Sandbeach Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf3z03mf81jj6lmmenw7	37.29810196174899	-108.4155436866327	Morefield Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4103mh81jj1au0vgcd	37.18573867295041	-108.4884549275229	Spruce Tree Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4203mj81jje5edsp1v	37.25826012966142	-108.4982990880303	Wetherill Mesa Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4403ml81jjq9n1ilmb	37.296313033613	-108.4413787800937	Prater Canyon Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4603mn81jja0h0ka2e	38.47042657950482	-107.2531434434049	Dillon Pinnacles Trail	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4703mp81jj8y112dz6	38.55475197617405	-107.686772592968	Gunnison Point Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4803mr81jj4olth3bz	40.12444087964617	-105.4423207996427	Ceran - St. Vrain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4a03mt81jjbx9myfuf	37.69540253516235	-108.0273894633506	Argentine & Enterprise Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4b03mv81jjs9h8izkn	37.69003703312355	-108.0357901638779	Piedmont & Silver Swan Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4d03mx81jjwg7fnhq9	37.26545378107041	-105.3472178215081	Costilla County Greenbelt Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4f03mz81jjx8h1bhc7	37.25357229238484	-105.318910704229	Rito Seco Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4g03n181jj86kddcr3	39.93694893451477	-105.899482118226	Crooked Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4i03n381jjk6xipgv1	37.0123096557417	-102.7445935029104	Picture Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4j03n581jj0zkurr9z	40.4865857536809	-106.817445024682	Spring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4l03n781jj54pr1b8q	39.65150976923898	-106.0980244444898	Willowbrook Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4m03n981jjnz61a0s1	39.75377908640352	-105.240147476639	Canal Zone Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4o03nb81jjzw4v2end	39.67398100783819	-105.444836378327	Beaver Brook Watershed Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4q03nd81jjed2btjph	39.69003617197068	-105.4229861720331	Lower Beaver Brook Watershed Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4r03nf81jjnofww6i9	39.74285596443332	-105.4742722746958	Game Check Station Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4t03nh81jj8a1p715l	39.62449289537059	-106.430082218017	North Trail (Davos) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4v03nj81jjuh8isz4t	39.34764272342985	-106.6807769912195	Montgomery Flats Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4w03nl81jjyaew0ptc	39.24423922848317	-106.7578349358266	Lenado Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4y03nn81jjaoyuuwt1	39.29801461111987	-106.6059007270016	Granite Lakes/Nast Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf4z03np81jjbmcedhkb	39.32945263321538	-106.6589147432663	Aspen Norrie Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5103nr81jjqca79a6y	39.26439113638926	-106.3394092489528	Leadville Junction Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5203nt81jjofy4aedh	39.36255710238155	-106.3112669361976	Tennessee Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5403nv81jj0ew46odw	39.59231810297754	-106.6113529583441	West Lake Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5603nx81jjd24w9759	39.479895795336	-106.7343945896564	West Brush Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5703nz81jj2i2wqkhm	39.2977362298606	-106.5876641743818	505 Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5903o181jjxe9mmx97	39.48634020609957	-105.9806928297458	Lincoln Townsite Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5a03o381jjxq6tfcin	39.64484516211616	-106.3759349477426	Middle Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5c03o581jj0u502fi3	39.43711948900229	-106.0506961670051	Spruce Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5d03o781jjnmh7r7sm	39.34583300058245	-105.9289241186318	Peabody Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5f03o981jjpp0bb8d3	39.46267755224274	-106.0211009547383	Boreas Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5g03ob81jjnkfx3wjm	39.82266954913715	-105.769660766676	Second Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5i03od81jjz0xzlbwy	39.00338913501916	-107.9404965727618	Old Grand Mesa Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5k03of81jj9ehhlq1k	39.04035847265874	-107.9867394967526	Cobbett Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5l03oh81jj03nckasr	39.00295623370241	-107.857356465646	Leon Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5m03oj81jjoav5mjfz	38.81380032836154	-106.280841359834	Avalanche Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5o03ol81jjdy3vj9j8	38.7054513314251	-106.3499529023462	Poplar Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5p03on81jjukqtjgaw	38.81780317407835	-106.5614227385078	Taylor River Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5r03op81jjxgrrbqpq	39.64839455674144	-106.3962708533841	Red Sandstone South Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5t03or81jjvir2h7tt	39.65481231320496	-106.3967259918891	Red Sandstone North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5u03ot81jjbafziwjn	40.53457809047565	-106.78466143486	Dry Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5w03ov81jjyanb1lob	40.38907395009478	-106.6357649040403	Dumont Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5y03ox81jjv0avfehm	40.38770033876974	-106.6187902033561	Muddy Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf5z03oz81jjhkl317je	40.55690468876021	-106.5967436294416	Grizzly Guard Station Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6103p181jj7rz1x9zd	40.14536139238927	-106.5485530330692	Red Dirt Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6203p381jj0bbflhcw	40.86156583510127	-106.9597656575675	Columbine Parking Lot	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6403p581jjh0w02csg	40.75442174962582	-106.8197295549431	Seedhouse Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6503p781jjx46d9v1c	39.21570786328008	-107.8137846573394	Visitor Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6703p981jjzjf5664t	40.68996998690022	-107.4347356904757	Black Mountain Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6803pb81jje1hp9bnx	40.69304667293557	-107.4633994412497	Freeman Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6a03pd81jjxd23380v	40.83508417124632	-107.5177199927634	Wilderness Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6b03pf81jj2mxo3e11	37.85529820437917	-107.1541050027723	Bristol Head Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6d03ph81jjy71367an	37.94079196979523	-107.1600669825968	Spring Creek Pass Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6f03pj81jjdohk8ypk	37.87168703718242	-106.943019485091	Rat Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6h03pl81jj6lufou7n	37.41752611268481	-108.2526301444063	West Mancos Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6i03pn81jjvfzhcgv3	37.47307904958466	-108.3803847177063	Haycamp Mesa Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6j03pp81jj9fbsofty	37.43044354196123	-107.7837953903521	Missionary Ridge Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6l03pr81jjlr6e47ji	37.76855869289722	-107.9877617472831	Barlow Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6n03pt81jjwciwgqj6	37.42325395525	-107.6710366815907	Youngs Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6o03pv81jj6qsvmdd8	37.43868521070078	-107.5428093590685	Middle Mountain Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6p03px81jj4eecmd01	39.90559466010383	-106.4043862168866	Spring Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6r03pz81jjg7smgasb	39.73193451201442	-107.6480302240695	West Elk Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6t03q181jjqdomrtqz	39.72479652784833	-107.688703947863	Rifle Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6u03q381jjze85obgf	39.96659785007857	-107.635906015685	Buford Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6v03q581jj44i0vm3o	39.56668324483447	-107.3179610625706	Transfer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6x03q781jjz79gygag	39.67827770616706	-107.0967682248482	Deep Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf6y03q981jjytktppxm	40.22521160102673	-105.8924390617413	Idleglen Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7003qb81jjd30k7b28	38.86763773390072	-107.023124508411	Kebler Pass Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7103qd81jjkqyam8pm	38.78424608265831	-107.0739816429023	Ohio Pass Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7303qf81jj7amgpf6z	38.95400798817453	-107.2712381581549	Erikson Springs Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7503qh81jjbij6fbz0	38.4679774332136	-107.5154218391219	Corral Gulch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7603qj81jja1p9zd5a	38.55297500738367	-107.5219569683272	Crystal Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7803ql81jj2sah39xo	39.25600797431716	-106.2450927126324	Evansville Town Site Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7903qn81jjhcm7p7j3	39.25824511641478	-106.2285969146756	Silver Spoon Mine Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7b03qp81jj2bps2bui	39.24742022401086	-106.2586979067461	Adeliade Town Site Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7c03qr81jjrjx9k68r	38.40728395734897	-106.415187223575	Marshall Pass Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7e03qt81jjuwj0kck1	39.23481953192451	-106.2526880289431	Oro Town Site Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7f03qv81jj0xog0r3n	39.22407630467478	-106.2363116229555	CR 6A Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7h03qx81jj3kel0cnl	39.23190736450265	-106.2442696277956	California Gulch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7i03qz81jjdxn6egsm	39.22499713676262	-106.2372387709262	Black Cloud Mine Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7k03r181jj0rc6y142	38.26044601799952	-107.5461779396164	Silverjack Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7m03r381jj3u5lxkzg	38.18036536067895	-107.6183885469103	Vista Point Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7n03r581jjyen3yo6t	38.25584209858012	-107.9776361975959	Elk Mountain Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7p03r781jj0vlbn9pp	37.37609103371001	-106.8907412999068	East Fork Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7q03r981jj2f3knozj	37.35737970956881	-107.0382527964056	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7s03rb81jj1p4n8fwl	37.33158613650976	-107.1250058366789	Turkey Springs Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7t03rd81jjl1zauw1o	37.48577423314798	-106.836962845418	Wolf Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7v03rf81jjc300277q	38.42001417330469	-106.129746040105	Shirley Site Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7w03rh81jjage2ggmt	38.58446699360171	-106.2198158450754	Angel of Shavano Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7x03rj81jj4bc8jcgg	37.88080015103178	-107.5664043284864	Eureka Gulch OHV Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf7z03rl81jjq708wxsc	37.55316605378519	-106.7786038505681	Big Meadows Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8003rn81jjwa88msl8	37.52805768545856	-106.7702046477758	Tucker Ponds Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8103rp81jjly2q7iyc	37.59676711608878	-106.7276861111714	Park Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8303rr81jje3zdsfgk	37.58278120507609	-106.6511189140524	Beaver Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8403rt81jj0xcygr5d	37.67408684003317	-106.6040704274016	Willow Park Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8603rv81jjdy5xkp78	39.51489628710372	-106.3646833546514	Red Cliff Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8703rx81jjphcvdorv	40.55639355493603	-106.0363930612066	Bull Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8903rz81jjo9as0lmj	38.06616632936624	-105.1242042381909	Ophir Creek Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8a03s181jjt7odnwtz	38.49100553436726	-105.0317033395075	Penrose Commons - Independence Extreme Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8c03s381jj1y36akb5	37.97714153611586	-108.2612164464935	East Naturita Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8e03s581jjwz078gui	37.3398351840184	-107.7983999758401	Durango Hills Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8g03s781jjezt6kgic	40.03198499227484	-105.7973662058873	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8h03s981jj8xveaqgn	38.5210485536101	-105.2147641937789	MOOve Over Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8i03sb81jjg3va8xj6	38.13833195054552	-108.3388679120645	Burn Canyon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8k03sd81jjla69bxrl	38.27277310011017	-108.5267244629628	Nucla Range Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8l03sf81jjo0i1w780	37.69656319994981	-106.9137920901859	North Lime Creek Summer Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8m03sh81jjq28yk6b0	38.30575503363936	-107.9634638708184	Dave Wood Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8o03sj81jj1serhltl	39.08302531590415	-104.8875260647068	Monument Fire Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8p03sl81jj0u5igtdp	37.23499377820578	-107.3588436750555	First Notch Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8r03sn81jjx12p7d75	37.24279360237239	-107.5454173958879	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8t03sp81jjwjle6pss	37.6991810308697	-107.7790370917317	Engineer Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8u03sr81jjxyqqv4mi	37.39678694437228	-108.2179216012445	Echo Basin Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8w03st81jjbh7c0xqd	37.53297752777945	-107.8056925920945	Haviland Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8y03sv81jj52bv4lfd	37.37650840701883	-107.5599563616793	Old Timers Winter Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf8z03sx81jj170tgc46	40.59632500621075	-105.1655535102199	Sunrise Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9103sz81jjjabyx8ck	40.52345685853986	-105.1141934157225	Cathy Fromme Prairie Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9203t181jjurrgzcmi	40.51105612762898	-105.0966511178234	Cathy Fromme Prairie Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9403t381jjkaqknmeo	39.89865541206369	-106.0958868710347	Horseshoe Snowmobile Parking	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9503t581jjy8qniirp	39.55952387377275	-105.7623040994342	Shelf Lake Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9603t781jj3d27kl46	40.31364772127517	-106.066790426219	Gilsonite Guard Station Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9803t981jjdxygvdrb	39.90691636919911	-105.8831224755796	Deadhorse Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9903tb81jj3wel48qh	39.90796180574999	-105.8810793848019	Leland Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9a03td81jjw8mm4iuz	39.92991548430684	-105.7755100938178	Meadow Trail Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9c03tf81jjxgnud1s3	39.90890755966125	-105.764449124398	Lakota Snowmobile Parking Area	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9d03th81jj4eyd8jh4	40.55644865339005	-105.1438514595396	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9f03tj81jj7tez41g5	40.58742181048395	-105.1815651745509	East Valley Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9g03tl81jjuq3rhdxk	40.58406485423259	-105.1794173261645	North Eltuck Bay Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9i03tn81jjggjixkj9	40.57863116978839	-105.1781979290771	Well Gulch Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9j03tp81jj2a8sbom1	40.57582554184001	-105.1778864708712	Well Gulch (Homestead) Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9l03tr81jj9xfdub1t	40.56515145648871	-105.1736873312758	Shoreline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9n03tt81jjqfp1e4xw	40.58849820976996	-105.1845105666862	Timber Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9o03tv81jjenbld0ns	40.55604796366588	-105.0195350970562	Environmental Learning Center Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9q03tx81jjqqj1lehn	40.59560188377996	-105.0823774992451	Lee Martinez Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9r03tz81jjwkda4atl	40.56482664775994	-105.0454360868439	Spring Creek Trail - Riverside Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9t03u181jj41lk3wbv	40.56514549878905	-105.0510068412303	Edora Ballfields Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9u03u381jjbf3ka564	40.56167835052202	-105.0735322781176	 	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9w03u581jj2f09sv13	40.56705436040506	-105.1551986613583	Rotary Park Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9x03u781jjtwwg5vr1	40.58224197904459	-105.1597565815122	Skyline Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomf9z03u981jjuzvagaaq	40.35194646896484	-105.4577502888076	Saddle Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa003ub81jje5ynslc9	39.94796801666816	-105.1658576526629	Oerman-Roche Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa203ud81jjpmx40zb9	39.53189592093295	-105.0456450816597	Plum Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa403uf81jj2bt2n95f	39.51530686438029	-105.0817379984121	Wetlands Connector North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa503uh81jjftmad1fa	39.77376806114841	-105.2540432594913	Mount Galbraith Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa603uj81jj4neh4k5w	39.79884419880863	-105.2483841746176	White Ranch East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa803ul81jj8ovtqsvd	39.63610373817627	-105.2394995169651	Mount Falcon Park West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfa903un81jj0rbk0dx4	39.66792448928175	-105.2583952439139	Lair o' the Bear Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfab03up81jj0neuwxom	39.62330383238078	-105.3464976204034	East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfac03ur81jja39spefh	39.62277528951537	-105.3599226665005	West Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfae03ut81jj9os30ssk	40.52390901829082	-105.181177200884	Horsetooth Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfaf03uv81jj87z21dod	40.48011017698511	-105.116686668888	Coyote Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfah03ux81jjn61j87pt	40.41149033575579	-105.1527339569438	Devil's Backbone Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfai03uz81jj4o63yaa7	40.6111827936701	-105.1534639053823	Reservoir Ridge - Michaud Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfak03v181jjr0w6jtl2	38.94892742108528	-104.8861798619426	North Blodgett Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfal03v381jjqhfk8lbx	38.94241327034154	-104.8764823979358	South Blodgett Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfan03v581jj9ttobzqd	38.91495000246355	-104.8368882268039	South Rockrimmon Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfao03v781jjjyidc1tl	40.47973228007788	-105.2254484308093	Bobcat Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfaq03v981jjo0gfvnsv	39.64690553400848	-105.1965549534165	Mount Falcon East Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfat03vb81jj1tfam6k4	38.79522762195057	-104.8587797175117	Ridgeway Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfav03vd81jjo0zjz8oj	38.80030514966644	-104.8584998516057	La Veta Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfaw03vf81jj29ozou7u	38.79120282510694	-104.7844187793774	Seymour Cray Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfay03vh81jjzef49tpx	40.45883601355759	-105.1174787839248	Prairie Ridge Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfaz03vj81jjk16fb878	38.7897660768103	-107.6938908196608	Crossroads Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb103vl81jjai3afxvk	40.42014818553736	-105.2852775235998	Round Mountain Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb303vn81jj8e5myby7	40.38036626850603	-105.5196703390894	Knoll-Willows North Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb403vp81jjfgu06el4	40.37782595515745	-105.520812058784	Knoll-Willows Town Hall Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb503vr81jjfoz7j6tm	39.02272514758845	-104.6601513772292	Pineries Open Space Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb703vt81jjaucpj345	40.70125899597848	-105.2429589397449	Gateway Natural Area Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfb803vv81jj8gqs53iq	37.81074256960846	-107.9083081364214	Galloping Goose Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfba03vx81jjfup0e1f9	37.19060714847248	-104.5131108092152	Wormhole Loop Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
clhcomfbb03vz81jj5do5496u	37.94485111668937	-105.1022451325967	Pole Creek Trailhead	\N	\N	clhcomc69000081jjgqd2cncx
\.


--
-- Data for Name: TrailOrg; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TrailOrg" (id, name) FROM stdin;
clhco8vgf000081alh5sb8gqt	COPMOBA
clhcod8i6000081dy4y2zrmfo	COPMOBA
clhcoeva0000081fi4n0o93bc	COPMOBA
clhcofzlx000081gb1hjzi9ih	COPMOBA
clhcomc69000081jjgqd2cncx	COPMOBA
\.


--
-- Data for Name: Trailbucks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Trailbucks" (id, created_at, amount, user_id) FROM stdin;
clhcq42em000181aimhgd1tta	2023-05-07 01:16:39.598	145	clhcq42em000081airv9zzkw4
\.


--
-- Data for Name: Transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Transactions" (id, created_at, amount, trail_id, user_id, trail_org_id, confirmation_number) FROM stdin;
clheaitvz000181jjwa8xao4l	2023-05-08 03:35:46.895	1	clhcomcj700ep81jj1f4fkv8y	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	0af-08d
clhebh6yg000381jj3xt616n9	2023-05-08 04:02:30.136	1	clhcomcjp00fd81jjx1bo9c7x	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	102-f10
clhebhity000581jjq4yq8n4t	2023-05-08 04:02:45.526	10	clhcomd9f01ap81jjqcatrqcv	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	8fa-fb3
clhebirm2000781jj71to6xn2	2023-05-08 04:03:43.562	10	clhcomd9f01ap81jjqcatrqcv	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	3e6-38a
clhec3kxn000981jjl8vaqp4t	2023-05-08 04:19:54.683	5	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	69f-569
clheca88h000b81jj6wgj7sdd	2023-05-08 04:25:04.818	1	clhcomd9d01an81jjggffywi7	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	fed-36e
clhecxtb4000181etzlx2dqin	2023-05-08 04:43:25.216	1	clhcomchf00ch81jjq4osf4dp	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	d6d-4b5
clhedlcds000181iws5xbmdl9	2023-05-08 05:01:43.024	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	51d-08b
clhedlwp9000381iw571bk891	2023-05-08 05:02:09.358	1	clhcomc99001x81jj05jzqi0v	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	d2f-41c
clhedridn000581iw2324pzfa	2023-05-08 05:06:30.732	1	clhcomcj600en81jj2rq3ahtn	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	789-2f5
clhedrodh000781iwha1jumlf	2023-05-08 05:06:38.501	1	clhcomd9d01an81jjggffywi7	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	0af-51d
clhedti0w000981iwlmundgun	2023-05-08 05:08:03.585	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	58d-b89
clhedtnky000b81iwlqnjmt4f	2023-05-08 05:08:10.786	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	61a-9dd
clhedwvkg000d81iwy8fsp4yc	2023-05-08 05:10:41.104	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	5f9-ac9
clhedx0at000f81iw16bqw521	2023-05-08 05:10:47.238	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	80e-d68
clhee8kso000181ahnmhcmw6r	2023-05-08 05:19:47.016	1	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	327-037
clheec9rm000381ahkiuv7krn	2023-05-08 05:22:39.346	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	837-1ef
clheedhv7000181gabt5wcs97	2023-05-08 05:23:36.5	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	01d-4c5
clheef4iv000381gaaqrb8bii	2023-05-08 05:24:52.519	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	4c3-696
clheehqbh000181k5ib4ulwch	2023-05-08 05:26:54.078	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	de84f857-6430-46c6-a8c1-d4b79d1f2332
clheeka6h000181leu9tyusl0	2023-05-08 05:28:53.129	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	591-658
clheemewa000181o0y0fa01sv	2023-05-08 05:30:32.554	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	10c-802
clheeo1p9000181pktl0sm32q	2023-05-08 05:31:48.765	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	e63-a84
clheeo7jq000381pkcgzdwhvs	2023-05-08 05:31:56.342	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	76f-dd5
clheesw60000181s6k50uvqqf	2023-05-08 05:35:34.872	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	dca-d07
clheeumar000181uzsligzm53	2023-05-08 05:36:55.396	1	clhcomci400dd81jj4gq0s2g9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	b4b-5fe
clheevvjm000181w0591nzb2r	2023-05-08 05:37:54.034	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	15a-02f
clheewkwh000181x2f8czyurf	2023-05-08 05:38:26.897	1	clhcomd9f01ap81jjqcatrqcv	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	7eb-c39
clheezgar000381x2xg7orqw1	2023-05-08 05:40:40.899	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	71a-566
clhef9u95000581x2erlgoym1	2023-05-08 05:48:45.545	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	3d8-7c2
clheficzz000781x20b5wzsue	2023-05-08 05:55:23.088	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	b5c-227
clhefoe7m000981x22cefnp9b	2023-05-08 06:00:04.594	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	868-111
clhefokhs000b81x2p57pfayk	2023-05-08 06:00:12.736	1	clhcomcd1006r81jj6ltulaxl	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	405-a4e
clhefu4fy000181e5cv2xzrw2	2023-05-08 06:04:31.87	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	8f8-313
clhefx1gg000381e5ro8e7ods	2023-05-08 06:06:47.968	1	clhcomcj700ep81jj1f4fkv8y	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	553-e37
clhefy8mk000581e56rfa02ui	2023-05-08 06:07:43.917	1	clhcomcj600en81jj2rq3ahtn	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	1ee-b09
clhefzrcl000781e5b2yfnjgm	2023-05-08 06:08:54.837	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	90f-233
clhefzx7c000981e5rqiygnwt	2023-05-08 06:09:02.424	1	clhcomcj600en81jj2rq3ahtn	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	311-8ff
clheg4hzq000b81e5wafh7u6t	2023-05-08 06:12:35.991	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	a6e-b06
clheg4qyk000d81e5bypc6657	2023-05-08 06:12:47.612	1	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	4a4-6c0
clhegausb000f81e5824izksf	2023-05-08 06:17:32.508	1	clhcomci300db81jjis1n3l0v	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	cb3-f9b
clhegbirh000h81e51ugzucrn	2023-05-08 06:18:03.582	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	175-15b
clhegdkj4000j81e5t72h46qw	2023-05-08 06:19:39.184	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	837-8ae
clhegea7k000l81e5v0tujgj8	2023-05-08 06:20:12.464	1	clhcomd9d01an81jjggffywi7	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	abc-d37
clhegihfw000n81e54h9tlkq4	2023-05-08 06:23:28.46	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	947-e7f
clhegiuqb000p81e5gg2zl3lm	2023-05-08 06:23:45.683	1	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	1b4-dd0
clhegr7b0000r81e54x8vaf3p	2023-05-08 06:30:15.228	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	a54-a97
clhegrs2i000t81e5jhvcqwrw	2023-05-08 06:30:42.139	1	clhcomd9d01an81jjggffywi7	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	642-8c4
clhetcj08000181qcar8rqar8	2023-05-08 12:22:45.56	1	clhcomci400dd81jj4gq0s2g9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	8d2-1fc
clheteaht000381qclzxgaaqs	2023-05-08 12:24:07.842	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	27a-4bd
clheth7dq000581qcgf4x5r3q	2023-05-08 12:26:23.774	1	clhcomcd1006r81jj6ltulaxl	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	652-cd8
clhetjhyr000781qclzzr4wv2	2023-05-08 12:28:10.803	1	clhcomcj500el81jjf9669zmh	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	6ca-1d9
clhetmcyr000981qc19skgi8x	2023-05-08 12:30:24.292	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	c10-a3d
clhetv20d000b81qc5mc81oh3	2023-05-08 12:37:09.997	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	79a-932
clhetxr5t000d81qcj1xzlr65	2023-05-08 12:39:15.905	1	clhcomcd1006r81jj6ltulaxl	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	bb3-2d0
clheu0k78000f81qc6n09ydin	2023-05-08 12:41:26.852	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	3eb-5d7
clheu2vc0000h81qcsf2el0z2	2023-05-08 12:43:14.592	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	517-24a
clheu6qbj000j81qckqclry8k	2023-05-08 12:46:14.719	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	4cf-465
clheuac7x000l81qcby1vw655	2023-05-08 12:49:03.07	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	d09-b74
clheubnc9000n81qc8mxxa6ez	2023-05-08 12:50:04.138	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	aab-e80
clheubx3u000p81qcp9avzknn	2023-05-08 12:50:16.795	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	13e-530
clheucsny000r81qc08j3zsmb	2023-05-08 12:50:57.694	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	069-992
clheuerd8000t81qc45ke5asg	2023-05-08 12:52:29.324	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	399-1fc
clheuf0a2000v81qcl4qdkilw	2023-05-08 12:52:40.874	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	ca1-d13
clheugts4000x81qcqqischxa	2023-05-08 12:54:05.764	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	d08-40b
clheuhdo0000z81qcol7jqbeg	2023-05-08 12:54:31.536	5	clhcomcj500el81jjf9669zmh	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	6b6-cb8
clheuib71001181qc38srt5jb	2023-05-08 12:55:14.99	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	7a2-d07
clhevzzn9001381qcects34lz	2023-05-08 13:36:59.445	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	472-884
clhex8rw3001581qcx7lfgp6q	2023-05-08 14:11:48.915	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	f88-025
clhexblj0001781qco54n00n2	2023-05-08 14:14:00.637	1	clhcomcd1006r81jj6ltulaxl	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	86c-fb1
clhexc4h0001981qcgpk5jeak	2023-05-08 14:14:25.189	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	e41-2da
clhexfgy4001b81qcuv9llkav	2023-05-08 14:17:01.324	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	cc2-09c
clhexfmqg001d81qczo57aons	2023-05-08 14:17:08.824	1	clhcomcd1006r81jj6ltulaxl	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	06a-2ee
clhexfta4001f81qcz6grvye7	2023-05-08 14:17:17.309	1	clhcomci300db81jjis1n3l0v	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	1e2-e82
clhexi7ov001h81qcn75nwdb6	2023-05-08 14:19:09.295	10	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	69f-b16
clhexiikq001j81qc0sb0f93p	2023-05-08 14:19:23.403	20	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	688-048
clhezkxig001l81qcoikfgzom	2023-05-08 15:17:15.304	1	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	52e-623
clhfqsp6m000181pjkggjz2b3	2023-05-09 03:59:07.39	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	832-2b4
clhi4t62j00018148ogz67sol	2023-05-10 20:06:56.25	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	1e3-9f9
clhibhake0003817zkyvesofc	2023-05-10 23:13:39.519	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	f99-529
clhibhakd0001817zlam6iw5b	2023-05-10 23:13:39.517	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	af9-042
clhibhakf0005817zlwpvmynl	2023-05-10 23:13:39.519	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	e34-27a
clhk0gr09000181pheiic7kk5	2023-05-12 03:40:50.745	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	038-65c
clhlbvy360001815ygajbg72e	2023-05-13 01:48:21.714	1	clhcomdfr01hr81jj7eao4097	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	bb6-42c
clhlc97m10003815yhvi84zl5	2023-05-13 01:58:40.585	10	clhcomdfr01hr81jj7eao4097	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	e6c-9a6
clhpfr54c000181cdxq00500a	2023-05-15 22:47:40.716	100	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	8a4-875
clhpnvz1y000381cdlfbvldey	2023-05-16 02:35:23.062	5	clhcomci400dd81jj4gq0s2g9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	f40-cbd
clhpq0a3t00018102x3p1eya1	2023-05-16 03:34:43.241	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	acc-5ac
clhpqp4po000181zwir6oti4q	2023-05-16 03:54:02.652	1	clhcomciw00eb81jjfl1en7cd	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	053-d4a
clhpqry7k0001811efrrs4n7f	2023-05-16 03:56:14.193	1	clhcomdaq01cb81jj7y39na1c	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	b7d-611
clhpr3qa30001814ua1ec5h2i	2023-05-16 04:05:23.788	1	clhcomcck006581jjhavtxlt2	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	f5f-8ed
clhprbx3z0003814ueok26kr1	2023-05-16 04:11:45.887	1	clhcomci100d981jje3962vz9	clhcq42em000081airv9zzkw4	clhcomc69000081jjgqd2cncx	4cc-04e
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, created_at, updated_at, first_name, last_name, email, password, is_new) FROM stdin;
clhcq42em000081airv9zzkw4	2023-05-07 01:16:39.598	2023-05-16 05:52:34.454	Jared	Vandeventer	Vanthedev@gmail.com	$2b$12$gCaSARrZVLhJFX5AYhNLjeUA7oLDEQQOCnt45HfOdDRjqY.CStBZi	f
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: FavoriteTrails FavoriteTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: RecentTrails RecentTrails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_pkey" PRIMARY KEY (id);


--
-- Name: TrailOrg TrailOrg_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TrailOrg"
    ADD CONSTRAINT "TrailOrg_pkey" PRIMARY KEY (id);


--
-- Name: Trail Trail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_pkey" PRIMARY KEY (id);


--
-- Name: Trailbucks Trailbucks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_pkey" PRIMARY KEY (id);


--
-- Name: Transactions Transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Notification_trail_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Notification_trail_id_key" ON public."Notification" USING btree (trail_id);


--
-- Name: Trailbucks_user_id_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Trailbucks_user_id_key" ON public."Trailbucks" USING btree (user_id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: FavoriteTrails FavoriteTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FavoriteTrails"
    ADD CONSTRAINT "FavoriteTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_trail_id_fkey" FOREIGN KEY (trail_id) REFERENCES public."Trail"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: RecentTrails RecentTrails_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RecentTrails"
    ADD CONSTRAINT "RecentTrails_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trail Trail_favorite_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_favorite_trail_id_fkey" FOREIGN KEY (favorite_trail_id) REFERENCES public."FavoriteTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trail Trail_recent_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_recent_trail_id_fkey" FOREIGN KEY (recent_trail_id) REFERENCES public."RecentTrails"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Trail Trail_trail_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trail"
    ADD CONSTRAINT "Trail_trail_org_id_fkey" FOREIGN KEY (trail_org_id) REFERENCES public."TrailOrg"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Trailbucks Trailbucks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Trailbucks"
    ADD CONSTRAINT "Trailbucks_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_trail_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_trail_id_fkey" FOREIGN KEY (trail_id) REFERENCES public."Trail"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_trail_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_trail_org_id_fkey" FOREIGN KEY (trail_org_id) REFERENCES public."TrailOrg"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Transactions Transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Transactions"
    ADD CONSTRAINT "Transactions_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

