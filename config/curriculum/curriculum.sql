--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: curriculum_designer_course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_course (
    id integer NOT NULL,
    course_name text NOT NULL,
    course_title text NOT NULL,
    course_description text NOT NULL,
    course_code text NOT NULL,
    course_category text NOT NULL,
    course_class_hours integer NOT NULL,
    course_lab_hours integer NOT NULL,
    course_credits integer NOT NULL,
    course_semester integer NOT NULL,
    course_flow_id integer NOT NULL,
    course_school_id integer NOT NULL
);


ALTER TABLE public.curriculum_designer_course OWNER TO postgres;

--
-- Name: curriculum_designer_course_course_lecturers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_course_course_lecturers (
    id integer NOT NULL,
    course_id integer NOT NULL,
    lecturer_id integer NOT NULL
);


ALTER TABLE public.curriculum_designer_course_course_lecturers OWNER TO postgres;

--
-- Name: curriculum_designer_course_course_lecturers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_course_course_lecturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_course_course_lecturers_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_course_course_lecturers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_course_course_lecturers_id_seq OWNED BY public.curriculum_designer_course_course_lecturers.id;


--
-- Name: curriculum_designer_course_course_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_course_course_skills (
    id integer NOT NULL,
    course_id integer NOT NULL,
    skill_id integer NOT NULL
);


ALTER TABLE public.curriculum_designer_course_course_skills OWNER TO postgres;

--
-- Name: curriculum_designer_course_course_skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_course_course_skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_course_course_skills_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_course_course_skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_course_course_skills_id_seq OWNED BY public.curriculum_designer_course_course_skills.id;


--
-- Name: curriculum_designer_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_course_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_course_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_course_id_seq OWNED BY public.curriculum_designer_course.id;


--
-- Name: curriculum_designer_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_flow (
    id integer NOT NULL,
    flow_name text NOT NULL,
    flow_title text NOT NULL,
    flow_abbreviation text NOT NULL
);


ALTER TABLE public.curriculum_designer_flow OWNER TO postgres;

--
-- Name: curriculum_designer_flow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_flow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_flow_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_flow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_flow_id_seq OWNED BY public.curriculum_designer_flow.id;


--
-- Name: curriculum_designer_lecturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_lecturer (
    id integer NOT NULL,
    lecturer_first_name text NOT NULL,
    lecturer_last_name text NOT NULL,
    lecturer_type text NOT NULL
);


ALTER TABLE public.curriculum_designer_lecturer OWNER TO postgres;

--
-- Name: curriculum_designer_lecturer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_lecturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_lecturer_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_lecturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_lecturer_id_seq OWNED BY public.curriculum_designer_lecturer.id;


--
-- Name: curriculum_designer_school; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_school (
    id integer NOT NULL,
    school_name text NOT NULL,
    school_title text NOT NULL,
    school_abbreviation text NOT NULL
);


ALTER TABLE public.curriculum_designer_school OWNER TO postgres;

--
-- Name: curriculum_designer_school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_school_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_school_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_school_id_seq OWNED BY public.curriculum_designer_school.id;


--
-- Name: curriculum_designer_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_skill (
    id integer NOT NULL,
    skill_name text NOT NULL,
    skill_title text NOT NULL,
    skill_type text NOT NULL,
    hard_skill boolean NOT NULL
);


ALTER TABLE public.curriculum_designer_skill OWNER TO postgres;

--
-- Name: curriculum_designer_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_skill_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_skill_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_skill_id_seq OWNED BY public.curriculum_designer_skill.id;


--
-- Name: curriculum_designer_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_student (
    id integer NOT NULL,
    student_first_name text NOT NULL,
    student_last_name text NOT NULL,
    admission_date timestamp with time zone NOT NULL
);


ALTER TABLE public.curriculum_designer_student OWNER TO postgres;

--
-- Name: curriculum_designer_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_student_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_student_id_seq OWNED BY public.curriculum_designer_student.id;


