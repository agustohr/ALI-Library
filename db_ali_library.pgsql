--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: enum_Borrows_borrow_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Borrows_borrow_status" AS ENUM (
    'booking',
    'borrowed',
    'completed',
    'canceled'
);


ALTER TYPE public."enum_Borrows_borrow_status" OWNER TO postgres;

--
-- Name: enum_Items_items_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Items_items_status" AS ENUM (
    'available',
    'notavailable'
);


ALTER TYPE public."enum_Items_items_status" OWNER TO postgres;

--
-- Name: enum_Users_status_users; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."enum_Users_status_users" AS ENUM (
    'active',
    'notactive'
);


ALTER TYPE public."enum_Users_status_users" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Alerts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Alerts" (
    id integer NOT NULL,
    "receiverName" character varying(255),
    "senderId" character varying(255),
    "senderName" character varying(255),
    id_item character varying(255),
    title character varying(255),
    text character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Alerts" OWNER TO postgres;

--
-- Name: Alerts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Alerts_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Alerts_id_seq" OWNER TO postgres;

--
-- Name: Alerts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Alerts_id_seq" OWNED BY public."Alerts".id;


--
-- Name: Authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Authors" (
    id integer NOT NULL,
    author character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Authors" OWNER TO postgres;

--
-- Name: Authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Authors_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Authors_id_seq" OWNER TO postgres;

--
-- Name: Authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Authors_id_seq" OWNED BY public."Authors".id;


--
-- Name: Borrows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Borrows" (
    id integer NOT NULL,
    id_borrow character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    user_name character varying(255) NOT NULL,
    item_id character varying(255) NOT NULL,
    item_title character varying(255) NOT NULL,
    code character varying(255),
    request_date date,
    booking_admin_id character varying(255),
    booking_date date,
    borrow_admin_id character varying(255),
    borrow_date date,
    return_admin_id character varying(255),
    return_date date,
    cancel_admin_id character varying(255),
    cancel_date date,
    due_date date,
    borrow_status character varying(255) DEFAULT 'request'::character varying,
    request_extend_date date,
    action_extend_admin_id character varying(255),
    action_extend_date date,
    extend_due_date date,
    extend_status character varying(255),
    return_status character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Borrows" OWNER TO postgres;

--
-- Name: Borrows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Borrows_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Borrows_id_seq" OWNER TO postgres;

--
-- Name: Borrows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Borrows_id_seq" OWNED BY public."Borrows".id;


--
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    id integer NOT NULL,
    "categoryID" character varying(255),
    "categoryName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Categories_id_seq" OWNER TO postgres;

--
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;


--
-- Name: Items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Items" (
    id integer NOT NULL,
    id_item character varying(255) NOT NULL,
    image character varying(255),
    location character varying(255),
    type character varying(255),
    category character varying(255),
    title character varying(255),
    author character varying(255),
    publisher character varying(255),
    sinopsis text,
    pages integer,
    language character varying(255),
    quantity integer,
    available_quantity integer,
    items_status public."enum_Items_items_status" DEFAULT 'available'::public."enum_Items_items_status",
    entry_date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Items" OWNER TO postgres;

--
-- Name: Items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Items_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Items_id_seq" OWNER TO postgres;

--
-- Name: Items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Items_id_seq" OWNED BY public."Items".id;


--
-- Name: Publishers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Publishers" (
    id integer NOT NULL,
    publisher character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Publishers" OWNER TO postgres;

--
-- Name: Publishers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Publishers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Publishers_id_seq" OWNER TO postgres;

--
-- Name: Publishers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Publishers_id_seq" OWNED BY public."Publishers".id;


--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: Shelves; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shelves" (
    id integer NOT NULL,
    "shelfName" character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Shelves" OWNER TO postgres;

--
-- Name: Shelves_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Shelves_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Shelves_id_seq" OWNER TO postgres;

--
-- Name: Shelves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Shelves_id_seq" OWNED BY public."Shelves".id;


--
-- Name: Users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Users" (
    id integer NOT NULL,
    id_pegawai character varying(255) NOT NULL,
    nama character varying(255),
    password character varying(255),
    jabatan character varying(255),
    no_hp character varying(255),
    email character varying(255),
    gender character varying(255),
    role character varying(255),
    ration integer DEFAULT 2,
    "isVerified" boolean DEFAULT false,
    status_users public."enum_Users_status_users" DEFAULT 'active'::public."enum_Users_status_users",
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Users" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Users_id_seq" OWNER TO postgres;

--
-- Name: Users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_id_seq" OWNED BY public."Users".id;


--
-- Name: Alerts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alerts" ALTER COLUMN id SET DEFAULT nextval('public."Alerts_id_seq"'::regclass);


--
-- Name: Authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Authors" ALTER COLUMN id SET DEFAULT nextval('public."Authors_id_seq"'::regclass);


--
-- Name: Borrows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows" ALTER COLUMN id SET DEFAULT nextval('public."Borrows_id_seq"'::regclass);


--
-- Name: Categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);


--
-- Name: Items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Items" ALTER COLUMN id SET DEFAULT nextval('public."Items_id_seq"'::regclass);


--
-- Name: Publishers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Publishers" ALTER COLUMN id SET DEFAULT nextval('public."Publishers_id_seq"'::regclass);


--
-- Name: Shelves id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shelves" ALTER COLUMN id SET DEFAULT nextval('public."Shelves_id_seq"'::regclass);


--
-- Name: Users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users" ALTER COLUMN id SET DEFAULT nextval('public."Users_id_seq"'::regclass);


--
-- Data for Name: Alerts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Alerts" (id, "receiverName", "senderId", "senderName", id_item, title, text, "createdAt", "updatedAt") FROM stdin;
1	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Booking	2022-08-05 21:43:23.631+07	2022-08-05 21:43:23.631+07
2	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Booking Approved	2022-08-05 21:44:10.715+07	2022-08-05 21:44:10.715+07
3	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Booking	2022-08-05 21:49:34.007+07	2022-08-05 21:49:34.007+07
4	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Booking Approved	2022-08-05 21:49:40.705+07	2022-08-05 21:49:40.705+07
5	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Extend	2022-08-05 21:51:43.426+07	2022-08-05 21:51:43.426+07
6	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Extend Approved	2022-08-05 21:51:52.803+07	2022-08-05 21:51:52.803+07
7	Admin	IT_01	Agusto	MTK_1	perkalian	Request Booking	2022-08-06 20:31:54.117+07	2022-08-06 20:31:54.117+07
8	Agusto	Admin_1	Admin	MTK_1	perkalian	Request Booking Approved	2022-08-06 20:43:15.227+07	2022-08-06 20:43:15.227+07
9	Admin	IT_01	Agusto	Doc_1	Penggunaan Mesin	Request Booking	2022-08-07 01:55:26.959+07	2022-08-07 01:55:26.959+07
10	Agusto	Admin_1	Admin	Doc_1	Penggunaan Mesin	Request Booking Approved	2022-08-07 02:01:26.216+07	2022-08-07 02:01:26.216+07
11	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Booking	2022-08-08 08:07:16.028+07	2022-08-08 08:07:16.028+07
12	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Booking Approved	2022-08-08 08:08:51.369+07	2022-08-08 08:08:51.369+07
13	Admin	IT_01	Agusto	12345	Data Science	Request Booking	2022-08-08 17:00:56.892+07	2022-08-08 17:00:56.892+07
14	Agusto	Admin_1	Admin	12345	Data Science	Request Booking Approved	2022-08-08 17:01:08.025+07	2022-08-08 17:01:08.025+07
15	Admin	IT_01	Agusto	12345	Data Science	Request Booking	2022-08-08 19:30:49.664+07	2022-08-08 19:30:49.664+07
16	Agusto	Admin_1	Admin	12345	Data Science	Request Booking Approved	2022-08-08 19:31:03.09+07	2022-08-08 19:31:03.09+07
17	Admin	IT_01	Agusto	12345	Data Science	Request Extend	2022-08-08 19:37:34.87+07	2022-08-08 19:37:34.87+07
18	Agusto	Admin_1	Admin	12345	Data Science	Request Extend Approved	2022-08-08 19:38:59.909+07	2022-08-08 19:38:59.909+07
19	Admin	IT_01	Agusto	Doc_1	Penggunaan Mesin	Request Booking	2022-08-08 19:41:12.324+07	2022-08-08 19:41:12.324+07
20	Admin	IT_01	Agusto	MTK_1	perkalian	Request Booking	2022-08-08 20:15:28.636+07	2022-08-08 20:15:28.636+07
21	Agusto	Admin_1	Admin	MTK_1	perkalian	Request Booking Approved	2022-08-08 20:17:02.291+07	2022-08-08 20:17:02.291+07
22	Agusto	Admin_1	Admin	Doc_1	Penggunaan Mesin	Request Booking Approved	2022-08-08 20:17:10.675+07	2022-08-08 20:17:10.675+07
23	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Booking	2022-08-08 20:34:45.779+07	2022-08-08 20:34:45.779+07
24	Admin	IT_01	Agusto	12345	Data Science	Request Booking	2022-08-09 08:44:20.798+07	2022-08-09 08:44:20.798+07
25	Agusto	Admin_1	Admin	12345	Data Science	Request Booking Approved	2022-08-09 08:49:07.548+07	2022-08-09 08:49:07.548+07
26	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Booking	2022-08-09 08:59:40.656+07	2022-08-09 08:59:40.656+07
27	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Booking Approved	2022-08-09 09:00:32.471+07	2022-08-09 09:00:32.471+07
28	Admin	IT_01	Agusto	Doc_1	Penggunaan Mesin	Request Booking	2022-08-09 09:01:12.471+07	2022-08-09 09:01:12.471+07
29	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Booking Approved	2022-08-09 09:01:26.183+07	2022-08-09 09:01:26.183+07
30	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Booking	2022-08-09 09:02:11.741+07	2022-08-09 09:02:11.741+07
31	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Booking Approved	2022-08-09 09:02:31.246+07	2022-08-09 09:02:31.246+07
32	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Booking	2022-08-10 09:14:30.691+07	2022-08-10 09:14:30.691+07
33	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Booking Approved	2022-08-10 09:14:48.332+07	2022-08-10 09:14:48.332+07
34	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Extend	2022-08-10 09:18:21.858+07	2022-08-10 09:18:21.858+07
35	Agusto	Admin_1	Admin	Doc_1	Penggunaan Mesin	Request Booking Approved	2022-08-11 09:37:12.648+07	2022-08-11 09:37:12.648+07
36	Admin	IT_01	Agusto	MTK_2	Algoritma Struktur Data	Request Booking	2022-08-11 10:22:02.459+07	2022-08-11 10:22:02.459+07
37	Agusto	Admin_1	Admin	MTK_2	Algoritma Struktur Data	Request Booking Approved	2022-08-11 16:28:02.163+07	2022-08-11 16:28:02.163+07
38	Admin	IT_01	Agusto	MTK_2	Algoritma Struktur Data	Request Booking	2022-08-11 16:29:02.861+07	2022-08-11 16:29:02.861+07
39	Admin	IT_01	Agusto	12345	Data Science	Request Booking	2022-08-11 16:36:33.735+07	2022-08-11 16:36:33.735+07
40	Agusto	Admin_1	Admin	MTK_2	Algoritma Struktur Data	Request Booking Approved	2022-08-11 16:37:06.2+07	2022-08-11 16:37:06.2+07
41	Agusto	Admin_1	Admin	12345	Data Science	Request Booking Approved	2022-08-11 16:39:00.464+07	2022-08-11 16:39:00.464+07
42	Admin	IT_01	Agusto	FIS_01	Hukum OHM	Request Booking	2022-08-11 16:42:38.859+07	2022-08-11 16:42:38.859+07
43	Agusto	Admin_1	Admin	FIS_01	Hukum OHM	Request Booking Approved	2022-08-11 16:42:49.681+07	2022-08-11 16:42:49.681+07
44	Admin	IT_01	Agusto	MTK_2	Algoritma Struktur Data	Request Booking	2022-08-11 16:47:27.867+07	2022-08-11 16:47:27.867+07
45	Agusto	Admin_1	Admin	MTK_2	Algoritma Struktur Data	Request Booking Approved	2022-08-11 16:47:37.358+07	2022-08-11 16:47:37.358+07
46	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Booking	2022-08-12 16:17:04.374+07	2022-08-12 16:17:04.374+07
47	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Booking Approved	2022-08-12 16:17:47.963+07	2022-08-12 16:17:47.963+07
48	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Extend	2022-08-12 16:19:11.85+07	2022-08-12 16:19:11.85+07
49	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Extend Approved	2022-08-12 16:24:07.85+07	2022-08-12 16:24:07.85+07
50	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Booking	2022-08-13 09:32:32.982+07	2022-08-13 09:32:32.982+07
51	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Booking Approved	2022-08-13 09:39:11.196+07	2022-08-13 09:39:11.196+07
52	Admin	IT_01	Agusto	IF_01	Pemrograman Web	Request Extend	2022-08-13 09:45:52.165+07	2022-08-13 09:45:52.165+07
53	Agusto	Admin_1	Admin	IF_01	Pemrograman Web	Request Extend Approved	2022-08-13 09:46:19.813+07	2022-08-13 09:46:19.813+07
\.


