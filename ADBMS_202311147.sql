--
-- PostgreSQL database dump
--

\restrict JnYXP85UxgMrZCOeRzzXXfvelGjx0ePT8HGIdkGYyzz19CTFulf42Qo0Lu0RQdK

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

-- Started on 2026-06-16 15:44:30

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 885 (class 1247 OID 16644)
-- Name: address_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.address_type AS (
	street character varying(100),
	city character varying(50),
	country character varying(50)
);


ALTER TYPE public.address_type OWNER TO postgres;

--
-- TOC entry 888 (class 1247 OID 16647)
-- Name: contact_info; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contact_info AS (
	email character varying(100),
	phone character varying(20)
);


ALTER TYPE public.contact_info OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 242 (class 1259 OID 16778)
-- Name: academicevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academicevent (
    event_id integer NOT NULL,
    event_name character varying(150),
    event_date date,
    location character varying(150)
);


ALTER TABLE public.academicevent OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 16777)
-- Name: academicevent_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academicevent_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academicevent_event_id_seq OWNER TO postgres;

--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 241
-- Name: academicevent_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academicevent_event_id_seq OWNED BY public.academicevent.event_id;


--
-- TOC entry 234 (class 1259 OID 16740)
-- Name: academicspace; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academicspace (
    space_id integer NOT NULL,
    capacity integer,
    building character varying(100)
);


ALTER TABLE public.academicspace OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16739)
-- Name: academicspace_space_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academicspace_space_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academicspace_space_id_seq OWNER TO postgres;

--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 233
-- Name: academicspace_space_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academicspace_space_id_seq OWNED BY public.academicspace.space_id;


--
-- TOC entry 246 (class 1259 OID 16799)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    attendance_id integer NOT NULL,
    student_id integer,
    course_id integer,
    attendance_date date,
    status character varying(20)
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 16798)
-- Name: attendance_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_attendance_id_seq OWNER TO postgres;

--
-- TOC entry 5192 (class 0 OID 0)
-- Dependencies: 245
-- Name: attendance_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_attendance_id_seq OWNED BY public.attendance.attendance_id;


--
-- TOC entry 235 (class 1259 OID 16747)
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    room_number character varying(20)
)
INHERITS (public.academicspace);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16711)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_code character varying(20),
    course_name character varying(100),
    credits integer,
    department_id integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16710)
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_course_id_seq OWNER TO postgres;

--
-- TOC entry 5193 (class 0 OID 0)
-- Dependencies: 229
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- TOC entry 250 (class 1259 OID 16825)
-- Name: courseclassroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courseclassroom (
    allocation_id integer NOT NULL,
    course_id integer,
    classroom_id integer,
    schedule_time timestamp without time zone
);


ALTER TABLE public.courseclassroom OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 16824)
-- Name: courseclassroom_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courseclassroom_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courseclassroom_allocation_id_seq OWNER TO postgres;

--
-- TOC entry 5194 (class 0 OID 0)
-- Dependencies: 249
-- Name: courseclassroom_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courseclassroom_allocation_id_seq OWNED BY public.courseclassroom.allocation_id;


--
-- TOC entry 252 (class 1259 OID 16838)
-- Name: courselaboratory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courselaboratory (
    allocation_id integer NOT NULL,
    course_id integer,
    laboratory_id integer,
    schedule_time timestamp without time zone
);


ALTER TABLE public.courselaboratory OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 16837)
-- Name: courselaboratory_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courselaboratory_allocation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courselaboratory_allocation_id_seq OWNER TO postgres;

--
-- TOC entry 5195 (class 0 OID 0)
-- Dependencies: 251
-- Name: courselaboratory_allocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courselaboratory_allocation_id_seq OWNED BY public.courselaboratory.allocation_id;


--
-- TOC entry 228 (class 1259 OID 16687)
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying(100) NOT NULL,
    faculty_id integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16686)
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_department_id_seq OWNER TO postgres;

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 227
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- TOC entry 232 (class 1259 OID 16726)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16725)
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollment_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNER TO postgres;

--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 231
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNED BY public.enrollment.enrollment_id;


--
-- TOC entry 244 (class 1259 OID 16786)
-- Name: eventparticipant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eventparticipant (
    participant_id integer NOT NULL,
    event_id integer,
    participant_type character varying(20),
    participant_reference integer
);


ALTER TABLE public.eventparticipant OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 16785)
-- Name: eventparticipant_participant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.eventparticipant_participant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.eventparticipant_participant_id_seq OWNER TO postgres;

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 243
-- Name: eventparticipant_participant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.eventparticipant_participant_id_seq OWNED BY public.eventparticipant.participant_id;


--
-- TOC entry 226 (class 1259 OID 16678)
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    faculty_name character varying(100) NOT NULL
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16677)
-- Name: faculty_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faculty_faculty_id_seq OWNER TO postgres;

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 225
-- Name: faculty_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculty_faculty_id_seq OWNED BY public.faculty.faculty_id;


--
-- TOC entry 236 (class 1259 OID 16752)
-- Name: laboratory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory (
    laboratory_name character varying(100)
)
INHERITS (public.academicspace);


ALTER TABLE public.laboratory OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16649)
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    full_name character varying(100) NOT NULL,
    gender character varying(10),
    date_of_birth date,
    address public.address_type,
    contact public.contact_info,
    phone_numbers text[]
);


ALTER TABLE public.person OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16669)
-- Name: lecturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lecturer (
    qualification character varying(100),
    academic_rank character varying(50),
    department_id integer
)
INHERITS (public.person);


ALTER TABLE public.lecturer OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16648)
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_person_id_seq OWNER TO postgres;

--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 221
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- TOC entry 238 (class 1259 OID 16758)
-- Name: researchproject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.researchproject (
    project_id integer NOT NULL,
    project_title character varying(200),
    start_date date,
    end_date date,
    research_metadata jsonb,
    lecturer_id integer
);


ALTER TABLE public.researchproject OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 16757)
-- Name: researchproject_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.researchproject_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.researchproject_project_id_seq OWNER TO postgres;

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 237
-- Name: researchproject_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.researchproject_project_id_seq OWNED BY public.researchproject.project_id;


--
-- TOC entry 248 (class 1259 OID 16812)
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource (
    resource_id integer NOT NULL,
    resource_name character varying(100),
    quantity integer,
    department_id integer
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 16811)
-- Name: resource_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.resource_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.resource_resource_id_seq OWNER TO postgres;

--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 247
-- Name: resource_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.resource_resource_id_seq OWNED BY public.resource.resource_id;


--
-- TOC entry 223 (class 1259 OID 16659)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    registration_number character varying(20),
    year_of_study integer,
    department_id integer
)
INHERITS (public.person);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16768)
-- Name: supervision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supervision (
    supervision_id integer NOT NULL,
    lecturer_id integer,
    student_id integer,
    project_id integer,
    supervision_date date,
    remarks text
);


ALTER TABLE public.supervision OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16767)
-- Name: supervision_supervision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supervision_supervision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.supervision_supervision_id_seq OWNER TO postgres;

