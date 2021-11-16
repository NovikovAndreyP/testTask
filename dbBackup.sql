--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0 (Debian 14.0-1.pgdg110+1)
-- Dumped by pg_dump version 14.0

-- Started on 2021-11-16 11:39:06

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
-- TOC entry 214 (class 1259 OID 16399)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.booking (
    id integer NOT NULL,
    hotel_room_id integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    price integer,
    sale integer,
    total_price integer
);


ALTER TABLE public.booking OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16398)
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_id_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 213
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- TOC entry 210 (class 1259 OID 16385)
-- Name: hotel_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel_room (
    id integer NOT NULL,
    name character varying(100),
    price integer NOT NULL
);


ALTER TABLE public.hotel_room OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16384)
-- Name: hotel_room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotel_room_id_seq OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 209
-- Name: hotel_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_room_id_seq OWNED BY public.hotel_room.id;


--
-- TOC entry 212 (class 1259 OID 16392)
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sale (
    id integer NOT NULL,
    days_count integer NOT NULL,
    sale integer NOT NULL
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16391)
-- Name: sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_id_seq OWNER TO postgres;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 211
-- Name: sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sale_id_seq OWNED BY public.sale.id;


--
-- TOC entry 3179 (class 2604 OID 16402)
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 16388)
-- Name: hotel_room id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_room ALTER COLUMN id SET DEFAULT nextval('public.hotel_room_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 16395)
-- Name: sale id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale ALTER COLUMN id SET DEFAULT nextval('public.sale_id_seq'::regclass);


--
-- TOC entry 3331 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.booking VALUES (2, 1, '2021-08-01 00:00:00+00', '2021-08-07 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (1, 1, '2021-07-27 00:00:00+00', '2021-07-31 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (3, 1, '2021-08-10 00:00:00+00', '2021-08-13 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (4, 1, '2021-08-15 00:00:00+00', '2021-08-18 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (5, 1, '2021-08-20 00:00:00+00', '2021-08-27 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (6, 1, '2021-08-28 00:00:00+00', '2021-09-03 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (7, 1, '2021-09-07 00:00:00+00', '2021-09-15 00:00:00+00', 8000, 0, 8000);
INSERT INTO public.booking VALUES (8, 1, '2021-09-17 00:00:00+00', '2021-09-18 00:00:00+00', 1000, 0, 1000);
INSERT INTO public.booking VALUES (9, 1, '2021-09-21 00:00:00+00', '2021-09-25 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (10, 1, '2021-09-26 00:00:00+00', '2021-09-28 00:00:00+00', 2000, 0, 2000);
INSERT INTO public.booking VALUES (11, 1, '2021-10-15 00:00:00+00', '2021-10-30 00:00:00+00', 15000, 10, 13500);
INSERT INTO public.booking VALUES (12, 1, '2021-11-02 00:00:00+00', '2021-11-09 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (73, 4, '2021-08-01 00:00:00+00', '2021-08-07 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (74, 4, '2021-07-27 00:00:00+00', '2021-07-31 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (75, 4, '2021-08-10 00:00:00+00', '2021-08-13 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (76, 4, '2021-08-15 00:00:00+00', '2021-08-18 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (77, 4, '2021-08-20 00:00:00+00', '2021-08-27 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (78, 4, '2021-08-28 00:00:00+00', '2021-09-03 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (79, 4, '2021-09-07 00:00:00+00', '2021-09-15 00:00:00+00', 8000, 0, 8000);
INSERT INTO public.booking VALUES (80, 4, '2021-09-17 00:00:00+00', '2021-09-18 00:00:00+00', 1000, 0, 1000);
INSERT INTO public.booking VALUES (81, 4, '2021-09-21 00:00:00+00', '2021-09-25 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (82, 4, '2021-09-26 00:00:00+00', '2021-09-28 00:00:00+00', 2000, 0, 2000);
INSERT INTO public.booking VALUES (83, 4, '2021-10-15 00:00:00+00', '2021-10-30 00:00:00+00', 15000, 10, 13500);
INSERT INTO public.booking VALUES (84, 4, '2021-11-02 00:00:00+00', '2021-11-09 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (49, 2, '2021-08-01 00:00:00+00', '2021-08-07 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (50, 2, '2021-07-27 00:00:00+00', '2021-07-31 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (51, 2, '2021-08-10 00:00:00+00', '2021-08-13 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (52, 2, '2021-08-15 00:00:00+00', '2021-08-18 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (53, 2, '2021-08-20 00:00:00+00', '2021-08-27 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (54, 2, '2021-08-28 00:00:00+00', '2021-09-03 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (55, 2, '2021-09-07 00:00:00+00', '2021-09-15 00:00:00+00', 8000, 0, 8000);
INSERT INTO public.booking VALUES (56, 2, '2021-09-17 00:00:00+00', '2021-09-18 00:00:00+00', 1000, 0, 1000);
INSERT INTO public.booking VALUES (57, 2, '2021-09-21 00:00:00+00', '2021-09-25 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (58, 2, '2021-09-26 00:00:00+00', '2021-09-28 00:00:00+00', 2000, 0, 2000);
INSERT INTO public.booking VALUES (59, 2, '2021-10-15 00:00:00+00', '2021-10-30 00:00:00+00', 15000, 10, 13500);
INSERT INTO public.booking VALUES (60, 2, '2021-11-02 00:00:00+00', '2021-11-09 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (61, 3, '2021-08-01 00:00:00+00', '2021-08-07 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (62, 3, '2021-07-27 00:00:00+00', '2021-07-31 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (63, 3, '2021-08-10 00:00:00+00', '2021-08-13 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (64, 3, '2021-08-15 00:00:00+00', '2021-08-18 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (65, 3, '2021-08-20 00:00:00+00', '2021-08-27 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (66, 3, '2021-08-28 00:00:00+00', '2021-09-03 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (67, 3, '2021-09-07 00:00:00+00', '2021-09-15 00:00:00+00', 8000, 0, 8000);
INSERT INTO public.booking VALUES (68, 3, '2021-09-17 00:00:00+00', '2021-09-18 00:00:00+00', 1000, 0, 1000);
INSERT INTO public.booking VALUES (69, 3, '2021-09-21 00:00:00+00', '2021-09-25 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (70, 3, '2021-09-26 00:00:00+00', '2021-09-28 00:00:00+00', 2000, 0, 2000);
INSERT INTO public.booking VALUES (71, 3, '2021-10-15 00:00:00+00', '2021-10-30 00:00:00+00', 15000, 10, 13500);
INSERT INTO public.booking VALUES (72, 3, '2021-11-02 00:00:00+00', '2021-11-09 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (85, 5, '2021-08-01 00:00:00+00', '2021-08-07 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (86, 5, '2021-07-27 00:00:00+00', '2021-07-31 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (87, 5, '2021-08-10 00:00:00+00', '2021-08-13 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (88, 5, '2021-08-15 00:00:00+00', '2021-08-18 00:00:00+00', 3000, 0, 3000);
INSERT INTO public.booking VALUES (89, 5, '2021-08-20 00:00:00+00', '2021-08-27 00:00:00+00', 7000, 0, 7000);
INSERT INTO public.booking VALUES (90, 5, '2021-08-28 00:00:00+00', '2021-09-03 00:00:00+00', 6000, 0, 6000);
INSERT INTO public.booking VALUES (91, 5, '2021-09-07 00:00:00+00', '2021-09-15 00:00:00+00', 8000, 0, 8000);
INSERT INTO public.booking VALUES (92, 5, '2021-09-17 00:00:00+00', '2021-09-18 00:00:00+00', 1000, 0, 1000);
INSERT INTO public.booking VALUES (93, 5, '2021-09-21 00:00:00+00', '2021-09-25 00:00:00+00', 4000, 0, 4000);
INSERT INTO public.booking VALUES (94, 5, '2021-09-26 00:00:00+00', '2021-09-28 00:00:00+00', 2000, 0, 2000);
INSERT INTO public.booking VALUES (95, 5, '2021-10-15 00:00:00+00', '2021-10-30 00:00:00+00', 15000, 10, 13500);
INSERT INTO public.booking VALUES (96, 5, '2021-11-02 00:00:00+00', '2021-11-09 00:00:00+00', 7000, 0, 7000);


--
-- TOC entry 3327 (class 0 OID 16385)
-- Dependencies: 210
-- Data for Name: hotel_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hotel_room VALUES (1, 'Номер 1', 1000);
INSERT INTO public.hotel_room VALUES (2, 'Номер 2', 1000);
INSERT INTO public.hotel_room VALUES (3, 'Номер 3', 1000);
INSERT INTO public.hotel_room VALUES (4, 'Номер 4', 1000);
INSERT INTO public.hotel_room VALUES (5, 'Номер 5', 1000);


--
-- TOC entry 3329 (class 0 OID 16392)
-- Dependencies: 212
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sale VALUES (1, 10, 10);
INSERT INTO public.sale VALUES (2, 20, 20);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 213
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.booking_id_seq', 96, true);


--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 209
-- Name: hotel_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_room_id_seq', 5, true);


--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 211
-- Name: sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sale_id_seq', 2, true);


--
-- TOC entry 3185 (class 2606 OID 16404)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- TOC entry 3181 (class 2606 OID 16390)
-- Name: hotel_room hotel_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel_room
    ADD CONSTRAINT hotel_room_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 16397)
-- Name: sale sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- TOC entry 3186 (class 2606 OID 16405)
-- Name: booking booking_hotel_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_hotel_room_id_fkey FOREIGN KEY (hotel_room_id) REFERENCES public.hotel_room(id);


-- Completed on 2021-11-16 11:39:06

--
-- PostgreSQL database dump complete
--