--
-- Data for Name: Authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Authors" (id, author, "createdAt", "updatedAt") FROM stdin;
1	A. A. Hattangadi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
2	A. Boore	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
3	A. Dale Timpe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
5	A.P Cowie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
6	A.Van Diepen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
8	ABB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
9	Abdul Haris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
12	Achsan Permas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
14	Adi Kusrianto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
15	Adi Soenarno	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
18	Adrian Gostick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
19	Adrian Vickers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
20	Aeration Industries International	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
22	Agricultural Biotechnology Institute	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
23	Ahlstrom Machinery	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
24	Ahlstrom Pumps	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
25	Ahmad Antoni IKM	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
26	Ahmad Tohari	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
27	Ahmad Yani	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
28	Aime Heene	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
29	Air Academy Associates	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
30	Ajar Permono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
32	Al Jaehn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
33	Alan C. Bovik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
35	Alan K. Macnair	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
36	Alan M. Stevens	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
37	Alan Muhlemann	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
38	Alan Mumford	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
40	Alan Wilson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
41	Alastair Reynolds	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
44	Alberthiene Endah	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
45	Albin F. Turbak	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
46	Aldus Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
47	Alessandro Baricco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
48	Alex Gofman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
49	Alexander Monroe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
50	Alexandra Ripley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
51	Alfred H. Jaehn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
52	Alice K. Sylvester	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
53	Allan M. Springer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
55	Allen Lawrence H	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
56	Allen-Bradley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
58	American Water Works Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
59	Amir M.S	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
60	Amir Tengku Ramly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
63	Andre Moller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
65	Andrea Hirata	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
66	Andreas Haryono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
67	Andrew D. Eaton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
68	Andrew Goliszek	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
69	Andrew J. Sherman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
70	Andrew Jones	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
71	Andrew K.Jones	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
74	Andrie Wongso	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
75	Andrzej Klimowski	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
76	Andy Rathbone	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
77	Ann Marie Ryan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
78	Ann Paludan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
80	Anne Davidson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
81	Anne weisberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
82	Annellen Simpkins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
83	Anne-Marie Grey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
85	Anthony Dio Martin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
86	Anthony Kenny	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
87	Anthony L. Kohan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
88	Anthony M. Grant	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
89	Anthony Robbins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
90	Anton Chekhov	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
91	Anugerah Pekerti	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
92	APPITA	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
93	Ariane Archambault	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
95	Aris Ananta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
96	Armando Corripio	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
97	Arnd Goebel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
98	Arnold E. Greenberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
99	Aromaa Jari	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
100	Arpi Marzuki	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
101	Arswendo Atmowiloto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
102	Art Kleiner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
104	Arthur H. Tuthill P.E.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
105	Arthur P. Fraas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
106	Arthur S. Diamond	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
108	Ary Ginanjar Agustian	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
109	Asian Agri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
110	Asian Institute of Technology	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
111	Asian Paper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
112	ASME PTC	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
113	Asosiasi Mikoriza Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
114	Asosiasi Penelitian Perkebunan Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
115	Asosiasi Pengusaha Hutan Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
117	Ati Cahayani S.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
118	Atmadji Sumarkidjo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
119	ATPK	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
121	Audrey E. Bloom	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
122	Australian Stainless Steel Development Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
123	Azizon Nurza	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
124	B. Jonsson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
125	B. Kronberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
126	B. Lindman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
127	B.K. Agrawal	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
128	B.W. Wenclawiak	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
129	Back Ernst L	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
130	Bambang Bujono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
131	Bambang Harsrinuksmo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
132	Bambang Rudito	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
133	BAPEDAL	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
134	BAPETEN	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
135	Barbara Davison	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
136	Barbara Kellerman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
137	Barbara Y. Martin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
138	Bard Wingfield	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
139	Barron's	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
140	Barry H. Kantowitz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
141	Barry Z. Posner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
142	Baskara T. Wardaya SJ	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
144	BE & H	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
145	Beatrice Hohenegger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
146	BELL	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
148	Bengt Karlof	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
149	Bern. Hidayat	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
150	Bernd H. Schmitt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
151	Bertrand Russell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
152	Beryl Heather	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
153	Bill Bliss	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
154	Bill Bryson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
155	Bill Capodagli	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
156	Bill Jenks	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
157	Bill Lane	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
158	Bill Sinclair	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
159	Billy Arcement	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
160	Bissada Management Simulations	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
161	Bjorn Andersen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
162	BLOUNT	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
163	Bob Frare	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
165	Bob Nelson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
166	Bobbi DePorter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
167	Bonnie Burn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
168	Bradford D. Smart	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
169	Bradley W. Hall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
170	Bramantyo Djohanputro	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
171	BRAMBLES	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
172	Brian Burns	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
173	Brian E. Becker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
174	Brian Hayes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
175	Brian Herbert	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
177	Bruce E. Meserve	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
180	Bruce Williams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
181	Bryan J. Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
182	BTG	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
183	Budi Gunawan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
185	Budiman, SH.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
186	Budiono Mismail	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
187	Burt Nanus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
188	C. Alexander Simpkins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
189	C. Ward Armstrong	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
190	C.C. Lee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
191	C.K. Prahalad	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
192	C.Klingensmith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
193	C.P. Leslie Grady	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
194	C.S. Lewis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
195	Cambridge University	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
197	CARAKA BUMI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
198	Carl de Zeeuw	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
199	Carl G. Liungman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
200	Carl W. Stern	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
201	Carlos A. Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
203	Carol Kinsey Goman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
204	Carol Taylor Fitz-Gibbon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
205	Carrier Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
207	Cary Cherniss	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
210	Cathleen benko	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
213	Central Gippsland Institute	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
214	CFPIM	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
215	Chairman Emeritus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
216	Chambers B., Tomlinson E. J.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
217	Chang Wai Ming	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
218	Chappy Hakim	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
219	Charles C. Heald	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
220	Charles D. Elis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
221	Charles H, Benjamin B	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
222	Charles H. Green	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
223	Charles J Margerison	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
224	Charles Ketteman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
225	Charles Mitchell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
227	Charles R. Greer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
228	Charles T. Horngren	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
229	Charlotte Roberts	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
230	Chen Guidi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
231	Cherry Hadibroto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
232	Chester Elton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
233	Chi Tien	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
234	China International Press	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
235	Chip Conley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
238	Chow-Hou Wee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
240	Chris Chapman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
241	Chris Lowney	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
242	Christoph Wachter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
243	Christopher	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
244	Christopher Bayly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
245	Christopher G. Worley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
246	Christopher J. Biermann	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
247	Christopher Kul-Want	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
248	Chrysanti Hasibuan-Sedyono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
249	Ciqa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
250	Clair N. Sawyer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
251	Claire Reinelt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
254	Clifford W. Randall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
255	Clotaire Rapaille	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
256	Coin Security International	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
257	Colin Frayne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
258	Colin Hastings	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
259	Compaq Computer Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
260	Congress	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
261	Corel Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
262	Corinna Horrigan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
263	Craig Gygi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
264	Cummins - Onan Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
265	Cummins Engine Company	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
266	Currie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
267	Cynthia D. McCauley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
269	D. Carl Yackel, P.E.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
272	Daigger Glen T.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
273	Daizo Kunii	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
274	Dale Carnegie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
276	Dan Brown	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
277	Dan Eklund	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
278	Dan Roam	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
279	Dana Gaines Robinson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
280	Daniel Goleman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
281	Daniel Griffin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
283	Daniel R. McCarville	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
284	Daniel T.Jones	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
286	Dard Hunter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
287	Darmadi Darmawangsa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
288	Dave Ulrich	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
289	David A. Garvin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
290	David A. Welch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
291	David Allen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
292	David B. Prowse	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
293	David Bycina	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
294	David C. Bennett	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
295	David C. Thomas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
296	David Clutterbuck	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
297	David Doyle	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
298	David Ellyard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
299	David Freemantle	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
300	David G. Collings	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
301	David G. Elmes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
302	David J. Reibstein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
304	David K. Hatch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
305	David L. Dotlich	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
306	David L. Freyberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
307	David Lane	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
308	David Meier	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
309	David Murray	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
310	David Osborne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
311	David P. Norton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
312	David R. Caruso	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
313	David R. Karsa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
314	David R. Roisum	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
315	David Samuel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
316	David Simchi-Levi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
317	David Stensel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
318	Dayacipta Primamuda	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
319	De La Jonquiere	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
320	Deborah Ancona	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
321	Deborah D. Tobey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
322	Deborah L. Rhode	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
324	Denis Brian	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
326	Dennis Lock	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
327	Denzil Rankine	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
328	Departemen Kehutanan dan Perkebunan RI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
329	Departemen Perindustrian Republik Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
330	Departemen Tenaga Kerja R.I	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
331	Departement Kehutanan RI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
332	DEPARTEMENT of LABOUR-NEW ZEALAND	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
333	Development Dimensions International-(DDI)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
334	Dewi Lestari	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
335	Dewi Motik Pramono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
336	Dhanny R. Cyssco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
337	Diana Twede	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
338	Diane Elliott-Lee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
339	Dianne R. Stober	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
340	Didiek Wiriady	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
341	Didin Hafidhuddin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
342	Diesen Magnus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
343	Dimitri Moraitis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
344	Dimitris S. Argyropoulos	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
346	Dirk Ritthaler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
351	Djoko Suprapto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
352	Djokosantoso Moeljono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
353	Dobrivoje Popovic	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
355	DOD'5000	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
356	Dodi Ahmad Fauzi S.Sos	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
358	Don Tapping	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
359	Don W. Green	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
360	Don WS.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
362	Donald F. Curda	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
363	Donald L. Kirkpatrick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
364	Donald M. West	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
365	Donald N. Sull	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
366	Donald Sampson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
368	Donald V. McCain	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
370	Doris M. Sims	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
371	Dorothy Jongeward	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
372	Dorothy M. Stewart	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
373	Douglas A. Skoog	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
374	Douglas C. Montgomery	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
375	Douglas M. Lambert	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
376	Douglas McGregor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
378	Dragan Z. Milosevic	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
379	Drea Zigarmi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
380	Dru Scott,	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
381	Duane Black	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
382	Duane Jones	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
384	Durametallic Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
385	Dwi Prabaningtyas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
387	E.W Malcolm	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
388	Eamon Kilduff-Swagelok	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
391	Edith Simchi-Levi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
392	Eduard Depari	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
393	Edward E. Lawler III	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
396	Edward J. Amrein, Jr.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
397	Edward Scannell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
398	Edward T. Hall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
399	Eero Sjostrom	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
400	Eiji Yoshikawa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
403	Electrical Apparatus Service Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
404	Eli Dalumpines	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
405	Elizabeth Breuilly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
407	Elizabeth J. Altman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
408	Elizabeth Kostova	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
409	Elizabeth Prichard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
410	Ellen Van Velsor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
411	Elton T. Krogel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
412	Elwood F. Holton III	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
413	Elyas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
414	Engineering Services Industry Training Division	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
415	Eni Kusuma	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
416	Enin Supriyanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
417	Environmental Engineering ITB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
418	Eric Berne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
419	Erich - Dieter Krause	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
420	Erich J. Schulz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
422	Erika Andersen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
423	Erlin Trisyulianti	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
425	Ernest L. Hall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
426	Ernie J. Zelinski	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
427	ESAB AB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
428	Etienne Wenger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
429	Eugene W. Rice	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
430	Eugenia Liliawati Muljono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
431	Eva Wong	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
433	F. Antonius Alijoyo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
434	F. Clayton Snyder	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
435	F.J Callahan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
436	F.X. Oerip S. Poerwopoespito	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
437	F.X. Tulusharyono, M.M	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
438	FAG Group	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
439	Fahrudin Faiz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
440	Fairfield Language Technologies	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
441	Fakultas Kehutanan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
442	FAO Forestry Paper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
443	Farah Ferdiany Natasapradja	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
445	Feliatra	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
446	Ferdinand Tesoro	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
447	Ferry W.Atmadi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
448	Festo Didactic	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
449	FESTOdidactic	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
450	Fiyanti Osman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
451	FLSmiljo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
452	FMG Timberjack	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
453	Fogelholm Carl-Johan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
454	Forestry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
455	Forestry Commission Tasmania	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
456	Forestry Suppliers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
458	Fortune s	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
459	Frances Hesselbein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
460	Francis Group	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
461	Frank J. Riley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
462	Frank M. Corrado	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
463	Frank M. Gryna.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
464	Frank M. Tenore	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
465	Frank N. Kemmer,	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
466	Frank Off	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
468	Frans Gunterus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
469	Frans Poels	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
470	Freada Kapor Klein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
471	Fred Evangelisti	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
472	Fred Kerr	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
474	Fumio Gotoh	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
475	Fung Yu - Lan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
476	G. Kateman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
478	G.A. Smook	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
480	Gareth Jones	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
481	Gareth Lewis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
482	Garlock Pty.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
483	Garrett P. R.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
484	Gary A. Smook	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
485	Gary Gagliardi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
486	Gary Hamel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
487	Gary Kroehnert	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
489	Gary Yukl	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
490	Gaurav Sharma	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
491	Gede Prama	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
492	Gedsiri Suhartono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
493	Geert Hofstede	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
494	Gene Crozier	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
495	Gene F. Parkin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
496	Geoff Reiss	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
497	Geoffrey G. Meredith et	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
498	George D. Haddow	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
499	George Orwell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
500	George Roth	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
501	George Tchobanoglous	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
502	George-Emil Baiulescu	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
504	Gerhard Plenert	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
507	Glen T. Daigger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
509	Gloria E. Bader	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
510	Goei Siauw Hong	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
511	Gopal C. Goyal	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
512	Gordon B. Davis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
515	GPS Technologies	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
516	Grace L. Duffy	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
517	Graham Stedman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
518	Grama Bazita	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
519	Gregory K. McMillan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
520	Greig Larcombe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
521	Gullichsen Johan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
522	Gunardi Endro	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
523	Gunnar Bergman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
524	Gunnar Lindblad	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
525	Gunther Drager	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
526	Gus Lee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
527	Guy M. Merritt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
529	H. Scott Fogler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
530	H.A. Richardson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
531	H.A. Simons	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
532	H.C. Van Ness	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
533	H.M. Widmer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
534	Hadi Setia Tunggal	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
535	Hakan Karlsson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
536	Handito Hadi Joewono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
537	Hannu Paulapuro	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
538	Hans-Georg Gadamer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
539	Hari Wahyudi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
541	Harold Richardson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
542	HarperCollins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
543	Harry Alder	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
544	Harry C. Katz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
545	Harvard Business School Publishing Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
546	Harvey K. Brelin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
547	Hasanuddin Z. Abidin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
548	Hassan Shadily	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
549	Hassan Y. Aboul-Enein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
550	Heinz P. Bloch, P.E.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
551	Heinzpeter Klein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
552	Helen De Cieri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
553	Helen Murlis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
554	Hellmut Wilhelm	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
555	Hendri Tanjung	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
556	Hendrik Bresman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
558	Henry C. Lim	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
559	Henry L. Roediger III	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
560	Henry Mintzberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
561	Herbert G. Heneman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
562	Herbert Holik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
563	Herbert Sixta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
564	Harmanto Edy Djatmiko	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
565	Hewlett Packard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
566	Himawan Soetanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
567	Hirotaka Takeuchi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
569	Hoenig	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
571	Holger Rathgeber	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
572	Honghi Tran	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
573	Horst Keller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
574	Howard Gardner,	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
575	Howard Moskowitz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
576	Howard Raiffa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
577	Hubert K. Rampersad	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
578	Hugh Bucknall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
579	Hugh Scullion	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
580	Hunt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
581	Hunton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
582	Huriawati Hartanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
583	Hynninen Pertti	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
585	Iain Ewing	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
586	ial staff of recycled paper news	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
587	Ian McDermott	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
588	IBM Business Consulting Service	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
590	Ibrahim Amini	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
591	IDCON Inc	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
592	Igor J. Karassik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
593	IkujiroNonaka	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
594	Ilie Gabriel Wantah	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
595	Imam Heryanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
596	Imam Munadhi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
597	Iman Soepomo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
599	Indonesian Quality Management Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
600	Infokom Elektrindo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
601	Inixindo - Jakarta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
602	Inland Company	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
603	Institut Pendidikan dan Pembinaan Manajemen (PPM)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
604	Institute of Paper Science & Technology	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
605	Intan Paramaditha	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
606	Integrated Project Systems (IPS) Asia, Europe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
607	Interforest AB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
608	International Conference Centre, South Africa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
609	International Convention Centre, Durban	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
610	International Tropical Timber Organization (ITTO)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
611	INTISARI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
612	Ira S. Krull	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
613	Isao Nakauchi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
614	iSDM, Certification & Training Center	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
615	Ismail Prabu - WTC Jakarta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
616	ISO - International Org. for Standardization	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
617	ITTO: International Tropical Timber Organization	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
620	J. David Viale	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
621	J. Donald Walters	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
622	J. Edward Russo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
623	J.D. Parker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
624	J.H. Jansen Company	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
625	J.H. Rapar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
627	J.K. Rowling	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
628	J.L. Heilbron	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
629	J.M. Juran	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
630	J.M. Mermet	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
631	J.M. Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
632	J.R.R. Tolkien	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
633	Jaakko Pory	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
634	Jac Fitz-enz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
635	Jack C. Richards	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
636	Jack Canfield	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
638	Jack G. Walters	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
639	Jack Gido	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
641	Jack Tootson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
642	Jack Welch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
643	Jackie Hill	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
644	Jacob A.Moulijin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
646	James A. Quinlan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
647	James Bradford Terrell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
649	James C. Robinson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
650	James D. Kirkpatrick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
652	James E. Berry, P.E	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
653	James F. Bolt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
655	James H. French	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
656	James Holler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
657	James I. Taylor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
658	James L. Barnard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
659	James L. Noel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
660	James L. Taylor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
661	James Legge	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
662	James M. Kouzes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
663	James N. Miller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
665	James R. Stock	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
666	Jamesh Creelman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
667	Jamesh P.Womack	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
669	Jan C. Walter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
670	Gert Jan Gronewold	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
671	Jan Slater	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
672	Jancee Dunn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
673	Jane A. Bullock	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
674	Jane Ballback	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
675	Jane C. Miller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
677	Janet Switzer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
678	Janice Berry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
679	Jansen H. Sinamo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
680	Jared L. Bleak	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
681	Jawahara Saidullah	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
683	Jay Ramsay	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
684	Jaynie L. Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
685	JB Kristanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
686	Jean Cunningham	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
688	Jean Wipperman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
689	Jean-Claude Corbeil	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
690	Jean-Claude Usunier	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
691	Jeffrey A. Krames	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
692	Jeffrey D. Kimno	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
693	Jeffrey Edmund Curry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
694	Jeffrey Hadler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
695	Jeffrey K. Liker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
696	Jeffrey P. Wincel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
697	Jenkins David	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
698	Jennifer W. Martineau	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
700	Jerome Want	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
701	Jerry I. Porras	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
702	JET-A-MARK	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
705	Jim Asplund	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
706	Jim Collins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
707	Jim Fuller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
708	Jim Steffen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
709	Jo Owen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
710	Joan V. Gallos	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
712	Jochen Wirtz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
713	Joe Knight	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
715	Joenil Kahar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
717	John A. Byrne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
719	John C. Redding	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
720	John C. Russ	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
721	John Case	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
722	John Clemons	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
723	John Connolly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
724	John D. Houck	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
725	John D. Pell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
726	John E. Bauer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
727	John E. Sussams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
728	John Foley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
729	John Grisham	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
730	John H. Fleming	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
731	John H. McGlynn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
732	John H. Zenger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
735	John Kenkel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
736	John Kotter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
737	John Lackie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
739	John M. Morris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
740	John M.Echols	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
741	John Maeda	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
743	John Naisbitt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
744	John Naughton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
745	John Newstrom	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
746	John Oakland	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
747	John P. Kotter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
749	John R. Alwi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
750	John S. Hammond	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
751	John Sandford	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
752	John W. Boudreau	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
753	John Wiley & Sons Limited	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
754	John Yokoyama	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
755	Jon Ingham	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
756	Jon Krakauer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
757	Jon R. Katzenbach	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
758	Jonathan Winterton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
760	Jorge A. Vasconcellos e Sa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
761	Joseph A. Maciariello	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
762	Joseph A. Michelli	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
763	Joseph B. Franzini	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
764	Joseph Folkman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
765	Joseph K. Berry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
766	Joseph L. Badaracco, Jr.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
767	Joseph L. Bower	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
769	Joseph O'Connor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
770	Joseph P. Messina	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
772	Joseph V. Sinfield	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
773	Josh Bersin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
775	Julia Sloan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
777	Julie Kendrick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
778	K. Adi Gunawan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
779	K. Holmberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
780	K. Rajendran	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
781	K.K.Choon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
782	Karen Berman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
783	Karen Edwards	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
784	Karl Albrecht	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
785	Karl F. Wenger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
786	Karl Heinz Koch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
787	Karla C. Shippey, J.D	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
788	Karlin Sloan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
789	Karlsson M	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
790	Karlstad University	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
791	Katherine A.Kulas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
792	Katherine Wagner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
793	Kaye Thorne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
794	Kee-Hyun Shin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
795	Keith Humphrey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
796	Keith Lockyer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
797	Keith Wilson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
798		2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
799	Kelly M. Hannum	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
800	Kementerian Lingkungan Hidup	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
801	Ken Blanchard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
802	Ken Sutherland	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
803	Kenneth Blanchard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
806	Kenneth R. Beebe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
807	Kerr Inkson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
808	Kerry Larkan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
809	Ketut Sendra	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
810	Kevin J. Anderson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
811	Kevin J. Hipolit	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
812	Keying Ye	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
813	Kholis Romli	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
814	Khoo Kheng Hor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
815	Kim Skildum-Reid	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
816	Kimberly Allers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
817	Kimberly S. Davenport	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
818	Kirk D. Zylstra	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
819	Kirk Polking	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
820	Kjell Andersson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
821	Kjell B. Zandin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
822	Kjell Stribolt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
823	Klarin Anja	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
824	Klaus D. Timmerhaus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
826	Knut-Erik Persson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
827	Komatsu	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
828	Konfrensi Nasional Produksi Bersih	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
829	Kongres Kehutanan Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
830	Kristiina Iisa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
831	Kumala Insiwi Suryo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
833	KVAERNER	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
834	L. Buydens	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
835	L.H. Pranoto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
836	L.T. Wan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
837	La Commision Scolaire	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
839	Laura Tyson Li	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
840	Laurence D. Ackerman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
842	Laurie A. Trotman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
843	Lawrence K. Wang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
844	LDI Training	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
845	Learning Solutions Driving Results	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
846	Lee Child	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
847	Lee J. Colan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
848	Lee Poh Onn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
849	Lee Smolin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
850	Lehtinen Esa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
851		2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
852	Lembaga Ekolable Indonesia (LEI)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
853	Lembaga Manajemen PPM	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
854	Lenore S. Clesceri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
855	Leon Martel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
856	Leonard Berkowitz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
858	Leonard Mlodinow	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
860	Lerbin R. Aritonang R.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
862	Leslie Rae	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
863	Levlin Jan-Erik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
864	Lewis Perdue	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
865	Lilik Agung	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
866	Lilik R. Nurcholisho	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
867	Lilik Sudiajeng	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
868	Linda Elder	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
869	Linda Warner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
870	Lindley R. Higgins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
871	Lindsey Pollak	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
872	Lisa Custer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
873	Lisa Hoecklin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
874	Lisa M. Ellram	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
875	Lloyd C. Finch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
876	LOCTITE	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
877	Lois J. Zacbary	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
878	Loizos Heracleous	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
879	Lorraine Daniels	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
881	Louis Bloomfield	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
883	Lucas-Nulle (LN)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
884	Lydia Braakman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
885	lyell P. Jennings	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
886	Lyle M. Spencer, Jr	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
888	Lynn Jackson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
889	Lynn Lyons Morris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
890	M Nihat Gurmen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
891	M. J. Kocurek	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
892	M. Koch, E. Hadjicostas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
893	M. Otto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
895	M. Valcarcel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
896	M.A.S. Joe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
897	M.G. Hartiti Hendarto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
898	M.J. Kocurek	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
899	M.M. Abbott	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
900	M.N. Md Yusuff	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
901	M.Nashihin Hasan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
902	MacMillan Bloedel Limited Power River Division	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
903	Maggi Payment	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
904	MAGNA Industrial Co.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
905	Mahendra Doshe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
906	Mahmoud M. El-Halwagi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
907	Maintenance Department	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
908	Malcolm Gladwell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
909	Malcolm S. Knowles	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
910	Malcolm Tight	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
911	Management Development International (MDI)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
913	Marc Cerasini	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
915	Marcia Hughes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
916	Marco Miagostovich	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
917	Marcus Banner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
918	MarcusEvans	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
919	Marga T.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
920	Margaret A. Fennessey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
921	Margaret Cheney	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
922	Margaret Dale	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
923	Margaret Glade Agusta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
924	Margaret Mitchell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
926	Marianne Minor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
927	Mario Linkies	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
928	Mario Puzo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
929	Mario Teguh	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
930	Marjorie Pressley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
931	Mark A. Huselid	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
932	Mark Allen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
933	Mark Bomer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
934	Mark Davies	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
935	Mark E. Davis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
936	Mark Herndon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
938	Mark J. Kiemele	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
940	Mark Lipton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
941	Mark Miller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
942	Mark Sanborn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
943	Mark W. Johnson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
945	Marlene E. Henerson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
946	Marlene Tabalujan Setiyadi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
947	Marshall J. Cook	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
948	Martha Mendoza	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
949	Martha Sears	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
950	Martin Lindstorm	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
952	Martin Palmer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
953	Marty Brounstein	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
954	Mary Beth Seasholtz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
956	Masaaki Imai	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
957	Masaaki Sato	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
958	Masaji Tajiri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
959	MATERIAL FABRICATION Square & Rectangular Ducting	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
960	Matthew E. May	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
961	Matthew E. Niedzwiecki	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
963	Matthew Kelly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
964	Matthias Otto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
965	Max S. Peters	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
966	Max Sutherland	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
967	Mayon Soetrisno	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
968	Maysville	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
969	MCP-GB Management Consultants	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
971	Melissa Giovagnoli	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
972	Melissa Marschke	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
973	METAL FABRICATION Lobsterback Bend & Cylindrical	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
974	Metcalf, Eddy	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
975	Metso	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
976	Mettler TOLEDO,	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
977	Michael A. Boles	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
978	Michael A. Johnson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
979	Michael Armstrong	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
980	Michael Bremer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
982	Michael Connelly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
984	Michael Dulworth	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
985	Michael E. Porter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
986	Michael E. Swartz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
987	Michael Foucault	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
988	Michael Geddes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
990	Michael J. Kocurek	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
991	Michael K. Chotiner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
992	Michael Kouris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
993	Michael Levine	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
994	Michael Maccoby	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
996	Michael McGrath	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
997	Michael Port	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
998	Michael R. LeGault	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
999	Michael S. Deiler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1000	Michael Thompson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1001	Michael Watkins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1003	Michael Zwell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1004	Michel Crouhy	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1005	Michiel Makkee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1006	Microsoft Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1007	Mike Bryon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1008	Mike Leat	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1010	Mike Morwood	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1011	Mike Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1012	Mikko Hupa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1014	Milagros Guindel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1015	Milledge A. Hart	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1016	Millwright	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1017	Mind Resources	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1018	Ming-Jer Chen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1019	Minister of Environment	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1020	Ministry of Education Schools Department	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1021	Mitsuboshi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1022	Moh. Alex Hadjid	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1024	Mohamed Zairi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1026	Mohammad H. Moradi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1028	Morey Stettner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1029	Morisco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1030	MSA International	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1031	Muda Markus	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1033	Murdifin Haming	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1034	Muriel James	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1035	Murray Dalziel, Jackie Hill	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1036	Murray R. Barrick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1038	Nancy J. Sell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1040	Napoleon Hill	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1041	Naresh Makhijani	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1042	National Association of Corrosion Engineers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1043	National Metal and Engineering Curriculum	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1044	National System of Restricted Electrical Licences	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1045	Neal Thornberry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1046	Neil DeCarlo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1047	Neil T. Bendle	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1048	Neimo Leo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1050	Niccolo Machiavelli's	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1052	Nicholas P. Cheremisionff	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1053	Nick Boulter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1054	Nicola Graimes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1055	Nicole Richie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1056	Nigel Farrow	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1057	Nigel Hunt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1059	Niskanen Kaarlo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1060	Nitin Pangarkar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1061	NLK Consultants	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1064	Norman C. Pereira	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1065	Norman Lofts	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1066	Norman Vincent Peale	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1067	Norman Walker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1068	Nur Basuki Rachmanto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1069	Nyoman S. Pendit	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1070	Odin Westgaard	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1071	Office Professional Institute-(OPI)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1072	Oittinen Pirkko	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1073	Okakura Kakuzo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1077	ORACLE	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1078	Osborn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1079	Oscar Aguirre	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1080	Oscar Motuloh	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1082	OTI - Organisasi Transformasi International	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1083	Otto V. Ingruber	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1084	OXFORD University Press	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1085	P. Roper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1086	P.T.Bin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1087	Pahala Nainggolan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1089	Pall Industrial Hydraulics Company	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1090	Pall Industrial Hydraulics Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1091	Pam Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1093	Pan Pacific Conference	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1094	Panshin A.J	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1095	Paris D.N. Svoronos	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1097	Patricia Zigarmi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1098	Patrick Forsyth	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1099	Patrick Lencioni	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1100	Patti Hathaway	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1101	Paul Cooper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1102	Paul D Tomlingson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1103	Paul D. Q. Campbell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1104	Paul F. Murphy	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1106	Paul Halpern	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1108	Paul J.H. Schoemaker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1109	Paul Kline	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1110	Paul Lunde	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1111	Paul N. Cheremisinoff	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1112	Paul R. Niven	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1113	Paul Strebel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1114	Paul W. Farris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1115	Paul Wesson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1117	Paulus Bambang WS	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1119	PEC-Tech	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1121	Peg Carlson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1122	Pemerintah Republik Indonesia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1123	Pengembangan Industri Selulosa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1124	Penny Van Oosterzee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1126	Perry L. McCarty	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1127	Peter C. Cairo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1129	Peter F. Drucker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1130	Peter Fisk	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1131	Peter J. Dowling	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1132	Peter M. Ramstad	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1133	Peter M. Senge	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1134	Peter Pipe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1135	Peter S. Pande	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1136	Peter Salovey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1138	Peter Sence	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1139	Peter Sheal	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1140	Philip A Vale	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1141	Philip Ball	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1142	Philip Chew Kheng Hoe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1143	Philip Kaminsky	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1144	Philip R. Harris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1145	Phillip C. McGraw	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1146	Phillip E. Pfeifer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1148	Pierre Labrousse	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1149	Pilgrim	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1150	PQM	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1152	Pradyot Patnaik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1153	Pramod K. Bajpai	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1154	Pramoedya Ananta Toer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1155	Pratima Bajpai	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1156	Praveen Gupta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1157	Preston G. Smit	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1158	Price Pritchett	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1159	Productivity & Quality Management Consultants	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1160	Productivity Press	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1161	Departemen Tenaga Kerja RI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1162	PT. Berca Niaga Medika	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1163	PT. Inti Indorayon Utama Porsea	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1164	PT. Inti Indrayon Utama Porsea	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1165	PT. Patria Utama Humanindo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1167	PT. Pradnya Paramita - Jakarta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1168	PT. Riau Andalan Pulp & Paper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1169	PT. Saputro Multitama Internusa	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1171	PT. United Tractors	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1172	Pungki Purnadi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1174	Purdi E. Chandra	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1175	Purwanto Dipl	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1176	Pusat Penelitian Sumberdaya Hayati & Biotek. IPB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1177	Pusat Produksi Bersih Nasional (PPBN)	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1178	Pusat Studi Lingkungan Hidup UGM & KLH	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1179	Putu Wijaya	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1180	Quality Council of Indiana	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1181	Quality Management Consultant	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1182	R. A. Higgins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1186	R. H. Wiwoho,	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1187	R. Keith Mobley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1188	R. Kellner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1189	R. Lawn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1190	R. Rhodes Trussell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1191	R. Walker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1192	R.A. Randy Nixon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1193	R.H. Wardman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1194	R.M. Christie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1195	R.R. Mather	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1197	Raja Bambang Sutikno	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1198	Rakhmad Subiyono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1199	Ralph Christensen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1200	Ralph Edney	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1201	Ralph L. Keeney	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1202	Ralph M. Barnes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1203	Ralph T. Buscarello	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1204	Raluca-Loana Stefan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1205	Ram Charan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1206	Ramelan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1207	Ramses Y. Hutahaean	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1208	RAND - WHITNEY	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1209	Randy J. Pell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1210	Randy Nixon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1211	Rao V Dukkipati	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1212	Ray A. Leask	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1213	Ray K. Linsley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1214	Raymond H. Myers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1216	Rebecca L. Morgan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1217	RECOFTC Kasetsart University	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1218	Redaksi Sinar Grafika	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1220	Refratechnik GmbH	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1222	Reliability Centre, Inc.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1223	Renee Mauborgne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1224	The Embassy of Findland	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1225	Research & Education Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1227	Rich Schiesser	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1228	Richard A. Reese	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1229	Richard A. Swanson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1230	Richard B. Ross	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1232	Richard C. Woolfson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1233	Richard E. Lawn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1234	Richard E. Petty	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1235	Richard F. Gerson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1236	Richard G. Brereton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1238	Richard J. Schonberger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1239	Richard J. Spangenberg	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1240	Richard Koch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1241	Richard L. MacInnes	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1242	Richard L. Shell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1244	Richard McDermott	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1245	Richard Michael G.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1246	Richard Osborne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1247	Richard P. Pohanish	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1248	Richard Restak, M.D	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1249	Richard Ross	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1251	Richard Strozzi - Heckler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1252	Richard W. Beatty	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1253	Richard W. James	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1254	Richard W. Paul	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1255	Richard Wilhelm	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1256	Richard Y. Chang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1257	Richardus Eko Indrajit	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1258	Rick Brinkman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1260	Rick Kirschner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1262	Riyanto Wujarso	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1263	RMIT	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1264	Rob Goffee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1265	Rob Yeung	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1266	Robert A. Corbitt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1268	Robert Bacal	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1269	Robert Bruner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1270	Robert E. Franken	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1271	Robert E. Lefton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1272	Robert Edenborough	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1273	Robert F. Mager	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1274	Robert G. Launsby	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1275	Robert H. Perry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1276	Robert Heller	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1277	Robert Hiebeler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1278	Robert J. Davis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1280	Robert L. Craig	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1281	Robert Lorber	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1282	Robert M. Fulmer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1283	Robert M. March	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1284	Robert Mark	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1287	Robert S. Kaplan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1288	Robert Simons	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1290	Robert T. Moran	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1291	Robert T. Paynter	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1293	Robert W. Bly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1294	Robert W. Hagemeyer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1295	Robert W. Lucas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1296	Robert W. Wendover	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1297	Robert Winston	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1298	Robert Wood	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1299	Robert Wright	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1300	Robin Bentley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1301	Robin Hobb	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1302	Robin Kessler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1303	Robin Smith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1305	Robrt F. Mager	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1307	Roger Cowe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1308	Roger Martin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1309	Roger Schwarz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1310	Roland Fischer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1312	Romeo H. Gecolea	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1313	Ron Ashkenas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1314	Ronald E. Walpole	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1315	Ronald F. Walker	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1316	Ronald J. Berdine	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1317	Ronald L. Bonewitz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1319	Ronny Kountur, D.M.S	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1320	Rosemarie Simon - Barwinkel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1321	Routledge Taylor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1322	Roy Christman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1323	RTTCO	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1324	Rudi Fajar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1325	Rudi Suardi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1326	Rudy Gunawan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1327	Russ Hall	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1328	Russell H. Fazio	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1329	Russell T. Westcott	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1330	Ruth L. Henoch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1331	Ruth Winterton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1332	RYLSON GROUP	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1333	S. Burke	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1334	S. Eko Widyatmoko	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1335	S.R Majumdar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1336	Saarelma Hannu	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1337	Saat A. Rahman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1339	SAIT	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1340	Salim Basalamah	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1341	Salomo Sitohang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1344	SanDisk Corporation	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1346	Sandra N. Twitchell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1347	Sandvik	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1348	Sandwell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1349	Sarah Allan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1351	Sarah V. Moran	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1352	Sascha Kruger	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1353	Savolainen Antti	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1355	Scandinavian Pulp, Paper & Board Testing Committee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1356	Scermerhorn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1357	Schmidgall-Tellings	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1358	school of Computer Graphics	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1359	Scott D. Anthony	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1361	Seminar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1362	Seventh Workshop	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1363	Sharon Crawford	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1364	Sharon L. Myers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1365	Shawn Currie	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1366	Sheila W. Furjanic	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1367	Shirley Fletcher	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1368	Shirley Taylor	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1370	Shundar Lin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1371	Sidney A. Morris	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1372	Sidney Sheldon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1373	SIEMENS	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1374	Signe M. Spencer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1375	Simon Sebag Montefiore	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1376	SISINDOKOM Education Center	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1377	Siswanto Sutojo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1378	SKF Group	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1379		2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1381	Soewito Santoso	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1382	Solichul HA. Bakri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1383	Spencer Johnson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1384	Spirax Sarco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1385	Sri Hendarto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1386	Standards Association of Australia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1387	Stanley A. Greene	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1388	Stanley M. Shinners	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1389	Stanley R. Crouch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1390	Stanley Yokell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1391	Stenius Per	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1392	Stephan A. Butscher	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1394	Stephen H. Rhinesmith	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1395	Stephen Hawking	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1396	Stephen J. Dubner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1397	Stephen L. Pearce	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1398	Stephen P. Fusco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1399	Stephen P. Robbins	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1400	Stephen R. Covey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1401	Stephen R. Schmidt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1402	Stephen W. Hawking	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1403	Stephen Ward	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1404	Steve Benton	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1405	Steve Chandler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1406	Steve Hamm	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1407	Steve Kerr	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1408	Steven D. Levitt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1409	Steven F. Hayward	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1410	Steven J. Molinsky	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1411	Steven Reiss	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1412	Stewart Emery	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1413	STFI	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1414	Sue Brioux Aldcorn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1415	Sue Mckinney	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1416	Sue O'Connell	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1418	Suharto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1419	Suhendi Suaeb	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1420	Su-Hua Wu	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1421	Sujit Banerjee	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1423	Sundholm Jan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1424	Susan D. Schubert	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1425	Susan E. M Selke	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1427	Sutikno Pandoyo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1428	Suyono M. Mar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1429	Suzanne Charle	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1430	Suzanne Turner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1431	Suzy Welch	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1432	Sveriges Skogsindustriforbund	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1434	SAEFL	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1435	Syahmuharnis, Harry Sidharta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1436	Syaiful F. Prihadi	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1437	T.A. Tatag Utomo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1438	T.M Grace	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1440	T.W.R. Dean	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1441	Tabrani Rab	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1442	TAFE	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1443	Takashi Osada	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1445	TAPPI PRESS	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1446	Tarwaka	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1447	Task Group Chairman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1448	Tatsu Chisaki	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1450	Taufan Hidyat	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1451	Ted Gaebler	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1452	Terrance E. Conners	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1453	Terry Dickey	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1454	Terry N.Adams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1455	Terry Wireman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1456	Th. Ninung Pandan Nurani	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1457	The American Society of Mechanical Engineers	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1458	The Economist	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1459	The Finnish Paper Engineer's Association	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1460	The Indonesia Business Links	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1461	The Indonesian Ecolabelling Institute	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1462	Japan Institute of Plant Maintenance	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1463	THE PITA WORKING GROUP	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1464	The Productivity Press Development Team	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1465	The Southern African Institute of Forestry	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1466	The Torrington Company	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1467	Thomas A. Fabrizio	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1468	Thomas A. Kochan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1469	Thomas B. Kelly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1470	Thomas Bezigian	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1471	Thomas Cleary	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1473	Thomas Furst	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1474	Thomas H. Cook	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1475	Thomas J. Bruno	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1476	Thomas L. Abrams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1477	Thomas M. Grace	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1478	Thomas McCarty	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1479	Thomas Schroder	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1480	Thorp Benjamin A	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1481	Threes Emir	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1482	Tim Clissold	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1483	Tim Gioe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1484	Tim Harper	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1485	Tim Hindle	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1486	Tim Hurson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1487	Tim Lintas Media	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1488	Tim Payne	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1490	Timberjack	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1491	Timothy A. Judge	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1492	Timothy J. Galpin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1494	Timothy N. Gioe	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1496	Tina Biswas	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1497	Tissue World Asia	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1499	Tom Butler-Bowdon	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1501	Tom Kendrick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1502	Tom Lindstrom	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1503	Tom Reilly	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1504	Tony Fang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1505	Torolf Laxen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1508	TPC Training Systems	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1509	TPC Training Sysytem	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1510	Tracey Keys	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1511	Tri Yuswijayanto Zaenuri	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1512	Triono Saputro	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1513	Tsai Chih Chung	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1514	Tulis Sutan Sati	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1516	Tyler G. Hicks, PE	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1517	U.S Environmental Protection Agency	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1518	Ulli Hoffmann	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1519	Umberto Eco	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1520	UN Resident Coordinator	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1521	UNDP Resident Representative	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1522	University of California Berkeley	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1523	UPPDRAGS AB	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1524	V. Barwick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1525	V.Van Der Watt	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1526	valmet	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1527	VARIAN	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1528	VESSELS and VALVES	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1529	Vickers-Incorporated	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1530	Victor R. Buzzotta	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1531	Victor Turoski	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1532	Victor Wowk	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1533	Vijay Govindarajan - Chris Trimble	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1534	Vijay P. Bhatkar	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1536	Vincent Gaspersz	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1537	Vincent Koh	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1538	W. Chan Kim	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1539	W. Colebrook Cooling	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1540	W. Howard Rapson	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1541	W. Richard Plunkett	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1542	Wade Parks, Jerry Kahn	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1543	Wahana Komputer	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1544	Walter E. Vieira	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1545	Walter F. Reynolds	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1546	Walter L. Williams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1547	Warren Bennis	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1549	Wayne Brockbank	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1550	Wayne Outlaw	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1551	Wendell Odom	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1552	Wendy Abraham	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1553	Wendy Briner	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1554	Wendy Jago	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1555	Werner Hertleif	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1556	Wiliam M. Snyder	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1557	Wiliam S. Cohen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1558	William B. Martin	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1560	William D. Callister, Jr.	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1561	William E. Rothschild	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1564	William G. Corboy, Jr. PE	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1565	William G. Flanagan	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1567	William S. Levine	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1568	William Sears	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1569	William Ury	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1570	Williams	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1571	Williams Learning Network	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1572	Wilson Arafat	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1574	With Bill Breen	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1575	Wm.James Frederick	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1577	Woodinville, WA	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1578	Wu Chuntao	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1579	Wulfram I. Ervianto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1580	Wyndell Kirkland P.E	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1581	Y Suhartono	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1582	Y.B. Suharto	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1583	Yadong Luo	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1584	Yasuhiro Monden	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1585	Yolanda M. Siagian	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1586	Yong Wang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1587	Youssef F. BISSADA	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1588	Yung-Tse Hung	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1589	Yuni Jie On	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1590	Yuniko Deviana MM	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1591	Yunus A. Cengel	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1593	Zheng Wei	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1594	Zhou Wang	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1595	Zygmunt Bauman	2009-07-24 19:30:41.753+07	2009-07-24 19:30:41.753+07
1596	Dan Galai	2009-07-27 15:27:57.187+07	2009-07-27 15:27:57.187+07
1597	Rob Johnston	2009-07-27 14:28:13.447+07	2009-07-27 14:28:13.447+07
1598	Ariesandi Setyono	2009-08-20 09:17:42.333+07	2009-08-20 09:17:42.333+07
1599	Anne Bruce	2009-08-20 09:17:25.627+07	2009-08-20 09:17:25.627+07
1600	Fathuddin	2009-08-20 09:17:14.317+07	2009-08-20 09:17:14.317+07
1601	Clifford Gray	2009-08-20 09:17:02.533+07	2009-08-20 09:17:02.533+07
1602	Erik Lardson	2009-08-20 09:16:51.52+07	2009-08-20 09:16:51.52+07
1603	Donald B. Brewster	2009-08-20 09:16:35.313+07	2009-08-20 09:16:35.313+07
1604	Mikko Jokio	2009-08-20 09:16:05.86+07	2009-08-20 09:16:05.86+07
1605	Stora Enso Oyj	2009-08-20 09:16:20.987+07	2009-08-20 09:16:20.987+07
1606	Adi W. Gunawan	2009-08-20 09:38:17.677+07	2009-08-20 09:38:17.677+07
1607	Peter Cheese	2009-09-01 09:44:13.933+07	2009-09-01 09:44:13.933+07
1608	Robert J. Thomas	2009-09-01 09:44:23.233+07	2009-09-01 09:44:23.233+07
1609	Elizabeth Craig	2009-09-01 09:44:31.217+07	2009-09-01 09:44:31.217+07
1610	A. Suryana	2009-09-01 09:44:41.31+07	2009-09-01 09:44:41.31+07
1611	Ben W. Heineman	2009-09-01 09:44:49.03+07	2009-09-01 09:44:49.03+07
1612	Gess Jerome M	2009-09-01 10:57:50.64+07	2009-09-01 10:57:50.64+07
1613	Wilson Paul H	2009-09-01 10:57:59.75+07	2009-09-01 10:57:59.75+07
1614	William E. Scott	2009-09-01 10:58:07.877+07	2009-09-01 10:58:07.877+07
1615	Eddie Davis	2009-09-01 11:53:08.18+07	2009-09-01 11:53:08.18+07
1616	Claire Weekes	2009-09-01 11:53:29.79+07	2009-09-01 11:53:29.79+07
1617	Pakarinen Heikki	2009-09-03 14:25:58.357+07	2009-09-03 14:25:58.357+07
1618	Gottsching Lothar 	2009-09-03 14:26:39.293+07	2009-09-03 14:26:39.293+07
1619	Vikie L. Milazzo	2009-09-08 10:38:46.487+07	2009-09-08 10:38:46.487+07
1620	John Grisham	2009-09-08 10:50:39.187+07	2009-09-08 10:50:39.187+07
1621	Britta Stengl	2009-09-08 14:06:56.053+07	2009-09-08 14:06:56.053+07
1622	Reinhard Ematinger	2009-09-08 14:07:13.383+07	2009-09-08 14:07:13.383+07
1623	Kenneth E. Bannister	2009-09-08 14:40:59.11+07	2009-09-08 14:40:59.11+07
1624	John Heider	2009-09-10 10:35:17.203+07	2009-09-10 10:35:17.203+07
1625	Bob Messing	2009-09-10 10:35:26.907+07	2009-09-10 10:35:26.907+07
1626	Kevin J. Hipolit 	2009-09-14 10:16:57.3+07	2009-09-14 10:16:57.3+07
1627	Parlindungan Marpaung	2009-09-14 13:57:13.637+07	2009-09-14 13:57:13.637+07
1628	Cameron Hunt	2009-09-14 13:58:13.323+07	2009-09-14 13:58:13.323+07
1629	Chris Brenton	2009-09-14 13:58:23.357+07	2009-09-14 13:58:23.357+07
1630	David J. Schwartz	2009-09-14 13:59:32.59+07	2009-09-14 13:59:32.59+07
1631	Gwidon W. Stachowiak	2009-09-14 14:00:14.03+07	2009-09-14 14:00:14.03+07
1632	Andrew W. Batchelor	2009-09-14 14:00:44.497+07	2009-09-14 14:00:44.497+07
1633	Akwasi A. Boateng	2009-09-14 15:41:48.443+07	2009-09-14 15:41:48.443+07
1634	Joseph Roussel	2009-09-14 15:43:05.1+07	2009-09-14 15:43:05.1+07
1635	Shoshanah Cohen	2009-09-14 15:43:21.82+07	2009-09-14 15:43:21.82+07
1636	Ibnul Qoyyim Al-Jauzi	2009-09-14 15:44:18.773+07	2009-09-14 15:44:18.773+07
1637	John C. Maxwell	2009-09-15 10:13:00.84+07	2009-09-15 10:13:00.84+07
1638	Douglas W. Reeve	2009-09-15 15:28:46.58+07	2009-09-15 15:28:46.58+07
1639	Carlton W. Dence	2009-09-15 15:29:22.173+07	2009-09-15 15:29:22.173+07
1640	Michael Maginn	2009-09-16 09:03:48.173+07	2009-09-16 09:03:48.173+07
1641	Albert Paul Malvino	2009-09-16 09:48:26.677+07	2009-09-16 09:48:26.677+07
1642	Geoffrey G. Meredith	2009-09-16 10:01:17.927+07	2009-09-16 10:01:17.927+07
1643	Alan Deutschman	2009-09-16 11:43:30.293+07	2009-09-16 11:43:30.293+07
1644	Djoko Pramono	2009-09-16 13:52:55.707+07	2009-09-16 13:52:55.707+07
1645	Michael M. Lombardo 	2009-09-17 08:32:19.373+07	2009-09-17 08:32:19.373+07
1646	Robert W. Echinger	2009-09-17 08:38:39.677+07	2009-09-17 08:38:39.677+07
1647	Robert P.Green	2009-09-17 10:05:49.34+07	2009-09-17 10:05:49.34+07
1648	Gerald Hough	2009-09-17 10:06:13.81+07	2009-09-17 10:06:13.81+07
1649	Jay R. Galbraith	2009-10-03 11:06:01.747+07	2009-10-03 11:06:01.747+07
1650	D.T. Johns	2009-10-03 11:10:52.393+07	2009-10-03 11:10:52.393+07
1651	H.A. Harding	2009-10-03 11:11:19.707+07	2009-10-03 11:11:19.707+07
1652	D.T. Johns	2009-10-07 10:35:27.13+07	2009-10-07 10:35:27.13+07
1653	H.A. Harding	2009-10-07 10:36:49.333+07	2009-10-07 10:36:49.333+07
1654	Albert Thumann 	2009-10-08 13:57:36.133+07	2009-10-08 13:57:36.133+07
1655	Agneta Mimms	2009-10-08 14:12:53.887+07	2009-10-08 14:12:53.887+07
1656	Jeff A. Pyatte	2009-10-08 14:13:52.463+07	2009-10-08 14:13:52.463+07
1657	Elizabeth E. Wright	2009-10-08 14:14:50.12+07	2009-10-08 14:14:50.12+07
1658	Ganesh Shermon	2009-10-12 10:45:22.083+07	2009-10-12 10:45:22.083+07
1659	Choliludin	2009-10-12 10:53:28.843+07	2009-10-12 10:53:28.843+07
1660	I Nyoman Londen	2009-10-13 15:25:46.757+07	2009-10-13 15:25:46.757+07
1661	Dodi Mawardi	2009-10-13 15:26:03.197+07	2009-10-13 15:26:03.197+07
1662	Noam Chomsky	2009-10-15 16:42:55.563+07	2009-10-15 16:42:55.563+07
1663	Donald Trump	2009-10-15 16:45:54.88+07	2009-10-15 16:45:54.88+07
1664	Dennis L. Borton	2009-10-16 10:01:50.337+07	2009-10-16 10:01:50.337+07
1665	Timothy J. Hall	2009-10-16 10:02:15.587+07	2009-10-16 10:02:15.587+07
1666	Robert P. Fisher	2009-10-16 10:02:36.493+07	2009-10-16 10:02:36.493+07
1667	Jill F. Thomas	2009-10-16 10:02:55.98+07	2009-10-16 10:02:55.98+07
1668	Debra Webb	2009-10-17 09:23:39.437+07	2009-10-17 09:23:39.437+07
1669	Marc Hoppe	2009-10-19 14:00:29.017+07	2009-10-19 14:00:29.017+07
1670	Derek Lambert	2009-10-19 16:43:20.533+07	2009-10-19 16:43:20.533+07
1671	Jacques Derrida	2009-10-19 16:44:57.287+07	2009-10-19 16:44:57.287+07
1672	Stephen C. Lundin	2009-10-21 13:38:20.523+07	2009-10-21 13:38:20.523+07
1673	Harry Paul	2009-10-21 13:38:54.65+07	2009-10-21 13:38:54.65+07
1674	John Christensen	2009-10-21 13:39:41.963+07	2009-10-21 13:39:41.963+07
1675	Robin Stuart-Kotze	2009-10-21 13:48:00.677+07	2009-10-21 13:48:00.677+07
1676	Robert P. Neuman	2009-10-22 09:34:47.517+07	2009-10-22 09:34:47.517+07
1677	Roland R. Cavanagih	2009-10-22 09:35:10.75+07	2009-10-22 09:35:10.75+07
1678	Tom Brannan	2009-10-23 10:17:27.573+07	2009-10-23 10:17:27.573+07
1679	Jack Febrian	2009-10-27 14:59:50.14+07	2009-10-27 14:59:50.14+07
1680	Promod Batra	2009-10-27 16:08:01.25+07	2009-10-27 16:08:01.25+07
1681	Susan Fowler	2009-10-28 09:50:00.577+07	2009-10-28 09:50:00.577+07
1682	Laurence Hawkins	2009-10-28 09:50:23.95+07	2009-10-28 09:50:23.95+07
1683	Richard Hodge	2009-11-04 15:10:02.757+07	2009-11-04 15:10:02.757+07
1684	Lou Schachter	2009-11-04 15:10:33.787+07	2009-11-04 15:10:33.787+07
1685	Dadang Dachjar	2009-11-04 17:10:50.24+07	2009-11-04 17:10:50.24+07
1686	Thomas J. Stevenin	2009-11-06 09:53:14.11+07	2009-11-06 09:53:14.11+07
1687	Alan Price	2009-11-06 10:26:55.943+07	2009-11-06 10:26:55.943+07
1688	Ambang Priyonggo	2009-11-09 09:48:02.547+07	2009-11-09 09:48:02.547+07
1689	Achmad Fanani	2009-11-09 09:48:31.267+07	2009-11-09 09:48:31.267+07
1690	Roderick A. Munro	2009-11-12 10:03:36.17+07	2009-11-12 10:03:36.17+07
1691	Matthew J. Maio	2009-11-12 10:03:52.687+07	2009-11-12 10:03:52.687+07
1692	Mohamed B. Nawaz	2009-11-12 10:04:09.983+07	2009-11-12 10:04:09.983+07
1693	Govindarajan Ramu	2009-11-12 10:04:27.013+07	2009-11-12 10:04:27.013+07
1694	Daniel J. Zrymiak	2009-11-12 10:04:48.313+07	2009-11-12 10:04:48.313+07
1695	Donald W. Benbow	2009-11-12 10:22:47.99+07	2009-11-12 10:22:47.99+07
1696	Thomas M. Kubiak	2009-11-12 10:23:05.613+07	2009-11-12 10:23:05.613+07
1697	Gary R. Heerkens 	2009-11-12 11:15:41.627+07	2009-11-12 11:15:41.627+07
1698	Alan Rickayzen	2009-11-13 15:05:05.357+07	2009-11-13 15:05:05.357+07
1699	Jocelyn Dart	2009-11-13 15:05:33.437+07	2009-11-13 15:05:33.437+07
1700	Carsten Brennecke	2009-11-13 15:07:43.313+07	2009-11-13 15:07:43.313+07
1701	Markus Schneider	2009-11-13 15:08:31.39+07	2009-11-13 15:08:31.39+07
1702	Samuel E. Windsor	2009-11-23 10:07:34.907+07	2009-11-23 10:07:34.907+07
1703	Mark J. Kirwan	2009-11-23 13:43:10.547+07	2009-11-23 13:43:10.547+07
1704	Phillip C. McGraw	2009-11-23 14:35:13.34+07	2009-11-23 14:35:13.34+07
1705	Ralp Graham Larimore	2009-11-23 15:37:33.193+07	2009-11-23 15:37:33.193+07
1706	Tom Clancy	2009-11-23 16:26:40.593+07	2009-11-23 16:26:40.593+07
1707	Jamshid Gharajedaghi	2009-11-24 15:31:56.277+07	2009-11-24 15:31:56.277+07
1708	D. Rajen Iyer	2009-12-08 11:17:57.167+07	2009-12-08 11:17:57.167+07
1709	Wolfgang Altmann	2009-12-08 11:37:27.86+07	2009-12-08 11:37:27.86+07
1710	James O. Gill	2009-12-08 11:53:22.723+07	2009-12-08 11:53:22.723+07
1711	Moira Chatton	2009-12-09 09:40:53.373+07	2009-12-09 09:40:53.373+07
1712	Elaine Biech	2009-12-09 10:38:46.05+07	2009-12-09 10:38:46.05+07
1713	Johanes Ariffin Wijaya	2009-12-09 13:38:48.35+07	2009-12-09 13:38:48.35+07
1714	Budi Setiawan	2009-12-09 13:38:59.867+07	2009-12-09 13:38:59.867+07
1715	Martin Muray	2009-12-09 13:39:25.147+07	2009-12-09 13:39:25.147+07
1716	Edward Frazelle	2009-12-09 16:52:49.393+07	2009-12-09 16:52:49.393+07
1717	DR.Eva Zhoriva Yusuf	2009-12-10 11:24:49.36+07	2009-12-10 11:24:49.36+07
1718	DR. Lesley Williams	2009-12-10 11:25:35.53+07	2009-12-10 11:25:35.53+07
1719	Glenn M. Parker	2009-12-10 14:26:21.723+07	2009-12-10 14:26:21.723+07
1720	Samuel Denton Faust	2009-12-10 16:03:07.617+07	2009-12-10 16:03:07.617+07
1721	Osman M. Aly	2009-12-10 16:03:48.29+07	2009-12-10 16:03:48.29+07
1722	Iyung Pahan	2009-12-11 13:41:38.127+07	2009-12-11 13:41:38.127+07
1723	Arthur H. Bell	2009-12-11 16:43:47.79+07	2009-12-11 16:43:47.79+07
1724	Dayle M. Smith	2009-12-11 16:44:23.4+07	2009-12-11 16:44:23.4+07
1725	Agus Setyarso	2009-12-14 11:18:11.977+07	2009-12-14 11:18:11.977+07
1726	T.A. Prayitno	2009-12-14 11:18:57.837+07	2009-12-14 11:18:57.837+07
1727	Nugroho Marsoum	2009-12-14 11:19:30.07+07	2009-12-14 11:19:30.07+07
1728	Sofyan Warsito	2009-12-14 11:19:45.48+07	2009-12-14 11:19:45.48+07
1729	Rhenald Kasali	2009-12-17 16:36:23.12+07	2009-12-17 16:36:23.12+07
1730	Cynthia Kersey	2009-12-22 08:21:47.457+07	2009-12-22 08:21:47.457+07
1731	E. W. McAllister	2009-12-22 09:00:12.47+07	2009-12-22 09:00:12.47+07
1732	Active Education	2009-12-31 16:13:35.277+07	2009-12-31 16:13:35.277+07
1733	Rick Conlow	2010-01-07 08:52:23.59+07	2010-01-07 08:52:23.59+07
1734	Richard Templar	2010-01-07 16:05:01.907+07	2010-01-07 16:05:01.907+07
1735	Mohammad Malek	2010-01-12 14:22:43.9+07	2010-01-12 14:22:43.9+07
1736	Devilito	2010-01-12 14:45:35.357+07	2010-01-12 14:45:35.357+07
1737	Toyyibah Faruq	2010-01-12 15:26:22.607+07	2010-01-12 15:26:22.607+07
1738	Leonard Berkowidz	2010-01-12 15:33:15.35+07	2010-01-12 15:33:15.35+07
1739	Frank R. Spellman	2010-01-14 13:30:07.343+07	2010-01-14 13:30:07.343+07
1740	Mike Merrill	2010-01-14 13:30:38.28+07	2010-01-14 13:30:38.28+07
1741	Joseph Cascio	2010-01-14 13:32:22.363+07	2010-01-14 13:32:22.363+07
1742	Carlos I. Calle	2010-01-18 10:16:50.46+07	2010-01-18 10:16:50.46+07
1743	Michael C. Tang	2010-01-18 10:48:35.947+07	2010-01-18 10:48:35.947+07
1744	John Jordan	2010-01-18 11:53:10.983+07	2010-01-18 11:53:10.983+07
1745	Joel Levitt	2010-01-18 13:24:34.733+07	2010-01-18 13:24:34.733+07
1746	Florence Littauer	2010-01-19 10:32:54.667+07	2010-01-19 10:32:54.667+07
1747	Alan J.  Kalameja	2010-01-19 13:34:45.343+07	2010-01-19 13:34:45.343+07
1748	James Leflar	2010-01-19 15:32:01.947+07	2010-01-19 15:32:01.947+07
1749	Richard Palmer	2010-01-19 15:51:02.677+07	2010-01-19 15:51:02.677+07
1750	Bruce Klatt	2010-01-21 14:03:54.58+07	2010-01-21 14:03:54.58+07
1751	Adi Sutrisno	2010-01-21 14:24:16.33+07	2010-01-21 14:24:16.33+07
1752	Catapult, Inc	2010-01-22 10:45:11.513+07	2010-01-22 10:45:11.513+07
1753	William C. Dunn	2010-01-25 13:30:35.863+07	2010-01-25 13:30:35.863+07
1754	Indayati Oetomo	2010-01-27 10:48:16.657+07	2010-01-27 10:48:16.657+07
1755	John Moubray	2010-02-02 08:07:40.833+07	2010-02-02 08:07:40.833+07
1756	Hiroyuki Hirano	2010-02-09 14:34:43.727+07	2010-02-09 14:34:43.727+07
1757	Astu Pudjanarsa	2010-02-15 16:12:14.867+07	2010-02-15 16:12:14.867+07
1758	Djati Nursuhud	2010-02-15 16:12:34.163+07	2010-02-15 16:12:34.163+07
1759	Norbert Egger	2010-02-17 09:28:05.033+07	2010-02-17 09:28:05.033+07
1760	Jean-Marie Fiechter	2010-02-17 09:29:26.97+07	2010-02-17 09:29:26.97+07
1761	Jens Rohlf	2010-02-17 09:30:00.8+07	2010-02-17 09:30:00.8+07
1762	Rose	2010-02-17 09:30:30.44+07	2010-02-17 09:30:30.44+07
1763	Oliver Schruffer	2010-02-17 09:31:26.427+07	2010-02-17 09:31:26.427+07
1764	John Langone	2010-02-17 14:11:11.08+07	2010-02-17 14:11:11.08+07
1765	Bruce Stutz	2010-02-17 14:11:42.533+07	2010-02-17 14:11:42.533+07
1766	Andrea Gianopoulos	2010-02-17 14:12:12.877+07	2010-02-17 14:12:12.877+07
1767	Robert M. Thomas	2010-02-18 10:56:35.48+07	2010-02-18 10:56:35.48+07
1768	Les Giblin	2010-02-18 14:50:50.47+07	2010-02-18 14:50:50.47+07
1769	R. Djokopranoto	2010-02-20 09:28:47.17+07	2010-02-20 09:28:47.17+07
1770	Dirk Herzog	2010-02-20 09:54:04.927+07	2010-02-20 09:54:04.927+07
1771	Catherine Hayden	2010-02-20 10:30:40.703+07	2010-02-20 10:30:40.703+07
1772	Sri Bramantoro Abdinagoro	2010-02-22 08:07:21.893+07	2010-02-22 08:07:21.893+07
1773	Ilka T. Kuusisto	2010-02-22 08:11:53.29+07	2010-02-22 08:11:53.29+07
1774	Iman Kartolaksono  R.	2010-02-24 14:11:07.49+07	2010-02-24 14:11:07.49+07
1775	Chakimoelmal Jasjkur	2010-02-24 14:11:34.38+07	2010-02-24 14:11:34.38+07
1776	Sean Covey	2010-02-25 10:03:43.8+07	2010-02-25 10:03:43.8+07
1777	A. Joseph Bursteln	2010-03-03 14:59:40.563+07	2010-03-03 14:59:40.563+07
1778	Fakhrunnas MA Jabbar	2010-03-04 09:49:13.043+07	2010-03-04 09:49:13.043+07
1779	Sarah Cook	2010-03-08 13:52:18.56+07	2010-03-08 13:52:18.56+07
1780	Sawaldjo Puspopranoto	2010-03-08 16:48:26.88+07	2010-03-08 16:48:26.88+07
1781	Erman Aminullah	2010-03-19 08:56:19.69+07	2010-03-19 08:56:19.69+07
1782	Ralph Grabowski	2010-03-20 08:27:12.223+07	2010-03-20 08:27:12.223+07
1783	Hendry Ch Bangun	2010-03-20 09:36:50.663+07	2010-03-20 09:36:50.663+07
1784	David Oliver	2010-03-20 10:05:34.31+07	2010-03-20 10:05:34.31+07
1785	Frista Artmanda Widodo	2010-03-23 15:18:49.23+07	2010-03-23 15:18:49.23+07
1786	Michael Duckworth	2010-03-24 10:02:32.627+07	2010-03-24 10:02:32.627+07
1787	Aru W. Sudoyo	2010-03-25 09:00:10.777+07	2010-03-25 09:00:10.777+07
1788	Bambang Setiyohadi	2010-03-25 09:01:31.857+07	2010-03-25 09:01:31.857+07
1789	Idrus Alwi	2010-03-25 09:01:56.357+07	2010-03-25 09:01:56.357+07
1790	Marcellus Simadibrata K.	2010-03-25 09:02:38.56+07	2010-03-25 09:02:38.56+07
1791	Siti Setiadi	2010-03-25 09:02:59.39+07	2010-03-25 09:02:59.39+07
1792	Jonathan Stroud	2010-03-25 10:29:45.33+07	2010-03-25 10:29:45.33+07
1793	Thomas A Stellman	2010-03-25 15:48:48.03+07	2010-03-25 15:48:48.03+07
1794	Robert Rhea	2010-03-25 15:49:15.75+07	2010-03-25 15:49:15.75+07
1795	Andrias Harefa	2010-03-30 08:54:58.707+07	2010-03-30 08:54:58.707+07
1796	Peter Englund	2010-03-30 15:41:36.113+07	2010-03-30 15:41:36.113+07
1797	Henning Mankell	2010-03-30 15:41:54.47+07	2010-03-30 15:41:54.47+07
1798	Hermawan Kartajaya	2010-03-30 16:56:30.343+07	2010-03-30 16:56:30.343+07
1799	Larry King	2010-03-31 10:33:42.447+07	2010-03-31 10:33:42.447+07
1800	Aubrey C. Daniels	2010-04-03 08:34:51.423+07	2010-04-03 08:34:51.423+07
1801	Stephen Cimorelli	2010-04-06 15:54:15.96+07	2010-04-06 15:54:15.96+07
1802	Wang Xuanming	2010-04-07 15:34:59.577+07	2010-04-07 15:34:59.577+07
1803	Bernard Renaldy Suteja	2010-04-13 13:54:53.323+07	2010-04-13 13:54:53.323+07
1804	Eko Priyo Utomo	2010-04-13 13:55:21.793+07	2010-04-13 13:55:21.793+07
1805	Hengky Alexander Mangkulo	2010-04-13 13:55:57.2+07	2010-04-13 13:55:57.2+07
1806	M. Agus J. Alam	2010-04-13 14:56:15.307+07	2010-04-13 14:56:15.307+07
1807	Efisitek.Com	2010-04-19 11:20:56.347+07	2010-04-19 11:20:56.347+07
1808	R. Fikriansyah	2010-04-19 11:21:40.223+07	2010-04-19 11:21:40.223+07
1809	Budi Raharjo	2010-04-19 11:22:41.333+07	2010-04-19 11:22:41.333+07
1810	Arif Haryono	2010-04-19 11:23:20.147+07	2010-04-19 11:23:20.147+07
1811	Leslie Pockell	2010-04-19 11:24:19.943+07	2010-04-19 11:24:19.943+07
1812	Adrienne Avila	2010-04-19 11:25:52.083+07	2010-04-19 11:25:52.083+07
1813	Ronnakorn Triraganon	2010-04-20 09:04:49.993+07	2010-04-20 09:04:49.993+07
1814	Martin J. Rees	2010-04-20 15:34:35.213+07	2010-04-20 15:34:35.213+07
1815	Robert Dinwiddie	2010-04-20 15:35:03.777+07	2010-04-20 15:35:03.777+07
1816	Freddy Rangkuti	2010-06-04 08:26:04.917+07	2010-06-04 08:26:04.917+07
1817	Semuil Tjiharjadi	2010-06-04 08:26:38.23+07	2010-06-04 08:26:38.23+07
1818	Tung Desem Waringin	2010-06-04 08:28:34.9+07	2010-06-04 08:28:34.9+07
1819	Ian Parker	2010-08-09 11:06:44.28+07	2010-08-09 11:06:44.28+07
1820	Makmur Hendrik	2010-08-09 14:44:35.12+07	2010-08-09 14:44:35.12+07
1821	Adi Wira Kusuma	2010-08-09 14:45:45.357+07	2010-08-09 14:45:45.357+07
1822	Gregory Benford	2010-08-09 16:01:14.073+07	2010-08-09 16:01:14.073+07
1823	Stanley Rosen	2010-08-13 14:52:31.243+07	2010-08-13 14:52:31.243+07
1824	Andrew Matthews	2010-08-31 10:56:42.417+07	2010-08-31 10:56:42.417+07
1825	Edison Siregar	2010-09-07 08:18:38.43+07	2010-09-07 08:18:38.43+07
1826	Kate Dicamillo	2010-09-07 08:19:51.43+07	2010-09-07 08:19:51.43+07
1827	Suharsono Wignyowiyoto	2010-09-07 08:20:35.79+07	2010-09-07 08:20:35.79+07
1828	Prabir Basu	2010-09-21 15:40:50.33+07	2010-09-21 15:40:50.33+07
1829	Cen Kefa	2010-09-21 15:41:21.88+07	2010-09-21 15:41:21.88+07
1830	Louis Jestin	2010-09-21 15:41:40.987+07	2010-09-21 15:41:40.987+07
1831	Marian Keyes	2010-09-22 10:19:38.573+07	2010-09-22 10:19:38.573+07
1832	Mardiyanto	2010-09-22 16:39:28.19+07	2010-09-22 16:39:28.19+07
1833	Karen Saunders	2010-09-23 10:15:46.34+07	2010-09-23 10:15:46.34+07
1834	Jane Yarnall	2010-09-23 14:22:47.873+07	2010-09-23 14:22:47.873+07
1835	Joanna Hines	2010-10-07 10:33:10.4+07	2010-10-07 10:33:10.4+07
1836	Sam Bourne	2010-10-07 10:34:01.103+07	2010-10-07 10:34:01.103+07
1837	Retnowati Abdulgani	2010-10-07 10:36:20.183+07	2010-10-07 10:36:20.183+07
1838	KNAPP	2010-10-07 10:36:44.243+07	2010-10-07 10:36:44.243+07
1839	Kasiman Peranginangin	2010-10-07 15:01:09.173+07	2010-10-07 15:01:09.173+07
1840	Fritjof Capra	2010-10-07 16:11:43.95+07	2010-10-07 16:11:43.95+07
1841	Francis Fukuyama	2010-10-11 09:38:26.437+07	2010-10-11 09:38:26.437+07
1842	David Brin	2010-10-11 11:17:42.727+07	2010-10-11 11:17:42.727+07
1843	Dale E. Seborg	2010-10-20 10:01:07.96+07	2010-10-20 10:01:07.96+07
1844	Thomas F. Edgar	2010-10-20 10:01:52.897+07	2010-10-20 10:01:52.897+07
1845	Duncan A. Mellichamp	2010-10-20 10:02:21.787+07	2010-10-20 10:02:21.787+07
1846	Brian Herbert	2010-10-21 11:19:06.707+07	2010-10-21 11:19:06.707+07
1847	Isaac Asimov	2010-11-08 11:33:01.003+07	2010-11-08 11:33:01.003+07
1848	Paul J. Jerome	2010-11-09 10:05:50.72+07	2010-11-09 10:05:50.72+07
1849	Forrest W. Breyfogle	2010-11-09 11:20:19.89+07	2010-11-09 11:20:19.89+07
1850	Wendy Ulrich	2010-11-09 15:02:25.68+07	2010-11-09 15:02:25.68+07
1851	Marshall Goldsmith	2010-11-09 15:04:10.867+07	2010-11-09 15:04:10.867+07
1852	Anntoinette D. Lucia	2010-11-11 11:37:34.317+07	2010-11-11 11:37:34.317+07
1853	Richard Lepsinger	2010-11-11 11:38:08.787+07	2010-11-11 11:38:08.787+07
1854	Robert B. Cialdini	2010-11-15 10:53:57.737+07	2010-11-15 10:53:57.737+07
1855	Jean Piaget	2010-11-24 08:47:56.48+07	2010-11-24 08:47:56.48+07
1856	Cecil C. Bozarth	2010-11-25 10:01:45.2+07	2010-11-25 10:01:45.2+07
1857	Robert B. Handfield	2010-11-25 10:02:14.637+07	2010-11-25 10:02:14.637+07
1858	Leonard Susskind	2010-11-25 10:37:31.697+07	2010-11-25 10:37:31.697+07
1859	Michael Wood	2010-11-25 10:48:58.403+07	2010-11-25 10:48:58.403+07
1860	Doris Naisbitt	2010-11-25 11:17:48.633+07	2010-11-25 11:17:48.633+07
1861	James Canton	2010-11-25 11:22:26.09+07	2010-11-25 11:22:26.09+07
1862	Friedrich Nietzsche	2010-11-26 15:16:01.203+07	2010-11-26 15:16:01.203+07
1863	FX. G. ISBAGYO WIYONO	2010-12-02 10:28:24.507+07	2010-12-02 10:28:24.507+07
1864	James Patterson	2010-12-02 11:12:05.07+07	2010-12-02 11:12:05.07+07
1865	Michael Ledwidge	2010-12-02 11:12:54.21+07	2010-12-02 11:12:54.21+07
1866	Patrick L. Gardiner	2010-12-02 12:00:54.87+07	2010-12-02 12:00:54.87+07
1867	Peg C. Neuhauser	2010-12-08 10:55:17.713+07	2010-12-08 10:55:17.713+07
1868	Technical Association of the Pulp and Paper	2010-12-08 16:31:50.98+07	2010-12-08 16:31:50.98+07
1869	Mats Alvesson	2010-12-15 13:56:01.927+07	2010-12-15 13:56:01.927+07
1870	Peter F. Hamilton	2010-12-15 13:57:36.52+07	2010-12-15 13:57:36.52+07
1871	Victor Velarde - Mayol	2010-12-15 14:27:28.313+07	2010-12-15 14:27:28.313+07
1872	Jerome S. Bruner	2010-12-15 14:38:07.007+07	2010-12-15 14:38:07.007+07
1873	Tony Parsons	2010-12-16 10:08:40.037+07	2010-12-16 10:08:40.037+07
1874	IPC Editorial	2011-02-02 08:13:51.41+07	2011-02-02 08:13:51.41+07
1875	Helvy Tiana Rosa	2011-02-02 15:30:12.07+07	2011-02-02 15:30:12.07+07
1876	Erich Segal	2011-02-02 15:36:26.33+07	2011-02-02 15:36:26.33+07
1877	Karen Okulicz	2011-02-02 16:26:16.453+07	2011-02-02 16:26:16.453+07
1878	Allan R. Hambley	2011-02-18 14:41:01.35+07	2011-02-18 14:41:01.35+07
1879	Prof. Dr. Firdaus L.N. M.Si	2011-03-04 11:06:04.73+07	2011-03-04 11:06:04.73+07
1880	Kenneth G. Oliver	2011-04-18 09:46:47.773+07	2011-04-18 09:46:47.773+07
1881	Paul Mathews	2012-02-09 13:57:06.91+07	2012-02-09 13:57:06.91+07
1882	John Cadick	2012-02-09 14:18:38.923+07	2012-02-09 14:18:38.923+07
1883	William Thue	2012-04-10 11:05:57.627+07	2012-04-10 11:05:57.627+07
1884	Zarita	2013-02-15 15:33:58.703+07	2013-02-15 15:33:58.703+07
1885	Alberthiene Endah	2013-03-07 10:05:33.19+07	2013-03-07 10:05:33.19+07
1886	Jeffrey K. Liker	2013-03-07 10:26:00.97+07	2013-03-07 10:26:00.97+07
1887	Walter Isaacson	2013-03-07 10:27:57.937+07	2013-03-07 10:27:57.937+07
1888	Richard Branson	2013-10-01 10:37:26.523+07	2013-10-01 10:37:26.523+07
1889	Rhonda Byrne	2014-02-27 10:48:30.723+07	2014-02-27 10:48:30.723+07
1890	Jessica Hagy	2014-02-27 10:49:24.94+07	2014-02-27 10:49:24.94+07
1891	Risye Amarta	2014-02-27 10:50:11.13+07	2014-02-27 10:50:11.13+07
1892	Wildan Zulkarnain	2014-02-27 10:50:53.71+07	2014-02-27 10:50:53.71+07
1893	Leyla Hana, dkk	2014-02-27 10:52:33.35+07	2014-02-27 10:52:33.35+07
1894	Andy Iskandar	2014-02-27 10:52:56.71+07	2014-02-27 10:52:56.71+07
1895	Gieck	2014-07-11 08:48:24.13+07	2014-07-11 08:48:24.13+07
1896	Seiichi Nakajima	2014-07-11 09:10:22.81+07	2014-07-11 09:10:22.81+07
1897	Cecil L. Smith	2014-07-11 09:11:34.777+07	2014-07-11 09:11:34.777+07
1898	Alton Thygerson	2014-12-03 10:58:44.013+07	2014-12-03 10:58:44.013+07
1899	John Ridley	2014-12-03 10:59:04.933+07	2014-12-03 10:59:04.933+07
1900	Soehatman Ramli	2014-12-03 10:59:40.45+07	2014-12-03 10:59:40.45+07
1901	Suyartono	2014-12-03 11:00:00.607+07	2014-12-03 11:00:00.607+07
1902	Laurens Bakker	2014-12-03 11:01:28.403+07	2014-12-03 11:01:28.403+07
1903	Herry Gendut Janarto	2014-12-03 11:02:29.64+07	2014-12-03 11:02:29.64+07
1904	John D Campbell	2014-12-03 11:03:20.623+07	2014-12-03 11:03:20.623+07
1905	Antonius Arif	2015-05-27 10:57:04.29+07	2015-05-27 10:57:04.29+07
1906	Edward G. Hinkelman	2018-05-09 14:30:38.417+07	2018-05-09 14:30:38.417+07
1907	Raidah	2022-08-10 17:37:18.379+07	2022-08-10 17:37:18.379+07
\.