--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 239
-- Name: supervision_supervision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supervision_supervision_id_seq OWNED BY public.supervision.supervision_id;


--
-- TOC entry 4958 (class 2604 OID 16781)
-- Name: academicevent event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicevent ALTER COLUMN event_id SET DEFAULT nextval('public.academicevent_event_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 16743)
-- Name: academicspace space_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicspace ALTER COLUMN space_id SET DEFAULT nextval('public.academicspace_space_id_seq'::regclass);


--
-- TOC entry 4960 (class 2604 OID 16802)
-- Name: attendance attendance_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN attendance_id SET DEFAULT nextval('public.attendance_attendance_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 16750)
-- Name: classroom space_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom ALTER COLUMN space_id SET DEFAULT nextval('public.academicspace_space_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 16714)
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- TOC entry 4962 (class 2604 OID 16828)
-- Name: courseclassroom allocation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courseclassroom ALTER COLUMN allocation_id SET DEFAULT nextval('public.courseclassroom_allocation_id_seq'::regclass);


--
-- TOC entry 4963 (class 2604 OID 16841)
-- Name: courselaboratory allocation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courselaboratory ALTER COLUMN allocation_id SET DEFAULT nextval('public.courselaboratory_allocation_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 16690)
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 16729)
-- Name: enrollment enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollment_enrollment_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 16789)
-- Name: eventparticipant participant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventparticipant ALTER COLUMN participant_id SET DEFAULT nextval('public.eventparticipant_participant_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 16681)
-- Name: faculty faculty_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty ALTER COLUMN faculty_id SET DEFAULT nextval('public.faculty_faculty_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 16755)
-- Name: laboratory space_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory ALTER COLUMN space_id SET DEFAULT nextval('public.academicspace_space_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 16672)
-- Name: lecturer person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 16652)
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 16761)
-- Name: researchproject project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researchproject ALTER COLUMN project_id SET DEFAULT nextval('public.researchproject_project_id_seq'::regclass);


--
-- TOC entry 4961 (class 2604 OID 16815)
-- Name: resource resource_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource ALTER COLUMN resource_id SET DEFAULT nextval('public.resource_resource_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 16662)
-- Name: student person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 16771)
-- Name: supervision supervision_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supervision ALTER COLUMN supervision_id SET DEFAULT nextval('public.supervision_supervision_id_seq'::regclass);


--
-- TOC entry 5174 (class 0 OID 16778)
-- Dependencies: 242
-- Data for Name: academicevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academicevent (event_id, event_name, event_date, location) FROM stdin;
1	Research Conference	2025-05-20	Kigali
2	Innovation Week	2025-06-15	ULK Main Campus
3	Career Day	2025-07-01	Conference Hall
4	Technology Exhibition	2025-08-12	Tech Block
5	Graduation Seminar	2025-09-05	Main Hall
\.


--
-- TOC entry 5166 (class 0 OID 16740)
-- Dependencies: 234
-- Data for Name: academicspace; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academicspace (space_id, capacity, building) FROM stdin;
\.


--
-- TOC entry 5178 (class 0 OID 16799)
-- Dependencies: 246
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (attendance_id, student_id, course_id, attendance_date, status) FROM stdin;
1	2	2	2026-06-16	Present
2	3	3	2026-06-16	Present
3	4	4	2026-06-16	Present
4	5	5	2026-06-16	Present
5	6	6	2026-06-16	Absent
6	7	7	2026-06-16	Present
7	8	8	2026-06-16	Present
8	9	9	2026-06-16	Present
9	10	10	2026-06-16	Present
10	11	11	2026-06-16	Absent
11	12	12	2026-06-16	Present
12	13	13	2026-06-16	Present
13	14	14	2026-06-16	Present
14	15	15	2026-06-16	Present
15	16	16	2026-06-16	Absent
16	17	17	2026-06-16	Present
17	18	18	2026-06-16	Present
18	19	19	2026-06-16	Present
19	20	20	2026-06-16	Present
20	21	21	2026-06-16	Absent
21	22	22	2026-06-16	Present
22	23	23	2026-06-16	Present
23	24	24	2026-06-16	Present
24	25	25	2026-06-16	Present
25	26	26	2026-06-16	Absent
26	27	27	2026-06-16	Present
27	28	28	2026-06-16	Present
28	29	29	2026-06-16	Present
29	30	30	2026-06-16	Present
30	31	1	2026-06-16	Absent
31	32	2	2026-06-16	Present
32	33	3	2026-06-16	Present
33	34	4	2026-06-16	Present
34	35	5	2026-06-16	Present
35	36	6	2026-06-16	Absent
36	37	7	2026-06-16	Present
37	38	8	2026-06-16	Present
38	39	9	2026-06-16	Present
39	40	10	2026-06-16	Present
40	41	11	2026-06-16	Absent
41	42	12	2026-06-16	Present
42	43	13	2026-06-16	Present
43	44	14	2026-06-16	Present
44	45	15	2026-06-16	Present
45	46	16	2026-06-16	Absent
46	47	17	2026-06-16	Present
47	48	18	2026-06-16	Present
48	49	19	2026-06-16	Present
49	50	20	2026-06-16	Present
50	51	21	2026-06-16	Absent
51	52	22	2026-06-16	Present
52	53	23	2026-06-16	Present
53	54	24	2026-06-16	Present
54	55	25	2026-06-16	Present
55	56	26	2026-06-16	Absent
56	57	27	2026-06-16	Present
57	58	28	2026-06-16	Present
58	59	29	2026-06-16	Present
59	60	30	2026-06-16	Present
60	61	1	2026-06-16	Absent
61	62	2	2026-06-16	Present
62	63	3	2026-06-16	Present
63	64	4	2026-06-16	Present
64	65	5	2026-06-16	Present
65	66	6	2026-06-16	Absent
66	67	7	2026-06-16	Present
67	68	8	2026-06-16	Present
68	69	9	2026-06-16	Present
69	70	10	2026-06-16	Present
70	71	11	2026-06-16	Absent
71	72	12	2026-06-16	Present
72	73	13	2026-06-16	Present
73	74	14	2026-06-16	Present
74	75	15	2026-06-16	Present
75	76	16	2026-06-16	Absent
76	77	17	2026-06-16	Present
77	78	18	2026-06-16	Present
78	79	19	2026-06-16	Present
79	80	20	2026-06-16	Present
80	81	21	2026-06-16	Absent
81	82	22	2026-06-16	Present
82	83	23	2026-06-16	Present
83	84	24	2026-06-16	Present
84	85	25	2026-06-16	Present
85	86	26	2026-06-16	Absent
86	87	27	2026-06-16	Present
87	88	28	2026-06-16	Present
88	89	29	2026-06-16	Present
89	90	30	2026-06-16	Present
90	91	1	2026-06-16	Absent
91	92	2	2026-06-16	Present
92	93	3	2026-06-16	Present
93	94	4	2026-06-16	Present
94	95	5	2026-06-16	Present
95	96	6	2026-06-16	Absent
96	97	7	2026-06-16	Present
97	98	8	2026-06-16	Present
98	99	9	2026-06-16	Present
99	100	10	2026-06-16	Present
100	1	11	2026-06-16	Absent
101	2	12	2026-06-16	Present
102	3	13	2026-06-16	Present
103	4	14	2026-06-16	Present
104	5	15	2026-06-16	Present
105	6	16	2026-06-16	Absent
106	7	17	2026-06-16	Present
107	8	18	2026-06-16	Present
108	9	19	2026-06-16	Present
109	10	20	2026-06-16	Present
110	11	21	2026-06-16	Absent
111	12	22	2026-06-16	Present
112	13	23	2026-06-16	Present
113	14	24	2026-06-16	Present
114	15	25	2026-06-16	Present
115	16	26	2026-06-16	Absent
116	17	27	2026-06-16	Present
117	18	28	2026-06-16	Present
118	19	29	2026-06-16	Present
119	20	30	2026-06-16	Present
120	21	1	2026-06-16	Absent
121	22	2	2026-06-16	Present
122	23	3	2026-06-16	Present
123	24	4	2026-06-16	Present
124	25	5	2026-06-16	Present
125	26	6	2026-06-16	Absent
126	27	7	2026-06-16	Present
127	28	8	2026-06-16	Present
128	29	9	2026-06-16	Present
129	30	10	2026-06-16	Present
130	31	11	2026-06-16	Absent
131	32	12	2026-06-16	Present
132	33	13	2026-06-16	Present
133	34	14	2026-06-16	Present
134	35	15	2026-06-16	Present
135	36	16	2026-06-16	Absent
136	37	17	2026-06-16	Present
137	38	18	2026-06-16	Present
138	39	19	2026-06-16	Present
139	40	20	2026-06-16	Present
140	41	21	2026-06-16	Absent
141	42	22	2026-06-16	Present
142	43	23	2026-06-16	Present
143	44	24	2026-06-16	Present
144	45	25	2026-06-16	Present
145	46	26	2026-06-16	Absent
146	47	27	2026-06-16	Present
147	48	28	2026-06-16	Present
148	49	29	2026-06-16	Present
149	50	30	2026-06-16	Present
150	51	1	2026-06-16	Absent
151	52	2	2026-06-16	Present
152	53	3	2026-06-16	Present
153	54	4	2026-06-16	Present
154	55	5	2026-06-16	Present
155	56	6	2026-06-16	Absent
156	57	7	2026-06-16	Present
157	58	8	2026-06-16	Present
158	59	9	2026-06-16	Present
159	60	10	2026-06-16	Present
160	61	11	2026-06-16	Absent
161	62	12	2026-06-16	Present
162	63	13	2026-06-16	Present
163	64	14	2026-06-16	Present
164	65	15	2026-06-16	Present
165	66	16	2026-06-16	Absent
166	67	17	2026-06-16	Present
167	68	18	2026-06-16	Present
168	69	19	2026-06-16	Present
169	70	20	2026-06-16	Present
170	71	21	2026-06-16	Absent
171	72	22	2026-06-16	Present
172	73	23	2026-06-16	Present
173	74	24	2026-06-16	Present
174	75	25	2026-06-16	Present
175	76	26	2026-06-16	Absent
176	77	27	2026-06-16	Present
177	78	28	2026-06-16	Present
178	79	29	2026-06-16	Present
179	80	30	2026-06-16	Present
180	81	1	2026-06-16	Absent
181	82	2	2026-06-16	Present
182	83	3	2026-06-16	Present
183	84	4	2026-06-16	Present
184	85	5	2026-06-16	Present
185	86	6	2026-06-16	Absent
186	87	7	2026-06-16	Present
187	88	8	2026-06-16	Present
188	89	9	2026-06-16	Present
189	90	10	2026-06-16	Present
190	91	11	2026-06-16	Absent
191	92	12	2026-06-16	Present
192	93	13	2026-06-16	Present
193	94	14	2026-06-16	Present
194	95	15	2026-06-16	Present
195	96	16	2026-06-16	Absent
196	97	17	2026-06-16	Present
197	98	18	2026-06-16	Present
198	99	19	2026-06-16	Present
199	100	20	2026-06-16	Present
200	1	21	2026-06-16	Absent
\.


--
-- TOC entry 5167 (class 0 OID 16747)
-- Dependencies: 235
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom (space_id, capacity, building, room_number) FROM stdin;
1	50	Block A	A101
2	60	Block A	A102
3	40	Block B	B201
4	70	Block B	B202
5	100	Main Hall	MH01
\.


--
-- TOC entry 5162 (class 0 OID 16711)
-- Dependencies: 230
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, course_code, course_name, credits, department_id) FROM stdin;
1	CSC1	Course 1	4	2
2	CSC2	Course 2	3	3
3	CSC3	Course 3	4	4
4	CSC4	Course 4	3	5
5	CSC5	Course 5	4	6
6	CSC6	Course 6	3	7
7	CSC7	Course 7	4	8
8	CSC8	Course 8	3	9
9	CSC9	Course 9	4	10
10	CSC10	Course 10	3	1
11	CSC11	Course 11	4	2
12	CSC12	Course 12	3	3
13	CSC13	Course 13	4	4
14	CSC14	Course 14	3	5
15	CSC15	Course 15	4	6
16	CSC16	Course 16	3	7
17	CSC17	Course 17	4	8
18	CSC18	Course 18	3	9
19	CSC19	Course 19	4	10
20	CSC20	Course 20	3	1
21	CSC21	Course 21	4	2
22	CSC22	Course 22	3	3
23	CSC23	Course 23	4	4
24	CSC24	Course 24	3	5
25	CSC25	Course 25	4	6
26	CSC26	Course 26	3	7
27	CSC27	Course 27	4	8
28	CSC28	Course 28	3	9
29	CSC29	Course 29	4	10
30	CSC30	Course 30	3	1
\.


--
-- TOC entry 5182 (class 0 OID 16825)
-- Dependencies: 250
-- Data for Name: courseclassroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courseclassroom (allocation_id, course_id, classroom_id, schedule_time) FROM stdin;
\.


--
-- TOC entry 5184 (class 0 OID 16838)
-- Dependencies: 252
-- Data for Name: courselaboratory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courselaboratory (allocation_id, course_id, laboratory_id, schedule_time) FROM stdin;
\.


--
-- TOC entry 5160 (class 0 OID 16687)
-- Dependencies: 228
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, faculty_id) FROM stdin;
1	Computer Science	1
2	Information Technology	1
3	Software Engineering	1
4	Accounting	2
5	Management	2
6	Marketing	2
7	Education Sciences	3
8	Law	4
9	Economics	5
10	Finance	5
\.


--
-- TOC entry 5164 (class 0 OID 16726)
-- Dependencies: 232
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (enrollment_id, student_id, course_id, enrollment_date) FROM stdin;
1	21	22	2026-06-16
2	22	23	2026-06-16
3	23	24	2026-06-16
4	24	25	2026-06-16
5	25	26	2026-06-16
6	26	27	2026-06-16
7	27	28	2026-06-16
8	28	29	2026-06-16
9	29	30	2026-06-16
10	30	1	2026-06-16
11	31	2	2026-06-16
12	32	3	2026-06-16
13	33	4	2026-06-16
14	34	5	2026-06-16
15	35	6	2026-06-16
16	36	7	2026-06-16
17	37	8	2026-06-16
18	38	9	2026-06-16
19	39	10	2026-06-16
20	40	11	2026-06-16
21	41	12	2026-06-16
22	42	13	2026-06-16
23	43	14	2026-06-16
24	44	15	2026-06-16
25	45	16	2026-06-16
26	46	17	2026-06-16
27	47	18	2026-06-16
28	48	19	2026-06-16
29	49	20	2026-06-16
30	50	21	2026-06-16
31	51	22	2026-06-16
32	52	23	2026-06-16
33	53	24	2026-06-16
34	54	25	2026-06-16
35	55	26	2026-06-16
36	56	27	2026-06-16
37	57	28	2026-06-16
38	58	29	2026-06-16
39	59	30	2026-06-16
40	60	1	2026-06-16
41	61	2	2026-06-16
42	62	3	2026-06-16
43	63	4	2026-06-16
44	64	5	2026-06-16
45	65	6	2026-06-16
46	66	7	2026-06-16
47	67	8	2026-06-16
48	68	9	2026-06-16
49	69	10	2026-06-16
50	70	11	2026-06-16
51	71	12	2026-06-16
52	72	13	2026-06-16
53	73	14	2026-06-16
54	74	15	2026-06-16
55	75	16	2026-06-16
56	76	17	2026-06-16
57	77	18	2026-06-16
58	78	19	2026-06-16
59	79	20	2026-06-16
60	80	21	2026-06-16
61	81	22	2026-06-16
62	82	23	2026-06-16
63	83	24	2026-06-16
64	84	25	2026-06-16
65	85	26	2026-06-16
66	86	27	2026-06-16
67	87	28	2026-06-16
68	88	29	2026-06-16
69	89	30	2026-06-16
70	90	1	2026-06-16
71	91	2	2026-06-16
72	92	3	2026-06-16
73	93	4	2026-06-16
74	94	5	2026-06-16
75	95	6	2026-06-16
76	96	7	2026-06-16
77	97	8	2026-06-16
78	98	9	2026-06-16
79	99	10	2026-06-16
80	100	11	2026-06-16
81	101	12	2026-06-16
82	102	13	2026-06-16
83	103	14	2026-06-16
84	104	15	2026-06-16
85	105	16	2026-06-16
86	106	17	2026-06-16
87	107	18	2026-06-16
88	108	19	2026-06-16
89	109	20	2026-06-16
90	110	21	2026-06-16
91	111	22	2026-06-16
92	112	23	2026-06-16
93	113	24	2026-06-16
94	114	25	2026-06-16
95	115	26	2026-06-16
96	116	27	2026-06-16
97	117	28	2026-06-16
98	118	29	2026-06-16
99	119	30	2026-06-16
100	120	1	2026-06-16
101	21	27	2026-06-16
102	22	28	2026-06-16
103	23	29	2026-06-16
104	24	30	2026-06-16
105	25	1	2026-06-16
106	26	2	2026-06-16
107	27	3	2026-06-16
108	28	4	2026-06-16
109	29	5	2026-06-16
110	30	6	2026-06-16
111	31	7	2026-06-16
112	32	8	2026-06-16
113	33	9	2026-06-16
114	34	10	2026-06-16
115	35	11	2026-06-16
116	36	12	2026-06-16
117	37	13	2026-06-16
118	38	14	2026-06-16
119	39	15	2026-06-16
120	40	16	2026-06-16
121	41	17	2026-06-16
122	42	18	2026-06-16
123	43	19	2026-06-16
124	44	20	2026-06-16
125	45	21	2026-06-16
126	46	22	2026-06-16
127	47	23	2026-06-16
128	48	24	2026-06-16
129	49	25	2026-06-16
130	50	26	2026-06-16
131	51	27	2026-06-16
132	52	28	2026-06-16
133	53	29	2026-06-16
134	54	30	2026-06-16
135	55	1	2026-06-16
136	56	2	2026-06-16
137	57	3	2026-06-16
138	58	4	2026-06-16
139	59	5	2026-06-16
140	60	6	2026-06-16
141	61	7	2026-06-16
142	62	8	2026-06-16
143	63	9	2026-06-16
144	64	10	2026-06-16
145	65	11	2026-06-16
146	66	12	2026-06-16
147	67	13	2026-06-16
148	68	14	2026-06-16
149	69	15	2026-06-16
150	70	16	2026-06-16
151	71	17	2026-06-16
152	72	18	2026-06-16
153	73	19	2026-06-16
154	74	20	2026-06-16
155	75	21	2026-06-16
156	76	22	2026-06-16
157	77	23	2026-06-16
158	78	24	2026-06-16
159	79	25	2026-06-16
160	80	26	2026-06-16
161	81	27	2026-06-16
162	82	28	2026-06-16
163	83	29	2026-06-16
164	84	30	2026-06-16
165	85	1	2026-06-16
166	86	2	2026-06-16
167	87	3	2026-06-16
168	88	4	2026-06-16
169	89	5	2026-06-16
170	90	6	2026-06-16
171	91	7	2026-06-16
172	92	8	2026-06-16
173	93	9	2026-06-16
174	94	10	2026-06-16
175	95	11	2026-06-16
176	96	12	2026-06-16
177	97	13	2026-06-16
178	98	14	2026-06-16
179	99	15	2026-06-16
180	100	16	2026-06-16
181	101	17	2026-06-16
182	102	18	2026-06-16
183	103	19	2026-06-16
184	104	20	2026-06-16
185	105	21	2026-06-16
186	106	22	2026-06-16
187	107	23	2026-06-16
188	108	24	2026-06-16
189	109	25	2026-06-16
190	110	26	2026-06-16
191	111	27	2026-06-16
192	112	28	2026-06-16
193	113	29	2026-06-16
194	114	30	2026-06-16
195	115	1	2026-06-16
196	116	2	2026-06-16
197	117	3	2026-06-16
198	118	4	2026-06-16
199	119	5	2026-06-16
200	120	6	2026-06-16
201	21	2	2026-06-16
202	22	3	2026-06-16
203	23	4	2026-06-16
204	24	5	2026-06-16
205	25	6	2026-06-16
206	26	7	2026-06-16
207	27	8	2026-06-16
208	28	9	2026-06-16
209	29	10	2026-06-16
210	30	11	2026-06-16
211	31	12	2026-06-16
212	32	13	2026-06-16
213	33	14	2026-06-16
214	34	15	2026-06-16
215	35	16	2026-06-16
216	36	17	2026-06-16
217	37	18	2026-06-16
218	38	19	2026-06-16
219	39	20	2026-06-16
220	40	21	2026-06-16
221	41	22	2026-06-16
222	42	23	2026-06-16
223	43	24	2026-06-16
224	44	25	2026-06-16
225	45	26	2026-06-16
226	46	27	2026-06-16
227	47	28	2026-06-16
228	48	29	2026-06-16
229	49	30	2026-06-16
230	50	1	2026-06-16
231	51	2	2026-06-16
232	52	3	2026-06-16
233	53	4	2026-06-16
234	54	5	2026-06-16
235	55	6	2026-06-16
236	56	7	2026-06-16
237	57	8	2026-06-16
238	58	9	2026-06-16
239	59	10	2026-06-16
240	60	11	2026-06-16
241	61	12	2026-06-16
242	62	13	2026-06-16
243	63	14	2026-06-16
244	64	15	2026-06-16
245	65	16	2026-06-16
246	66	17	2026-06-16
247	67	18	2026-06-16
248	68	19	2026-06-16
249	69	20	2026-06-16
250	70	21	2026-06-16
251	71	22	2026-06-16
252	72	23	2026-06-16
253	73	24	2026-06-16
254	74	25	2026-06-16
255	75	26	2026-06-16
256	76	27	2026-06-16
257	77	28	2026-06-16
258	78	29	2026-06-16
259	79	30	2026-06-16
260	80	1	2026-06-16
261	81	2	2026-06-16
262	82	3	2026-06-16
263	83	4	2026-06-16
264	84	5	2026-06-16
265	85	6	2026-06-16
266	86	7	2026-06-16
267	87	8	2026-06-16
268	88	9	2026-06-16
269	89	10	2026-06-16
270	90	11	2026-06-16
271	91	12	2026-06-16
272	92	13	2026-06-16
273	93	14	2026-06-16
274	94	15	2026-06-16
275	95	16	2026-06-16
276	96	17	2026-06-16
277	97	18	2026-06-16
278	98	19	2026-06-16
279	99	20	2026-06-16
280	100	21	2026-06-16
281	101	22	2026-06-16
282	102	23	2026-06-16
283	103	24	2026-06-16
284	104	25	2026-06-16
285	105	26	2026-06-16
286	106	27	2026-06-16
287	107	28	2026-06-16
288	108	29	2026-06-16
289	109	30	2026-06-16
290	110	1	2026-06-16
291	111	2	2026-06-16
292	112	3	2026-06-16
293	113	4	2026-06-16
294	114	5	2026-06-16
295	115	6	2026-06-16
296	116	7	2026-06-16
297	117	8	2026-06-16
298	118	9	2026-06-16
299	119	10	2026-06-16
300	120	11	2026-06-16
\.


--
-- TOC entry 5176 (class 0 OID 16786)
-- Dependencies: 244
-- Data for Name: eventparticipant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eventparticipant (participant_id, event_id, participant_type, participant_reference) FROM stdin;
1	2	Student	2
2	3	Student	3
3	4	Student	4
4	5	Student	5
5	1	Student	6
6	2	Student	7
7	3	Student	8
8	4	Student	9
9	5	Student	10
10	1	Student	11
11	2	Student	12
12	3	Student	13
13	4	Student	14
14	5	Student	15
15	1	Student	16
16	2	Student	17
17	3	Student	18
18	4	Student	19
19	5	Student	20
20	1	Student	21
21	2	Student	22
22	3	Student	23
23	4	Student	24
24	5	Student	25
25	1	Student	26
26	2	Student	27
27	3	Student	28
28	4	Student	29
29	5	Student	30
30	1	Student	31
31	2	Student	32
32	3	Student	33
33	4	Student	34
34	5	Student	35
35	1	Student	36
36	2	Student	37
37	3	Student	38
38	4	Student	39
39	5	Student	40
40	1	Student	41
41	2	Student	42
42	3	Student	43
43	4	Student	44
44	5	Student	45
45	1	Student	46
46	2	Student	47
47	3	Student	48
48	4	Student	49
49	5	Student	50
50	1	Student	51
51	2	Student	52
52	3	Student	53
53	4	Student	54
54	5	Student	55
55	1	Student	56
56	2	Student	57
57	3	Student	58
58	4	Student	59
59	5	Student	60
60	1	Student	61
61	2	Student	62
62	3	Student	63
63	4	Student	64
64	5	Student	65
65	1	Student	66
66	2	Student	67
67	3	Student	68
68	4	Student	69
69	5	Student	70
70	1	Student	71
71	2	Student	72
72	3	Student	73
73	4	Student	74
74	5	Student	75
75	1	Student	76
76	2	Student	77
77	3	Student	78
78	4	Student	79
79	5	Student	80
80	1	Student	81
81	2	Student	82
82	3	Student	83
83	4	Student	84
84	5	Student	85
85	1	Student	86
86	2	Student	87
87	3	Student	88
88	4	Student	89
89	5	Student	90
90	1	Student	91
91	2	Student	92
92	3	Student	93
93	4	Student	94
94	5	Student	95
95	1	Student	96
96	2	Student	97
97	3	Student	98
98	4	Student	99
99	5	Student	100
100	1	Student	1
\.


--
-- TOC entry 5158 (class 0 OID 16678)
-- Dependencies: 226
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (faculty_id, faculty_name) FROM stdin;
1	Faculty of Computing
2	Faculty of Business
3	Faculty of Education
4	Faculty of Law
5	Faculty of Economics
\.


--
-- TOC entry 5168 (class 0 OID 16752)
-- Dependencies: 236
-- Data for Name: laboratory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory (space_id, capacity, building, laboratory_name) FROM stdin;
6	40	Tech Block	Networking Lab
7	35	Tech Block	Database Lab
8	50	Engineering Block	Programming Lab
9	45	Engineering Block	Cyber Security Lab
10	30	Engineering Block	Research Lab
\.


--
-- TOC entry 5156 (class 0 OID 16669)
-- Dependencies: 224
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lecturer (person_id, full_name, gender, date_of_birth, address, contact, phone_numbers, qualification, academic_rank, department_id) FROM stdin;
1	Lecturer 1	Female	1980-01-31	\N	\N	\N	Masters Degree	Senior Lecturer	2
2	Lecturer 2	Male	1980-03-01	\N	\N	\N	Masters Degree	Senior Lecturer	3
3	Lecturer 3	Female	1980-03-31	\N	\N	\N	Masters Degree	Senior Lecturer	4
4	Lecturer 4	Male	1980-04-30	\N	\N	\N	Masters Degree	Senior Lecturer	5
5	Lecturer 5	Female	1980-05-30	\N	\N	\N	Masters Degree	Senior Lecturer	6
6	Lecturer 6	Male	1980-06-29	\N	\N	\N	Masters Degree	Senior Lecturer	7
7	Lecturer 7	Female	1980-07-29	\N	\N	\N	Masters Degree	Senior Lecturer	8
8	Lecturer 8	Male	1980-08-28	\N	\N	\N	Masters Degree	Senior Lecturer	9
9	Lecturer 9	Female	1980-09-27	\N	\N	\N	Masters Degree	Senior Lecturer	10
10	Lecturer 10	Male	1980-10-27	\N	\N	\N	Masters Degree	Senior Lecturer	1
11	Lecturer 11	Female	1980-11-26	\N	\N	\N	Masters Degree	Senior Lecturer	2
12	Lecturer 12	Male	1980-12-26	\N	\N	\N	Masters Degree	Senior Lecturer	3
13	Lecturer 13	Female	1981-01-25	\N	\N	\N	Masters Degree	Senior Lecturer	4
14	Lecturer 14	Male	1981-02-24	\N	\N	\N	Masters Degree	Senior Lecturer	5
15	Lecturer 15	Female	1981-03-26	\N	\N	\N	Masters Degree	Senior Lecturer	6
16	Lecturer 16	Male	1981-04-25	\N	\N	\N	Masters Degree	Senior Lecturer	7
17	Lecturer 17	Female	1981-05-25	\N	\N	\N	Masters Degree	Senior Lecturer	8
18	Lecturer 18	Male	1981-06-24	\N	\N	\N	Masters Degree	Senior Lecturer	9
19	Lecturer 19	Female	1981-07-24	\N	\N	\N	Masters Degree	Senior Lecturer	10
20	Lecturer 20	Male	1981-08-23	\N	\N	\N	Masters Degree	Senior Lecturer	1
\.


--
-- TOC entry 5154 (class 0 OID 16649)
-- Dependencies: 222
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (person_id, full_name, gender, date_of_birth, address, contact, phone_numbers) FROM stdin;
\.


--
-- TOC entry 5170 (class 0 OID 16758)
-- Dependencies: 238
-- Data for Name: researchproject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researchproject (project_id, project_title, start_date, end_date, research_metadata, lecturer_id) FROM stdin;
1	Research Project 1	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	2
2	Research Project 2	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	3
3	Research Project 3	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	4
4	Research Project 4	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	5
5	Research Project 5	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	6
6	Research Project 6	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	7
7	Research Project 7	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	8
8	Research Project 8	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	9
9	Research Project 9	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	10
10	Research Project 10	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	11
11	Research Project 11	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	12
12	Research Project 12	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	13
13	Research Project 13	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	14
14	Research Project 14	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	15
15	Research Project 15	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	16
16	Research Project 16	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	17
17	Research Project 17	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	18
18	Research Project 18	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	19
19	Research Project 19	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	20
20	Research Project 20	2026-06-16	2026-12-13	{"budget": "5000", "status": "ongoing"}	1
\.


--
-- TOC entry 5180 (class 0 OID 16812)
-- Dependencies: 248
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource (resource_id, resource_name, quantity, department_id) FROM stdin;
1	Resource 1	11	2
2	Resource 2	12	3
3	Resource 3	13	4
4	Resource 4	14	5
5	Resource 5	15	6
6	Resource 6	16	7
7	Resource 7	17	8
8	Resource 8	18	9
9	Resource 9	19	10
10	Resource 10	20	1
11	Resource 11	21	2
12	Resource 12	22	3
13	Resource 13	23	4
14	Resource 14	24	5
15	Resource 15	25	6
16	Resource 16	26	7
17	Resource 17	27	8
18	Resource 18	28	9
19	Resource 19	29	10
20	Resource 20	30	1
21	Resource 21	31	2
22	Resource 22	32	3
23	Resource 23	33	4
24	Resource 24	34	5
25	Resource 25	35	6
26	Resource 26	36	7
27	Resource 27	37	8
28	Resource 28	38	9
29	Resource 29	39	10
30	Resource 30	40	1
\.


--
-- TOC entry 5155 (class 0 OID 16659)
-- Dependencies: 223
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (person_id, full_name, gender, date_of_birth, address, contact, phone_numbers, registration_number, year_of_study, department_id) FROM stdin;
21	Student 1	Female	2000-02-20	\N	\N	\N	ULK20250001	2	2
22	Student 2	Male	2000-04-10	\N	\N	\N	ULK20250002	3	3
23	Student 3	Female	2000-05-30	\N	\N	\N	ULK20250003	4	4
24	Student 4	Male	2000-07-19	\N	\N	\N	ULK20250004	1	5
25	Student 5	Female	2000-09-07	\N	\N	\N	ULK20250005	2	6
26	Student 6	Male	2000-10-27	\N	\N	\N	ULK20250006	3	7
27	Student 7	Female	2000-12-16	\N	\N	\N	ULK20250007	4	8
28	Student 8	Male	2001-02-04	\N	\N	\N	ULK20250008	1	9
29	Student 9	Female	2001-03-26	\N	\N	\N	ULK20250009	2	10
30	Student 10	Male	2001-05-15	\N	\N	\N	ULK20250010	3	1
31	Student 11	Female	2001-07-04	\N	\N	\N	ULK20250011	4	2
32	Student 12	Male	2001-08-23	\N	\N	\N	ULK20250012	1	3
33	Student 13	Female	2001-10-12	\N	\N	\N	ULK20250013	2	4
34	Student 14	Male	2001-12-01	\N	\N	\N	ULK20250014	3	5
35	Student 15	Female	2002-01-20	\N	\N	\N	ULK20250015	4	6
36	Student 16	Male	2002-03-11	\N	\N	\N	ULK20250016	1	7
37	Student 17	Female	2002-04-30	\N	\N	\N	ULK20250017	2	8
38	Student 18	Male	2002-06-19	\N	\N	\N	ULK20250018	3	9
39	Student 19	Female	2002-08-08	\N	\N	\N	ULK20250019	4	10
40	Student 20	Male	2002-09-27	\N	\N	\N	ULK20250020	1	1
41	Student 21	Female	2002-11-16	\N	\N	\N	ULK20250021	2	2
42	Student 22	Male	2003-01-05	\N	\N	\N	ULK20250022	3	3
43	Student 23	Female	2003-02-24	\N	\N	\N	ULK20250023	4	4
44	Student 24	Male	2003-04-15	\N	\N	\N	ULK20250024	1	5
45	Student 25	Female	2003-06-04	\N	\N	\N	ULK20250025	2	6
46	Student 26	Male	2003-07-24	\N	\N	\N	ULK20250026	3	7
47	Student 27	Female	2003-09-12	\N	\N	\N	ULK20250027	4	8
48	Student 28	Male	2003-11-01	\N	\N	\N	ULK20250028	1	9
49	Student 29	Female	2003-12-21	\N	\N	\N	ULK20250029	2	10
50	Student 30	Male	2004-02-09	\N	\N	\N	ULK20250030	3	1
51	Student 31	Female	2004-03-30	\N	\N	\N	ULK20250031	4	2
52	Student 32	Male	2004-05-19	\N	\N	\N	ULK20250032	1	3
53	Student 33	Female	2004-07-08	\N	\N	\N	ULK20250033	2	4
54	Student 34	Male	2004-08-27	\N	\N	\N	ULK20250034	3	5
55	Student 35	Female	2004-10-16	\N	\N	\N	ULK20250035	4	6
56	Student 36	Male	2004-12-05	\N	\N	\N	ULK20250036	1	7
57	Student 37	Female	2005-01-24	\N	\N	\N	ULK20250037	2	8
58	Student 38	Male	2005-03-15	\N	\N	\N	ULK20250038	3	9
59	Student 39	Female	2005-05-04	\N	\N	\N	ULK20250039	4	10
60	Student 40	Male	2005-06-23	\N	\N	\N	ULK20250040	1	1
61	Student 41	Female	2005-08-12	\N	\N	\N	ULK20250041	2	2
62	Student 42	Male	2005-10-01	\N	\N	\N	ULK20250042	3	3
63	Student 43	Female	2005-11-20	\N	\N	\N	ULK20250043	4	4
64	Student 44	Male	2006-01-09	\N	\N	\N	ULK20250044	1	5
65	Student 45	Female	2006-02-28	\N	\N	\N	ULK20250045	2	6
66	Student 46	Male	2006-04-19	\N	\N	\N	ULK20250046	3	7
67	Student 47	Female	2006-06-08	\N	\N	\N	ULK20250047	4	8
68	Student 48	Male	2006-07-28	\N	\N	\N	ULK20250048	1	9
69	Student 49	Female	2006-09-16	\N	\N	\N	ULK20250049	2	10
70	Student 50	Male	2006-11-05	\N	\N	\N	ULK20250050	3	1
71	Student 51	Female	2006-12-25	\N	\N	\N	ULK20250051	4	2
72	Student 52	Male	2007-02-13	\N	\N	\N	ULK20250052	1	3
73	Student 53	Female	2007-04-04	\N	\N	\N	ULK20250053	2	4
74	Student 54	Male	2007-05-24	\N	\N	\N	ULK20250054	3	5
75	Student 55	Female	2007-07-13	\N	\N	\N	ULK20250055	4	6
76	Student 56	Male	2007-09-01	\N	\N	\N	ULK20250056	1	7
77	Student 57	Female	2007-10-21	\N	\N	\N	ULK20250057	2	8
78	Student 58	Male	2007-12-10	\N	\N	\N	ULK20250058	3	9
79	Student 59	Female	2008-01-29	\N	\N	\N	ULK20250059	4	10
80	Student 60	Male	2008-03-19	\N	\N	\N	ULK20250060	1	1
81	Student 61	Female	2008-05-08	\N	\N	\N	ULK20250061	2	2
82	Student 62	Male	2008-06-27	\N	\N	\N	ULK20250062	3	3
83	Student 63	Female	2008-08-16	\N	\N	\N	ULK20250063	4	4
84	Student 64	Male	2008-10-05	\N	\N	\N	ULK20250064	1	5
85	Student 65	Female	2008-11-24	\N	\N	\N	ULK20250065	2	6
86	Student 66	Male	2009-01-13	\N	\N	\N	ULK20250066	3	7
87	Student 67	Female	2009-03-04	\N	\N	\N	ULK20250067	4	8
88	Student 68	Male	2009-04-23	\N	\N	\N	ULK20250068	1	9
89	Student 69	Female	2009-06-12	\N	\N	\N	ULK20250069	2	10
90	Student 70	Male	2009-08-01	\N	\N	\N	ULK20250070	3	1
91	Student 71	Female	2009-09-20	\N	\N	\N	ULK20250071	4	2
92	Student 72	Male	2009-11-09	\N	\N	\N	ULK20250072	1	3
93	Student 73	Female	2009-12-29	\N	\N	\N	ULK20250073	2	4
94	Student 74	Male	2010-02-17	\N	\N	\N	ULK20250074	3	5
95	Student 75	Female	2010-04-08	\N	\N	\N	ULK20250075	4	6
96	Student 76	Male	2010-05-28	\N	\N	\N	ULK20250076	1	7
97	Student 77	Female	2010-07-17	\N	\N	\N	ULK20250077	2	8
98	Student 78	Male	2010-09-05	\N	\N	\N	ULK20250078	3	9
99	Student 79	Female	2010-10-25	\N	\N	\N	ULK20250079	4	10
100	Student 80	Male	2010-12-14	\N	\N	\N	ULK20250080	1	1
101	Student 81	Female	2011-02-02	\N	\N	\N	ULK20250081	2	2
102	Student 82	Male	2011-03-24	\N	\N	\N	ULK20250082	3	3
103	Student 83	Female	2011-05-13	\N	\N	\N	ULK20250083	4	4
104	Student 84	Male	2011-07-02	\N	\N	\N	ULK20250084	1	5
105	Student 85	Female	2011-08-21	\N	\N	\N	ULK20250085	2	6
106	Student 86	Male	2011-10-10	\N	\N	\N	ULK20250086	3	7
107	Student 87	Female	2011-11-29	\N	\N	\N	ULK20250087	4	8
108	Student 88	Male	2012-01-18	\N	\N	\N	ULK20250088	1	9
109	Student 89	Female	2012-03-08	\N	\N	\N	ULK20250089	2	10
110	Student 90	Male	2012-04-27	\N	\N	\N	ULK20250090	3	1
111	Student 91	Female	2012-06-16	\N	\N	\N	ULK20250091	4	2
112	Student 92	Male	2012-08-05	\N	\N	\N	ULK20250092	1	3
113	Student 93	Female	2012-09-24	\N	\N	\N	ULK20250093	2	4
114	Student 94	Male	2012-11-13	\N	\N	\N	ULK20250094	3	5
115	Student 95	Female	2013-01-02	\N	\N	\N	ULK20250095	4	6
116	Student 96	Male	2013-02-21	\N	\N	\N	ULK20250096	1	7
117	Student 97	Female	2013-04-12	\N	\N	\N	ULK20250097	2	8
118	Student 98	Male	2013-06-01	\N	\N	\N	ULK20250098	3	9
119	Student 99	Female	2013-07-21	\N	\N	\N	ULK20250099	4	10
120	Student 100	Male	2013-09-09	\N	\N	\N	ULK20250100	1	1
\.


--
-- TOC entry 5172 (class 0 OID 16768)
-- Dependencies: 240
-- Data for Name: supervision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supervision (supervision_id, lecturer_id, student_id, project_id, supervision_date, remarks) FROM stdin;
1	2	2	2	2026-06-16	Monthly supervision meeting
2	3	3	3	2026-06-16	Monthly supervision meeting
3	4	4	4	2026-06-16	Monthly supervision meeting
4	5	5	5	2026-06-16	Monthly supervision meeting
5	6	6	6	2026-06-16	Monthly supervision meeting
6	7	7	7	2026-06-16	Monthly supervision meeting
7	8	8	8	2026-06-16	Monthly supervision meeting
8	9	9	9	2026-06-16	Monthly supervision meeting
9	10	10	10	2026-06-16	Monthly supervision meeting
10	11	11	11	2026-06-16	Monthly supervision meeting
11	12	12	12	2026-06-16	Monthly supervision meeting
12	13	13	13	2026-06-16	Monthly supervision meeting
13	14	14	14	2026-06-16	Monthly supervision meeting
14	15	15	15	2026-06-16	Monthly supervision meeting
15	16	16	16	2026-06-16	Monthly supervision meeting
16	17	17	17	2026-06-16	Monthly supervision meeting
17	18	18	18	2026-06-16	Monthly supervision meeting
18	19	19	19	2026-06-16	Monthly supervision meeting
19	20	20	20	2026-06-16	Monthly supervision meeting
20	1	21	1	2026-06-16	Monthly supervision meeting
21	2	22	2	2026-06-16	Monthly supervision meeting
22	3	23	3	2026-06-16	Monthly supervision meeting
23	4	24	4	2026-06-16	Monthly supervision meeting
24	5	25	5	2026-06-16	Monthly supervision meeting
25	6	26	6	2026-06-16	Monthly supervision meeting
26	7	27	7	2026-06-16	Monthly supervision meeting
27	8	28	8	2026-06-16	Monthly supervision meeting
28	9	29	9	2026-06-16	Monthly supervision meeting
29	10	30	10	2026-06-16	Monthly supervision meeting
30	11	31	11	2026-06-16	Monthly supervision meeting
31	12	32	12	2026-06-16	Monthly supervision meeting
32	13	33	13	2026-06-16	Monthly supervision meeting
33	14	34	14	2026-06-16	Monthly supervision meeting
34	15	35	15	2026-06-16	Monthly supervision meeting
35	16	36	16	2026-06-16	Monthly supervision meeting
36	17	37	17	2026-06-16	Monthly supervision meeting
37	18	38	18	2026-06-16	Monthly supervision meeting
38	19	39	19	2026-06-16	Monthly supervision meeting
39	20	40	20	2026-06-16	Monthly supervision meeting
40	1	41	1	2026-06-16	Monthly supervision meeting
41	2	42	2	2026-06-16	Monthly supervision meeting
42	3	43	3	2026-06-16	Monthly supervision meeting
43	4	44	4	2026-06-16	Monthly supervision meeting
44	5	45	5	2026-06-16	Monthly supervision meeting
45	6	46	6	2026-06-16	Monthly supervision meeting
46	7	47	7	2026-06-16	Monthly supervision meeting
47	8	48	8	2026-06-16	Monthly supervision meeting
48	9	49	9	2026-06-16	Monthly supervision meeting
49	10	50	10	2026-06-16	Monthly supervision meeting
50	11	51	11	2026-06-16	Monthly supervision meeting
\.


--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 241
-- Name: academicevent_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academicevent_event_id_seq', 5, true);


--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 233
-- Name: academicspace_space_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academicspace_space_id_seq', 10, true);


--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 245
-- Name: attendance_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_attendance_id_seq', 200, true);


--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 229
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 30, true);


