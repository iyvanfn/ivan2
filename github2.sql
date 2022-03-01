--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: marking_sample; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA marking_sample;


ALTER SCHEMA marking_sample OWNER TO postgres;

--
-- Name: fill_marks(); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.fill_marks()
    LANGUAGE plpgsql
    AS $$
   DECLARE
       i INTEGER;
       j INTEGER;
   BEGIN
       FOR i IN (SELECT id FROM exam) LOOP
           j = 1*random()*(5-1);
           INSERT INTO mark (id , exam, stud, res)
               SELECT nextval('mark_id'), i, id,
               2 + random() * (5-2) FROM student WHERE random() < 0.10;
       END LOOP;
   END;
$$;


ALTER PROCEDURE public.fill_marks() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: discipline; Type: TABLE; Schema: marking_sample; Owner: postgres
--

CREATE TABLE marking_sample.discipline (
    id integer NOT NULL,
    descr character varying(50)
);


ALTER TABLE marking_sample.discipline OWNER TO postgres;

--
-- Name: exam; Type: TABLE; Schema: marking_sample; Owner: postgres
--

CREATE TABLE marking_sample.exam (
    id integer NOT NULL,
    discip integer,
    ts timestamp without time zone
);


ALTER TABLE marking_sample.exam OWNER TO postgres;

--
-- Name: mark; Type: TABLE; Schema: marking_sample; Owner: postgres
--

CREATE TABLE marking_sample.mark (
    id integer NOT NULL,
    exam integer,
    stud integer,
    res integer
);


ALTER TABLE marking_sample.mark OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: marking_sample; Owner: postgres
--

CREATE TABLE marking_sample.student (
    id integer NOT NULL,
    first character varying(50),
    last character varying(50),
    sex character(1)
);


ALTER TABLE marking_sample.student OWNER TO postgres;

--
-- Name: discip_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.discip_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discip_id OWNER TO postgres;

--
-- Name: discipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.discipline (
    id integer NOT NULL,
    descr character varying(50)
);


ALTER TABLE public.discipline OWNER TO postgres;

--
-- Name: exam; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam (
    id integer NOT NULL,
    discip integer,
    ts timestamp without time zone
);


ALTER TABLE public.exam OWNER TO postgres;

--
-- Name: exam_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exam_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exam_id OWNER TO postgres;

--
-- Name: exam_marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exam_marks (
    descr character varying,
    res integer,
    ts timestamp without time zone
);


ALTER TABLE public.exam_marks OWNER TO postgres;

--
-- Name: mark; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mark (
    id integer NOT NULL,
    exam integer,
    stud integer,
    res integer
);


ALTER TABLE public.mark OWNER TO postgres;

--
-- Name: mark_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mark_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mark_id OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    id integer NOT NULL,
    first character varying(50),
    last character varying(50),
    sex character(1)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Data for Name: discipline; Type: TABLE DATA; Schema: marking_sample; Owner: postgres
--

COPY marking_sample.discipline (id, descr) FROM stdin;
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: marking_sample; Owner: postgres
--

COPY marking_sample.exam (id, discip, ts) FROM stdin;
\.


--
-- Data for Name: mark; Type: TABLE DATA; Schema: marking_sample; Owner: postgres
--

COPY marking_sample.mark (id, exam, stud, res) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: marking_sample; Owner: postgres
--