--
-- Data for Name: Borrows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Borrows" (id, id_borrow, user_id, user_name, item_id, item_title, code, request_date, booking_admin_id, booking_date, borrow_admin_id, borrow_date, return_admin_id, return_date, cancel_admin_id, cancel_date, due_date, borrow_status, request_extend_date, action_extend_admin_id, action_extend_date, extend_due_date, extend_status, return_status, "createdAt", "updatedAt") FROM stdin;
12	P12_FIS_01	IT_01	Agusto	FIS_01	Hukum OHM	WKAJKV	2022-08-08	Admin_1	2022-08-09	Admin_1	2022-08-09	Admin_1	2022-08-09	\N	\N	2022-08-23	completed	\N	\N	\N	\N	\N	ontime	2022-08-09 08:59:40.571+07	2022-08-09 09:01:34.708+07
1	P1_IF_01	IT_01	Agusto	IF_01	Pemrograman Web	oR86YC	2022-08-06	Admin_1	2022-08-05	Admin_1	2022-08-05	Admin_1	2022-08-05	\N	\N	2022-08-19	completed	\N	\N	\N	\N	\N	ontime	2022-08-05 21:43:23.576+07	2022-08-05 21:51:09.24+07
14	P14_IF_01	IT_01	Agusto	IF_01	Pemrograman Web	eSbmCJ	2022-08-09	Admin_1	2022-08-09	Admin_1	2022-08-10	Admin_1	2022-08-10	\N	\N	2022-08-24	completed	\N	\N	\N	\N	\N	ontime	2022-08-09 09:02:11.688+07	2022-08-10 09:11:49.243+07
2	P2_FIS_01	IT_01	Agusto	FIS_01	Hukum OHM	soDotX	2022-08-06	Admin_1	2022-08-05	Admin_1	2022-08-05	Admin_1	2022-08-07	\N	\N	2022-08-19	completed	2022-08-05	Admin_1	2022-08-05	2022-09-02	extended	ontime	2022-08-05 21:49:33.968+07	2022-08-07 01:54:51.913+07
3	P3_MTK_1	IT_01	Agusto	MTK_1	perkalian	8p7NMF	2022-08-07	Admin_1	2022-08-06	Admin_1	2022-08-06	Admin_1	2022-08-08	\N	\N	2022-08-20	completed	\N	\N	\N	\N	\N	ontime	2022-08-06 20:31:54.048+07	2022-08-08 08:06:43.929+07
21	P21_IF_01	IT_01	Agusto	IF_01	Pemrograman Web	5mbQMf	2022-08-12	Admin_1	2022-08-12	Admin_1	2022-08-12	Admin_1	2022-08-12	\N	\N	2022-08-26	completed	2022-08-12	Admin_1	2022-08-12	2022-09-09	extended	ontime	2022-08-12 16:17:04.285+07	2022-08-12 16:25:01.654+07
4	P4_Doc_1	IT_01	Agusto	Doc_1	Penggunaan Mesin	s9ArzF	2022-08-07	Admin_1	2022-08-07	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	\N	\N	\N	\N	\N	ontime	2022-08-07 01:55:26.907+07	2022-08-08 17:00:50.716+07
15	P15_IF_01	IT_01	Agusto	IF_01	Pemrograman Web	OwlmUZ	2022-08-10	Admin_1	2022-08-10	Admin_1	2022-08-10	Admin_1	2022-08-11	\N	\N	2022-08-24	completed	2022-08-10	\N	\N	\N	request	ontime	2022-08-10 09:14:30.447+07	2022-08-11 10:21:40.365+07
5	P5_FIS_01	IT_01	Agusto	FIS_01	Hukum OHM	kUYLml	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	\N	\N	\N	\N	\N	ontime	2022-08-08 08:07:15.998+07	2022-08-08 19:30:30.425+07
13	P13_Doc_1	IT_01	Agusto	Doc_1	Penggunaan Mesin	jZwbJn	2022-08-09	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-09 09:01:12.408+07	2022-08-11 16:26:45.016+07
6	P6_12345	IT_01	Agusto	12345	Data Science	FERURb	2022-08-09	Admin_1	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	2022-08-08	Admin_1	2022-08-08	2022-09-05	extended	ontime	2022-08-08 17:00:56.824+07	2022-08-08 19:40:24.267+07
7	P7_12345	IT_01	Agusto	12345	Data Science	p9bkwf	2022-08-09	Admin_1	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	\N	\N	\N	\N	\N	ontime	2022-08-08 19:30:49.619+07	2022-08-08 20:15:14.598+07
16	P16_MTK_2	IT_01	Agusto	MTK_2	Algoritma Struktur Data	2EQ0au	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-11 10:22:02.408+07	2022-08-11 16:28:14.357+07
22	P22_IF_01	IT_01	Agusto	IF_01	Pemrograman Web	InrQlV	2022-08-13	Admin_1	2022-08-13	Admin_1	2022-08-13	Admin_1	2022-08-13	\N	\N	2022-08-27	completed	2022-08-13	Admin_1	2022-08-13	2022-09-10	extended	ontime	2022-08-13 09:32:32.908+07	2022-08-13 09:48:28.279+07
8	P8_Doc_1	IT_01	Agusto	Doc_1	Penggunaan Mesin	XOmmry	2022-08-09	Admin_1	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	\N	\N	\N	\N	\N	ontime	2022-08-08 19:41:12.29+07	2022-08-08 20:34:26.351+07
9	P9_MTK_1	IT_01	Agusto	MTK_1	perkalian	sW4mCu	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	Admin_1	2022-08-08	\N	\N	2022-08-22	completed	\N	\N	\N	\N	\N	ontime	2022-08-08 20:15:28.589+07	2022-08-08 20:34:29.471+07
17	P17_MTK_2	IT_01	Agusto	MTK_2	Algoritma Struktur Data	HSJiAL	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-11 16:29:02.822+07	2022-08-11 16:38:36.382+07
11	P11_12345	IT_01	Agusto	12345	Data Science	a1BdHt	2022-08-08	Admin_1	2022-08-09	Admin_1	2022-08-09	Admin_1	2022-08-09	\N	\N	2022-08-23	completed	\N	\N	\N	\N	\N	ontime	2022-08-09 08:44:20.719+07	2022-08-09 08:59:12.721+07
10	P10_FIS_01	IT_01	Agusto	FIS_01	Hukum OHM	44bNVx	2022-08-08	Admin_1	2022-08-09	Admin_1	2022-08-09	Admin_1	2022-08-09	\N	\N	2022-08-23	completed	\N	\N	\N	\N	\N	ontime	2022-08-08 20:34:45.722+07	2022-08-09 09:00:40.605+07
18	P18_12345	IT_01	Agusto	12345	Data Science	DfOYIO	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-11 16:36:33.675+07	2022-08-11 16:39:10.327+07
19	P19_FIS_01	IT_01	Agusto	FIS_01	Hukum OHM	PMx20L	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-11 16:42:38.824+07	2022-08-11 16:46:54.461+07
20	P20_MTK_2	IT_01	Agusto	MTK_2	Algoritma Struktur Data	lMCawg	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	Admin_1	2022-08-11	\N	\N	2022-08-25	completed	\N	\N	\N	\N	\N	ontime	2022-08-11 16:47:27.834+07	2022-08-11 16:48:02.785+07
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" (id, "categoryID", "categoryName", "createdAt", "updatedAt") FROM stdin;
1	A01	Process Production of Pulp, Paper, Power & Forestry	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
2	B01	Engineering & Maintenance	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
3	C01	Management, Leadership & Human Resource	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
4	D01	Business, Ecomomy, Finance & Marketing	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
5	E01	Biography, Science, Health, Culture	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
6	F01	Standardization, Law, Legislation	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
7	G01	Computer	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
8	H01	Language	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
9	I01	Novel & Fiction	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
10	J01	Electronic (CD, DVD, VCD, Cassette)	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
11	K01	Training Module	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
12	L01	Company Report	2009-07-22 20:22:22.183+07	2009-07-22 20:22:22.183+07
13	IF01	Informatika	2022-08-10 16:33:42.141+07	2022-08-10 16:33:42.141+07
\.