--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 249
-- Name: courseclassroom_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courseclassroom_allocation_id_seq', 1, false);


--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 251
-- Name: courselaboratory_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courselaboratory_allocation_id_seq', 1, false);


--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 227
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 10, true);


--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 231
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollment_enrollment_id_seq', 300, true);


--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 243
-- Name: eventparticipant_participant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eventparticipant_participant_id_seq', 100, true);


--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 225
-- Name: faculty_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculty_faculty_id_seq', 5, true);


--
-- TOC entry 5214 (class 0 OID 0)
-- Dependencies: 221
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_person_id_seq', 120, true);


--
-- TOC entry 5215 (class 0 OID 0)
-- Dependencies: 237
-- Name: researchproject_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.researchproject_project_id_seq', 20, true);


--
-- TOC entry 5216 (class 0 OID 0)
-- Dependencies: 247
-- Name: resource_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.resource_resource_id_seq', 30, true);


--
-- TOC entry 5217 (class 0 OID 0)
-- Dependencies: 239
-- Name: supervision_supervision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supervision_supervision_id_seq', 50, true);


--
-- TOC entry 4985 (class 2606 OID 16784)
-- Name: academicevent academicevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicevent
    ADD CONSTRAINT academicevent_pkey PRIMARY KEY (event_id);


