--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-09-04 00:20:55

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
-- TOC entry 7 (class 2615 OID 16518)
-- Name: blogging; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA blogging;


ALTER SCHEMA blogging OWNER TO postgres;

--
-- TOC entry 4821 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA blogging; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA blogging IS 'blogging platform with tables for users, posts, and comments';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 16561)
-- Name: comments; Type: TABLE; Schema: blogging; Owner: postgres
--

CREATE TABLE blogging.comments (
    id integer NOT NULL,
    content text NOT NULL,
    post_id integer,
    user_name character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE blogging.comments OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16560)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: blogging; Owner: postgres
--

CREATE SEQUENCE blogging.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE blogging.comments_id_seq OWNER TO postgres;

--
-- TOC entry 4822 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: blogging; Owner: postgres
--

ALTER SEQUENCE blogging.comments_id_seq OWNED BY blogging.comments.id;


--
-- TOC entry 220 (class 1259 OID 16545)
-- Name: posts; Type: TABLE; Schema: blogging; Owner: postgres
--

CREATE TABLE blogging.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    context text NOT NULL,
    user_name character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE blogging.posts OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16544)
-- Name: posts_id_seq; Type: SEQUENCE; Schema: blogging; Owner: postgres
--

CREATE SEQUENCE blogging.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE blogging.posts_id_seq OWNER TO postgres;

--
-- TOC entry 4823 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: blogging; Owner: postgres
--

ALTER SEQUENCE blogging.posts_id_seq OWNED BY blogging.posts.id;


--
-- TOC entry 218 (class 1259 OID 16520)
-- Name: users; Type: TABLE; Schema: blogging; Owner: postgres
--

CREATE TABLE blogging.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE blogging.users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16519)
-- Name: users_id_seq; Type: SEQUENCE; Schema: blogging; Owner: postgres
--

CREATE SEQUENCE blogging.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE blogging.users_id_seq OWNER TO postgres;

--
-- TOC entry 4824 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: blogging; Owner: postgres
--

ALTER SEQUENCE blogging.users_id_seq OWNED BY blogging.users.id;


--
-- TOC entry 4651 (class 2604 OID 16564)
-- Name: comments id; Type: DEFAULT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.comments ALTER COLUMN id SET DEFAULT nextval('blogging.comments_id_seq'::regclass);


--
-- TOC entry 4648 (class 2604 OID 16548)
-- Name: posts id; Type: DEFAULT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.posts ALTER COLUMN id SET DEFAULT nextval('blogging.posts_id_seq'::regclass);


--
-- TOC entry 4646 (class 2604 OID 16523)
-- Name: users id; Type: DEFAULT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.users ALTER COLUMN id SET DEFAULT nextval('blogging.users_id_seq'::regclass);


--
-- TOC entry 4815 (class 0 OID 16561)
-- Dependencies: 222
-- Data for Name: comments; Type: TABLE DATA; Schema: blogging; Owner: postgres
--

COPY blogging.comments (id, content, post_id, user_name, created_at, updated_at) FROM stdin;
3	looks cool	1	some123	2024-09-04 00:03:22.851225	2024-09-04 00:03:22.851225
2	amazing!	1	some123	2024-09-04 00:06:05.444488	2024-09-04 00:06:05.444488
\.


--
-- TOC entry 4813 (class 0 OID 16545)
-- Dependencies: 220
-- Data for Name: posts; Type: TABLE DATA; Schema: blogging; Owner: postgres
--

COPY blogging.posts (id, title, context, user_name, created_at, updated_at) FROM stdin;
1	life at the beach	Im at the beach	some123	2024-09-03 23:58:10.439594	2024-09-03 23:58:10.439594
\.


--
-- TOC entry 4811 (class 0 OID 16520)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: blogging; Owner: postgres
--

COPY blogging.users (id, username, email, password, created_at) FROM stdin;
1	some123	something@gmail.com	testpassword	2024-09-03 23:57:01.630545
\.


--
-- TOC entry 4825 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: blogging; Owner: postgres
--

SELECT pg_catalog.setval('blogging.comments_id_seq', 3, true);


--
-- TOC entry 4826 (class 0 OID 0)
-- Dependencies: 219
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: blogging; Owner: postgres
--

SELECT pg_catalog.setval('blogging.posts_id_seq', 3, true);


--
-- TOC entry 4827 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: blogging; Owner: postgres
--

SELECT pg_catalog.setval('blogging.users_id_seq', 1, true);


--
-- TOC entry 4663 (class 2606 OID 16569)
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- TOC entry 4661 (class 2606 OID 16554)
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- TOC entry 4655 (class 2606 OID 16532)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4657 (class 2606 OID 16528)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4659 (class 2606 OID 16530)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4665 (class 2606 OID 16570)
-- Name: comments comments_post_id_fkey; Type: FK CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES blogging.posts(id) ON DELETE CASCADE;


--
-- TOC entry 4666 (class 2606 OID 16585)
-- Name: comments comments_user_name_fkey; Type: FK CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.comments
    ADD CONSTRAINT comments_user_name_fkey FOREIGN KEY (user_name) REFERENCES blogging.users(username) NOT VALID;


--
-- TOC entry 4664 (class 2606 OID 16580)
-- Name: posts posts_user_name_fkey; Type: FK CONSTRAINT; Schema: blogging; Owner: postgres
--

ALTER TABLE ONLY blogging.posts
    ADD CONSTRAINT posts_user_name_fkey FOREIGN KEY (user_name) REFERENCES blogging.users(username) NOT VALID;


-- Completed on 2024-09-04 00:20:56

--
-- PostgreSQL database dump complete
--