--
-- Data for Name: Items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Items" (id, id_item, image, location, type, category, title, author, publisher, sinopsis, pages, language, quantity, available_quantity, items_status, entry_date, "createdAt", "updatedAt") FROM stdin;
6	MTK_2	public\\img\\desain_pti.jpg	01-C-43	cd	Engineering & Maintenance	Algoritma Struktur Data	A.P Cowie	A Wiley-Interscience Publication, John Wiley & Sons, Inc.	It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.	123	english	2	2	available	2022-08-09 07:00:00+07	2022-08-09 15:01:11.077+07	2022-08-11 16:48:02.808+07
2	MTK_1	public\\img\\book2.jpg	01-A-03	books	Management, Leadership & Human Resource	perkalian	Alexander Monroe	APRIL - Forestry Service	belajar matematika	100	bahasa	3	3	available	2022-08-02 07:00:00+07	2022-08-02 11:11:08.128+07	2022-08-11 15:56:34.759+07
3	Doc_1	public\\img\\home-bg.jpg	01-A-01	document	Process Production of Pulp, Paper, Power & Forestry	Penggunaan Mesin	A. A. Hattangadi	Caraka Bumi	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.	87	english	3	3	available	2022-08-01 07:00:00+07	2022-08-02 11:18:21.052+07	2022-08-11 16:28:37.574+07
1	IF_01	public\\img\\book.jpg	01-A-02	books	Informatika	Pemrograman Web	Charles H, Benjamin B	Fakultas Kehutanan & Dept. Kehutanan RI, Jakarta	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.	99	bahasa	3	3	available	2022-08-03 07:00:00+07	2022-08-02 11:03:21.156+07	2022-08-13 09:48:28.284+07
5	12345	public\\img\\Book-cover-page-2.png	01-A-05	document	Informatika	Data Science	David Osborne	ABB (Asea Brown Bover)	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.	101	english	2	2	available	2022-08-08 07:00:00+07	2022-08-08 14:44:06.343+07	2022-08-11 16:42:09.54+07
4	FIS_01	public\\img\\book1.jpg	01-A-04	books	Training Module	Hukum OHM	Barry Z. Posner	APRIL - Forestry Service	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.	80	bahasa	3	3	available	2022-08-01 07:00:00+07	2022-08-02 11:25:42.824+07	2022-08-11 16:46:54.469+07
\.