COPY marking_sample.student (id, first, last, sex) FROM stdin;
1	Tuan	Mario	M
2	Kiersten	Rayford	F
3	Jolyn	Elisha	F
4	Nadine	Perry	F
5	Nena	Kelley	F
6	Caitlin	Johnathan	F
7	Santos	Elton	F
8	Venus	Alec	F
9	Octavio	Charley	M
10	Flor	Carl	F
11	Rogelio	Franklyn	M
12	Rolando	Fletcher	M
13	Blanch	Leslie	F
14	Elvie	Wilber	F
15	Bobette	Lawrence	F
16	Mikaela	Chuck	F
17	Christian	Wyatt	M
18	Ellan	Truman	F
19	Eleonor	Kelley	F
20	Goldie	Heath	F
21	Simonne	Diego	F
22	Willy	Merlin	M
23	Olene	Carrol	F
24	Walker	Scottie	M
25	Lupe	Duane	F
26	Bryon	Basil	M
27	In	Burl	F
28	Morton	Yong	M
29	Alena	Gerardo	F
30	Hans	Carrol	M
31	Mitchell	Zane	M
32	Cira	Max	F
33	Elmo	Rayford	M
34	Jospeh	Giovanni	M
35	Jonas	Lazaro	M
36	Lucien	Benito	M
37	Augustine	Melvin	M
38	Craig	Xavier	M
39	Wava	Quincy	F
40	Jess	Wilfred	M
41	Roscoe	Matthew	M
42	Ralph	Steve	M
43	Juan	Chase	M
44	Katharyn	Edwardo	F
45	Saul	Edison	M
46	Delmar	Clifford	M
47	Devin	Joesph	M
48	Leonel	Hilario	M
49	Suellen	Chase	F
50	Margert	Augustine	F
51	Modesto	Anibal	M
52	Russ	Scot	M
53	Jose	Scot	M
54	Laure	Jules	F
55	Felipe	Kevin	M
56	Claudio	Leonard	M
57	Shanta	Douglass	F
58	Joel	Rosendo	F
59	Junko	Conrad	F
60	Hoa	Arnoldo	F
61	Kim	Cory	M
62	Darryl	Jerome	M
63	Heather	Lawerence	F
64	Josette	Lewis	F
65	Paulette	Johnie	F
66	Milagro	Steve	F
67	Dalton	Jarvis	M
68	Rickey	Wendell	M
69	Florencio	Will	M
70	Cathrine	Derek	F
71	Jestine	Marquis	F
72	Micki	Mariano	F
73	Percy	Dick	M
74	Reiko	Aaron	F
75	Adolfo	Ismael	M
76	Jarred	Jarrod	M
77	Harrison	Napoleon	M
78	Margarito	Vern	M
79	Jonah	Herb	M
80	Colin	Anderson	M
81	Christian	Ross	F
82	Normand	Jed	M
83	Tiffani	Tyrell	F
84	Donna	Alton	F
85	Luana	James	F
86	Nannie	Alfonso	F
87	Celinda	Rex	F
88	Wallace	Mason	M
89	Kirstin	Jamal	F
90	Coleman	Ruben	M
91	Wilbur	Rubin	M
92	Jamel	Kieth	M
93	Claud	Brendon	M
94	Galen	Nelson	M
95	Elli	Benito	F
96	Rickey	Jacob	M
97	Keith	Wilson	F
98	Roderick	Jason	M
99	Delmer	Jeffrey	M
100	Bronwyn	Jimmy	F
\.


--
-- Data for Name: discipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.discipline (id, descr) FROM stdin;
\.


--
-- Data for Name: exam; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam (id, discip, ts) FROM stdin;
\.


--
-- Data for Name: exam_marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exam_marks (descr, res, ts) FROM stdin;
\.


--
-- Data for Name: mark; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mark (id, exam, stud, res) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (id, first, last, sex) FROM stdin;
\.


--
-- Name: discip_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.discip_id', 5, true);


--
-- Name: exam_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exam_id', 20, true);


--
-- Name: mark_id; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mark_id', 1, false);


--
-- Name: discipline discipline_pkey; Type: CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id);


--
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- Name: mark mark_pkey; Type: CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.mark
    ADD CONSTRAINT mark_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: discipline discipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.discipline
    ADD CONSTRAINT discipline_pkey PRIMARY KEY (id);


--
-- Name: exam exam_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exam
    ADD CONSTRAINT exam_pkey PRIMARY KEY (id);


--
-- Name: mark mark_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mark
    ADD CONSTRAINT mark_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: mark_ix_1; Type: INDEX; Schema: marking_sample; Owner: postgres
--

CREATE UNIQUE INDEX mark_ix_1 ON marking_sample.mark USING btree (exam, stud);


--
-- Name: exam discipline_exam; Type: FK CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.exam
    ADD CONSTRAINT discipline_exam FOREIGN KEY (discip) REFERENCES marking_sample.discipline(id);


--
-- Name: mark exam_mark; Type: FK CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.mark
    ADD CONSTRAINT exam_mark FOREIGN KEY (exam) REFERENCES marking_sample.exam(id);


--
-- Name: mark student_mark; Type: FK CONSTRAINT; Schema: marking_sample; Owner: postgres
--

ALTER TABLE ONLY marking_sample.mark
    ADD CONSTRAINT student_mark FOREIGN KEY (stud) REFERENCES marking_sample.student(id);


--
-- PostgreSQL database dump complete
--