--
-- TOC entry 4979 (class 2606 OID 16746)
-- Name: academicspace academicspace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicspace
    ADD CONSTRAINT academicspace_pkey PRIMARY KEY (space_id);


--
-- TOC entry 4989 (class 2606 OID 16805)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (attendance_id);


--
-- TOC entry 4973 (class 2606 OID 16719)
-- Name: course course_course_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_course_code_key UNIQUE (course_code);


--
-- TOC entry 4975 (class 2606 OID 16717)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4993 (class 2606 OID 16831)
-- Name: courseclassroom courseclassroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courseclassroom
    ADD CONSTRAINT courseclassroom_pkey PRIMARY KEY (allocation_id);


--
-- TOC entry 4995 (class 2606 OID 16844)
-- Name: courselaboratory courselaboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courselaboratory
    ADD CONSTRAINT courselaboratory_pkey PRIMARY KEY (allocation_id);


--
-- TOC entry 4971 (class 2606 OID 16694)
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- TOC entry 4977 (class 2606 OID 16733)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);


--
-- TOC entry 4987 (class 2606 OID 16792)
-- Name: eventparticipant eventparticipant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventparticipant
    ADD CONSTRAINT eventparticipant_pkey PRIMARY KEY (participant_id);


--
-- TOC entry 4969 (class 2606 OID 16685)
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);