--
-- Data for Name: Publishers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Publishers" (id, publisher, "createdAt", "updatedAt") FROM stdin;
1	A Harvard Business Review Book	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
2	A Touchstone Book, Simon & Schuster	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
3	A Wiley-Interscience Publication, John Wiley & Sons, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
4	A. Boore	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
5	AB Lorentzen & Wettre - Sweden	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
6	Abacus	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
7	ABB (Asea Brown Bover)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
8	Academic Press, Inc. (AP). San Diego, California	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
9	Adams Media Corporation, Avon Massachusetts	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
10	Addison-Wesley Publishing Co.Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
12	Aeration Industries International, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
13	Ahlstrom Machinery - Finland	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
14	Air Academy Press & Associates, Colorado Springs	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
15	Aldus Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
16	Alhstrom Pumps	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
17	Al-Huda Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
19	Allen-Bradley	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
20	Alpha Science International Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
21	AMACOM - American Management Association	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
22	American Public Heath Association	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
23	ASQ Quality Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
24	American Society for Training & Development (ASTD)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
25	Anchor Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
26	ANDI - Yokyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
28	Angus Wilde Publication Inc., Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
29	Ann Arbor Press, Chelsea, Michigan	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
30	APPITA, Melbourne Australia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
31	APRIL - Forestry Service	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
32	Arrbey - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
33	Arrow Books, United Kingdom	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
35	ASIAN AGRI Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
36	Asian Institute of Technology	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
37	ASIAN PAPER	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
38	Asiapac Books - Singapore	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
39	Pusat Penelitian Sumberdaya Hayati & Bioteknologi IPB	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
40	Asosiasi Pengusaha Hutan Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
42	Association Archipel - Paris	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
43	Atlantic Monthly Press, New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
44	Australian Computer Society	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
45	Australian Human Resources Institute	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
46	Avebury, Ashgate Publishing Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
48	BACA!, baca buku, buku baik - Yogyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
49	Badan Pengawas Tenaga Nuklir (BAPETEN) - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
50	Badan Pengendalian Dampak Lingkungan (BAPEDAL)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
51	Balai Besar Pulp & Kertas - BBPK, Bandung	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
52	Balai Besar Pulp dan Kertas dengan Lorentzen	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
53	Balai Pustaka	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
54	Bantam Press, a Division of Transword Publishers	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
55	Barron's Educational Series, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
56	Basic Books, A Member of the Perseus Books Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
59	Beacon Publishing	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
60	BELL Training	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
61	Berret-Koehler Publishers, Inc., San Francisco	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
62	Binarupa Aksara, Jakarta Barat, Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
63	Bissada Management Simulations	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
64	Blackwell Science Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
65	Blanchard Management Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
66	Bloomsbury Publishing Plc., London	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
67	BLOUNT Prentice Hydro-AX	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
68	BRAMBLES	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
69	Broadway Books, A Division of Random House, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
70	Brooks/Cole, Emily Barrosse	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
71	BTG	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
72	Butterworth-Heinemann	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
73	Cambridge University Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
74	Capstone Publishing Limited (a Wiley Company)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
75	Caraka Bumi	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
76	Career Press, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
77	Carrier Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
80	Center for Pulp and Paper (CPP)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
81	University of California Berkeley	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
82	Central Gippland College of Technical and Further Education (TAFE)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
83	Central Gippsland College of TAFE & John Batman Institute of TAFE	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
84	Central Gippsland Institute of TAFE	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
85	CEPATEC AB, Swedia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
86	CERMA, The Center for Earth Resources Management Application, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
87	Chambers Harrap	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
88	Chemical Publishing, Co.Inc	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
89	China International Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
90	CHIP Magazine Editor	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
91	Clearbridge Publishing	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
92	Co. KGaA, Weinheim	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
93	Coin Security International (Pty) Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
94	Collins, An Imprint of HarperCollins Publishers	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
95	Compaq Computer Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
96	Continuum	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
97	Corel Corporation - Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
98	Corgi Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
99	Corrosion Probe, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
100	CRC Press LLC	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
101	CSIRO Australia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
102	Cummins Engine Company, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
104	Daras Books - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
105	Dastan Books - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
106	Dastay Books - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
107	David Samuel And Bill Jenks	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
108	Dayacipta Primamuda, Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
109	Deddy Jacobus / Ray Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
110	Deloitte Development	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
111	Departemen Kehutanan dan Perkebunan Republik Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
112	Departement Of Labour-New Zealand	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
113	Dept. Perindustrian dan Perdagangan	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
114	DEStech Publications, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
115	Development Dimensions International, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
116	Dian Rakyat - Jakarta,	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
117	Digital Computations, Inc. & Air Academy Associates	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
119	Dinas Penerangan Angkatan Udara	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
120	Dirjen PHI & Pengawasan Ketenagakerjaan, DEPNAKER RI	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
121	Distance Education Center, The University of South Australia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
122	Dorling Kindersley Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
123	Doubleday	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
124	Dover Publications, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
125	DPF	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
126	DT. Paper Science, Grankulla	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
127	Duncan Baird Publisher Ltd. - London	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
128	Durametallic Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
129	E & FN Spon	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
130	EDSA Mahkota	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
131	Educational and Training Resource Center, NSW TAFE	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
132	Electrical Apparatus Service Association, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
133	Ellis Horwood Limited, Chichester	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
134	Elsevier Butterworth - Heinemann	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
135	Environmental Engineering Institut Teknologi Banding (ITB)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
136	Erlangga	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
137	ESAB AB - Sweden	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
138	ESSENSI, a division of Penerbit Erlangga	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
139	Everyman's Library	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
140	Ewing Communications Pte.Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
142	FAG Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
143	Fairfield Language Technologies	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
144	Fakultas Kehutanan & Dept. Kehutanan RI, Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
145	FAPET, Helsinki	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
146	Festo Didactic	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
147	Financial Times/Prentice Hall	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
148	Finnish Companies & The Embassy	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
149	Fivestar Publishing - Tangerang	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
150	Flexible Learning Center, The University of South Australia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
151	FLSmiljo	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
152	FMG Timberjack Inc. - Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
153	Food and Agriculture Organization of the United Nations - Rome	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
154	Forest Research Institute Malaysia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
155	Forestry and Agricultural Biotechnology Institute	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
156	Forestry Commission Tasmania	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
157	Forestry Suppliers, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
158	Fortune Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
159	Forum Media Utama - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
160	FranklinCovey.Co.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
161	Free Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
162	Freiburger Forstliche Forschung, HEFT 68	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
163	Frog, Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
164	Galileo Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
165	GALLUP PRESS - New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
166	Garlock Pty. Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
167	Gema Insani - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
169	GIS World, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
170	Gitamedia Press, Surabaya	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
171	Gollancz	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
172	Goverment Institutes, Rockville, MD, USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
173	Gower B	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
174	Gower Publishing	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
175	GPS TEchnologies, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
177	Graham Brash (Pte) Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
178	Grama Bazita, MCP-GB Management Consultants	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
179	Gramercy Books New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
180	GRASINDO, PT. Gramedia Widiasarana Indonesia - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
181	Gregg Division / McGraw Hill Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
183	Hardkonocks Factory Sdn.Bhd., Malaysia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
184	Harmony Books, an inprint of the Crown Publishing Group, United States	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
185	Harper Collins	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
186	Harvard Business School Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
187	Hewlett Packard Company	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
188	Highroads Media, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
189	Hodder & Stoughton	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
190	Houghton Mifflin Company - Boston - New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
191	How To Books Ltd, United Kingdom	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
192	Humana Press Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
193	Hutchinson	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
194	Icon Books UK, Totem Books USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
195	IDCON, INC	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
196	IDG Books Worldwide, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
197	IMD ; Robert F.Mager	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
198	Indonesia Journal for Sustainable Future - Jakarta Selatan	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
199	Indonesian Quality Management Association	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
200	Industrial Press Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
201	Infokom Elektrindo - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
202	Inixindo Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
203	Inland Company	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
204	Institut Darma Mahardika, Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
205	Institute of Paper Science and Technology, Atlanta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
206	Institute of Southeast Asian Studies, Singapore	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
207	Interaksara - Batam Centre	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
208	Interforest AB - Stockholm	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
209	International Conference Centre	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
210	International Convention Centre, Durban	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
211	International Organization for Standardization	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
212	International Tropical Timber Organization (ITTO)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
213	IPS Asia & IPS Europe	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
214	iSDM, Certification & Training Center for HR Specialist	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
215	ITTO: International Tropical Timber Organization	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
216	Jaakko Poyry	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
218	JET-A-MARK , DOD'5000 ,	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
219	John Wiley & Sons Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
220	John Wiley & Sons, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
221	Joint Textbook Commitee of the Paper Industry TAPPI -CPPA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
222	Joseph Henry Press - Washington, DC.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
223	Jossey-Bass, A Wiley Company	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
224	Jphn Wiley & Sons	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
225	Judy Piatkus (Publishers) Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
226	Kaifa - PT. Mizan Pustaka	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
227	Karisma Publishing Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
228	Karlstad University	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
229	Kartika Surabaya	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
230	Kata Hasta Pustaka	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
231	Katakita, Depok Estate.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
232	Kementrian Negara Lingkungan Hidup	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
233	Kepustakaan Populer Gramedia (KPG), Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
234	Kodansha International Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
235	Kogan Page Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
236	Komatsu	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
237	Konfrensi Nasional Produksi Bersih 2006	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
238	Kongres Kehutanan Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
239	Departemen Perindustrian Republik Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
240	KVAERNER	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
241	La Commision Scolaire, De La Jonquiere	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
242	LDI Training, (Leading Edge Courses for Professionals)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
243	Lembaga Ekolable Indonesia (LEI)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
244	Lembaga Manajemen PPM	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
245	Lentera Dipantara - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
247	Lewis	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
248	Linkoping University, Department of Management & Economics, Sweden	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
249	Lintas Media, Jombang	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
250	Liro Forestry Solution, New Zealand	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
251	Little, Brown and Company	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
252	LOCTITE	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
253	LONTAR	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
254	Lorentzen & Wettre - Sweden	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
255	Lucas-Nulle GmBH (LH)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
256	Macmillan an imprint of Pan Macmillan Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
257	Macmillan Bloeder Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
258	MAGNA Industrial Co. Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
259	Maintenance Departement	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
260	Majalah Intisari	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
261	Management Development International (MDI) - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
262	Marcel Dekker Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
263	Marcel Dekker, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
264	MarcusEvans	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
265	Markad Service Co,.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
266	Marshall Cavendish International (Asia) Private Limited	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
267	Massachusetts Institute of Technology	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
268	Matahari, Sleman Yogyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
270	Maysville	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
271	Mercy Relief	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
272	Mestika Nusa Jaya	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
273	Metal Fabrication	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
274	MetroBooks	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
275	Metso Paper, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
276	Mettler Toledo, Inc. - USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
277	Microsoft Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
278	Miller Freeman Inc. San Francisco	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
279	Millwright	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
280	Mind Resources, Learning Solutions Driving Results	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
281	Minister of Environment Minister of Supply and Services Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
282	Ministry of Education Schools Department Curriculum Development Branch	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
283	Mitsuboshi Belting LTD.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
284	MM Corp - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
285	Morgan & Claypool Publishers	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
287	MSA International, USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
288	Nakhlah Pustaka - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
290	National Association of Corrosion Engineers, Houston, Texas	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
291	National Metal and Engineering Curriculum	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
292	National System of Restrical Electrical Licenses	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
294	Nicholas Brealey Publishing	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
295	NIDI - Nickel Development Institute	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
296	Nightingale-Conant Corp	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
297	Noss	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
298	Noyes Publications - USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
299	Office - Professional - Institute, (OPI)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
300	Ohio University Press - Athens	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
301	Onan Corporation / Cummins Engine Company	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
302	ORACLE university	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
303	Orient Paperbacks Delhi-Mumbai	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
304	OTI - Organisasi Transformasi International, & APRIL	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
305	Pall Industrial Hydraulics Corporation, New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
306	Pan Pacific Conference	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
307	Paper Industry Technical Association (PITA)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
308	PC-Media Magazines 2006	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
309	Pearson Education Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
310	PEC-Tech	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
311	Pemerintah Republik Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
314	Penerbit ANDI - Yokyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
315	Penerbit ARGA - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
316	Penerbit Buku Kedokteran, EGC - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
317	Kompas (penerbit buku)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
318	Penerbit Djambatan	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
319	Penerbit Erlangga - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
320	Penerbit Harvarindo - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
321	Penerbit Informatika - Bandung	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
323	Penerbit ITB	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
324	Penerbit Kanisius	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
325	Penerbit MITRA UTAMA - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
326	Penerbit Progres - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
328	Penerbit PT. Bentang Pustaka - Yogyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
329	Penerbit Qanita, PT. Mizan Pustaka Bandung	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
330	Penerbit REPUBLIKA - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
331	Penerbit Sinar Grafika - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
332	Penguin Books Ltd (Penguin Group)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
333	Pesantren Karya Basmala Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
334	Pfeiffer, A Wiley Imprint	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
335	Phoenix Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
337	Piatkus Books Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
338	Pilgrim Software Inc	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
339	PIRA International	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
340	PMS INDUSTRIAL ENGINEERING	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
341	Polity Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
342	PPMR Press, Program Pemberdayaan Masyarakat Riau, PT. RAPP	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
343	PQM, Productivity & Quality Management Consultants	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
344	Pradnya Paramita - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
345	Prentice Hall, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
346	Prestasi Pustaka Publisher	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
347	Princeton University Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
348	Printice-Hall, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
349	Proceeding Co.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
350	Productivity Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
351	Profile Books Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
352	Program Committee and Korea TAPPI	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
353	Program Pemberdayaan Masyarakat Riau (PPMR)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
354	Program Pengembangan Kondisi & Lingkungan Kerja Dept. Tenaga Kerja	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
356	Prometheus Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
357	Psychology Press - New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
358	PT Fiqry Jaya Manunggal	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
359	PT Kawan Pustaka Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
360	PT. Berca Niaga Medika & Agilent Technologies	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
361	PT. Betawindo Valve & Fitting - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
362	PT. Bhuana Ilmu Populer - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
363	PT. Cahaya Insan Suci - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
365	PT. Elex Media Komputindo	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
366	PT. Fiqry Jaya Manunggal - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
367	PT. Gramedia Pustaka Utama	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
368	PT. INTI INDRAYON UTAMA PORSEA , TAPUT , SUMATERA UTARA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
369	PT. Kawan Pustaka - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
370	PT. MHE-DEMAG Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
371	PT. Obor Sarana Utama	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
372	PT. Patria Utama Humanindo	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
373	PT. Patriatek Bhineka Pratama	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
374	PT. PERTAMINA (PERSERO)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
375	PT. Pradnya Paramita	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
376	PT. Prestasi Pustakaraya Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
377	PT. Pustaka Binaman Pressindo	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
378	PT. Pustaka Delapratasa	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
379	PT. Pustaka Utama Grafiti - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
380	PT. RajaGrafindo Persada - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
381	PT. Riau Andalan Pulp & Paper	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
382	PT. Salemba Empan Patria - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
383	PT. Serambi Ilmu Semesta - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
384	PT. Syaamil Cipta Media - Bandung	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
385	PT. Transmedia - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
386	PT. Trubus Swadaya	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
387	PT. United Tractors	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
388	PT. Wisnu Inter Sains Hakiki	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
389	Pulp and paper research institute of Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
390	Asosiasi Penelitian Perkebunan Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
392	Pusat Produksi Bersih Nasional (PPBN) - Banten	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
393	Pusat Studi Lingkungan Hidup Universitas Gadjah Mada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
394	Puspa Swara, Anggota IKAPI - Cimanggis	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
395	Pustaka Alvabet, Anggota IKAPI	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
396	Pustaka Bisnis Indonesia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
397	Pustaka Fahima - Yokyakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
398	Qisthi Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
399	Quality Council of Indiana	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
400	Quercus Publishing Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
401	Ralph T. Buscarello President Update International,Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
402	Random House Business Books	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
403	RECOFTC	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
404	Recycle Linerboard Mill Training	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
405	Reed New Holland Publisher (Australia)Pty Ltd	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
406	Refratechnik GmbH	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
407	Reliability Centre Inc,	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
408	Rena Focus	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
409	Research & Education Assoc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
411	RMIT	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
412	Robrt F. Mager & Peter Pipe	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
413	Routledge	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
414	Royal Society of Chemistry	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
415	RTTCO	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
416	Rutgers, The StateUniversity	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
417	Rylson Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
418	SAGE Publication Ltd	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
419	SAIT	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
420	SanDisk Corporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
421	Sandvik - Singapore	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
423	SAP PRESS & Galileo Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
424	Saunders College	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
425	Scandinavian Pulp, Paper and Board Testing Committee, Sweden	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
426	Seminar	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
427	Seventh Workshop-CIFOR	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
428	Shambhala Publications, Inc. - Boston	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
429	SIEMENS	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
430	Simon & Schuster Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
431	Sinar Grafika - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
432	SISINDOKOM Education Center	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
433	SKF	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
434	Skogsindustrins Utbildning i Markaryd AB	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
435	Sourcebooks, Inc	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
436	Spirax Sarco, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
437	Springer	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
438	ST. Martin, Press - New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
439	Stainless Steel Development Association (ASSDA)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
440	Standards Association of Australia, Incorporated by Royal Charter	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
441	STFI STFI, (Swedish Pulp & Paper Research Institute)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
442	Sunraysia College of TAFE, Austria	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
443	Sveriges Skogsindustriforbund	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
444	SWARAHIJAU	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
445	Swiss Agency for the Environment, Forests and Landscape (SAEFL), Berne	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
446	TAPPI - People Resources Solutions	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
447	Taramedia	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
448	Tata MgGraw Hill	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
449	Tech. Publication PTE. Ltd. - Singapore	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
450	Technical Associated of Charlotte, P.C., USA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
451	Technical Association of the Pulp & Paper Industry, New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
452	Technical Section Canadian Pulp and Paper Association	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
453	Technomic Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
454	Tess Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
455	Thames & Hudson Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
456	The American Forest & Paper Association	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
457	The American Paper Institute, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
458	The American Society of Mechanical Engineers	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
459	The Berkley Publishing Group	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
460	The Career Press, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
461	The Economist Intelligence Unit	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
462	The Fairmont Press, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
463	The Finnish Paper Engineer's Association - Finland	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
464	The Free Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
465	The Indonesia Business Links	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
466	The Indonesian Ecolabelling Institute	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
467	The Jossey-Bass Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
468	The McGraw-Hill Companies	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
469	The Orion Publishing Group Ltd. - London	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
470	The Royal Society of Chemistry	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
471	The Southern African Institute of Forestry	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
472	The Standards Association of Australia Standards House	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
473	The Torrington Compant - Indiana	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
474	The University of Chicago Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
476	Thomson Wadsworth	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
477	Thorsons Audio	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
478	Tim Penerbit Interaksara - Batam Centre	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
479	Timberjack Inc. Canada	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
480	TINTA (Kelompok Penerbit Qalam)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
481	Tissue World, Asia 2006, Organized by CMP - United Busines Media	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
482	Tom Doherty Associates, LLC - New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
483	Toyota & Astra	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
484	TPC-Training Systems, A Division of Telemedia, Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
486	Truedee Books & Gagas Media - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
487	Tuttle	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
488	U.S Environmental Protection Agency	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
489	UFUK PRESS	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
490	UN Resident Coordinator and UNDP Resident Representative	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
491	Uniba Press (Universitas Islam Batik - Surakarta)	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
492	OUP Oxford	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
493	UNRI Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
494	UPM-Kymmene Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
495	UPPDRAGS AB	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
496	Upstart	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
497	V.Van Der Watt	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
498	Valmet Fibertech AB	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
499	Varian Analytical Instruments	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
500	VCI - Printed in the United States of America	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
501	Ebury Press	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
502	Vertical, Inc., New York	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
503	Vickers, Incorporation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
504	Vincent Foundation	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
505	Vintage	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
508	Voyager, An Imprint of HarperCollins Publisher	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
509	W.W. Norton & Company, New York - London	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
510	Wahana Kendali Mutu, Quality Management Consultant	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
511	Wahana Komputer, dan Penerbit ANDI	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
512	WaterBrook Press - Colorado	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
513	Wettre dan Elof Hansson	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
514	Wharton School Publishing	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
515	WIKA	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
516	Wiley Publishing Inc.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
517	William Heinemann	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
518	William Morrow, An Imprint of HarperCollinsPublisher	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
519	Williams Learning Network	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
520	World Scientific Publishing Co. Pte. Ltd.	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
521	World Trade Center University - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
522	Yayasan Sarana Cipta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
523	Yayasan Sembada Swakarya - Jakarta	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
524	Yayasan Sosial Pendidikan AINI	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
525	Ziff-Davis Press - California	2009-07-24 19:31:16.3+07	2009-07-24 19:31:16.3+07
526	PT. Gramedia Pustaka Utama	2017-07-26 16:11:49.513+07	2017-07-26 16:11:49.513+07
527	Bentang	2009-09-01 11:32:54.007+07	2009-09-01 11:32:54.007+07
528	Kanisius	2009-09-01 11:51:24.427+07	2009-09-01 11:51:24.427+07
529	MQS Publishing	2009-09-14 14:02:32.203+07	2009-09-14 14:02:32.203+07
530	Thomas Nelson Publishers	2009-09-15 10:14:05.593+07	2009-09-15 10:14:05.593+07
531	McGRAW-HILL	2009-09-16 09:49:07.193+07	2009-09-16 09:49:07.193+07
532	Lominger International	2009-09-17 08:57:24.76+07	2009-09-17 08:57:24.76+07
533	The Fairmont Press Inc	2009-10-08 13:58:33.103+07	2009-10-08 13:58:33.103+07
534	Progressio	2009-10-09 11:19:32.07+07	2009-10-09 11:19:32.07+07
535	Kesaint Blanc	2009-10-12 10:55:27.05+07	2009-10-12 10:55:27.05+07
536	Harlequin Books 	2009-10-17 09:24:12.78+07	2009-10-17 09:24:12.78+07
537	METANOIA	2009-11-06 09:23:51.307+07	2009-11-06 09:23:51.307+07
538	Diglossia Media Associates	2009-11-09 09:50:05.253+07	2009-11-09 09:50:05.253+07
539	Newnes	2009-12-08 11:38:01.41+07	2009-12-08 11:38:01.41+07
540	Penebar Swadaya	2009-12-11 13:42:32.63+07	2009-12-11 13:42:32.63+07
541	Arcan	2009-12-11 16:45:51.513+07	2009-12-11 16:45:51.513+07
542	Lembaga Ekolabel Indonesia	2009-12-14 11:33:55.697+07	2009-12-14 11:33:55.697+07
543	Gulf Professional Publishing	2009-12-22 09:07:09.587+07	2009-12-22 09:07:09.587+07
544	Batavia Press	2010-01-12 14:56:32.717+07	2010-01-12 14:56:32.717+07
545	ASQC Quality Press	2010-01-14 13:33:37.687+07	2010-01-14 13:33:37.687+07
546	Delmar Thomson Learning	2010-01-19 13:36:43.91+07	2010-01-19 13:36:43.91+07
547	Adicita Karya Nusa	2010-01-21 14:25:22.567+07	2010-01-21 14:25:22.567+07
548	Catapult, Inc	2010-01-22 10:45:31.547+07	2010-01-22 10:45:31.547+07
549	Artech House, Inc	2010-01-25 13:33:07.827+07	2010-01-25 13:33:07.827+07
550	Abdi Tandur	2010-01-26 13:45:49.023+07	2010-01-26 13:45:49.023+07
551	National Geographic	2010-02-17 14:13:05.05+07	2010-02-17 14:13:05.05+07
552	Centre for Management Tech.	2010-02-20 09:31:10.127+07	2010-02-20 09:31:10.127+07
553	Ilka T. Kuusisto	2010-02-22 08:13:32.32+07	2010-02-22 08:13:32.32+07
554	Cakra Buana Nusantara	2010-02-24 14:05:56.953+07	2010-02-24 14:05:56.953+07
555	Ballantine Books	2010-02-25 15:42:53.75+07	2010-02-25 15:42:53.75+07
556	Thomson Delmar Learning	2010-03-20 08:27:47.6+07	2010-03-20 08:27:47.6+07
557	Pustaka Spirit	2010-03-20 09:37:54.583+07	2010-03-20 09:37:54.583+07
558	AKAR Indonesia	2010-03-23 10:40:53.017+07	2010-03-23 10:40:53.017+07
559	Fakultas Kedokteran UI	2010-03-25 09:06:52.003+07	2010-03-25 09:06:52.003+07
560	Gradien Books	2010-03-30 09:01:29.163+07	2010-03-30 09:01:29.163+07
561	Atlantis	2010-03-30 15:42:35.473+07	2010-03-30 15:42:35.473+07
562	Ordfronts Forlag	2010-03-30 15:46:11.883+07	2010-03-30 15:46:11.883+07
563	Pustaka Sinar Harapan	2010-03-31 09:26:48.13+07	2010-03-31 09:26:48.13+07
564	Restu Agung	2010-04-13 14:52:53.367+07	2010-04-13 14:52:53.367+07
565	Business Plus	2010-04-19 14:48:23.663+07	2010-04-19 14:48:23.663+07
566	AW Publishing	2010-06-04 10:52:36.49+07	2010-06-04 10:52:36.49+07
567	CV Angkasa Raya	2010-08-09 14:47:18.983+07	2010-08-09 14:47:18.983+07
568	Gava Media	2010-08-09 14:47:59.14+07	2010-08-09 14:47:59.14+07
569	CV Genta	2010-08-09 14:51:35.22+07	2010-08-09 14:51:35.22+07
570	Seashell Publishers	2010-08-31 10:57:54.37+07	2010-08-31 10:57:54.37+07
571	Flamingo	2010-10-07 10:21:32.503+07	2010-10-07 10:21:32.503+07
572	Picador	2010-10-07 10:23:43.287+07	2010-10-07 10:23:43.287+07
573	Pocket Books	2010-10-07 10:25:51.88+07	2010-10-07 10:25:51.88+07
574	Sam Bourne	2010-10-08 09:17:05.247+07	2010-10-08 09:17:05.247+07
575	TOR Books	2010-10-21 11:47:48.42+07	2010-10-21 11:47:48.42+07
576	Forrest W Breyfogle	2010-11-09 10:17:15.85+07	2010-11-09 10:17:15.85+07
577	BBC Books	2010-11-25 10:50:52.407+07	2010-11-25 10:50:52.407+07
578	Visipro	2010-12-14 09:34:35.1+07	2010-12-14 09:34:35.1+07
579	Open University Press	2010-12-15 14:01:46.053+07	2010-12-15 14:01:46.053+07
580	Pan Books	2010-12-15 14:04:05.587+07	2010-12-15 14:04:05.587+07
581	World Library of Educationalists	2010-12-15 14:37:08.1+07	2010-12-15 14:37:08.1+07
582	None	2011-02-01 08:41:59.787+07	2011-02-01 08:41:59.787+07
583	Polity	2011-02-01 08:52:23.897+07	2011-02-01 08:52:23.897+07
584	Alva Bet	2011-02-01 10:04:28.413+07	2011-02-01 10:04:28.413+07
585	Intellectual Publishing	2011-02-02 08:12:51.677+07	2011-02-02 08:12:51.677+07
586	KPPSM	2011-02-02 09:54:43.88+07	2011-02-02 09:54:43.88+07
587	Dale Carnegie	2011-02-02 15:58:54.66+07	2011-02-02 15:58:54.66+07
588	Pusat Pengembangan Pendidikan Universitas Riau	2011-03-04 10:26:00.98+07	2011-03-04 10:26:00.98+07
589	Industrial Press Inc	2011-04-18 09:47:18.493+07	2011-04-18 09:47:18.493+07
590	Pengembangan Eksekutif (PPM)	2011-05-10 15:07:17.36+07	2011-05-10 15:07:17.36+07
591	Valmet	2011-06-15 10:25:31.66+07	2011-06-15 10:25:31.66+07
592	TAPPI PRESS	2012-01-18 11:24:24.477+07	2012-01-18 11:24:24.477+07
593	Springer	2012-01-18 11:25:15.477+07	2012-01-18 11:25:15.477+07
594	International Thomson Publishing	2012-01-18 11:27:00.553+07	2012-01-18 11:27:00.553+07
595	PennWell	2012-01-18 11:28:10.77+07	2012-01-18 11:28:10.77+07
596	American Society for Quality (ASQ)	2012-02-09 14:01:10.077+07	2012-02-09 14:01:10.077+07
597	WILEY	2012-02-09 14:13:29.49+07	2012-02-09 14:13:29.49+07
598	AVO International	2012-02-09 14:15:48.067+07	2012-02-09 14:15:48.067+07
599	Toastmaster International	2012-02-15 10:52:44.47+07	2012-02-15 10:52:44.47+07
600	Emerson	2012-03-19 09:40:07.15+07	2012-03-19 09:40:07.15+07
601	Bridgeway	2012-03-19 09:50:47+07	2012-03-19 09:50:47+07
602	Shingo Prize	2012-03-19 09:51:35.11+07	2012-03-19 09:51:35.11+07
603	Walter Isaacson	2013-02-15 15:32:36.75+07	2013-02-15 15:32:36.75+07
604	Mc Graw Hill	2013-03-07 10:25:32.61+07	2013-03-07 10:25:32.61+07
605	Simon & Schuster	2013-03-07 10:28:54.56+07	2013-03-07 10:28:54.56+07
606	Virgin Publishing 	2013-10-01 10:46:00.11+07	2013-10-01 10:46:00.11+07
607	Sinar Kejora	2014-02-27 10:42:37.007+07	2014-02-27 10:42:37.007+07
608	Bumi Aksara	2014-02-27 10:43:51.803+07	2014-02-27 10:43:51.803+07
609	Selaksa	2014-02-27 10:45:17.77+07	2014-02-27 10:45:17.77+07
610	The Japan Institute of Plant Maintenance	2014-07-11 09:08:08.683+07	2014-07-11 09:08:08.683+07
611	Minergy Informasi Indonesia	2014-12-03 11:10:49.533+07	2014-12-03 11:10:49.533+07
612	Harapan Press	2014-12-03 11:14:13.953+07	2014-12-03 11:14:13.953+07
613	Pohon Cahaya	2014-12-03 11:17:18.143+07	2014-12-03 11:17:18.143+07
614	Nelson Business	2015-04-27 11:41:01.277+07	2015-04-27 11:41:01.277+07
615	Mizan	2015-04-27 11:43:00.433+07	2015-04-27 11:43:00.433+07
616	Water Brook	2015-05-27 10:55:44.85+07	2015-05-27 10:55:44.85+07
617	Kreatif	2015-05-27 10:56:11.27+07	2015-05-27 10:56:11.27+07
618	The North River 	2016-02-24 10:19:46.033+07	2016-02-24 10:19:46.033+07
619	A. Aruleswaran	2016-02-25 08:37:32.227+07	2016-02-25 08:37:32.227+07
620	Steve Litt	2016-02-25 09:33:57.967+07	2016-02-25 09:33:57.967+07
621	Noura Books	2016-06-02 16:31:39.547+07	2016-06-02 16:31:39.547+07
622	Badan Litbang ESDM	2016-08-23 11:38:03.087+07	2016-08-23 11:38:03.087+07
623	Crown Business	2017-07-27 11:02:31.843+07	2017-07-27 11:02:31.843+07
624	World Trade Press	2018-05-09 14:22:48.3+07	2018-05-09 14:22:48.3+07
625	Nourabooks	2018-12-08 10:48:40.057+07	2018-12-08 10:48:40.057+07
626	Perseus Books	2019-07-04 15:55:00.91+07	2019-07-04 15:55:00.91+07
627	Pfeiffer	2019-11-27 11:13:49.007+07	2019-11-27 11:13:49.007+07
628	PT. Mitrakerjaya Indonesia 	2019-11-29 10:23:17.93+07	2019-11-29 10:23:17.93+07
629	Wana Aksara	2019-11-29 11:20:22.303+07	2019-11-29 11:20:22.303+07
630	Yayasan Karaniya	2019-11-29 11:36:54.6+07	2019-11-29 11:36:54.6+07
631	Information AGE Publishing Inc. 	2019-12-03 07:08:27.32+07	2019-12-03 07:08:27.32+07
632	Visi Media	2019-12-03 07:09:27.28+07	2019-12-03 07:09:27.28+07
633	Erlangga	2022-08-10 17:38:51.31+07	2022-08-10 17:38:51.31+07
\.


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20220628085825-create-users.js
20220628090147-create-items.js
20220628090408-create-borrow.js
20220727080320-create-alert.js
20220805133257-create-category.js
20220805133426-create-author.js
20220805133458-create-publisher.js
20220808163103-create-shelf.js
\.