--
-- Name: curriculum_designer_student_selected_courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_student_selected_courses (
    id integer NOT NULL,
    student_id integer NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.curriculum_designer_student_selected_courses OWNER TO postgres;

--
-- Name: curriculum_designer_student_selected_courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_student_selected_courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_student_selected_courses_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_student_selected_courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_student_selected_courses_id_seq OWNED BY public.curriculum_designer_student_selected_courses.id;


--
-- Name: curriculum_designer_student_student_selected_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curriculum_designer_student_student_selected_flows (
    id integer NOT NULL,
    student_id integer NOT NULL,
    flow_id integer NOT NULL
);


ALTER TABLE public.curriculum_designer_student_student_selected_flows OWNER TO postgres;

--
-- Name: curriculum_designer_student_student_selected_flows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curriculum_designer_student_student_selected_flows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curriculum_designer_student_student_selected_flows_id_seq OWNER TO postgres;

--
-- Name: curriculum_designer_student_student_selected_flows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curriculum_designer_student_student_selected_flows_id_seq OWNED BY public.curriculum_designer_student_student_selected_flows.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: curriculum_designer_course id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_course_id_seq'::regclass);


--
-- Name: curriculum_designer_course_course_lecturers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_lecturers ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_course_course_lecturers_id_seq'::regclass);


--
-- Name: curriculum_designer_course_course_skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_skills ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_course_course_skills_id_seq'::regclass);


--
-- Name: curriculum_designer_flow id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_flow ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_flow_id_seq'::regclass);


--
-- Name: curriculum_designer_lecturer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_lecturer ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_lecturer_id_seq'::regclass);


--
-- Name: curriculum_designer_school id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_school ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_school_id_seq'::regclass);


--
-- Name: curriculum_designer_skill id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_skill ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_skill_id_seq'::regclass);


--
-- Name: curriculum_designer_student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_student_id_seq'::regclass);


--
-- Name: curriculum_designer_student_selected_courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_selected_courses ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_student_selected_courses_id_seq'::regclass);


--
-- Name: curriculum_designer_student_student_selected_flows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_student_selected_flows ALTER COLUMN id SET DEFAULT nextval('public.curriculum_designer_student_student_selected_flows_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add school	7	add_school
26	Can change school	7	change_school
27	Can delete school	7	delete_school
28	Can view school	7	view_school
29	Can add skill	8	add_skill
30	Can change skill	8	change_skill
31	Can delete skill	8	delete_skill
32	Can view skill	8	view_skill
33	Can add student	9	add_student
34	Can change student	9	change_student
35	Can delete student	9	delete_student
36	Can view student	9	view_student
37	Can add flow	10	add_flow
38	Can change flow	10	change_flow
39	Can delete flow	10	delete_flow
40	Can view flow	10	view_flow
41	Can add course	11	add_course
42	Can change course	11	change_course
43	Can delete course	11	delete_course
44	Can view course	11	view_course
45	Can add lecturer	12	add_lecturer
46	Can change lecturer	12	change_lecturer
47	Can delete lecturer	12	delete_lecturer
48	Can view lecturer	12	view_lecturer
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: curriculum_designer_course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_course (id, course_name, course_title, course_description, course_code, course_category, course_class_hours, course_lab_hours, course_credits, course_semester, course_flow_id, course_school_id) FROM stdin;
1	business_microeconomics	Business Microeconomics	Basic concepts about production, consumption, transactions, prices and money. Microeconomic optimization of consumer behavior. Utility and demand functions, income and price elasticities. Microeconomic optimization of producer behavior. Production functions, productivity of production factors, cost functions, economies of scale. Pricing commodities. Market equilibrium, price formation, perfect and imperfect competition. Theory of monopoly and oligopoly competition. Optimisation over time, investment and financial flows, discount rates, present value and rate of return on capital. Applications to investment, cost and production problems for firms and their evaluation. Decisions under uncertainty.	3.6.3292.6	Obligatory (half flow)	3	1	5	6	1	1
2	management_and_management_information_systems	Management and Management Information Systems	Enterprise and management functions. Business planning and strategy. Definition of the business vision, mission, goals and strategy. SWOT analysis. Models of competitive forces and strategies for competitive advantage. Ethical and social responsibility in management. Enterprise organisation and organisational behaviour. Formal and informal organisational dimensions. Technological factors and flexible organisation. Methods and tools for human resources management. Marketing, marketing strategy, market segmentation, marketing / sales plan and the marketing mix. Entrepreneurship: the role of entrepreneurship in the modern economic framework, development of a business idea, starting a business activity, access to resources, elements of a business plan, business opportunities and obstacles. Leadership. Control and quality management. Operations management. Traditional and new tools for quality management, change management and innovation. Case studies.	3.7.3196.6	Obligatory (half flow)	3	1	5	6	1	1
3	management_and_decision_support_systems	Management and Decision Support Systems	Decision making: Decision support models and their use in decision making; Elements and structure of a decision problem; Decision Trees: Decision Matrices The Bayes, Maximin, Maximax and Hurwitz criteria; Problem-solving with sampling information about the states of nature; Values of sampling and complete information. Dynamic programming: Characteristics of a dynamic programming problem; Examples of multi-stage decisions; Schematic representation of multi-stage decision making problems; Linear programming: Characteristics of a linear programming problem; Modeling mathematically a linear programming problem; Possible solutions to linear programming problems; The graphical solution method; The Simplex algorithm; The dual problem; Sensitivity analysis; Simulation: Special features and schematic presentation of simulation; Generation of random observations through probability distribution functions; Time increment techniques; Simulation languages; Laboratory exercises using appropriate software.	3.7.3306.7	Obligatory (half flow)	3	1	5	7	1	1
4	mathematical_programming_models	Mathematical Programming Models	Introduction to mathematical modeling and operations research. Categories of mathematical programming models. Linear programming and extensions. Decomposition, goal programming, parametric programming, duality theory and sensitivity analysis. Network programming and algorithms. Integer and mixed programming. Exercises and applications in GAMS (www.gams.com). Exercise for electricity system operation and capacity expansion.	3.6.3269.7	Obligatory by selection	4	0	5	7	1	1
5	production_and_operations_management	Production and Operations Management	Introduction to Production Management: Production systems. Management of production systems. Production planning. Historical Development of production and operations management.-- Goods and Services: Definitions, analysis and discrimination. Modern targets, trends and perspectives. The strategic planning concept. Strategies of production and service supply systems. The challenge of competition. Productivity. Product Design: Design levels and the design process. Product life-cycle. Learning curve. Design and technology. Capacity Planning: The problem of capacity. Capacity planning process. Waiting line (queuing) systems. Management and optimization of waiting line (queuing) systems. Facility design: Job Design & Work Measurement. Facility location. Facility layout planning. Maintenance and Quality Control. Reliability of technical systems. Preventive maintenance. Quality control. Sampling methods. Inventory Management: Inventory systems models. Uncertainty in inventory systems. Cost elements. Supply chain management. Kanban / Just in Time (JIT) systems. Production and material planning. Master production schedule (MPS). Capacity requirements planning (CRP). Material requirements planning (MRP). MRPII systems. ERP systems. Production and Operations Scheduling: Definitions. Objectives. Dispatching rules and techniques. n-job in m-machine problems. Flow-Shop scheduling. Job-Shop scheduling. Service delivery scheduling.	3.7.3341.7	Obligatory by selection	3	0	4	7	1	1
7	financial_management_systems	Financial Management Systems	The aim of this course is to provide students with the necessary knowledge background related to the financial management of modern enterprises. The main topics analyzed in this course are the following. Financial accounting: Basic principles, financial statements, accounts and accounting events registration. Financial analysis: Evaluation of the financial performance of enterprises, analysis of accounting statements via financial ratios. Cost accounting & Budgeting: Basic principles and main techniques for cost accounting and budgeting. Financial decisions: Financing decisions and methods for economic evaluation of investments. Laboratory exercise is provided on the evaluation of the financial operation of real enterprises.	3.7.3264.8	Obligatory by selection	2	1	4	8	1	1
15	operating_systems	Operating Systems	This course covers the general principles of Operating Systems. Evolution of Operating Systems, Input/Output, concurrent processes, critical section, process synchronization and communication. CPU scheduling. Memory management (static and dynamic allocation, virtual memory, paging, segmentation). File management, disk scheduling, deadlocks.	3.4.3136.6	Obligatory (half flow)	2	2	5	6	2	1
16	human_computer_interaction	Human- Computer Interaction	The course deals with the design, development and evaluation methodologies of computer systems that interact with users to a significant degree. The purpose is to review theoretical models, technologies, methods and tools for the design and development of interactive computing systems. The course includes (1) Human modeling of computer system and conceptual interaction framework, (2) Cognitive models, perception and representation, attention and memory representation and organization of knowledge(3) Interactive Systems Design Methodologies: Human-centric Design, Usability Requirements, Task Analysis, GOMS Models, Dialogue Methods, Interface Design, Usability and Accessibility of Internet Services, Interactive Systems Evaluation Techniques, (4) Overview of Interactive Technologies and Applications: Distributed Intelligence Systems, Ubiquitous Computer, Augmented Reality Systems, Synthetic Animation, Accessibility Interface Systems, Collaboration Applications.	3.4.3362.7	Obligatory (main flow)	2	2	4	7	2	1
8	forecasting_techniques	Forecasting Techniques	The course describes the latest forecasting techniques, both statistical and non-statistical ones, in order the students to be able to understand and implement a forecasting procedure. The main objects of the course are the statistical analysis and extrapolation of time series: Basic statistical concepts, Time series analysis, Time series characteristics, Decomposition, Forecasting methods, Forecasting performance evaluation and monitoring, Special events and treatment methods, Smoothing methods (moving averages), Exponential smoothing methods (Single, Holt, Winters, Damped), Regression models (simple and multiple regression), ARIMA models, Theta (θ) method, Long term predictions, Judgmental forecasting, Forecasting competitions, Hierarchical forecasting (bottom-up/top-down). The course focuses also on the use of IT systems to familiarize students with the exploitation of forecasting techniques in practice, the comparative evaluation of alternative techniques and their implementation in businesses. The ultimate goal is students to acquire both theoretical and practical knowledge in business forecasting techniques. In this respect, the course includes both theoretical lessons and practical training through electronic online games and interactive quizzes.	3.7.3260.8	Obligatory (main flow)	4	0	5	8	1	1
9	management_of_the_digital_enterprise	Management of the Digital Enterprise	The course covers a wide range of technical and managerial topics regarding e-commerce and e-government. The course examines topics lile: e-business models and mechanisms; customer interface design; internet promotion methods and computational advertising algorithms; online search types and functional description of search engines; recommender system techniques and algorithms; business process modelling and management; Enterprise Resource planning (ERP) Systems architectures and their critical success factors; Customer Relationship Management (CRM) Systems; knowledge management approaches, systems and architectures; mobile commerce technologies and applications; e-government, e-democracy and e-participation concepts and frameworks; Web 2.0 and collective intelligence: approaches and mechanisms.	3.7.3365.8	Obligatory by selection	2	1	4	8	1	1
10	multiple_criteria_decision_making	Multiple Criteria Decision Making	The main objective of the Μultiple Criteria Decision Analysis (MCDA) is to support decision making in real life complex problems, with conflicting interests and goals, i.e. the “multiple criteria”. The basic feature of MCDA is the appropriate aggregation of different views and dimensions, taking into consideration the necessary preferences and values of the decision makers. Within this course, the overall philosophy and the methodological framework of the MCDA are outlined and the most important quantitative methods, namely the multiple criteria mathematical programming, the multi-attribute utility theory, the outranking methods and the disaggregation methods are presented in detail. Moreover, representative methods and models that can adequately capture and process the qualitative characteristics of the performance of efficient solutions in the problem criteria are also analyzed and practical application examples of MCDA from the fields of technology, management, economy and energy are presented as well.	3.7.3381.8	Obligatory by selection	3	0	5	8	1	1
11	management_game	Management Game	The scope of the course is to offer to the students a realistic picture of different real-world problems related to fields of the management science. This is achieved by utilizing a management simulation game where the students are called to apply selected management practices. Students, divided into teams of 4 to 5, are called to manage a global company operating in the computer industry sector. All participating students are assigned specific roles linked to the major management operations of the company (General Management, Sales, Marketing, Production, Finance). In this framework the student teams are called to develop and then to apply a complete business plan for their companies and to take decisions regarding different operations. Through this process they get a good understanding regarding the ways that different company operations are interrelated and, at the same time, how the decision making processes get affected by competitors’ moves or by changes in the external environment. The lectures provided in the framework of the course cover major strategic management and business planning topics, as well as specific subjects related to managing main company operations. Each lecture is complemented with presentations of relevant case studies based on real, well-known, enterprises and organizations.	3.7.3334.9	Obligatory (main flow)	0	4	4	9	1	1
12	project_management	Project Management	This course focuses on strategies and tools useful in the management of non-repetitive business activities. Tools introduced during the course include work breakdown structure, network representation, PERT/CPM models and analysis, Gantt charts, time and cost models, resource scheduling and optimisation, project management software, and probabilistic analysis. Strategy considerations covered include dealing with uncertainty, resource constraints, dealing with shared and requested vs. dedicated and commanded resources, and milestone management. Students take a case study approach through the essentials of a four-phase project planning process, learn about the unique challenges at each stage and see how a project manager’s mastery of essential knowledge increases the likelihood of project success.	3.7.3255.9	Obligatory by selection	2	2	5	9	1	1
13	digital_systems_laboratory	Digital Systems Laboratory	Signal processing in digital communication systems. Filtering and amplification of digital signals. Frequency conversion. Multilevel modulation. Amplitude/phase modulation schemes. Frequency modulation schemes. Pulse shaping. Raised cosine pulses. Error performance of multilevel modulation schemes in AWGN channels. Fading. Adaptive transmission. Power control. Diversity protection. Theory and technologies of switching systems including internet routers, optical switches, wireless switches, packet and circuit switches. Packet scheduling algorithms, multicast copy techniques, call splitting. Classification of switching architectures, space and time division switching, buffering techniques and performance. Input-buffered switches, crossbar, shared memory switches, Banyan, sorting networks, Knockout. Optical switches, optical CDMA, high speed TDM, wavelength division switches. Scheduling algorithms (PIM, iRRM, iSLIP, DRRM). Internet switching, IP route lookup algorithms, buffer management techniques. Wireless switches, mobility support. Examples of switching technologies	3.5.3236.6	Obligatory by selection	1	2	4	6	2	1
14	microprocessor_systems\r\n	Microprocessor Systems\r\n	Introduction to Microprocessor Technology and Architecture. Microcomputer Based Systems - Embedded Systems. 8085 Microprocessor Description and Commands. Memory Systems and Technology - Memory Reference Modes. Microprocessor Programming in Assembly Language - Macros and Routines. Techniques for data input/ output. Interrupt Systems and Direct Memory Access. Description of 80x86 Microprocessors, along with all of their commands. Architecture and Programming of AVR and PIC Microcontrollers in Assembly and C Language. Microcontroller  Applications. Introduction to RISC Processors and the ARM Processors.	3.4.3046.6	Obligatory (half flow)	4	0	5	6	2	1
17	microprocessors_laboratory	Microprocessors Laboratory	The course includes laboratory exercises on the following topics: 8085 and 80x86 microprocessor assembly programming. Data input/output procedures. Interrupts. Connection of microprocessors to external units and devices. Automation using microprocessors. Programming of microcontrollers. Microcontroller applications.	3.4.3213.7	Obligatory (main flow)	1	3	5	7	2	1
18	multimedia_technology	Multimedia Technology	Introduction to multimedia. Types of multimedia messages. Multimedia environments. Digital conversion of multimedia data. Multimedia applications programming. Integrated multimedia systems. Specifications, design and implementation of multimedia web applications. Specific requirements for multimedia systems on the Internet. The laboratory exercises of the course are conducted in a java environment in order to meet the requirements of both local and web applications.	3.5.3297.7	Obligatory by selection	1	2	4	7	2	1
19	operating_systems_laboratory	Operating Systems Laboratory	This course offers laboratory projects to assimilate critical concepts from the previous courses "Computer Architecture" and "Operating Systems". The course includes 3-4 exercises in distributed UNIX programming, development of device drivers, kernel-level programming, and extensions of the Linux OS.	3.4.3237.7	Obligatory by selection	0	3	4	7	2	1
20	advanced_topics_in_computer_architecture	Advanced Topics in Computer Architecture	Instruction Set Architectures. Organizing advanced processors: control unit and datapath, pipeline architectures, memory hierarchy organization (cache memories, virtual address translation, TLB), multistage pipeline with variable latency, branch prediction, VLIW, ILP, super scalar pipelines, dynamic command routing (out-of-order- OOO). Examples of modern processors. Hyperthreading, multicoreCMP architectures, SMT architectures.	3.4.3352.8	Obligatory (main flow)	3	1	5	8	2	1
21	computer_system_performance	Computer System Performance	Main approaches for modelling and analysis of computer system performance: analytical models, simulation and empirical techniques. Introduction to queueing theory, queueing networks (general product-form networks, convolution algorithms, mean value analysis), techniques based on queueing networks (operational laws, bounds, hierarchical decomposition, load-independent and load-dependent service models, non-product-form networks, exact and approximate solution algorithms, analysis of specific systems), discrete event simulation (random number generation, program construction, transient removal, statistical analysis of simulation results), measurement techniques and tools (workload, benchmarking, monitoring and capacity planning, design and analysis of experiments). Applications to the performance analysis of various computer systems with emphasison currently established paradigms (client/server, intranets και Internet, Web services etc.).	3.4.3207.8	Obligatory by selection	3	0	4	8	2	1
23	digital_vlsi_systems	Digital VLSI Systems	Implementation of VLSI circuits for arithmetic operations. Implementation of digital filters. Circuits based on special numerical systems for high speed applications. VLSI design tools. Circuit Description Languages for automated Design. Design and implementation of digital systems.	3.4.3328.8	Obligatory by selection	2	2	5	8	2	1
24	image_and_video_analysis_and_technology	Image and Video Analysis and Technology	The course includes theoretical analysis and preparation of laboratory exercises in the field of processing, analyzing, managing, transmitting, accessing and retrieving both digital images and digital video, which is the most complex structure in modern multimedia systems. Theoretical analysis includes the analysis of image and video characteristics, the digitization process (sampling, quantization), image transformations, the encoding and transmission techniques of still and moving images, the analysis of images and video with the application of non linear filters, in order to extract attributes and categorize them. In the laboratory exercises, image and video encoding, compression, analysis and management systems are detailed, with emphasis on JPEG, JPEG2000, MPEG1, MPEG2, MPEG4, MPEG7, MPEG21, and modern Web applications in multimedia systems utilizing the XML structure.	3.4.3330.8	Obligatory by selection	2	2	5	8	2	1
25	distributed_system	Distributed Systems	Synchronization: Natural, logical and vector clocks, natural and logical clock synchronization, Lamport's algorithm. Distributed Coordination: Mutual Exclusion Algorithms, Election Algorithms, Distributed Agreement, Interactive Consistency, Byzantine Protocols, Distributed Consensus Algorithm Paxos. Tasks and concurrency control: ACID properties, embedded transactions, strict two-phase locking, concurrent problems, timer layout, optimistic concurrency control. Distributed Transactions and Timing Control: Distributed Individual Transactions, Distributed Timing Control, Deadlock Detection, Error Recovery. Data Backup: Error Tolerance, Primary / Secondary Backup, Passive / Active Backup, Network Partition Management, High Availability, Consistency Levels, CAP Theorem. Peer-to-peer networks, distributed hash tables, distributed storage systems, Map Reduce and Bulk Synchronous Parallel distributed processing models.	3.4.3377.9	Obligatory by selection	2	1	5	9	2	1
27	embedded_system_design	Embedded System Design	Embedded Systems Description Models: Computational Models, High-Level Programming Languages. Program / Application Design and Analysis: Program Models, High Level Transformations, Translators for Embedded Systems, Program Optimization. Embedded Systems Material: Multiprocessor Architecture (MPSOC), Processing Units, Interconnection Networks and Topologies, Memory Hierarchies, Memory Management Units. Embedded Systems Software: Embedded Real-Time Operating Systems, timing in real-time systems. Embedded Systems Implementation - Hardware and Software Co-design: Design Platforms, Hardware and Software Segmentation, Performance Analysis, Hardware and Software Co-synthesis Algorithms. Verification: Hybrid Systems Verification, Simulation, Testing, Error Simulation, Risk Analysis, Reliability.	3.4.3361.9	Obligatory by selection	2	1	4	9	2	1
28	neural_networks	Neural Networks and Intelligent Systems	Neural networks and other approaches from the broader area of computational intelligence. Neural network models and architectures, dynamics, convergence and stability, learning algorithms, implementation issues and applications. Feedforward neural networks and error-correction learning (multilayer perceptrons and the backpropagation algorithm). Associative networks (Hopfield model). Recurrent multilayer networks. Receptive fields and local learning (Radial basis function networks). Competitive learning (Kohonen maps, ART models). Other computational intelligence methodologies, fuzzy systems, evolutionary computation (genetic algorithms), hybrid approaches. Intelligent system applications (classification and clustering, intelligent agents, information retrieval, human-computer interaction). Laboratory exercises using advanced software tools for neural network simulation.	3.4.3319.9	Obligatory by selection	2	2	5	9	2	1
29	parallel_processing_systems	Parallel Processing Systems	Introduction to Parallel Processing. Shared memory and distributed memory architectures (SMP, COMA, NUMA, cc-NUMA, SMT, Clusters, MPPs). Methods, techniques and interconnection networks (Bus-oriented, Cube, Switch Network, Mixed systems). Clusters as supercomputers. Principles of parallel programming. Design and implementation of parallel programs. Parallelization and partitioning techniques. Parallel programming models: Message passing and shared address space. Synchronization and concurrent data structures. Laboratory exercises: Application development in clusters, multicore and manycore (accelerator) architectures with OpenMP, MPI, CUDA, Cilk and others. Performance analysis.	3.4.3257.9	Obligatory by selection	1	2	4	9	2	1
30	computer_graphics	Computer Graphics	Geometric transformations: transport, scaling and homogeneous coordinates. Views: perspectives, parallel (right-lateral). Line drawing: line, circle, letter and character design algorithms. Clipping: lines, characters, polygons. Field fill: Polygon scanning priority. Shape Models: Third Class Polynomials. Polygon grids. Virtual reality: stereoscopy, removal of hidden surfaces (depth shredder), shading of visible surfaces, x-ray chromatography.	3.4.3165.6	Obligatory by selection	2	2	5	6	3	1
31	databases	Databases	Database Management Systems and their architecture. Data Structures for Databases. Modeling - The E-R model. Reference to classic Database Models (Hierarchical, Network). The Relational Model. Database Languages ​​- The SQL language. File Systems and Physical Database Design. Logical Design and Normalization. Management and Operation Issues (integrity, optimization, reorganization, security, functionality, etc.). Other Issues (Object Oriented Systems, Multi-Systems, Personal Computer Systems, etc.).	3.4.3123.6	Obligatory (main flow)	3	1	5	6	3	1
32	programming_languages_one	Programming Languages I	This course studies the theoretical basis of modern programming languages and main aspects of their design and implementation. Historical introduction to programming languages, design considerations, principles of lexical and syntax analysis, data types and their operations. Introduction to strongly typed functional programming languages using a suitable language (e.g., ML or Haskell). Type inference and polymorphism. Names and scopes. Activation records. Introduction to object-oriented programming languages using a suitable language (e.g. C++, Java or C#). Memory management. Exception handling. Parameters and parameter passing. Introduction to logic programming languages and their foundations using Prolog.	3.4.3061.6	Obligatory (half flow)	3	1	5	6	3	1
33	algorithms_and_complexity	Algorithms and Complexity	Asymptotic estimation of computational complexity, criteria for algorithm selection, polynomial-time algorithms. Priority queues, binary heap, disjoint sets, union-find. Data processing (sorting, selection, search). Algorithm design techniques: divide-and-conquer, greedy, dynamic programming. Applications to graph problems: breadth first search, depth first search, minimum spanning tree, shortest paths, max flow and min cut. Computability and computational complexity. Complexity classes and reductions. The classes of P and NP, NP-completeness. Space complexity and classes. Lab: a set of algorithmic problems to be solved in C/C++.	3.4.3105.7	Obligatory (half flow)	4	1	5	7	3	1
34	artificial_intelligence	Artificial Intelligence	The main topics covered in this course include: problem solving, search algorithms, heuristic methods, game playing, theorem proving and the use of logic for problem solving. Introduction to Prolog and problem solving using Prolog. Knowledge representation. Semantic networks, logic representations, frames, deductive systems and knowledge systems. Planning, machine learning and natural language processing.	3.4.3287.7	Obligatory by selection	3	1	4	7	3	1
35	software_engineering	Software Engineering	Software systems, software life-cycle models, methodologies for developing software systems, software requirements, software design, software coding, testing, verification and validation, project management, cost analysis, quality assurance, model management, software development environments and software standards. Use of object oriented programming techniques and design patterns, design and development of software systems using the UML modeling language. Lab: Specification, design and implementation of a software application using standardized modeling techniques.	3.4.3205.7	Obligatory (main flow)	2	2	5	7	3	1
36	advanced_algorithms	Advanced Algorithms	Optimization problems, convexity and optimization. Linear programming, geometry, basic feasible solutions, Simplex, duality, complementary slackness conditions. Max flow, min cut, min cost flow. Randomized algorithms, max cut, Chernoff-Hoeffding bounds, applications to load balancing and random sampling. Approximation algorithms, basic techniques, LP-based approximation algorithms, randomized rounding, the primal-dual method, inapproximability, approximation preserving reductions. Online algorithms, paging, scheduling and load balancing problems, network design problems. Algorithmic game theory, Nash equilibrium, price of anarchy, congestion games, stable matchings, mechanism design.	3.4.3135.8	Obligatory by selection	3	0	4	8	3	1
37	compilers	Compilers	Introduction: compilers and related tools, compilation phases, organization of a compiler. Formal languages: notations, automata, grammars. Scanning: tokens, design of the scanner. Parsing: design of a bottom-up and top-down parser. Symbol tables. Semantic analysis: type systems and checking. Intermediate code generation: forms of intermediate code, syntax directed translation. Final code generation: the target machine, memory management and activation records, simple final code generation, instruction selection, register allocation. Code optimization. Tools for automatic compiler generation: lex/flex, yacc/bison, meta-compilers. Lab: design and implementation of a compiler for a hypothetical programming language.	3.4.3186.8	Obligatory by selection	2	2	5	8	3	1
38	computability_and_complexity	Computability and Complexity	Computability: Logical foundation of computer science, historical overview about the problem of decidability of mathematical propositions, solvability or computability of problems with an effective, i.e. algorithmic, way. Simple equivalent computational models: Turing machines, WHILE programs. Induction and recursion, encodings and semantics. Fix-point theory. Arithmetical hierarchy.\r\nComplexity: Relations among complexity classes. Reductions and completeness. Oracles. Polynomial hierarchy. Probabilistic, interactive and counting classes. Advanced topics of formal grammar theory. Applications to the syntax of programming languages.	3.4.3254.8	Obligatory by selection	3	0	4	8	3	1
39	internet_programming	Internet Programming	The course of Internet Programming covers the following topics:\r\n\r\nPresentation of the state-of-the-art of Internet technologies, with emphasis to the structure and operation of TCP/IP protocol as well as datagrams και socket oriented communications.\r\nStructure attributes of the HTTP communications protocol, including HTML programming language on the web, programming of HTTP servers, HTML-based applications development of dynamic web pages CGI scripts coded in PERL language.\r\nState-of-the-art Web Applications, with emphasis to security issues and the future of Internet.\r\nIntroduction in Java, covers differences between Java and C++, advantages of Java language, Java structures and programming Java in Unix environments.\r\nObject oriented programming: classes, objects, messages, methods, constructors, access control and overloading. Basic classes and packages, vectors και hash tables, inheritance, polymorphism, variables and methods, abstract basic classes.\r\nObject Oriented Programming code and interfaces design covers execution type recognition, class objects, nested classes, packages, exceptions, error handling, threads, concurrency, synchronization. Input/output and net classes, sockets, streams, tokenizing, client/server, URLs. Abstract window toolkit (AWT), component/container, graphics, applets, fonts, colors, widgets, layout, text, event handling, windows, menus, images, beans.\r\nAdvanced topics on: security, verification, native methods, garbage collection, images and sounds.	3.5.3337.8	Obligatory by selection	2	2	4	8	3	1
40	knowledge_systems_and_technologies	Knowledge Systems and Technologies	The main objective of this module is to introduce students to the fundamentals of knowledge systems and technologies. In particular, based on the framework of Description Logics, methodologies for object-oriented knowledge representation, management, evolution, as well as automated reasoning and semantic data integration algorithms are described. Moreover, emphasis is given to the analysis of W3C standards for semantic data and knowledge representation (XML, RDF, OWL etc), ontology engineering and applications of knowledge-based systems and intelligent web services.	3.4.3183.8	Obligatory by selection	3	0	4	8	3	1
47	queuing_systems	Queuing Systems	The course aims at introducing students to methodologies in modeling and performance evaluation for Internet based communication networks and computer systems. The emphasis is on the analysis of such systems as simple queuing models, complemented by simulation techniques. Yearly updated On-line Lectures (synchronized video/audio and transparencies) are accessed via the Network Management & Optimal Design Laboratory (NETMODE) web site - www.netmode.ece.ntua.gr. Topics covered include:\r\n\r\nOverview of probability theory with emphasis on memoryless probability distributions (Poisson and exponential distributions)\r\nDefinitions of Markov stochastic processes, ergodicity\r\nDefinitions and basic models of queuing systems. Arrival& departure processes, state definition, steady-state behavior, steady-state probabilities, utilization, average queue size and delay, Little’s formula, throughput, blocking probability\r\nBirth – death processes and applications in simple Markov queuing systems. M/M/1, M/M/1/K, M/M/N, M/M/N/N, state dependent queues\r\nOpen and closed networks of queues. Product form state probabilities, Burke’s theorem, Jackson’s theorem, Gordon/Newell theorem, Buzen’s algorithm\r\nIntroduction to M/G/1 queues, Pollaczeck–Khinchin formulae\r\nApplications in performance evaluation of data networks, telephone networks and computer systems	3.5.3248.6	Obligatory (main flow)	3	1	4	6	4	1
41	advanced_topics_in_database_systems	Advanced Topics in Database Systems	Database Management Systems Coordination and Restore. Distributed databases and their operating problems. New standard SQL-3. Database Engines. Advanced database systems and applications (object-oriented, temporal, active, spatial databases, database repositories). Correlation of mathematical logic and databases (inductive databases).	3.4.3189.9	Obligatory by selection	3	0	4	9	3	1
42	analysis_and_design_of_information_systems	Analysis and Design of Information Systems	The first part of the course covers the basic definitions and classifications for Information Systems and presents extended examples and elements of Management and Decision Sciences. In addition, the topics of (social) Implications and Quality of Information Systems (IS) are covered. The second part of the course presents technological issues of IS - with emphasis on Architectures (client-server, distributed systems, web-based, etc.), Software Systems and Data Base Management Systems. In the third part, which constitutes the kernel of the course, the methodologies and techniques for developing Information Systems are examined in depth. Methodologies for analysis and design, object-based methodologies, platforms and tools for development are analyzed and are used in the laboratory. Finally, the fourth part of the course deals with important operational topics (re-engineering, BPR, benchmarking, management of IS, etc) which are examined with the help of real case studies.	3.4.3321.9	Obligatory by selection	3	0	4	9	3	1
43	computational_cryptography	Computational Cryptography	Classical cryptography: Substitution cryptosystems, Caesar, Vigenere, cryptanalysis methods. Perfect secrecy (Shannon), one-time pad. Semantic security, CPA, CCA, PCPA. Symmetric cryptography. Pseudorandomness, stream cryptosystems. Block cryptosystems: Feistel circuits, DES, AES, operation modes. Message authentication codes (MACs). Hash functions, salt, Merkle trees.\r\nElements of number theory: divisibility, residue arithmetic, quadratic residues, Chinese remainder theorem. Elements of group theory: groups, rings, Legendre theorem. Euler's φ function. Prime number tests. Public key cryptography. RSA and Rabin cryptosystems, relation to factoring problem. The discrete logarithm problem, ElGamal cryptosystem. Diffie-Hellman key exchange. Digital signatures: RSA, DSS, blind signatures. Cryptographic protocols: secret sharing, zero knowledge proofs, identification. Elements of complexity theory: one-way functions. Applications: encrypted communications, electronic voting, attacks, crypto-currencies (bitcoin).\r\nThe course contains (in addition to exercises) a project with a written report and presentation.	3.4.3327.9	Obligatory by selection	3	1	4	9	3	1
44	programming_languages_two	Programming Languages II	Theory issues. The course examines the theoretical foundations of the main programming language paradigms: imperative	3.4.3320.9	Obligatory by selection	3	0	4	9	3	1
46	digital_communications_one	Digital Communications I	Introduction. Digital signal processing in telecommunications. Simulation of analog modulation. Optimal digital recognition. Custom filters. Spectral characteristics of digital waveforms. Nyquist filter formatting. QAM and PSK Digital Modulation. FSK and MSK digital modulation. Channel performance, theoretical limits and practical approaches. Specific topics and examples of modern digital communication systems. DMT and OFDM modulation. DSL and DVB-T Digital Television Transmission Systems. During the semester there will be eight three-hour lab exercises on the subject using software tools such as MATLAB.	3.5.3299.6	Obligatory (main flow)	2	2	5	6	4	1
48	digital_communications_two	Digital Communications II	1)Introduction to Finite Bodies 2)Linear Block Codes 3)Circular Codes 4)Reed-Solomon coding 5)Convolutional Decoder Representation 6)The problem of convolutional decoding 7)Spread Spectrum Techniques	3.5.3393.7	Obligatory by selection	3	1	5	7	4	1
49	computer_networks	Computer Networks	This course covers the technologies and protocols used in the Internet, starting with the fundamental underlying transmission technologies and protocols. The design principles of Internet protocols, including the Internet Protocol (IP), Address Resolution Protocol (ARP), Internet Control Message Protocol (ICMP), User Datagram Protocol (UDP) and Transmission Control Protocol (TCP), the Domain Name System (DNS), routing protocols (RIP, OSPF, BGP), and application-level protocols (FTP, TFTP, TELENET, SSH, HTTP, HTTPS, DNS, DHCP, SMTP) are explored. A set of laboratory exercises provide hands-on experience so as the students comprehend the operation of Internet Protocols, by capturing and analyzing traffic generated in IP networks.	3.5.3298.7	Obligatory (half flow)	2	2	5	7	4	1
50	telephony	Telephony	This course has two aspects: the traffic theoretic and the technological one. The technological part covers the basic telephony transmission and switching systems, starting with the description the basic design of telephone sets, historical analog exchanges and in-band signaling systems, local loops and transmission systems like ADSL, PCM (E1/T1), SDH/SONET. Digital exchanges and the underlying technologies for time vs. space division multiplexing in switching matrices and call processing are explored. Introduction to digital telephony systems, i.e. ISDN, the Intelligent Network, and the Common Channel Signaling System No. 7, Voice over IP (VoIP), SIP and H.323 based systems. The theoretical part covers the basic telephony traffic engineering, basic concepts of telephone traffic and congestion metrics (blocking probability, queuing delay, etc), network dimensioning principles (Moe's method). Congestion measures are derived for the typical telephone systems, lost call cleared systems (Erlang-B and Engset formulas) and delay systems (Erlang-C formula). Discussion on the routing principles and their consequences to the statistical description of traffic (overflow traffic, smoothed and peaked traffic). Introduction to the equivalent random traffic method for the engineering of such complex systems.	3.5.3060.7	Obligatory by selection	3	1	5	7	4	1
51	multimedia_communication	Multimedia Communication	Basic principles of television. Color television. Colorimetric data. Color TV systems and standards [NTSC, PAL, SECAM]. Digital Encoding / Compression of Images and Videos. Encoding / compression algorithms. JPEG, H.261, MPEG standards. Digital Television Broadcasting. The ATSC and DVB standards for Digital Television. Ground, satellite, cable transmission systems. Interactive television and multimedia communication. Network and Service Architecture for Interactive Television. Access networks. IPTV, MHP. Television and multimedia services over the Internet. Applications. During the semester four laboratory exercises will be conducted on the subject.	3.5.3329.8	Obligatory by selection	2	1	4	8	4	1
52	computer_network_security	Computer Network Security	Introduction, computer network architectures, attacks to networks, security services and mechanisms. Cryptographic tools, user authentication, access control, malware, denial of service attacks, intrusion detection, firewalls, attack prevention mechanisms. Symmetric encryption, Data Encryption Standard (DES), Advanced Encryption Standard (AES), multiple encryption, asymmetric algorithms, public key cryptography, RSA. Data integrity, hash functions, Secure Hash Algorithm (SHA), message authentication code (MAC), digital signatures. Authentication, Kerberos, X.509 standard, Public Key Infrastructure (PKI). Internet security, Secure Sockets Layer (SSL), Transport Layer Security (TLS), HTTPS, SSH. Wireless network security, IEEE 802.11i, transport layer security. E-mail security, Pretty Good Privacy (PGP), Secure Multipurpose Internet Mail Extensions (S/MIME), DomainKeys Identified Mail (DKIM). Laboratory exercises on encryption algorithms, vulnerability and intrusion detection, firewalls.	3.5.3370.8	Obligatory by selection	2	1	4	8	4	1
53	mobile_personal_communication_networks	Mobile and Personal Communication Networks	Mobile and personal communications, Wireless mobile and personal communication systems, Design issues, Impact of mobility on communication networks, 3G and 4G mobile communication systems. The wireless environment in mobile communications, Path loss, Fading, Radio channel attributes. Cellular systems, cellular architecture, Frequency reuse, Traffic engineering, Spectrum efficiency, capacity of CDMA cellular systems. Interference in the wireless environment of mobile communications, Capacity improvement in cellular systems. Radio resource allocation techniques in cellular systems, Channel assignment, Multiple access techniques. Architecture of cellular systems, Support of user mobility, Cellular networking. Transmission techniques in mobile networks, Encryption, Modulation. Radio resource management, Handover. Mobility management, Location management, Location update, Security management, Mobility models. Communication management, Call control, Interrogation, Paging, Supplementary services, message transmission in mobile networks. Location based services in mobile networks, methods for mobile terminal positioning.	3.5.3312.8	Obligatory by selection	3	0	4	8	4	1
54	telecommunication_systems_simulation	Telecommunication Systems Simulation	Understand the principles of the operation of computer networks and network protocols used in the Internet. Series of twelve simulation exercises, in a virtual laboratory environment, including the configuration of networked devices (routers, firewalls, servers, PCs) interconnected in a variety of topologies Experimentation with typical static and dynamic routing, protocols, RIP, OSPF, BGP, basic network services, DHCP, DNS, NAT and Firewalls. In depth study of the IPv6 protocol and its interoperability with IPv4.	3.5.3278.8	Obligatory by selection	0	3	4	8	4	1
55	broadband_networks	Broadband Networks	Elective: 3-0 Networking technologies for multimedia services, circuit switching, packet switching, frame relay, optical switching. Synchronous Digital Hierarchy (SDH/SONET). Neτwork architectures for broadband communications, basic reference model, reference configuration, protocol reference model. Asynchronous Transfer Mode (ATM), ATM Adaptation Layer (AAL), network management. Switchnig architectures. Traffic engineering, resource allocation, connection admission control (CAC), usage parameter control, priority and traffic shaping algorithms. Service classes, available bit rate services. Traffic modeling and performance evaluation of CAC algorithms and switching architectures. Signalling and service control, Intelligent Networks (IN). Access networks, passive optical networks (PONs), xDSL, broadband local and metropolitan networks, wireless broadband access networks. Interworking and interoperability, quality of service.	3.5.3323.9	Obligatory by selection	3	0	4	8	4	1
56	information_theory	Information Theory	Entropy, relative entropy and mutual information, asymptotic equipartition property, entropy rate of a stochastic process, data compression, gambling, channel capacity, differential entropy, Gaussian channel, rate distortion theory, information theory and statistics, maximum entropy, universal source coding, Kolmogorov complexity, network information theory, application of information theory on portfolio theory, inequalities in information theory.	3.5.3125.9	Obligatory by selection	3	0	4	9	4	1
57	network_management	Network Management – Intelligent Networks	The course aims at introducing students to Network Management, with emphasis on Internet based architectures and protocols. The course material consists of Lecture Notes, Laboratory Exercises & On-line Lectures (synchronized video/audio and transparencies), yearly updated and accessed via the Network Management & Optimal Design Laboratory (NETMODE) web site - www.netmode.ece.ntua.gr. Topics covered include:\r\n\r\nThe Network Management Framework FCAPS (Fault, Configuration, Accounting, Performance & Security) definitions\r\nReview of the TCP/IP protocol suite and current networking advances in optical Backbone Networks, broadband Access and Local Area Networks. Illustration via the NTUA Campus LAN, the Greek Academic& Research Network GRNET and the Pan-European optical backbone GÉANT\r\nCommercial service providers, peering and service provisioning\r\nManagement of TCP/IP networks – the Simple Network Management Protocol (SNMP)\r\nManagement & operations at lower layers, Ethernet switching, Virtual Local Area Networks (VLANs)\r\nSecurity management: Digital certificates, Public Key Infrastructures (PKI), Authentication & Authorization Infrastructures (AAI), intrusion and anomaly detection\r\nVirtual Private Networks (VPNs), Cloud computing and Service Oriented Architectures (SOA)\r\nIntelligent Software Defined Networks – SDN, OpenFlow Control Architectures\r\nStudents get hands-on experience at the NTUA PC Labs. Laboratory exercises involve using TCP/IP based protocol analysis and network management Software tools.	3.5.3251.9	Obligatory by selection	3	1	5	9	4	1
58	optical_communication_networks	Optical Communication Networks	Optical links and constraints. Wavelength Division Multiplexing (WDM) technology. Fundamental optical network devices and switches. Optical Multiplexers-Demultiplexers, Optical Cross-Connects (OXCs), Passive non-configurable and active reconfigurable OXCs, Wavelength-Convertible Cross Connects Switches (WCS), Wavelength Converters. Broadcast and Select Networks. Passive Star Topology. Wavelength Selective Switches. Planning and Operation of Optical Networks. Routing and Wavelength Assignment (RWA) problem. Integer Linear Programming (ILP) Formulations. Heuristic algorithms. Dynamic Wavelength Assignment (RWA). Physical Layer Impairments and Impairment-Aware RWA. Spectrum-Flexible Networks and Modulation Level Adaptability. The Routing and Spectrum Allocation (RSA) problem. Defragmentation, Re-optimization and Multi-period Planning of Optical Networks. Physical and Virtual Topology. Virtual topology design formulation and optimization problem. Mixed Integer Linear Programming (MILP) formulations. Optical Packet Switched Networks. The Staggering, SLOB, and Scheduling Optical Switch Architectures. Optical Burst Switching (OBS) Network Architecture, burst assembly, classification of signaling schemes. Connection establishment and flow control protocols. Just Enough Time (JET), Just In Time (JIT), Tell and Wait (TAW), Tell and Go (TAG), and Virtual Circuit Deflection (VCD) protocols. Metropolitan Area Networks (MANs). Datacenters, Optical Interconnects and Topologies. Software Defined Networking (SDN).	3.5.3367.9	Obligatory by selection	3	0	3	9	4	1
59	social_network_analysis	Social Network Analysis	Introduction to Network Science: Basic Network Definitions, Network Role and Different Applications, Topology Checking and Networking. Graph Theory Elements and Overview of Basic Definitions. Structure and characteristics of complex and social networks: random network models, small-world networks, power-law networks, scale-free networks, regular networks, random geometric networks (random geometric graphs), etc. Complex and social network analytics elements: analytics metrics (node ​​degree distribution, aggregation coefficient, network centrality, etc.), selective connectivity and network creation / evolution. Evolutionary computation: genetic algorithms, cognitive algorithms, parallel computation and heuristic computation methods. Applications in Telecommunications and Computer Science: topology control, routing and resource allocation, effect of network structure on dissemination of information / opinion formation, impact of social networks on recommendation systems, epidemiological information models, collaboration and synchronization, impact of social networks on systems communication.The laboratory exercises focus on collecting free / open data from social networks, data processing and statistical analysis to study topologies and features of different networks, identify network influence nodes, detect communities with similar features, disseminate information / system study, methods of social constitution.	3.5.3379.9	Obligatory by selection	2	1	4	9	4	1
\.


--
-- Data for Name: curriculum_designer_course_course_lecturers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_course_course_lecturers (id, course_id, lecturer_id) FROM stdin;
1	1	1
2	2	2
3	2	3
4	2	4
5	3	5
6	3	6
7	3	7
8	4	1
9	5	2
10	5	4
11	7	3
12	7	4
13	7	5
14	7	6
15	7	7
16	8	8
17	9	9
18	9	10
19	10	3
20	10	5
21	10	6
22	11	2
23	11	3
24	11	4
25	11	6
26	11	8
27	11	9
28	12	9
29	12	10
30	13	11
31	13	12
32	13	13
33	14	14
34	15	15
35	15	16
36	15	17
37	16	20
38	16	21
39	16	22
40	16	18
41	16	19
42	17	14
43	17	22
44	18	23
45	19	16
46	19	15
47	20	24
48	20	16
49	21	19
50	21	21
51	23	14
52	24	25
53	24	18
54	24	22
55	25	16
56	27	14
57	28	18
58	28	19
59	28	20
60	28	21
61	28	22
62	29	15
63	29	24
64	30	18
65	31	16
66	31	26
67	32	27
68	32	28
69	32	29
70	33	30
71	33	31
72	34	25
73	35	27
74	35	32
75	35	33
76	36	30
77	36	34
78	37	27
79	37	28
80	38	35
81	38	36
82	40	25
83	39	37
84	41	16
85	41	26
86	42	17
87	42	26
88	42	38
89	43	34
90	43	29
91	44	27
92	46	39
93	46	40
94	46	41
95	46	42
96	47	43
97	47	44
98	47	41
99	48	39
100	49	43
101	49	40
102	49	42
103	49	45
104	50	45
105	50	42
106	51	39
107	51	43
108	52	42
109	52	45
110	52	46
111	53	23
112	54	45
113	54	40
114	54	42
115	55	48
116	56	46
117	57	43
118	57	41
119	58	23
120	58	49
121	59	43
122	59	42
123	59	50
\.


--
-- Name: curriculum_designer_course_course_lecturers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_course_course_lecturers_id_seq', 123, true);


--
-- Data for Name: curriculum_designer_course_course_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_course_course_skills (id, course_id, skill_id) FROM stdin;
1	1	1
2	1	3
3	1	4
4	1	5
5	1	6
6	1	7
7	1	17
8	1	18
9	1	19
10	1	20
11	1	21
12	1	22
13	1	23
14	1	24
15	1	25
16	1	26
17	1	27
18	1	28
19	2	29
20	2	30
21	2	31
22	2	32
23	2	33
24	2	34
25	2	35
26	2	36
27	2	37
28	2	38
29	2	39
30	2	40
31	2	41
32	2	42
33	3	43
34	3	44
35	3	45
36	3	46
37	3	47
38	3	48
39	3	49
40	4	50
41	4	51
42	4	52
43	4	53
44	4	54
45	4	48
46	4	46
47	4	55
48	5	57
49	5	58
50	5	59
51	5	60
52	5	61
53	5	62
54	5	63
55	5	64
56	5	65
57	5	66
58	5	67
59	5	68
60	5	69
61	5	70
62	5	71
63	5	41
64	7	72
65	7	73
66	7	74
67	8	75
68	8	76
69	8	77
70	8	78
71	8	79
72	8	80
73	8	81
74	8	82
75	8	83
76	8	84
77	8	85
78	9	86
79	9	87
80	9	88
81	9	89
82	9	90
83	9	91
84	9	92
85	9	93
86	9	68
87	10	94
88	10	95
89	10	96
90	11	36
91	11	72
92	11	57
93	11	98
94	11	99
95	11	100
96	11	101
97	11	102
98	11	103
99	11	104
100	2	103
101	11	40
102	3	99
103	5	102
104	7	104
105	9	101
106	10	99
107	12	105
108	12	106
109	12	107
110	12	108
111	12	109
112	12	110
113	12	99
114	12	100
115	13	111
116	13	112
117	13	113
118	13	114
119	13	115
120	13	116
121	13	117
122	13	118
123	13	119
124	13	120
125	13	121
126	14	122
127	14	123
128	14	124
129	14	125
130	15	126
131	15	127
132	15	128
133	15	129
134	15	130
135	15	131
136	16	132
137	16	133
138	16	134
139	16	135
140	17	122
141	17	125
142	17	124
143	17	123
144	18	136
145	18	137
146	18	138
147	18	139
148	19	126
149	19	127
150	19	128
151	19	140
152	19	141
153	19	142
154	20	143
155	20	144
156	20	145
157	20	146
158	20	147
159	20	148
160	20	149
161	20	150
162	20	151
163	20	123
164	21	153
165	21	154
166	21	155
167	21	156
168	23	158
169	23	159
170	23	111
171	23	112
172	24	160
173	24	161
174	24	162
175	24	163
176	24	164
177	24	165
178	24	166
179	3	161
180	8	161
181	8	162
182	25	168
183	25	169
184	25	170
185	25	171
186	25	172
187	25	173
188	25	174
189	25	175
190	25	176
191	25	177
192	25	178
193	25	138
194	9	179
195	9	180
196	21	138
197	27	181
198	27	182
199	27	183
200	27	184
201	27	185
202	27	186
203	27	187
204	27	188
205	27	189
206	27	49
207	28	190
208	28	191
209	28	192
210	28	193
211	28	194
212	28	195
213	28	196
214	28	197
215	28	198
216	28	199
217	28	200
218	28	201
219	28	202
220	28	203
221	28	204
222	28	205
223	28	135
224	29	206
225	29	207
226	29	208
227	29	209
228	29	210
229	29	211
230	29	212
231	29	213
232	29	214
233	29	215
234	29	216
235	29	217
236	29	218
237	29	219
238	29	220
239	29	221
240	29	155
241	30	222
242	30	223
243	30	224
244	30	225
245	30	226
246	30	227
247	30	228
248	31	237
249	31	238
250	31	239
251	31	240
252	31	241
253	31	242
254	31	243
255	31	244
256	32	245
257	32	246
258	32	247
259	32	248
260	32	249
261	32	250
262	32	251
263	32	252
264	32	130
265	32	139
266	32	138
267	32	128
268	33	253
269	33	254
270	33	255
271	33	256
272	33	257
273	33	258
274	33	259
275	33	260
276	33	261
277	33	262
278	33	263
279	33	128
280	33	45
281	33	264
282	34	264
283	34	265
284	34	266
285	34	267
286	34	268
287	34	269
288	34	270
289	34	257
290	34	258
291	34	128
292	34	248
293	34	250
294	34	271
295	35	272
296	35	273
297	35	274
298	35	275
299	35	276
300	35	277
301	35	278
302	35	187
303	35	138
304	35	139
305	2	274
306	5	274
307	12	272
308	12	273
309	36	279
310	36	280
311	36	281
312	36	282
313	36	283
314	36	284
315	36	46
316	36	47
317	36	261
318	11	284
319	37	285
320	37	286
321	37	287
322	37	288
323	37	289
324	37	290
325	37	291
326	37	292
327	37	130
328	37	128
329	37	138
330	37	246
331	37	251
332	38	293
333	38	294
334	38	295
335	38	296
336	38	253
337	38	254
338	38	262
339	38	263
340	38	245
341	39	297
342	39	298
343	39	299
344	39	244
345	39	242
346	39	138
347	39	251
348	39	139
349	39	228
350	40	303
351	40	304
352	40	305
353	40	306
354	40	307
355	40	308
356	40	266
357	40	268
358	40	288
359	41	309
360	41	310
361	41	311
362	41	312
363	41	313
364	41	314
365	41	315
366	41	316
367	41	237
368	41	317
369	41	318
370	41	319
371	41	320
372	41	321
373	41	322
374	42	323
375	42	324
376	42	325
377	42	326
378	42	327
379	42	328
380	42	100
381	42	90
382	42	237
383	42	91
384	42	329
385	43	329
386	43	331
387	43	332
388	43	333
389	43	334
390	43	335
391	43	336
392	43	337
393	43	338
394	43	339
395	43	340
396	43	341
397	43	342
398	43	343
399	43	344
400	43	345
401	43	346
402	43	347
403	43	348
404	43	349
405	43	294
406	44	246
407	44	247
408	44	248
409	44	249
410	44	250
411	44	251
412	44	252
413	44	130
414	44	139
415	44	138
416	44	350
417	44	351
418	44	352
419	44	353
420	44	354
421	46	352
422	46	353
423	46	354
424	46	355
425	46	356
426	46	357
427	46	358
428	46	359
429	46	360
430	46	361
431	46	362
432	46	363
433	46	116
434	46	159
435	46	160
436	47	366
437	47	367
438	47	368
439	47	59
440	47	152
441	47	156
442	47	49
443	47	161
444	48	116
445	48	370
446	48	371
447	48	372
448	48	373
449	48	374
450	49	375
451	49	376
452	49	377
453	49	378
454	49	379
455	49	380
456	49	381
457	49	382
458	49	383
459	49	384
460	50	385
461	50	386
462	50	387
463	50	388
464	50	389
465	50	390
466	50	391
467	50	392
468	50	393
469	50	394
470	50	395
471	50	396
472	50	397
473	50	398
474	50	115
475	51	399
476	51	400
477	51	417
478	51	418
479	51	419
480	51	420
481	51	421
482	51	422
483	51	423
484	51	424
485	51	425
486	51	426
487	51	427
488	51	428
489	51	429
490	51	430
491	51	431
492	52	433
493	52	434
494	52	435
495	52	436
496	52	437
497	52	438
498	52	439
499	52	440
500	52	441
501	52	442
502	52	443
503	52	444
504	52	445
505	52	446
506	52	447
507	52	448
508	52	449
509	52	450
510	52	451
511	52	452
512	52	453
513	52	454
514	52	455
515	52	456
516	52	457
517	52	458
518	52	459
519	52	460
520	52	461
521	52	375
522	52	329
523	52	331
524	52	335
525	53	462
526	53	463
527	53	464
528	53	465
529	53	466
530	53	467
531	53	468
532	53	469
533	53	470
534	53	471
535	53	472
536	53	473
537	53	474
538	53	396
551	53	482
552	53	483
553	53	475
554	53	476
555	53	477
556	53	478
557	53	479
558	53	480
559	53	481
560	53	384
561	53	375
562	53	49
563	53	115
564	53	437
565	55	489
566	55	490
567	55	491
568	55	136
569	55	115
570	55	484
571	55	485
572	55	486
573	55	396
574	55	487
575	55	488
576	55	391
577	56	493
578	56	494
579	56	495
580	56	162
581	56	496
582	56	497
583	56	498
584	56	499
585	57	488
586	57	376
587	57	381
588	57	377
589	57	450
590	57	436
591	57	500
592	57	501
593	57	502
594	57	503
595	57	504
596	57	505
597	57	506
598	57	507
599	58	508
600	58	509
601	58	510
602	58	511
603	58	512
604	58	513
605	58	514
606	58	515
607	58	516
608	58	517
609	58	518
610	58	519
611	58	520
612	58	521
613	58	522
614	58	523
615	58	524
616	58	525
617	58	526
618	58	527
619	58	528
620	58	529
621	58	64
622	58	506
623	58	265
624	59	530
625	59	531
626	59	532
627	59	533
628	59	534
629	59	535
630	59	536
631	59	537
632	59	538
633	59	539
634	59	542
635	59	543
636	59	544
637	59	265
638	59	162
639	59	540
\.


--
-- Name: curriculum_designer_course_course_skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_course_course_skills_id_seq', 639, true);


--
-- Name: curriculum_designer_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_course_id_seq', 59, true);


--
-- Data for Name: curriculum_designer_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_flow (id, flow_name, flow_title, flow_abbreviation) FROM stdin;
1	management_and_dss	Management and Decision Support Systems	O
2	computer_systems	Computer Systems	Y
3	computer_software	Computer Software	L
4	telecommunication_systems_computer_networks	Telecommunication Systems and Computer Networks	D
\.


--
-- Name: curriculum_designer_flow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_flow_id_seq', 4, true);


--
-- Data for Name: curriculum_designer_lecturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_lecturer (id, lecturer_first_name, lecturer_last_name, lecturer_type) FROM stdin;
1	Pantelis	Capros	professor
2	Dimitrios	Askounis	professor
3	Ioanna	Makarouni	t & r associate
4	Dimitrios	Panopoulos	t & r associate
7	Maria	Flouri	t & r associate
8	Vassilis	Assimakopoulos	professor
9	Gregoris	Mentzas	professor
10	Xenia	Papadomichelaki	t & r associate
6	John 	Psarras	professor
5	Haris	Doukas	associate professor
11	Elias	Koukoutsis	associate professor
12	Konstantinos	Papaodyssefs	professor
13	Ioannis\r\n	Panagodimos	t & r associate
14	Dimitrios	Soudris	professor
15	Georgios	Goumas	associate professor
16	Nectarios	Koziris	professor
17	Panayiotis	Tsanakas	professor
18	Stefanos	Kollias	professor
19	Andreas-Georgios	Stafylopatis	professor
20	Georgios	Alexandridis	t & r associate
21	Georgios	Siolas	t & r associate
22	Paraskevi	Tzouveli	t & r associate
23	Emmanouel	Varvarigos	professor
24	Dionisios	Pnevmatikatos	professor
25	Giorgos	Stamou	associate professor
26	Vassiliki (Verena)	Kantere	associate professor
27	Nikolaos	Papaspyrou	professor
28	Kostis	Sagonas	associate professor
29	Petros	Potikas	t & r associate
30	Dimitris	Fotakis	associate professor
31	Theodora	Souliou	t & r associate
32	Vassilios	Veskoukis	t & r associate
33	Konstantinos	Saidis	t & r associate
34	Aris	Pagourtzis	associate professor
35	Stathis	Zachos	professor
36	Petros	Potikas	t & r associate
37	Theodora	Varvarigou	professor
38	Konstantinos	Tzamaloukas	t & r associate
39	Nikolaos	Mitrou	professor
40	Peristera	Baziana 	t & r associate
41	Maria	Grammatikou	t & r associate
42	Konstantina	Sakka	t & r associate
43	Symeon	Papavassiliou	professor
44	Theodoros	Karounos	t & r associate
45	Efstathios	Sykas	professor
46	Miltiades	Anagnostou	professor
47	Ioanna	Roussaki	associate professor
48	Iakovos	Venieris	professor
49	Hercules	Avramopoulos	professor
50	Kariotis	Vassilios	t & r associate
\.


--
-- Name: curriculum_designer_lecturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_lecturer_id_seq', 50, true);


--
-- Data for Name: curriculum_designer_school; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_school (id, school_name, school_title, school_abbreviation) FROM stdin;
1	ntua	National Technical University of Athens	NTUA
\.


--
-- Name: curriculum_designer_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_school_id_seq', 1, true);


--
-- Data for Name: curriculum_designer_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_skill (id, skill_name, skill_title, skill_type, hard_skill) FROM stdin;
1	basic_production_consumption_transactions_prices_money	Basic concepts about production, consumption, transactions, prices and money	management	f
3	microeconomic_optimization_of_consumer	Microeconomic optimization of consumer behavior	management	f
4	utility_and_demand_functions	Utility and demand functions	management	f
5	income_and_price_elasticities	Income and price elasticities	management	f
6	microeconomic_optimization_of_producer_behavior	Microeconomic optimization of producer behavior	management	f
7	production_functions	Production functions	management	f
17	productivity_of_production_factors	Productivity of production factors	management	f
18	cost_functions	Cost functions	management	f
19	economies_of_scale	Economies of scale	management	f
20	pricing_commodities	Pricing commodities	management	f
21	market_equilibrium	Market equilibrium	management	f
22	price_formation	Price formation	management	f
23	perfect_and_imperfect_competition	Perfect and imperfect competition	management	f
24	theory_of_monopoly_and_oligopoly_competition	Theory of monopoly and oligopoly competition	management	f
25	investment_and_financial_flows	Investment and financial flows	management	f
26	discount_rates	Discount rates	management	f
27	present_value_and_rate_of_return_on_capital	Present value and rate of return on capital	management	f
28	decisions_under_uncertainty	Decisions under uncertainty	management	f
29	enterprise_and_management_functions	Enterprise and management functions	management	f
30	business_planning_and_strategy	Business planning and strategy	management	f
31	swot_analysis	SWOT analysis	management	f
32	strategies_for_competitive_advantage	Strategies for competitive advantage	management	f
33	ethical_and_social_responsibility_in_management	Ethical and social responsibility in management	management	f
34	enterprise_organisation_and_organisational_behaviour	Enterprise organisation and organisational behaviour	management	f
35	human_resources_management	Human resources management	management	f
36	marketing_strategy	Marketing strategy	management	f
37	market_segmentation	Market segmentation	management	f
38	marketing_mix	Marketing mix	management	f
39	entrepreneurship	Entrepreneurship	management	f
40	leadership	Leadership	management	f
41	control_and_quality_management	Control and quality management	management	f
42	operations_management	Operations management	management	f
43	decision_support_model	Decision support model	management	f
44	decision_trees	Decision trees	management	f
45	dynamic_programming	Dynamic programming	management	f
46	linear_programming	Linear programming	management	f
47	simplex_algorithm	Simplex algorithm	management	f
48	sensitivity_analysis	Sensitivity analysis	management	f
49	simulation	Simulation	management	f
50	mathematical_programming_models	Mathematical programming models	management	f
51	goal_programming	Goal programming	management	f
52	network_programming	Network programming	management	f
53	integer_and mixed_programming	Integer and mixed programming	management	f
54	gams	GAMS	management	f
55	parametric_programming	Parametric programming	management	f
56	management_of_production_systems	Management of production systems	management	f
57	production_planning	Production planning	management	f
58	strategies_of_production_and_service_supply_systems	Strategies of production and service supply systems	management	f
59	management_of_waiting_line_systems	Management of waiting line (queuing) systems	management	f
60	facility_layout_planning	Facility layout planning	management	f
61	maintenance_management	Maintenance management	management	f
62	inventory_management	Inventory management	management	f
63	supply_chain_management	Supply chain management	management	f
64	jit	Kanban / Just in Time (JIT) systems	management	f
65	mps	Master production schedule (MPS)	management	f
66	crp	Capacity requirements planning (CRP)	management	f
67	mrp	Material requirements planning (MRP)	management	f
69	fshop_scheduling	Flow-Shop scheduling	management	f
70	jshop_scheduling	Job-Shop scheduling	management	f
71	service_delivery_scheduling	Service delivery scheduling	management	f
72	financial_accounting	Financial accounting	management	f
73	financial_analysis	Financial analysis	management	f
74	cost_accounting_budgeting	Cost accounting & Budgeting	management	f
75	basic_statistical_concepts	Basic statistical concepts	management	f
76	time_series_analysis	Time series analysis	management	f
77	smoothing_methods	Smoothing methods (moving averages)	management	f
78	exp_smoothing_methods	Exponential smoothing methods (Single, Holt, Winters, Damped)	management	f
79	regression_models	Regression models (simple and multiple regression)	management	f
80	arima_models	ARIMA models	management	f
81	theta_method	Theta (θ) method	management	f
82	long_term_predictions	Long term predictions	management	f
83	judgmental_forecasting	Judgmental forecasting	management	f
84	hierarchical_forecasting	Hierarchical forecasting (bottom-up/top-down)	management	f
68	erp	Enterprise resource planning (ERP)	management	f
85	forecasting_evaluation	Forecasting performance evaluation and monitoring	management	f
86	e_business_models_and_mechanisms	E-business models and mechanisms	management	f
87	customer_interface_design	Customer interface design	management	f
88	internet_promotion_methods_and_computational_advertising_algorithms	Internet promotion methods and computational advertising algorithms	management	f
89	recommender_system_techniques_and_algorithms	Recommender system techniques and algorithms	management	f
90	business_process_modelling_and_management	Business process modelling and management	management	f
91	crm_systems	Customer Relationship Management (CRM) Systems	management	f
92	e_participation_frameworks	E-government, e-democracy and e-participation frameworks	management	f
93	web_2_0_mechanisms	Web 2.0 mechanisms	management	f
94	multiple_criteria_mathematical_programming	Multiple criteria mathematical programming	management	f
95	multi_attribute_utility_theory	Multi-attribute utility theory	management	f
96	outranking_methods	Outranking methods	management	f
97	disaggregation_methods	Disaggregation methods	management	f
98	business_plan_development	Business plan development	management	f
99	decision_making	Decision making	management	f
100	general_management	General management	management	f
101	sales_management	Sales management	management	f
102	production_management	Production management	management	f
103	marketing_management	Marketing management	management	f
104	financial_management	Financial management	management	f
105	work_breakdown_structure	Work breakdown structure	management	f
106	pert_cpm_analysis	PERT/CPM analysis	management	f
107	gantt_charts	Gantt charts	management	f
108	resource_scheduling	Resource scheduling	management	f
109	probabilistic_analysis	Probabilistic analysis	management	f
110	milestone_management	Milestone management	management	f
111	digital_design	Digital design	electrical engineering	f
112	digital_circuit_design	Digital circuit design	electrical engineering	f
113	boolean_algebra	Boolean Algerba	electrical engineering	f
114	processor_design	Processor Design	electrical engineering	f
115	switching_systems	Switching systems (internet routers, optical /wireless /packet /circuit switches)	electrical engineering	f
116	signal_processing	Signal processing	electrical engineering	f
117	packet_scheduling_algorithms	Packet scheduling algorithms	electrical engineering	f
118	multicast_copy_techniques	Multicast copy techniques	electrical engineering	f
119	call_splitting	Call splitting	electrical engineering	f
120	scheduling_algorithms	Scheduling algorithms (PIM, iRRM, iSLIP, DRRM)	electrical engineering	f
121	ip_route_lookup_algorithms	IP route lookup algorithms	electrical engineering	f
152	techniques_based_on_queueing_networks	Techniques based on queueing networks	computer/ data science	f
122	8085	8085 Microprocessors	computer/ data science	f
125	avr_pic	AVR and PIC Microcontrollers	computer/ data science	f
124	8086	80x86 Microprocessors	computer/ data science	f
123	assembly	Assembly programming language	computer/ data science	f
126	operating_systems	Basic principles of operating systems	computer/ data science	f
127	unix	UNIX operating systems	computer/ data science	f
128	c_language	C programming language	computer/ data science	f
129	cpu_scheduling	CPU scheduling	computer/ data science	f
130	memory _management	Memory management	computer/ data science	f
131	file_management	File management	computer/ data science	f
132	interface_design	Interface design (screen, navigation, interaction)	computer/ data science	f
133	cognitive_models	Cognitive models	computer/ data science	f
134	user_experience_evaluation	User experience evaluation	computer/ data science	f
135	human_computer interaction	Human- computer interaction	computer/ data science	f
136	multimedia	Multimedia	computer/ data science	f
137	multimedia_app_programming	Multimedia applications programming	computer/ data science	f
139	object_oriented_programming	Object-oriented programming	computer/ data science	f
140	distributed_unix_programming	Distributed UNIX programming	computer/ data science	f
141	development_of_device_drivers	Development of device drivers	computer/ data science	f
142	kernel_level_programming	Kernel-level programming	computer/ data science	f
143	isa	Instruction Set Architectures	computer/ data science	f
144	ilp	Instruction-level parallelism (ILP)	computer/ data science	f
145	pipeline	Pipeline	computer/ data science	f
146	multistage_pipeline_with_variable_latency	Multistage pipeline with variable latency	computer/ data science	f
147	memory_hierarchy_organisation	Memory Hierarchy Organisation	computer/ data science	f
148	branch_prediction	Branch prediction	computer/ data science	f
149	super_scalar_pipelines	Super scalar pipelines	computer/ data science	f
150	smt	Simultaneous multithreading architectures	computer/ data science	f
151	multicore_cmp	MulticoreCMP	computer/ data science	f
153	discrete_event_simulation	Discrete event simulation	computer/ data science	f
154	measurement_techniques_and_tools	Measurement techniques and tools	computer/ data science	f
155	performance_analysis	Performance analysis	computer/ data science	f
156	queueing_networks	Queueing networks	computer/ data science	f
158	vlsi_circuits	VLSI circuits implementation 	electrical engineering	f
159	digital_filters_implementation	Digital filters implementation	electrical engineering	f
160	matlab	Matlab	computer/ data science	f
161	probability_theory	Probability theory	computer/ data science	f
163	image_video_compression	Image/ Video Compression	computer/ data science	f
162	statistical_analysis	Statistical analysis	computer/ data science	f
164	image_processing	Image processing	computer/ data science	f
165	video_processing	Video processing	computer/ data science	f
166	lloyd_max_algorithm	Lloyd max algorithm	computer/ data science	f
167	distributed_systems	Distributed systems	computer/ data science	f
168	synchronization	Synchronization	computer/ data science	f
169	distributed_coordination	Distributed coordination	computer/ data science	f
170	concurrency_control	Concurrency control	computer/ data science	f
171	distributed_transactions_and_timing_control	Distributed Transactions and Timing Control	computer/ data science	f
172	data_backup	Data Backup	computer/ data science	f
173	peer_to_peer_networks	Peer-to-peer networks	computer/ data science	f
174	distributed_storage_systems	Distributed storage systems	computer/ data science	f
175	map_reduce_models	Map reduce models	computer/ data science	f
176	bulk_sync_parallel_models	Bulk Synchronous Parallel models	computer/ data science	f
178	flask_framework	Flask framework	computer/ data science	f
177	python_language	Python programming language	computer/ data science	f
138	java_language	JAVA programming language	computer/ data science	f
179	magento	Magento	computer/ data science	f
180	bizagi	Bizagi	computer/ data science	f
181	embedded_systems	Embedded systems	computer/ data science	f
182	computational_models	Computational models	computer/ data science	f
183	high_level_programming_languages	High-Level Programming Languages	computer/ data science	f
184	program_optimization	Program Optimization	computer/ data science	f
185	mpsoc	Multiprocessor Architecture (MPSOC)	computer/ data science	f
186	h_s_cosyntesis_alg	Hardware and Software Co-synthesis Algorithms	computer/ data science	f
187	testing	Testing	computer/ data science	f
188	error_simulation	Error simulation	computer/ data science	f
189	risk_analysis	Risk analysis	computer/ data science	f
190	neural_networks	Neural networks	computer/ data science	f
191	learning_algorithms	Learning algorithms	computer/ data science	f
192	mlp	Multilayer perceptrons (MLP)	computer/ data science	f
193	backpropagation_algorithm	Backpropagation algorithm	computer/ data science	f
194	associative_networks	Associative networks	computer/ data science	f
195	hopfield_model	Hopfield model	computer/ data science	f
196	recurrent_multilayer_networks	Recurrent multilayer networks	computer/ data science	f
197	receptive_fields_local_learning	Receptive fields and local learning	computer/ data science	f
198	radial_basis_function_networks	Radial basis function networks	computer/ data science	f
199	competitive_learning	Competitive learning	computer/ data science	f
200	kohonen_maps	Kohonen maps	computer/ data science	f
201	art_models	ART models	computer/ data science	f
202	fuzzy_systems	Fuzzy systems	computer/ data science	f
203	classification	Classification	computer/ data science	f
204	clustering	Clustering	computer/ data science	f
205	intelligent_agents	Intelligent agents	computer/ data science	f
206	distributed_memory_architectures	Distributed memory architectures	computer/ data science	f
207	smp	SMP	computer/ data science	f
208	coma	COMA	computer/ data science	f
209	numa	NUMA	computer/ data science	f
210	cc_numa	cc-NUMA	computer/ data science	f
211	smt	SMT	computer/ data science	f
212	clusters	Clusters	computer/ data science	f
213	mpps	MPPs	computer/ data science	f
214	bus_oriented_networks	Bus-oriented networks	computer/ data science	f
215	switch_networks	Switch Network	computer/ data science	f
216	parallel_programming	Parallel programming	computer/ data science	f
217	sync_concurrent_data_structures	Synchronization and concurrent data structures	computer/ data science	f
218	open_mp	OpenMP	computer/ data science	f
219	cuda	CUDA	computer/ data science	f
220	mpi	MPI	computer/ data science	f
221	cilk	Cilk 	computer/ data science	f
222	line_drawing_algorithms	Line drawing algorithms	computer/ data science	f
223	shape_models	Shape models	computer/ data science	f
224	virtual_reality	Virtual reality	computer/ data science	f
225	stereoscopy	Stereoscopy	computer/ data science	f
226	depth_shredder	Depth shredder	computer/ data science	f
227	xray_chromatography	X-ray chromatography	computer/ data science	f
228	graphics	Graphics	computer/ data science	f
237	database_management_systems	Database Management Systems	computer/ data science	f
238	data_structures	Data Structures	computer/ data science	f
239	er_model	E-R model	computer/ data science	f
240	relational_model	Relational model	computer/ data science	f
241	sql	SQL language	computer/ data science	f
242	html	HTML	computer/ data science	f
243	database_design	Database design	computer/ data science	f
244	web_application_programming	Web application programming	computer/ data science	f
245	lexical_syntax_analysis	Lexical and syntax analysis	computer/ data science	f
246	ml	ML programming language	computer/ data science	f
247	haskell	Haskell programming language	computer/ data science	f
248	prolog	Prolog programming language	computer/ data science	f
249	functional_programming	Functional programming	computer/ data science	f
250	logic_programming	Logic programming	computer/ data science	f
251	c_plus_plus	C++ programming language	computer/ data science	f
252	c_sharp	C# programming language	computer/ data science	f
253	estimation_of_computational_complexity	Estimation of computational complexity	computer/ data science	f
254	polynomial_time_algorithms	Polynomial-time algorithms	computer/ data science	f
255	divide_and_conquer	Divide-and-conquer technique	computer/ data science	f
256	greedy_alg	Greedy algorithm technique	computer/ data science	f
257	bfs	Breadth first search (BFS)	computer/ data science	f
259	mst	Minimum spanning tree (MST)	computer/ data science	f
260	shortest_paths	Shortest path algorithms	computer/ data science	f
261	max_flow_min_cut	Max flow and min cut algorithms	computer/ data science	f
262	np_problems	NP problems	computer/ data science	f
263	np_complete_problems	NP-complete problems	computer/ data science	f
264	search_algorithms	Search algorithms	computer/ data science	f
265	heuristic_methods	Heuristic methods	computer/ data science	f
266	knowledge_representation	Knowledge representation	computer/ data science	f
267	semantic_networks	Semantic networks	computer/ data science	f
268	knowledge_systems	Knowledge systems	computer/ data science	f
269	machine_learning	Machine learning	computer/ data science	f
270	natural_language_processing	Natural language processing	computer/ data science	f
258	dfs	Depth first search (DFS)	computer/ data science	f
271	first_order_logic	First-order logic	computer/ data science	f
272	project_management	Project Management	management	f
273	cost_analysis	Cost analysis	management	f
274	quality_assurance	Quality assurance	management	f
275	software_design	Software design	computer/ data science	f
276	software_lifecycle_models	Software life-cycle models	computer/ data science	f
277	design_patterns	Design Patterns	computer/ data science	f
278	uml_modeling_language	UML modeling language	computer/ data science	f
279	randomized_algorithms	Randomized algorithms	computer/ data science	f
280	approximation_algorithms	Approximation algorithms	computer/ data science	f
281	lp_based_problems	LP-based problems	computer/ data science	f
282	primal_dual_method	Primal-dual method	computer/ data science	f
283	online_algorithms	Online algorithms	computer/ data science	f
284	game_theory	Game Theory	computer/ data science	f
285	compilers	Compilers	computer/ data science	f
286	formal_languages	Formal languages	computer/ data science	f
287	parsing	Parsing	computer/ data science	f
288	semantic_analysis	Semantic analysis	computer/ data science	f
289	lex_flex	Lex/flex	computer/ data science	f
290	yacc_bison	Yacc/bison	computer/ data science	f
291	intermediate_code_generation	Intermidiate code generation	computer/ data science	f
292	final_code_generation	Final code generation	computer/ data science	f
293	computability	Computability	computer/ data science	f
294	complexity	Complexity	computer/ data science	f
295	turing_machines	Turing machines	computer/ data science	f
296	fix_point_theory	Fix-point theory	computer/ data science	f
297	internet_programming	Internet programming	computer/ data science	f
299	awt	Abstract window toolkit (AWT)	computer/ data science	f
303	auto_reasoning	Automated reasoning	computer/ data science	f
304	semantic_data_integration_algorithms	Semantic data integration algorithms	computer/ data science	f
305	xml	XML	computer/ data science	f
306	rdf	RDF	computer/ data science	f
307	owl	OWL	computer/ data science	f
308	ontology_engineering	Ontology engineering	computer/ data science	f
298	perl	PERL programming language	computer/ data science	f
309	db_management_systems_coordination	Database Management Systems Coordination	computer/ data science	f
310	db_management_systems_restore	Database Management Systems Restore	computer/ data science	f
311	distributed_databases	Distributed databases	computer/ data science	f
312	new_standad_sql3	New standard SQL-3	computer/ data science	f
313	database_engines	Database Engines	computer/ data science	f
314	advanced_database_systems	Advanced database systems	computer/ data science	f
315	database_repositories	Database repositories	computer/ data science	f
316	inductive_databases	Inductive databases	computer/ data science	f
317	hadoop	Hadoop	computer/ data science	f
318	map_reduce	Map Reduce	computer/ data science	f
319	h_base	H-Base	computer/ data science	f
320	nosql_db	No-SQL Databases	computer/ data science	f
321	acid_model	ACID Model	computer/ data science	f
322	two_face_locking	Two-face locking	computer/ data science	f
323	information_systems	Information systems	computer/ data science	f
324	reengineering	Re-engineering	computer/ data science	f
325	bpr	Bussines process re-engineering (BPR)	computer/ data science	f
326	pl_sql	PL/SQL	computer/ data science	f
327	oracle_database	Oracle Database	computer/ data science	f
328	adf_oracle	Oracle Application Development Framework	computer/ data science	f
329	system_security	System security	computer/ data science	f
331	cryptography	Cryptography	computer/ data science	f
332	sub_cryptosystems	Substitution cryptosystems	computer/ data science	f
333	cryptanalysis_methods	Cryptanalysis methods	computer/ data science	f
334	semantic_security	Semantic security	computer/ data science	f
335	symmetric_cryptography	Symmetric cryptography	computer/ data science	f
336	pseudorandomness	Pseudorandomness	computer/ data science	f
337	block_cryptosystems	Block cryptosystems	computer/ data science	f
338	macs	Message authentication codes (MACs)	computer/ data science	f
339	merkle_trees	Merkle trees	computer/ data science	f
340	hush_functions	Hash functions	computer/ data science	f
341	number_theory	Elements of number theory	computer/ data science	f
342	group_theory	Elements of group theory	computer/ data science	f
343	public_key_cryptography	Public key cryptography	computer/ data science	f
344	digital_signatures	Digital signatures	computer/ data science	f
345	cryptographic_protocols	Cryptographic protocols	computer/ data science	f
346	encrypted_communications	Encrypted communications	computer/ data science	f
347	electronic_voting	Electronic voting	computer/ data science	f
348	bitcoin	Bitcoin	computer/ data science	f
349	crypto_currencies	Crypto-currencies	computer/ data science	f
350	domain_theory	Domain theory	computer/ data science	f
351	lambda_calculus	Lambda calculus	computer/ data science	f
352	vms	Virtual machines (VMs)	computer/ data science	f
353	python	Python	computer/ data science	f
354	ruby	Ruby	computer/ data science	f
355	digital_modulation	Digital Modulation	networks	f
356	qam	QAM	networks	f
357	psk	PSK	networks	f
358	fsk	FSK	networks	f
359	msk	MSK	networks	f
360	dmt	DMT	networks	f
361	ofdm	OFDM	networks	f
362	dsl	DSL	networks	f
363	digital_tv_dvbt	Digital TV DVB-T	networks	f
364	markov_stochastic_processes	Markov stochastic processes	networks	f
366	performance_evaluation_of_data_networks	Performance evaluation of data networks	networks	f
367	performance_evaluation_of_telephone_networks	Performance evaluation of telephone networks	networks	f
368	performance_evaluation_of_computer_systems	Performance evaluation of computer systems	networks	f
370	linear_block_codes	Linear Block Codes	networks	f
371	circular_codes	Circular Codes	networks	f
372	rs_coding 	Reed-Solomon coding 	networks	f
373	convolutional_decoding	Convolutional decoding	networks	f
374	spread_spectrum_techniques	Spread Spectrum Techniques	networks	f
375	computer_networks	Computer Networks	networks	f
376	internet_protocols	Internet protocols	networks	f
377	ip	Internet Protocol (IP)	networks	f
378	arp	Address Resolution Protocol (ARP)	networks	f
379	icmp	Internet Control Message Protocol (ICMP)	networks	f
380	udp	User Datagram Protocol (UDP)	networks	f
381	tcp	Transmission Control Protocol (TCP)	networks	f
382	dns	Domain Name System (DNS)	networks	f
383	routing_protocols	Routing protocols (RIP, OSPF, BGP)	networks	f
384	application_level_protocols	Application-level protocols (FTP, TFTP, TELENET, SSH, HTTP, HTTPS, DNS, DHCP, SMTP)	networks	f
385	telephony	Telephony	networks	f
386	telephony_transmission_systems	Telephony transmission systems	networks	f
387	adsl	ADSL	networks	f
388	pcm	PCM (E1/T1)	networks	f
389	sdh_sonet	SDH/SONET	networks	f
390	isdn	ISDN	networks	f
391	intelligent_network	Intelligent Network	networks	f
392	ccssno7	Common Channel Signaling System No. 7	networks	f
393	voice_over_ip	Voice over IP (VoIP)	networks	f
394	sip	SIP	networks	f
395	h323	H.323	networks	f
396	telephony_traffic_engineering	Telephony traffic engineering	networks	f
397	network_dimensioning_principles 	Network dimensioning principles 	networks	f
398	congestion_metrics	Congestion metrics	networks	f
399	television	Television	networks	f
400	color_television	Color Television	networks	f
417	ntsc	NTSC	networks	f
418	pal	PAL	networks	f
419	secam	SECAM	networks	f
420	jpg	JPG	networks	f
421	h261	H.261	networks	f
422	mpeg	MPEG	networks	f
423	digital_television	Digital Television	networks	f
424	atsc	ATSC	networks	f
425	dvb	DVB	networks	f
426	cable_television	Cable Television	networks	f
427	satellite_television	Satellite Television	networks	f
428	multimedia_communication	Multimedia communication	networks	f
429	interactive_television	Interactive Television	networks	f
430	iptv	IPTV	networks	f
431	mhp	MHP	networks	f
433	user_authentication	User authentication	networks	f
434	access_control	Access control	networks	f
435	malware	Malware	networks	f
436	intrusion_detection	Intrusion detection	networks	f
437	firewalls	Firewalls	networks	f
438	service_attack_prevention_mechanisms	Service attack prevention mechanisms	networks	f
439	des	Data Encryption Standard (DES)	networks	f
440	aes	Advanced Encryption Standard (AES)	networks	f
441	multiple_encryption	Multiple encryption	networks	f
442	asymmetric_algorithms	Asymmetric algorithms	networks	f
443	public_key_cryptography	Public key cryptography	networks	f
444	rsa	RSA	networks	f
445	sha	Secure Hash Algorithm (SHA)	networks	f
446	mac	Message authentication code (MAC)	networks	f
447	digital_signatures	Digital signatures	networks	f
448	kerberos	Kerberos	networks	f
449	x509	X.509 standard	networks	f
450	pki	Public Key Infrastructure (PKI)	networks	f
451	internet_security	Internet security	networks	f
452	ssl	Secure Sockets Layer (SSL)	networks	f
453	tls	Transport Layer Security (TLS)	networks	f
454	https	HTTPS	networks	f
455	ssh	SSH	networks	f
456	wifi_security	Wireless network security	networks	f
457	ieee802_11i	IEEE 802.11i	networks	f
458	email_security	E-mail security	networks	f
459	pgp	Pretty Good Privacy (PGP)	networks	f
460	s_mime	Secure Multipurpose Internet Mail Extensions (S/MIME)	networks	f
461	dkim	DomainKeys Identified Mail (DKIM)	networks	f
462	mobile_communications	Mobile communications	networks	f
463	3g	3G mobile communication systems	networks	f
464	4g	4G mobile communication systems	networks	f
465	cellular_systems	Cellular systems	networks	f
466	spectrum_efficiency	Spectrum efficiency	networks	f
467	radio_resource_allocation_techniques	Radio resource allocation techniques	networks	f
468	channel_assignment	Channel assignment	networks	f
469	multiple_access_techniques	Multiple access techniques	networks	f
470	mobility_management	Mobility management	networks	f
471	location_management	Location management	networks	f
472	security_management	Security management	networks	f
473	communication_management	Communication management	networks	f
474	call_control	Call control	networks	f
475	network_protocols	Network protocols	networks	f
476	servers	Servers	networks	f
477	static_routing	Static routing	networks	f
478	dynamic_routing	Dynamic routing	networks	f
479	rip	RIP	networks	f
480	osfp	OSFP	networks	f
481	bgp	BGP	networks	f
482	ipv6_protocol	IPv6 protocol	networks	f
483	ipv4_protocol	IPv4 protocol	networks	f
484	synchronous_digital_hierarchy	Synchronous Digital Hierarchy (SDH/SONET).	networks	f
485	broadband_communications	Broadband communications	networks	f
486	atm	Asynchronous Transfer Mode (ATM)	networks	f
487	cac	Connection admission control (CAC)	networks	f
488	network_management	Network management	networks	f
489	pons	Passive optical networks (PONs)	networks	f
490	xdsl	xDSL	networks	f
491	metropolitan_networks	Metropolitan networks	networks	f
493	entropy	Entropy	networks	f
494	relative_entropy	Relative entropy	networks	f
495	asymptotic_equipartition_property	Asymptotic equipartition property	networks	f
496	data_compression	Data compression	networks	f
497	differential_entropy	Differential entropy	networks	f
498	information_theory	Information Theory	networks	f
499	universal_source_coding	Universal source coding	networks	f
500	snmp	Simple Network Management Protocol (SNMP)	networks	f
501	vlans	Virtual Local Area Networks (VLANs)	networks	f
502	aai	Authentication & Authorization Infrastructures (AAI)	networks	f
503	vpns	Virtual Private Networks (VPNs)	networks	f
504	cloud_computing	Cloud computing	networks	f
505	soa	Service Oriented Architectures (SOA)	networks	f
506	sdn	Intelligent Software Defined Networks – SDN	networks	f
507	openflow_control_architectures	OpenFlow Control Architectures	networks	f
508	wdm	Wavelength Division Multiplexing (WDM)	networks	f
509	optical_mult_demult	Optical Multiplexers-Demultiplexers	networks	f
510	oxc	Optical Cross-Connects (OXCs)	networks	f
511	wcs	Wavelength-Convertible Cross Connects Switches (WCS)	networks	f
512	wavelength_converters	Wavelength Converters	networks	f
513	passive_star_topology	Passive Star Topology	networks	f
514	wavelength_selective_switches	Wavelength Selective Switches	networks	f
515	optical_networks	Optical networks	networks	f
516	rwa	Routing and Wavelength Assignment (RWA)	networks	f
517	ilp_linear	Integer Linear Programming (ILP)	networks	f
518	sf_networks	Spectrum-Flexible Networks	networks	f
519	rsa	Routing and Spectrum Allocation (RSA) 	networks	f
520	p_and_v_topology	Physical and Virtual Topology	networks	f
521	milp	Mixed Integer Linear Programming (MILP)	networks	f
522	opsn	Optical Packet Switched Networks	networks	f
523	obs	Optical Burst Switching (OBS) 	networks	f
524	jet_pr	Just Enough Time Protocol(JET)	networks	f
525	taw_pr	Tell and Wait Protocol(TAW)	networks	f
526	tag_pr	Tell and Go Protocol (TAG)	networks	f
527	vcd_pr	Virtual Circuit Deflection Protocol (VCD)	networks	f
528	man_metrop	Metropolitan Area Networks (MANs)	networks	f
529	datacenters	Datacenters	networks	f
530	social_networks	Social networks	networks	f
531	graph_theory	Graph theory	networks	f
532	random_network_models	Random network models	networks	f
533	small_world_networks	Small-world networks	networks	f
534	power_law_networks	Power-law networks	networks	f
535	scale_free_networks	Scale-free networks	networks	f
536	regular_networks	Regular networks	networks	f
537	random_geometric_networks	Random geometric networks	networks	f
538	analytics_metrics	Analytics metrics	networks	f
539	evolutionary_computation	Evolutionary computation	networks	f
540	data_processing	Data processing	computer/ data science	f
542	topology_control	Topology control	networks	f
543	genetic_algorithms	Genetic algorithms	networks	f
544	epidemiological_information_models	Epidemiological information models	networks	f
\.


--
-- Name: curriculum_designer_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_skill_id_seq', 544, true);


--
-- Data for Name: curriculum_designer_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_student (id, student_first_name, student_last_name, admission_date) FROM stdin;
\.


--
-- Name: curriculum_designer_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_student_id_seq', 1, false);


--
-- Data for Name: curriculum_designer_student_selected_courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_student_selected_courses (id, student_id, course_id) FROM stdin;
\.


--
-- Name: curriculum_designer_student_selected_courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_student_selected_courses_id_seq', 1, false);


--
-- Data for Name: curriculum_designer_student_student_selected_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curriculum_designer_student_student_selected_flows (id, student_id, flow_id) FROM stdin;
\.


--
-- Name: curriculum_designer_student_student_selected_flows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curriculum_designer_student_student_selected_flows_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	curriculum_designer	school
8	curriculum_designer	skill
9	curriculum_designer	student
10	curriculum_designer	flow
11	curriculum_designer	course
12	curriculum_designer	lecturer
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-02-03 14:48:23.503465+02
2	auth	0001_initial	2020-02-03 14:48:23.575673+02
3	admin	0001_initial	2020-02-03 14:48:23.667135+02
4	admin	0002_logentry_remove_auto_add	2020-02-03 14:48:23.689955+02
5	admin	0003_logentry_add_action_flag_choices	2020-02-03 14:48:23.702031+02
6	contenttypes	0002_remove_content_type_name	2020-02-03 14:48:23.728025+02
7	auth	0002_alter_permission_name_max_length	2020-02-03 14:48:23.733342+02
8	auth	0003_alter_user_email_max_length	2020-02-03 14:48:23.743145+02
9	auth	0004_alter_user_username_opts	2020-02-03 14:48:23.752154+02
10	auth	0005_alter_user_last_login_null	2020-02-03 14:48:23.760123+02
11	auth	0006_require_contenttypes_0002	2020-02-03 14:48:23.762155+02
12	auth	0007_alter_validators_add_error_messages	2020-02-03 14:48:23.771146+02
13	auth	0008_alter_user_username_max_length	2020-02-03 14:48:23.785507+02
14	auth	0009_alter_user_last_name_max_length	2020-02-03 14:48:23.793179+02
15	auth	0010_alter_group_name_max_length	2020-02-03 14:48:23.803188+02
16	auth	0011_update_proxy_permissions	2020-02-03 14:48:23.812227+02
17	sessions	0001_initial	2020-02-03 14:48:23.822158+02
18	curriculum_designer	0001_initial	2020-02-03 15:50:27.045474+02
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: curriculum_designer_course_course_lecturers curriculum_designer_cour_course_id_lecturer_id_1672c5dc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_lecturers
    ADD CONSTRAINT curriculum_designer_cour_course_id_lecturer_id_1672c5dc_uniq UNIQUE (course_id, lecturer_id);


--
-- Name: curriculum_designer_course_course_skills curriculum_designer_cour_course_id_skill_id_701f2aaf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_skills
    ADD CONSTRAINT curriculum_designer_cour_course_id_skill_id_701f2aaf_uniq UNIQUE (course_id, skill_id);


--
-- Name: curriculum_designer_course_course_lecturers curriculum_designer_course_course_lecturers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_lecturers
    ADD CONSTRAINT curriculum_designer_course_course_lecturers_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_course_course_skills curriculum_designer_course_course_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_skills
    ADD CONSTRAINT curriculum_designer_course_course_skills_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_course curriculum_designer_course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course
    ADD CONSTRAINT curriculum_designer_course_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_flow curriculum_designer_flow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_flow
    ADD CONSTRAINT curriculum_designer_flow_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_lecturer curriculum_designer_lecturer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_lecturer
    ADD CONSTRAINT curriculum_designer_lecturer_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_school curriculum_designer_school_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_school
    ADD CONSTRAINT curriculum_designer_school_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_skill curriculum_designer_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_skill
    ADD CONSTRAINT curriculum_designer_skill_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_student_selected_courses curriculum_designer_stud_student_id_course_id_185a7918_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_selected_courses
    ADD CONSTRAINT curriculum_designer_stud_student_id_course_id_185a7918_uniq UNIQUE (student_id, course_id);


--
-- Name: curriculum_designer_student_student_selected_flows curriculum_designer_stud_student_id_flow_id_d56ef5e9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_student_selected_flows
    ADD CONSTRAINT curriculum_designer_stud_student_id_flow_id_d56ef5e9_uniq UNIQUE (student_id, flow_id);


--
-- Name: curriculum_designer_student curriculum_designer_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student
    ADD CONSTRAINT curriculum_designer_student_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_student_selected_courses curriculum_designer_student_selected_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_selected_courses
    ADD CONSTRAINT curriculum_designer_student_selected_courses_pkey PRIMARY KEY (id);


--
-- Name: curriculum_designer_student_student_selected_flows curriculum_designer_student_student_selected_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_student_selected_flows
    ADD CONSTRAINT curriculum_designer_student_student_selected_flows_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: curriculum_designer_course_course_flow_id_f04763d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_course_flow_id_f04763d2 ON public.curriculum_designer_course USING btree (course_flow_id);


--
-- Name: curriculum_designer_course_course_lecturers_course_id_a5806407; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_course_lecturers_course_id_a5806407 ON public.curriculum_designer_course_course_lecturers USING btree (course_id);


--
-- Name: curriculum_designer_course_course_school_id_9ed32240; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_course_school_id_9ed32240 ON public.curriculum_designer_course USING btree (course_school_id);


--
-- Name: curriculum_designer_course_course_skills_course_id_41416582; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_course_skills_course_id_41416582 ON public.curriculum_designer_course_course_skills USING btree (course_id);


--
-- Name: curriculum_designer_course_course_skills_skill_id_8644b2dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_course_skills_skill_id_8644b2dd ON public.curriculum_designer_course_course_skills USING btree (skill_id);


--
-- Name: curriculum_designer_course_lecturer_id_5a2c66f5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_course_lecturer_id_5a2c66f5 ON public.curriculum_designer_course_course_lecturers USING btree (lecturer_id);


--
-- Name: curriculum_designer_studen_flow_id_cb98f575; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_studen_flow_id_cb98f575 ON public.curriculum_designer_student_student_selected_flows USING btree (flow_id);


--
-- Name: curriculum_designer_studen_student_id_34c472ce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_studen_student_id_34c472ce ON public.curriculum_designer_student_selected_courses USING btree (student_id);


--
-- Name: curriculum_designer_studen_student_id_819001b8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_studen_student_id_819001b8 ON public.curriculum_designer_student_student_selected_flows USING btree (student_id);


--
-- Name: curriculum_designer_student_selected_courses_course_id_6115599e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX curriculum_designer_student_selected_courses_course_id_6115599e ON public.curriculum_designer_student_selected_courses USING btree (course_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course curriculum_designer__course_flow_id_f04763d2_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course
    ADD CONSTRAINT curriculum_designer__course_flow_id_f04763d2_fk_curriculu FOREIGN KEY (course_flow_id) REFERENCES public.curriculum_designer_flow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course_course_skills curriculum_designer__course_id_41416582_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_skills
    ADD CONSTRAINT curriculum_designer__course_id_41416582_fk_curriculu FOREIGN KEY (course_id) REFERENCES public.curriculum_designer_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_student_selected_courses curriculum_designer__course_id_6115599e_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_selected_courses
    ADD CONSTRAINT curriculum_designer__course_id_6115599e_fk_curriculu FOREIGN KEY (course_id) REFERENCES public.curriculum_designer_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course_course_lecturers curriculum_designer__course_id_a5806407_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_lecturers
    ADD CONSTRAINT curriculum_designer__course_id_a5806407_fk_curriculu FOREIGN KEY (course_id) REFERENCES public.curriculum_designer_course(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course curriculum_designer__course_school_id_9ed32240_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course
    ADD CONSTRAINT curriculum_designer__course_school_id_9ed32240_fk_curriculu FOREIGN KEY (course_school_id) REFERENCES public.curriculum_designer_school(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_student_student_selected_flows curriculum_designer__flow_id_cb98f575_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_student_selected_flows
    ADD CONSTRAINT curriculum_designer__flow_id_cb98f575_fk_curriculu FOREIGN KEY (flow_id) REFERENCES public.curriculum_designer_flow(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course_course_lecturers curriculum_designer__lecturer_id_5a2c66f5_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_lecturers
    ADD CONSTRAINT curriculum_designer__lecturer_id_5a2c66f5_fk_curriculu FOREIGN KEY (lecturer_id) REFERENCES public.curriculum_designer_lecturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_course_course_skills curriculum_designer__skill_id_8644b2dd_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_course_course_skills
    ADD CONSTRAINT curriculum_designer__skill_id_8644b2dd_fk_curriculu FOREIGN KEY (skill_id) REFERENCES public.curriculum_designer_skill(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_student_selected_courses curriculum_designer__student_id_34c472ce_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_selected_courses
    ADD CONSTRAINT curriculum_designer__student_id_34c472ce_fk_curriculu FOREIGN KEY (student_id) REFERENCES public.curriculum_designer_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: curriculum_designer_student_student_selected_flows curriculum_designer__student_id_819001b8_fk_curriculu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curriculum_designer_student_student_selected_flows
    ADD CONSTRAINT curriculum_designer__student_id_819001b8_fk_curriculu FOREIGN KEY (student_id) REFERENCES public.curriculum_designer_student(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

