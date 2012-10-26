--
-- PostgreSQL database dump
-- Default database: shiro_primefaces
-- Default Password: testpass
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;


--
-- Name: person; Type: TABLE; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    name character varying(120) NOT NULL,
    email character varying(200) NOT NULL,
    login character varying(16) NOT NULL,
    password character varying(92) NOT NULL
);


ALTER TABLE public.person OWNER TO shiro_primefaces;

--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: shiro_primefaces
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO shiro_primefaces;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiro_primefaces
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiro_primefaces
--

SELECT pg_catalog.setval('person_id_seq', 1, false);


--
-- Name: person_role; Type: TABLE; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

CREATE TABLE person_role (
    id integer NOT NULL,
    id_person integer,
    id_role integer
);


ALTER TABLE public.person_role OWNER TO shiro_primefaces;

--
-- Name: person_role_id_seq; Type: SEQUENCE; Schema: public; Owner: shiro_primefaces
--

CREATE SEQUENCE person_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_role_id_seq OWNER TO shiro_primefaces;

--
-- Name: person_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiro_primefaces
--

ALTER SEQUENCE person_role_id_seq OWNED BY person_role.id;


--
-- Name: person_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiro_primefaces
--

SELECT pg_catalog.setval('person_role_id_seq', 1, false);


--
-- Name: role; Type: TABLE; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.role OWNER TO shiro_primefaces;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: shiro_primefaces
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO shiro_primefaces;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shiro_primefaces
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shiro_primefaces
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: shiro_primefaces
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: shiro_primefaces
--

ALTER TABLE ONLY person_role ALTER COLUMN id SET DEFAULT nextval('person_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: shiro_primefaces
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: shiro_primefaces
-- Default password: 111
--

COPY person (id, name, email, login, password) FROM stdin;
1	Example User	user@example.org	user	$shiro1$SHA-256$500000$E26t9FVZJzhQi9kCS/yX+A==$cUBvP9rl8qb0NpyVZZizS9Q9A7Hoqaqu1vZ0pqdy2xk=
2	Example Admin	admin@example.org	admin	$shiro1$SHA-256$500000$E26t9FVZJzhQi9kCS/yX+A==$cUBvP9rl8qb0NpyVZZizS9Q9A7Hoqaqu1vZ0pqdy2xk=
\.


--
-- Data for Name: person_role; Type: TABLE DATA; Schema: public; Owner: shiro_primefaces
--

COPY person_role (id, id_person, id_role) FROM stdin;
1	1	2
2	2	1
3	2	2
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: shiro_primefaces
--

COPY role (id, name) FROM stdin;
1	admin
2	user
\.


--
-- Name: person_email_key; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_email_key UNIQUE (email);


--
-- Name: person_login_key; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_login_key UNIQUE (login);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_role_id_person_id_role_key; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_id_person_id_role_key UNIQUE (id_person, id_role);


--
-- Name: person_role_pkey; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: shiro_primefaces; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: person_role_id_person_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiro_primefaces
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_id_person_fkey FOREIGN KEY (id_person) REFERENCES person(id);


--
-- Name: person_role_id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shiro_primefaces
--

ALTER TABLE ONLY person_role
    ADD CONSTRAINT person_role_id_role_fkey FOREIGN KEY (id_role) REFERENCES role(id);