--
-- Data for Name: Shelves; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Shelves" (id, "shelfName", "createdAt", "updatedAt") FROM stdin;
1	01-C-43	2012-01-20 10:16:08.383+07	2012-01-20 10:16:08.383+07
2	01-A-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
3	01-A-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
4	01-A-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
5	01-A-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
6	01-A-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
7	01-A-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
8	01-A-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
9	01-A-08	2009-09-03 14:18:40.347+07	2009-09-03 14:18:40.347+07
10	01-A-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
11	01-A-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
12	01-A-11	2009-08-19 16:29:26.753+07	2009-08-19 16:29:26.753+07
13	01-A-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
14	01-A-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
15	01-A-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
16	01-A-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
17	01-A-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
18	01-A-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
19	01-A-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
20	01-A-19	2010-02-20 09:44:57.933+07	2010-02-20 09:44:57.933+07
21	01-A-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
22	01-A-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
23	01-A-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
24	01-A-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
25	01-A-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
26	01-A-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
27	01-A-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
28	01-A-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
29	01-A-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
30	01-A-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
31	01-A-30	2009-08-19 16:30:05.91+07	2009-08-19 16:30:05.91+07
32	01-A-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
33	01-A-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
34	01-A-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
35	01-A-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
36	01-A-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
37	01-A-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
38	01-A-37	2009-09-01 10:59:25.38+07	2009-09-01 10:59:25.38+07
39	01-A-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
40	01-A-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
41	01-A-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
42	01-A-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
43	01-A-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
44	01-A-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
45	01-A-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
46	01-A-45	2009-09-15 15:37:54.637+07	2009-09-15 15:37:54.637+07
47	01-A-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
48	01-A-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
49	01-A-48	2009-10-08 14:16:30.513+07	2009-10-08 14:16:30.513+07
50	01-A-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
51	01-A-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
52	01-A-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
53	01-A-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
54	01-A-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
55	01-A-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
56	01-A-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
57	01-A-56	2009-09-01 10:59:47.067+07	2009-09-01 10:59:47.067+07
58	01-A-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
59	01-A-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
60	01-A-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
61	01-A-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
62	01-A-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
63	01-A-62	2019-07-03 14:52:30.287+07	2019-07-03 14:52:30.287+07
64	01-A-63	2019-11-29 11:42:57.757+07	2019-11-29 11:42:57.757+07
65	01-A-64 	2019-11-29 14:58:52.597+07	2019-11-29 14:58:52.597+07
66	01-A-65	2019-12-02 10:23:22.79+07	2019-12-02 10:23:22.79+07
67	01-B-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
68	01-B-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
69	01-B-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
70	01-B-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
71	01-B-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
72	01-B-06	2009-09-17 10:04:28.997+07	2009-09-17 10:04:28.997+07
73	01-B-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
74	01-B-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
75	01-B-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
76	01-B-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
77	01-B-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
78	01-B-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
79	01-B-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
80	01-B-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
81	01-B-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
82	01-B-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
83	01-B-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
84	01-B-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
85	01-B-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
86	01-B-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
87	01-B-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
88	01-B-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
89	01-B-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
90	01-B-25	2011-05-27 09:26:29.88+07	2011-05-27 09:26:29.88+07
91	01-B-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
92	01-B-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
93	01-B-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
94	01-B-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
95	01-B-30	2010-01-14 13:26:33.323+07	2010-01-14 13:26:33.323+07
96	01-B-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
97	01-B-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
98	01-B-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
99	01-B-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
100	01-B-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
101	01-B-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
102	01-B-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
103	01-B-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
104	01-B-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
105	01-B-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
106	01-B-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
107	01-B-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
108	01-B-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
109	01-B-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
110	01-B-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
111	01-B-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
112	01-B-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
113	01-B-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
114	01-B-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
115	01-B-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
116	01-B-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
117	01-B-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
118	01-B-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
119	01-B-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
120	01-B-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
121	01-B-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
122	01-B-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
123	01-B-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
124	01-B-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
125	01-B-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
126	01-B-62	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
127	01-B-63	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
128	01-B-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
129	01-B-65	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
130	01-B-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
131	01-B-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
132	01-B-68	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
133	01-B-69	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
134	01-B-70	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
135	01-B-71	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
136	01-B-72	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
137	01-B-73	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
138	01-B-74	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
139	01-B-75	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
140	01-C-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
141	01-C-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
142	01-C-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
143	01-C-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
144	01-C-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
145	01-C-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
146	01-C-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
147	01-C-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
148	01-C-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
149	01-C-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
150	01-C-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
151	01-C-12	2010-01-12 14:15:11.76+07	2010-01-12 14:15:11.76+07
152	01-C-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
153	01-C-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
154	01-C-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
155	01-C-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
156	01-C-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
157	01-C-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
158	01-C-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
159	01-C-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
160	01-C-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
161	01-C-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
162	01-C-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
163	01-C-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
164	01-C-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
165	01-C-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
166	01-C-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
167	01-C-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
168	01-C-29	2009-10-16 09:57:55.91+07	2009-10-16 09:57:55.91+07
169	01-C-30	2009-12-10 15:59:54.77+07	2009-12-10 15:59:54.77+07
170	01-C-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
171	01-C-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
172	01-C-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
173	01-C-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
174	01-C-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
175	01-C-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
176	01-C-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
177	01-C-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
178	01-C-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
179	01-C-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
180	01-C-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
181	01-C-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
182	01-C-43	2012-01-20 10:17:59.367+07	2012-01-20 10:17:59.367+07
183	01-C-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
184	01-C-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
185	01-C-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
186	01-C-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
187	01-C-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
188	01-C-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
189	01-C-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
190	01-C-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
191	01-C-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
192	01-C-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
193	01-C-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
194	01-C-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
195	01-C-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
196	01-C-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
197	01-C-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
198	01-C-60	2011-03-03 11:34:08.05+07	2011-03-03 11:34:08.05+07
199	01-C-61	2011-03-03 11:34:18.397+07	2011-03-03 11:34:18.397+07
200	01-C-62	2011-10-05 11:16:12.337+07	2011-10-05 11:16:12.337+07
201	01-D-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
202	01-D-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
203	01-D-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
204	01-D-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
205	01-D-07	2009-11-23 14:02:05.46+07	2009-11-23 14:02:05.46+07
206	01-D-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
207	01-D-09	2011-04-14 10:51:27.217+07	2011-04-14 10:51:27.217+07
208	01-D-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
209	01-D-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
210	01-D-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
211	01-D-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
212	01-D-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
213	01-D-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
214	01-D-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
215	01-D-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
216	01-D-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
217	01-D-19	2012-01-18 11:21:06.45+07	2012-01-18 11:21:06.45+07
218	01-D-20	2012-01-18 11:21:19.323+07	2012-01-18 11:21:19.323+07
219	01-D-21	2012-01-18 11:21:59.48+07	2012-01-18 11:21:59.48+07
220	01-D-22	2012-01-18 11:22:07.633+07	2012-01-18 11:22:07.633+07
221	01-D-23	2012-01-18 11:22:14.633+07	2012-01-18 11:22:14.633+07
222	01-D-24	2013-07-26 11:25:19.253+07	2013-07-26 11:25:19.253+07
223	01-D-25	2013-07-26 11:25:28.677+07	2013-07-26 11:25:28.677+07
224	01-D-26	2013-07-26 11:25:36.99+07	2013-07-26 11:25:36.99+07
225	01-D-33	2014-12-04 08:54:15.667+07	2014-12-04 08:54:15.667+07
226	01-D-37	2014-12-04 08:54:56.82+07	2014-12-04 08:54:56.82+07
227	01-D-38	2019-11-29 10:11:34.237+07	2019-11-29 10:11:34.237+07
228	02-A-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
229	02-A-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
230	02-A-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
231	02-A-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
232	02-A-05	2009-09-16 09:48:01.363+07	2009-09-16 09:48:01.363+07
233	02-A-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
234	02-A-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
235	02-A-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
236	02-A-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
237	02-A-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
238	02-A-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
239	02-A-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
240	02-A-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
241	02-A-15	2012-02-02 09:49:25.133+07	2012-02-02 09:49:25.133+07
242	02-A-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
243	02-A-17	2009-11-23 14:47:34.103+07	2009-11-23 14:47:34.103+07
244	02-A-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
245	02-A-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
246	02-A-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
247	02-A-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
248	02-A-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
249	02-A-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
250	02-A-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
251	02-A-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
252	02-A-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
253	02-A-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
254	02-A-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
255	02-A-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
256	02-A-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
257	02-A-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
258	02-A-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
259	02-A-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
260	02-A-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
261	02-A-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
262	02-A-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
263	02-A-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
264	02-A-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
265	02-A-40	2013-02-15 09:35:49.777+07	2013-02-15 09:35:49.777+07
266	02-A-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
267	02-A-42	2010-01-18 13:23:58.86+07	2010-01-18 13:23:58.86+07
268	02-A-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
269	02-A-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
270	02-A-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
271	02-A-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
272	02-A-48	2010-02-02 08:04:38.11+07	2010-02-02 08:04:38.11+07
273	02-A-49	2010-01-15 14:00:14.42+07	2010-01-15 14:00:14.42+07
274	02-A-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
275	02-B-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
276	02-B-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
277	02-B-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
278	02-B-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
279	02-B-05	2011-04-18 09:43:13.517+07	2011-04-18 09:43:13.517+07
280	02-B-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
281	02-B-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
282	02-B-08	2009-09-08 14:40:08.45+07	2009-09-08 14:40:08.45+07
283	02-B-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
284	02-B-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
285	02-B-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
286	02-B-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
287	02-B-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
288	02-B-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
289	02-B-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
290	02-B-17	2009-12-22 08:16:32.33+07	2009-12-22 08:16:32.33+07
291	02-B-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
292	02-B-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
293	02-B-21 	2016-11-21 14:07:08.623+07	2016-11-21 14:07:08.623+07
294	02-B-22	2009-09-14 13:55:55.29+07	2009-09-14 13:55:55.29+07
295	02-B-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
296	02-B-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
297	02-B-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
298	02-B-26	2010-02-15 15:55:56.12+07	2010-02-15 15:55:56.12+07
299	02-B-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
300	02-B-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
301	02-B-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
302	02-B-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
303	02-B-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
304	02-B-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
305	02-B-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
306	02-B-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
307	02-B-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
308	02-B-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
309	02-B-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
310	02-B-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
311	02-B-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
312	02-B-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
313	02-B-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
314	02-B-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
315	02-B-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
316	02-B-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
317	02-B-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
318	02-B-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
319	02-B-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
320	02-B-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
321	02-B-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
322	02-B-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
323	02-B-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
324	02-B-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
325	02-B-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
326	02-B-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
327	02-B-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
328	02-B-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
329	02-B-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
330	02-B-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
331	02-B-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
332	02-B-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
333	02-B-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
334	02-B-62	2010-09-21 15:40:13.893+07	2010-09-21 15:40:13.893+07
335	02-B-63	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
336	02-B-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
337	02-B-65	2010-01-19 15:31:22.833+07	2010-01-19 15:31:22.833+07
338	02-B-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
339	02-C-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
340	02-C-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
341	02-C-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
342	02-C-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
343	02-C-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
344	02-C-06	2010-02-22 15:42:37.54+07	2010-02-22 15:42:37.54+07
345	02-C-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
346	02-C-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
347	02-C-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
348	02-C-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
349	02-C-12	2011-02-18 14:45:33.073+07	2011-02-18 14:45:33.073+07
350	02-C-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
351	02-C-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
352	02-C-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
353	02-C-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
354	02-C-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
355	02-C-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
356	02-C-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
357	02-C-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
358	02-C-21	2009-10-08 13:56:19.083+07	2009-10-08 13:56:19.083+07
359	02-C-22	2010-01-19 15:48:50.83+07	2010-01-19 15:48:50.83+07
360	02-C-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
361	02-C-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
362	02-C-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
363	02-C-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
364	02-C-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
365	02-C-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
366	02-C-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
367	02-C-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
368	02-C-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
369	02-C-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
370	02-C-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
371	02-C-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
372	02-C-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
373	02-C-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
374	02-C-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
375	02-C-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
376	02-C-39	2010-01-25 13:26:53.38+07	2010-01-25 13:26:53.38+07
377	02-c-40	2009-12-08 11:32:54.513+07	2009-12-08 11:32:54.513+07
378	02-c-41	2010-10-20 09:47:27.86+07	2010-10-20 09:47:27.86+07
379	02-C-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
380	02-C-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
381	02-C-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
382	02-C-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
383	02-C-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
384	02-C-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
385	02-C-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
386	02-C-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
387	02-C-50	2013-12-05 09:38:20.573+07	2013-12-05 09:38:20.573+07
388	02-C-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
389	02-C-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
390	02-C-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
391	02-C-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
392	02-C-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
393	02-C-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
394	02-C-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
395	02-D-01	2013-02-15 09:36:09.9+07	2013-02-15 09:36:09.9+07
396	02-D-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
397	02-D-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
398	02-D-04	2009-09-03 14:19:22.537+07	2009-09-03 14:19:22.537+07
399	02-D-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
400	02-D-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
401	02-D-07	2009-09-14 15:40:55.52+07	2009-09-14 15:40:55.52+07
402	02-D-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
403	02-D-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
404	02-D-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
405	02-D-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
406	02-D-13	2011-10-06 11:31:50.297+07	2011-10-06 11:31:50.297+07
407	02-D-14	2011-10-06 11:31:57.623+07	2011-10-06 11:31:57.623+07
408	02-D-15	2011-10-06 11:32:11.767+07	2011-10-06 11:32:11.767+07
409	02-D-16	2011-10-06 11:32:19.233+07	2011-10-06 11:32:19.233+07
410	02-D-17	2011-10-06 11:32:26.83+07	2011-10-06 11:32:26.83+07
411	02-D-18	2011-10-06 11:32:35.06+07	2011-10-06 11:32:35.06+07
412	02-D-19	2011-10-06 11:32:43.08+07	2011-10-06 11:32:43.08+07
413	02-D-20	2011-10-06 11:32:49.72+07	2011-10-06 11:32:49.72+07
414	02-D-21	2011-10-06 11:33:05.297+07	2011-10-06 11:33:05.297+07
415	02-D-22	2011-10-06 11:33:12.673+07	2011-10-06 11:33:12.673+07
416	02-D-23	2011-10-06 11:33:19.47+07	2011-10-06 11:33:19.47+07
417	02-D-24	2011-10-06 11:33:25.97+07	2011-10-06 11:33:25.97+07
418	02-D-25	2011-10-06 11:33:34.187+07	2011-10-06 11:33:34.187+07
419	02-D-26	2012-02-09 11:17:29.813+07	2012-02-09 11:17:29.813+07
420	02-D-27	2012-02-09 11:17:39.377+07	2012-02-09 11:17:39.377+07
421	02-D-28	2012-02-09 11:17:48.86+07	2012-02-09 11:17:48.86+07
422	02-D-29	2012-03-22 11:26:21.11+07	2012-03-22 11:26:21.11+07
423	02-d-30	2012-03-22 11:26:30.533+07	2012-03-22 11:26:30.533+07
424	02-D-31	2012-04-12 08:51:21.767+07	2012-04-12 08:51:21.767+07
425	02-D-32	2014-07-11 08:27:56.56+07	2014-07-11 08:27:56.56+07
426	02-D-33	2014-07-11 08:28:15.357+07	2014-07-11 08:28:15.357+07
427	02-D-34	2014-07-11 08:28:23.87+07	2014-07-11 08:28:23.87+07
428	02-D-35	2014-07-11 08:28:32.513+07	2014-07-11 08:28:32.513+07
429	02-D-36	2014-07-11 08:28:41.543+07	2014-07-11 08:28:41.543+07
430	02-D-37	2014-12-04 08:56:49.837+07	2014-12-04 08:56:49.837+07
431	03-H-04	2011-01-27 09:15:59.25+07	2011-01-27 09:15:59.25+07
432	03 - H - 05	2011-01-27 09:16:09.487+07	2011-01-27 09:16:09.487+07
433	03 - H - 06	2011-01-27 09:16:19.847+07	2011-01-27 09:16:19.847+07
434	03 - H - 07 	2011-01-27 09:16:45.033+07	2011-01-27 09:16:45.033+07
435	03 - H - 08	2011-01-27 09:16:58.783+07	2011-01-27 09:16:58.783+07
436	03 - H - 09	2011-01-27 09:17:07.457+07	2011-01-27 09:17:07.457+07
437	03 - H - 10	2011-01-27 09:17:16.597+07	2011-01-27 09:17:16.597+07
438	03 - H - 11	2011-01-27 09:17:25.237+07	2011-01-27 09:17:25.237+07
439	03 - H - 12	2011-01-27 09:17:38.817+07	2011-01-27 09:17:38.817+07
440	03 - H - 13	2011-01-27 09:17:49.643+07	2011-01-27 09:17:49.643+07
441	03 - H - 14	2011-01-27 09:18:19.8+07	2011-01-27 09:18:19.8+07
442	03 - H - 15	2011-01-27 09:18:36.49+07	2011-01-27 09:18:36.49+07
443	03 - H - 16	2011-01-27 09:18:44.973+07	2011-01-27 09:18:44.973+07
444	03 - H - 17	2011-01-27 09:19:54.867+07	2011-01-27 09:19:54.867+07
445	03 - H - 18	2011-01-27 09:20:09.257+07	2011-01-27 09:20:09.257+07
446	03 - H - 19	2011-01-27 09:20:17.18+07	2011-01-27 09:20:17.18+07
447	03 - H - 21	2011-01-28 10:53:27.66+07	2011-01-28 10:53:27.66+07
448	03 - H - 22	2011-01-28 10:53:38.673+07	2011-01-28 10:53:38.673+07
449	03 - H - 23	2011-01-28 10:53:51.22+07	2011-01-28 10:53:51.22+07
450	03 - H - 24	2011-01-28 10:54:01.423+07	2011-01-28 10:54:01.423+07
451	03 - H - 25	2011-01-28 10:54:09.847+07	2011-01-28 10:54:09.847+07
452	03 - H - 75	2016-09-27 12:02:25.417+07	2016-09-27 12:02:25.417+07
453	Cinta Itu Motivasi	2019-05-31 12:40:44.15+07	2019-05-31 12:40:44.15+07
454	03- H - 20	2011-01-27 09:20:25.507+07	2011-01-27 09:20:25.507+07
455	03-A-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
456	03-A-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
457	03-A-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
458	03-A-04	2009-10-21 09:09:02.387+07	2009-10-21 09:09:02.387+07
459	03-A-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
460	03-A-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
461	03-A-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
462	03-A-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
463	03-A-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
464	03-A-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
465	03-A-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
466	03-A-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
467	03-A-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
468	03-A-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
469	03-A-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
470	03-A-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
471	03-A-19	2009-10-20 16:22:06.03+07	2009-10-20 16:22:06.03+07
472	03-A-20	2010-01-19 10:51:52.633+07	2010-01-19 10:51:52.633+07
473	03-A-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
474	03-A-22	2010-03-25 16:47:23.123+07	2010-03-25 16:47:23.123+07
475	03-A-23	2010-01-14 13:26:21.623+07	2010-01-14 13:26:21.623+07
476	03-A-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
477	03-A-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
478	03-A-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
479	03-A-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
480	03-A-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
481	03-A-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
482	03-A-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
483	03-A-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
484	03-A-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
485	03-A-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
486	03-A-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
487	03-A-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
488	03-A-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
489	03-A-37	2009-11-12 09:20:42.26+07	2009-11-12 09:20:42.26+07
490	03-A-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
491	03-A-39	2009-12-09 10:37:53.94+07	2009-12-09 10:37:53.94+07
492	03-A-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
493	03-A-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
494	03-A-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
495	03-A-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
496	03-A-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
497	03-A-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
498	03-A-46	2009-10-28 09:39:48.89+07	2009-10-28 09:39:48.89+07
499	03-A-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
500	03-A-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
501	03-A-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
502	03-A-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
503	03-A-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
504	03-A-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
505	03-A-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
506	03-A-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
507	03-A-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
508	03-A-58	2009-08-19 16:31:12.507+07	2009-08-19 16:31:12.507+07
509	03-A-59	2009-10-08 14:16:43.013+07	2009-10-08 14:16:43.013+07
510	03-A-60	2010-04-03 08:34:00.563+07	2010-04-03 08:34:00.563+07
511	03-A-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
512	03-A-62	2009-10-22 09:36:45.11+07	2009-10-22 09:36:45.11+07
513	03-A-63	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
514	03-A-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
515	03-A-65	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
516	03-A-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
517	03-A-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
518	03-A-68	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
519	03-A-70	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
520	03-A-71	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
521	03-A-72	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
522	03-A-73	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
523	03-A-74	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
524	03-A-75	2009-10-12 10:42:25.003+07	2009-10-12 10:42:25.003+07
525	03-A-78	2010-12-14 09:22:14.97+07	2010-12-14 09:22:14.97+07
526	03-A-83	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
527	03-B-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
528	03-B-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
529	03-B-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
530	03-B-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
531	03-B-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
532	03-B-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
533	03-B-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
534	03-B-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
535	03-B-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
536	03-B-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
537	03-B-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
538	03-B-14	2010-11-25 10:01:13.76+07	2010-11-25 10:01:13.76+07
539	03-B-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
540	03-B-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
541	03-B-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
542	03-B-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
543	03-B-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
544	03-B-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
545	03-B-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
546	03-B-22	2009-09-14 15:40:42.067+07	2009-09-14 15:40:42.067+07
547	03-B-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
548	03-B-25	2010-01-21 14:03:25.05+07	2010-01-21 14:03:25.05+07
549	03-B-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
550	03-B-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
551	03-B-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
552	03-B-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
553	03-B-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
554	03-B-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
555	03-B-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
556	03-B-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
557	03-B-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
558	03-B-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
559	03-B-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
560	03-B-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
561	03-B-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
562	03-B-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
563	03-B-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
564	03-B-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
565	03-B-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
566	03-B-43	2009-12-09 16:51:41.61+07	2009-12-09 16:51:41.61+07
567	03-B-44	2009-08-19 16:30:24.693+07	2009-08-19 16:30:24.693+07
568	03-B-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
569	03-B-46	2009-09-16 09:35:10.257+07	2009-09-16 09:35:10.257+07
570	03-B-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
571	03-B-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
572	03-B-49	2009-09-15 10:14:35.873+07	2009-09-15 10:14:35.873+07
573	03-B-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
574	03-B-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
575	03-B-52	2009-10-21 13:35:39.147+07	2009-10-21 13:35:39.147+07
576	03-B-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
577	03-B-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
578	03-B-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
579	03-B-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
580	03-B-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
581	03-B-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
582	03-B-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
583	03-B-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
584	03-B-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
585	03-B-62	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
586	03-B-63	2010-04-20 09:01:37.46+07	2010-04-20 09:01:37.46+07
587	03-B-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
588	03-B-65	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
589	03-B-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
590	03-B-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
591	03-B-68	2010-02-09 14:34:12.65+07	2010-02-09 14:34:12.65+07
592	03-B-69	2019-07-03 15:17:05.697+07	2019-07-03 15:17:05.697+07
593	03-B-70	2019-07-04 15:20:33.477+07	2019-07-04 15:20:33.477+07
594	03-C-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
595	03-C-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
596	03-C-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
597	03-C-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
598	03-C-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
599	03-C-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
600	03-C-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
601	03-C-08	2009-10-09 09:10:02.687+07	2009-10-09 09:10:02.687+07
602	03-C-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
603	03-C-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
604	03-C-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
605	03-C-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
606	03-C-13	2010-02-20 10:29:55.97+07	2010-02-20 10:29:55.97+07
607	03-C-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
608	03-C-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
609	03-C-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
610	03-C-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
611	03-C-18	2011-08-19 09:45:27.283+07	2011-08-19 09:45:27.283+07
612	03-C-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
613	03-C-20	2009-09-14 15:40:31.973+07	2009-09-14 15:40:31.973+07
614	03-C-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
615	03-C-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
616	03-C-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
617	03-C-24	2009-08-19 16:30:50.507+07	2009-08-19 16:30:50.507+07
618	03-C-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
619	03-C-26	2009-09-16 08:16:47.493+07	2009-09-16 08:16:47.493+07
620	03-C-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
621	03-C-28	2009-11-12 11:15:58.597+07	2009-11-12 11:15:58.597+07
622	03-C-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
623	03-C-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
624	03-C-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
625	03-C-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
626	03-C-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
627	03-C-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
628	03-C-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
629	03-C-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
630	03-C-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
631	03-C-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
632	03-C-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
633	03-C-41	2009-09-10 14:28:14.61+07	2009-09-10 14:28:14.61+07
634	03-C-42	2009-08-19 16:29:53.363+07	2009-08-19 16:29:53.363+07
635	03-C-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
636	03-C-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
637	03-C-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
638	03-C-46	2009-11-04 14:13:42.457+07	2009-11-04 14:13:42.457+07
639	03-C-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
640	03-C-48	2009-10-12 11:53:30.4+07	2009-10-12 11:53:30.4+07
641	03-C-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
642	03-C-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
643	03-C-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
644	03-C-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
645	03-C-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
646	03-C-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
647	03-C-58	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
648	03-C-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
649	03-C-60	2010-01-26 13:33:49.32+07	2010-01-26 13:33:49.32+07
650	03-C-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
651	03-C-62	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
652	03-C-63	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
653	03-C-64	2009-09-14 13:55:17.587+07	2009-09-14 13:55:17.587+07
654	03-C-65	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
655	03-C-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
656	03-C-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
657	03-C-68	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
658	03-C-69	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
659	03-C-70	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
660	03-C-71	2009-08-19 16:31:20.88+07	2009-08-19 16:31:20.88+07
661	03-C-72	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
662	03-C-73	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
663	03-C-74	2010-02-25 10:03:13.44+07	2010-02-25 10:03:13.44+07
664	03-C-75	2009-10-07 08:27:43.407+07	2009-10-07 08:27:43.407+07
665	03-C-76	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
666	03-C-77	2010-03-19 08:07:14.62+07	2010-03-19 08:07:14.62+07
667	03-C-78	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
668	03-C-79	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
669	03-C-80	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
670	03-C-81	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
671	03-C-82	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
672	03-C-83	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
673	03-C-84	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
674	03-C-85	2010-09-07 08:17:42.443+07	2010-09-07 08:17:42.443+07
675	03-C-86	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
676	03-C-88	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
677	03-C-89 	2016-11-22 11:14:33.55+07	2016-11-22 11:14:33.55+07
678	03-C-90	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
679	03-C-91	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
680	03-C-92	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
681	03-C-93	2010-12-08 10:54:23.917+07	2010-12-08 10:54:23.917+07
682	03-C-94	2009-11-10 15:25:37.197+07	2009-11-10 15:25:37.197+07
683	03-D-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
684	03-D-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
685	03-D-03	2009-12-22 08:16:01.063+07	2009-12-22 08:16:01.063+07
686	03-D-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
687	03-D-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
688	03-D-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
689	03-D-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
690	03-D-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
691	03-D-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
692	03-D-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
693	03-D-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
694	03-D-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
695	03-D-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
696	03-D-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
697	03-D-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
698	03-D-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
699	03-D-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
700	03-D-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
701	03-D-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
702	03-D-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
703	03-D-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
704	03-D-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
705	03-D-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
706	03-D-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
707	03-D-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
708	03-D-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
709	03-D-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
710	03-D-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
711	03-D-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
712	03-D-31	2010-02-20 09:27:21.373+07	2010-02-20 09:27:21.373+07
713	03-D-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
714	03-D-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
715	03-D-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
716	03-D-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
717	03-D-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
718	03-D-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
719	03-D-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
720	03-D-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
721	03-D-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
722	03-D-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
723	03-D-42	2009-10-12 10:37:58.247+07	2009-10-12 10:37:58.247+07
724	03-D-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
725	03-D-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
726	03-D-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
727	03-D-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
728	03-D-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
729	03-D-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
730	03-D-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
731	03-D-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
732	03-D-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
733	03-D-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
734	03-D-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
735	03-D-54	2010-03-30 08:53:35.957+07	2010-03-30 08:53:35.957+07
736	03-D-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
737	03-D-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
738	03-D-58	2009-08-27 14:12:54.013+07	2009-08-27 14:12:54.013+07
739	03-D-59	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
740	03-D-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
741	03-D-61	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
742	03-D-62	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
743	03-D-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
744	03-D-65	2009-10-13 15:26:18.57+07	2009-10-13 15:26:18.57+07
745	03-D-66	2010-01-27 10:47:26.547+07	2010-01-27 10:47:26.547+07
746	03-D-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
747	03-D-68	2009-10-09 11:16:59.52+07	2009-10-09 11:16:59.52+07
748	03-D-69	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
749	03-D-70	2009-12-17 16:35:35.747+07	2009-12-17 16:35:35.747+07
750	03-D-71	2019-08-08 14:25:12.563+07	2019-08-08 14:25:12.563+07
751	03-D-72	2019-08-08 14:25:28.487+07	2019-08-08 14:25:28.487+07
752	03-D-73	2019-12-03 07:16:36.193+07	2019-12-03 07:16:36.193+07
753	03-E-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
754	03-E-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
755	03-E-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
756	03-E-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
757	03-E-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
758	03-E-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
759	03-E-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
760	03-E-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
761	03-E-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
762	03-E-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
763	03-E-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
764	03-E-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
765	03-E-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
766	03-E-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
767	03-E-15	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
768	03-E-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
769	03-E-17	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
770	03-E-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
771	03-E-19	2009-09-01 11:56:09.887+07	2009-09-01 11:56:09.887+07
772	03-E-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
773	03-E-21	2009-10-13 16:28:13.847+07	2009-10-13 16:28:13.847+07
774	03-E-22	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
775	03-E-23	2009-09-04 15:59:43.44+07	2009-09-04 15:59:43.44+07
776	03-E-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
777	03-E-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
778	03-E-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
779	03-E-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
780	03-E-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
781	03-E-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
782	03-E-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
783	03-E-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
784	03-E-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
785	03-E-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
786	03-E-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
787	03-E-36	2009-09-14 13:55:46.65+07	2009-09-14 13:55:46.65+07
788	03-E-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
789	03-E-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
790	03-E-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
791	03-E-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
792	03-E-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
793	03-E-42	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
794	03-E-43	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
795	03-E-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
796	03-E-45	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
797	03-E-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
798	03-E-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
799	03-E-48	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
800	03-E-49	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
801	03-E-50	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
802	03-E-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
803	03-E-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
804	03-E-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
805	03-E-54	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
806	03-E-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
807	03-E-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
808	03-E-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
809	03-E-58	2010-09-22 16:36:36.483+07	2010-09-22 16:36:36.483+07
810	03-E-59	2010-01-22 09:29:06.553+07	2010-01-22 09:29:06.553+07
811	03-E-60	2012-02-09 11:20:45.077+07	2012-02-09 11:20:45.077+07
812	03-E-61	2012-02-14 10:12:48.89+07	2012-02-14 10:12:48.89+07
813	03-E-62	2019-07-01 10:17:21.1+07	2019-07-01 10:17:21.1+07
814	03-E-63	2019-07-15 14:50:26.237+07	2019-07-15 14:50:26.237+07
815	03-E-64	2019-07-15 14:54:22.093+07	2019-07-15 14:54:22.093+07
816	03-E-65	2019-07-15 14:54:37.513+07	2019-07-15 14:54:37.513+07
817	03-E-66	2019-08-08 15:00:47.763+07	2019-08-08 15:00:47.763+07
818	03-E-67	2019-08-08 15:01:01.013+07	2019-08-08 15:01:01.013+07
819	03-E-68	2019-11-29 10:11:47.39+07	2019-11-29 10:11:47.39+07
820	03-E-69	2019-11-29 13:57:07.73+07	2019-11-29 13:57:07.73+07
821	03-E-70	2019-12-02 10:30:33.783+07	2019-12-02 10:30:33.783+07
822	03-E-71	2019-12-02 14:49:28.507+07	2019-12-02 14:49:28.507+07
823	03-F-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
824	03-F-02	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
825	03-F-03	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
826	03-F-04	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
827	03-F-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
828	03-F-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
829	03-F-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
830	03-F-08	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
831	03-F-09	2010-04-06 15:52:16.457+07	2010-04-06 15:52:16.457+07
832	03-F-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
833	03-F-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
834	03-F-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
835	03-F-13	2009-11-23 09:59:58.993+07	2009-11-23 09:59:58.993+07
836	03-F-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
837	03-F-15	2010-11-09 10:13:06.223+07	2010-11-09 10:13:06.223+07
838	03-F-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
839	03-F-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
840	03-F-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
841	03-F-21	2009-11-12 10:22:26.66+07	2009-11-12 10:22:26.66+07
842	03-F-22	2009-10-03 11:05:02.56+07	2009-10-03 11:05:02.56+07
843	03-F-23	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
844	03-F-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
845	03-F-25	2009-12-10 14:25:47.427+07	2009-12-10 14:25:47.427+07
846	03-F-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
847	03-F-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
848	03-F-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
849	03-F-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
850	03-F-30	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
851	03-F-31	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
852	03-F-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
853	03-F-34	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
854	03-F-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
855	03-F-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
856	03-F-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
857	03-F-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
858	03-F-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
859	03-F-40	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
860	03-F-41	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
861	03-F-44	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
862	03-F-45	2009-09-09 10:20:18.15+07	2009-09-09 10:20:18.15+07
863	03-F-46	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
864	03-F-47	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
865	03-F-48	2010-01-07 08:51:51.18+07	2010-01-07 08:51:51.18+07
866	03-F-49	2009-09-10 10:34:03.967+07	2009-09-10 10:34:03.967+07
867	03-F-50	2009-09-16 11:03:32.793+07	2009-09-16 11:03:32.793+07
868	03-F-51	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
869	03-F-52	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
870	03-F-53	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
871	03-F-55	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
872	03-F-56	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
873	03-F-57	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
874	03-F-59	2009-10-15 16:47:52.82+07	2009-10-15 16:47:52.82+07
875	03-F-60	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
876	03-F-61	2010-03-19 08:55:46.72+07	2010-03-19 08:55:46.72+07
877	03-F-62	2010-11-11 11:35:18.753+07	2010-11-11 11:35:18.753+07
878	03-F-63	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
879	03-F-64	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
880	03-F-65	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
881	03-F-66	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
882	03-F-67	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
883	03-F-68	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
884	03-F-69	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
885	03-F-70	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
886	03-F-71	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
887	03-F-73	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
888	03-F-74	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
889	03-F-75	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
890	03-F-76	2009-12-09 13:37:43.473+07	2009-12-09 13:37:43.473+07
891	03-F-77	2010-11-09 10:05:12.08+07	2010-11-09 10:05:12.08+07
892	03-F-78	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
893	03-F-79	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
894	03-F-81	2009-10-03 11:09:39.127+07	2009-10-03 11:09:39.127+07
895	03-F-82	2009-09-01 09:55:37.967+07	2009-09-01 09:55:37.967+07
896	03-F-83	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
897	03-F-84	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
898	03-F-85	2009-11-23 15:22:54.757+07	2009-11-23 15:22:54.757+07
899	03-G-01	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
900	03-G-02	2014-06-24 10:11:55.353+07	2014-06-24 10:11:55.353+07
901	03-G-03	2010-01-18 09:31:14.61+07	2010-01-18 09:31:14.61+07
902	03-G-05	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
903	03-G-06	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
904	03-G-07	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
905	03-G-08	2010-09-23 14:22:13.187+07	2010-09-23 14:22:13.187+07
906	03-G-09	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
907	03-G-10	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
908	03-G-11	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
909	03-G-12	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
910	03-G-13	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
911	03-G-14	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
912	03-G-16	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
913	03-G-18	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
914	03-G-19	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
915	03-G-20	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
916	03-G-21	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
917	03-G-22	2009-10-12 10:32:51.29+07	2009-10-12 10:32:51.29+07
918	03-G-23	2010-03-18 08:11:15.53+07	2010-03-18 08:11:15.53+07
919	03-G-24	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
920	03-G-25	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
921	03-G-26	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
922	03-G-27	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
923	03-G-28	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
924	03-G-29	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
925	03-G-30	2010-02-22 15:38:22.523+07	2010-02-22 15:38:22.523+07
926	03-G-31	2009-09-16 11:42:40.76+07	2009-09-16 11:42:40.76+07
927	03-G-32	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
928	03-G-33	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
929	03-G-34	2010-02-22 15:39:08.007+07	2010-02-22 15:39:08.007+07
930	03-G-35	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
931	03-G-36	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
932	03-G-37	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
933	03-G-38	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
934	03-G-39	2009-07-22 20:18:20.363+07	2009-07-22 20:18:20.363+07
935	03-G-40	2009-09-01 09:55:11.14+07	2009-09-01 09:55:11.14+07
936	03-G-41	2009-09-01 11:56:35.217+07	2009-09-01 11:56:35.217+07
937	03-G-42	2009-09-17 08:31:31.653+07	2009-09-17 08:31:31.653+07
938	03-G-43	2010-02-18 14:50:11.987+07	2010-02-18 14:50:11.987+07
939	03-G-44	2009-11-04 17:50:34.44+07	2009-11-04 17:50:34.44+07
940	03-G-45	2010-01-07 14:45:09.457+07	2010-01-07 14:45:09.457+07
941	03-G-46	2009-11-23 15:37:03.63+07	2009-11-23 15:37:03.63+07
942	03-G-47	2009-11-06 10:23:44.05+07	2009-11-06 10:23:44.05+07
943	03-G-48	2009-10-21 13:35:58.913+07	2009-10-21 13:35:58.913+07
944	03-G-49	2010-02-04 14:31:21.593+07	2010-02-04 14:31:21.593+07
945	03-G-50	2009-11-06 09:21:55.603+07	2009-11-06 09:21:55.603+07
946	03-G-51	2010-03-03 14:58:51.14+07	2010-03-03 14:58:51.14+07
947	03-G-52	2010-03-31 10:32:48.617+07	2010-03-31 10:32:48.617+07
948	03-G-53	2010-08-09 11:06:02.95+07	2010-08-09 11:06:02.95+07
949	03-G-54	2010-04-19 14:47:53.413+07	2010-04-19 14:47:53.413+07
950	03-G-55	2010-06-04 08:24:14.87+07	2010-06-04 08:24:14.87+07
951	03-G-56	2010-06-04 08:24:23.603+07	2010-06-04 08:24:23.603+07
952	03-G-57	2010-06-04 08:24:30.573+07	2010-06-04 08:24:30.573+07
953	03-G-58	2010-06-04 08:24:40.93+07	2010-06-04 08:24:40.93+07
954	03-G-59	2010-06-04 08:24:48.29+07	2010-06-04 08:24:48.29+07
955	03-G-60	2010-08-09 14:41:40.01+07	2010-08-09 14:41:40.01+07
956	03-G-61	2010-08-09 14:26:44.927+07	2010-08-09 14:26:44.927+07
957	03-G-62	2010-08-13 14:51:31.883+07	2010-08-13 14:51:31.883+07
958	03-G-63	2010-08-31 10:58:23.087+07	2010-08-31 10:58:23.087+07
959	03-G-64	2010-09-23 10:13:48.23+07	2010-09-23 10:13:48.23+07
960	03-G-65	2010-11-08 11:09:01.497+07	2010-11-08 11:09:01.497+07
961	03-G-66	2010-11-08 11:09:21.433+07	2010-11-08 11:09:21.433+07
962	03-G-67	2010-11-08 11:09:31.857+07	2010-11-08 11:09:31.857+07
963	03-G-68	2010-11-08 11:10:10.433+07	2010-11-08 11:10:10.433+07
964	03-G-69	2010-11-25 11:13:03.35+07	2010-11-25 11:13:03.35+07
965	03-G-70	2010-11-25 11:13:44.35+07	2010-11-25 11:13:44.35+07
966	03-G-71	2010-11-26 15:14:22.11+07	2010-11-26 15:14:22.11+07
967	03-G-72	2010-11-26 15:14:45.843+07	2010-11-26 15:14:45.843+07
968	03-G-73	2010-12-02 10:26:05.693+07	2010-12-02 10:26:05.693+07
969	03-G-74	2010-12-02 12:05:08.403+07	2010-12-02 12:05:08.403+07
970	03-G-75	2010-12-15 14:44:20.337+07	2010-12-15 14:44:20.337+07
971	03-G-76	2010-12-14 15:26:21.723+07	2010-12-14 15:26:21.723+07
972	03-G-77	2010-12-14 15:26:41.053+07	2010-12-14 15:26:41.053+07
973	03-G-78	2011-01-19 09:20:59.337+07	2011-01-19 09:20:59.337+07
974	03-G-79	2011-01-19 09:22:56.31+07	2011-01-19 09:22:56.31+07
975	03-G-80	2011-01-19 09:23:07.887+07	2011-01-19 09:23:07.887+07
976	03-G-81	2017-07-27 11:01:00.603+07	2017-07-27 11:01:00.603+07
977	03-H-22	2011-02-01 10:10:52.953+07	2011-02-01 10:10:52.953+07
978	03-H-23	2011-02-01 10:11:00.78+07	2011-02-01 10:11:00.78+07
979	03-H-24	2011-02-01 10:11:08.14+07	2011-02-01 10:11:08.14+07
980	03-H-25	2011-02-01 10:11:17.407+07	2011-02-01 10:11:17.407+07
981	03-H-26	2011-02-01 10:11:23.703+07	2011-02-01 10:11:23.703+07
982	03-H-27	2011-02-01 10:11:30.907+07	2011-02-01 10:11:30.907+07
983	03-H-28	2011-02-01 10:11:38.783+07	2011-02-01 10:11:38.783+07
984	03-H-29	2011-02-01 10:11:46.987+07	2011-02-01 10:11:46.987+07
985	03-H-30	2011-02-01 10:11:55.017+07	2011-02-01 10:11:55.017+07
986	03-H-31	2011-03-04 10:11:34.583+07	2011-03-04 10:11:34.583+07
987	03-H-32	2011-03-04 10:11:44.05+07	2011-03-04 10:11:44.05+07
988	03-H-33	2011-04-14 10:13:05.033+07	2011-04-14 10:13:05.033+07
989	03-H-34	2011-04-14 10:13:13.143+07	2011-04-14 10:13:13.143+07
990	03-H-35	2011-04-14 10:13:23.5+07	2011-04-14 10:13:23.5+07
991	03-H-36	2011-04-14 10:13:31.83+07	2011-04-14 10:13:31.83+07
992	03-H-37	2011-04-14 10:15:26.27+07	2011-04-14 10:15:26.27+07
993	03-H-38	2011-04-21 11:32:39.227+07	2011-04-21 11:32:39.227+07
994	03-H-39	2011-04-21 11:32:48.807+07	2011-04-21 11:32:48.807+07
995	03-H-40	2011-04-27 10:29:29.193+07	2011-04-27 10:29:29.193+07
996	03-H-41	2011-04-27 10:29:40.743+07	2011-04-27 10:29:40.743+07
997	03-H-42	2011-04-27 10:29:58.367+07	2011-04-27 10:29:58.367+07
998	03-H-43	2014-02-27 10:36:52.647+07	2014-02-27 10:36:52.647+07
999	03-H-44	2014-02-27 10:37:02.77+07	2014-02-27 10:37:02.77+07
1000	03-H-45	2014-02-27 10:37:12.1+07	2014-02-27 10:37:12.1+07
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Users" (id, id_pegawai, nama, password, jabatan, no_hp, email, gender, role, ration, "isVerified", status_users, "createdAt", "updatedAt") FROM stdin;
1	Admin_1	admin	$2b$10$pA2pYcl9RfD31fSqDi1TnOTpv3MW6hGmMNvIIwpjy5AJ98gO2twVK	admin perpus	08123456789	agusto.119140119@student.itera.ac.id	female	admin	2	f	active	2022-08-02 10:00:35.171+07	2022-08-02 10:00:35.171+07
2	IT_01	Agusto	$2b$10$jA1bKjcDHKZygZije8KCZuReQroW7vObJ9gDcs2ymp15fJHf4gmkG	Engineer	0123456789	agusto.hawlai@gmail.com	male	member	2	f	active	2022-08-02 10:18:58.051+07	2022-08-13 09:48:28.289+07
\.