--
-- TOC entry 4965 (class 2606 OID 16658)
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- TOC entry 4981 (class 2606 OID 16766)
-- Name: researchproject researchproject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researchproject
    ADD CONSTRAINT researchproject_pkey PRIMARY KEY (project_id);


--
-- TOC entry 4991 (class 2606 OID 16818)
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_id);


--
-- TOC entry 4967 (class 2606 OID 16668)
-- Name: student student_registration_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_registration_number_key UNIQUE (registration_number);


--
-- TOC entry 4983 (class 2606 OID 16776)
-- Name: supervision supervision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supervision
    ADD CONSTRAINT supervision_pkey PRIMARY KEY (supervision_id);


--
-- TOC entry 5002 (class 2606 OID 16806)
-- Name: attendance attendance_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 4999 (class 2606 OID 16720)
-- Name: course course_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 5004 (class 2606 OID 16832)
-- Name: courseclassroom courseclassroom_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courseclassroom
    ADD CONSTRAINT courseclassroom_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 5005 (class 2606 OID 16845)
-- Name: courselaboratory courselaboratory_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courselaboratory
    ADD CONSTRAINT courselaboratory_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 4998 (class 2606 OID 16695)
-- Name: department department_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);


--
-- TOC entry 5000 (class 2606 OID 16734)
-- Name: enrollment enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 5001 (class 2606 OID 16793)
-- Name: eventparticipant eventparticipant_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eventparticipant
    ADD CONSTRAINT eventparticipant_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.academicevent(event_id);


--
-- TOC entry 4997 (class 2606 OID 16705)
-- Name: lecturer lecturer_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer
    ADD CONSTRAINT lecturer_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 5003 (class 2606 OID 16819)
-- Name: resource resource_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource
    ADD CONSTRAINT resource_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- TOC entry 4996 (class 2606 OID 16700)
-- Name: student student_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


-- Completed on 2026-06-16 15:44:31

--
-- PostgreSQL database dump complete
--

\unrestrict JnYXP85UxgMrZCOeRzzXXfvelGjx0ePT8HGIdkGYyzz19CTFulf42Qo0Lu0RQdK