--
-- Name: Alerts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Alerts_id_seq"', 53, true);


--
-- Name: Authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Authors_id_seq"', 1907, true);


--
-- Name: Borrows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Borrows_id_seq"', 22, true);


--
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_id_seq"', 13, true);


--
-- Name: Items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Items_id_seq"', 6, true);


--
-- Name: Publishers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Publishers_id_seq"', 633, true);


--
-- Name: Shelves_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Shelves_id_seq"', 1000, false);


--
-- Name: Users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_id_seq"', 2, true);


--
-- Name: Alerts Alerts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Alerts"
    ADD CONSTRAINT "Alerts_pkey" PRIMARY KEY (id);


--
-- Name: Authors Authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Authors"
    ADD CONSTRAINT "Authors_pkey" PRIMARY KEY (id);


--
-- Name: Borrows Borrows_id_borrow_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_id_borrow_key" UNIQUE (id_borrow);


--
-- Name: Borrows Borrows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_pkey" PRIMARY KEY (id);


--
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- Name: Items Items_id_item_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Items"
    ADD CONSTRAINT "Items_id_item_key" UNIQUE (id_item);


--
-- Name: Items Items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Items"
    ADD CONSTRAINT "Items_pkey" PRIMARY KEY (id);


--
-- Name: Publishers Publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Publishers"
    ADD CONSTRAINT "Publishers_pkey" PRIMARY KEY (id);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: Shelves Shelves_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shelves"
    ADD CONSTRAINT "Shelves_pkey" PRIMARY KEY (id);


--
-- Name: Users Users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_email_key" UNIQUE (email);


--
-- Name: Users Users_id_pegawai_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_id_pegawai_key" UNIQUE (id_pegawai);


--
-- Name: Users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- Name: Borrows Borrows_action_extend_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_action_extend_admin_id_fkey" FOREIGN KEY (action_extend_admin_id) REFERENCES public."Users"(id_pegawai);


--
-- Name: Borrows Borrows_booking_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_booking_admin_id_fkey" FOREIGN KEY (booking_admin_id) REFERENCES public."Users"(id_pegawai);


--
-- Name: Borrows Borrows_borrow_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_borrow_admin_id_fkey" FOREIGN KEY (borrow_admin_id) REFERENCES public."Users"(id_pegawai);


--
-- Name: Borrows Borrows_cancel_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_cancel_admin_id_fkey" FOREIGN KEY (cancel_admin_id) REFERENCES public."Users"(id_pegawai);


--
-- Name: Borrows Borrows_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_item_id_fkey" FOREIGN KEY (item_id) REFERENCES public."Items"(id_item);


--
-- Name: Borrows Borrows_return_admin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_return_admin_id_fkey" FOREIGN KEY (return_admin_id) REFERENCES public."Users"(id_pegawai);


--
-- Name: Borrows Borrows_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Borrows"
    ADD CONSTRAINT "Borrows_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."Users"(id_pegawai);


--
-- PostgreSQL database dump complete
--

