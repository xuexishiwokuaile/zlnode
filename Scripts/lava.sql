--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.21
-- Dumped by pg_dump version 9.5.6 (Postgres-XL 9.5r1.5)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: get_log_detail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE get_log_detail (
    id bigint NOT NULL,
    read_line bigint
);


ALTER TABLE get_log_detail OWNER TO postgres;

--
-- Name: get_log_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE get_log_detail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE get_log_detail_id_seq OWNER TO postgres;

--
-- Name: get_log_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE get_log_detail_id_seq OWNED BY get_log_detail.id;


--
-- Name: job_clean; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE job_clean (
    version_number character varying(255) NOT NULL,
    event_time bigint NOT NULL,
    jobid bigint,
    idx bigint
);


ALTER TABLE job_clean OWNER TO postgres;

--
-- Name: job_execute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE job_execute (
    version_number character varying(255) NOT NULL,
    event_time bigint NOT NULL,
    jobid bigint,
    execuid bigint,
    jobpgid bigint,
    exechome character varying(255),
    execcwd character varying(255),
    execusername character varying(255),
    jobpid bigint,
    idx bigint
);


ALTER TABLE job_execute OWNER TO postgres;

--
-- Name: job_start; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE job_start (
    version_number character varying(255) NOT NULL,
    event_time bigint NOT NULL,
    jobid bigint,
    jstatus bigint,
    jobpid bigint,
    jobpgid bigint,
    hostfactor character varying(255),
    numexhost bigint,
    exechost character varying(255),
    queueprecmd character varying(255),
    queuepostcmd character varying(255),
    jflags bigint,
    idx bigint,
    usergroup character varying(255),
    id bigint NOT NULL
);


ALTER TABLE job_start OWNER TO postgres;

--
-- Name: job_start_accept; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE job_start_accept (
    version_number character varying(255),
    event_time bigint NOT NULL,
    jobid bigint,
    jobpgid bigint,
    idx bigint,
    jflags bigint,
    id bigint NOT NULL
);


ALTER TABLE job_start_accept OWNER TO postgres;

--
-- Name: job_start_accept_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_start_accept_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_start_accept_id_seq OWNER TO postgres;

--
-- Name: job_start_accept_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_start_accept_id_seq OWNED BY job_start_accept.id;


--
-- Name: job_start_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE job_start_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE job_start_id_seq OWNER TO postgres;

--
-- Name: job_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE job_start_id_seq OWNED BY job_start.id;


--
-- Name: lava_work; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE lava_work (
    id bigint,
    submit_user character varying(254),
    type character varying(254),
    name character varying(254),
    status character varying(254),
    application character varying(254),
    queue character varying(254),
    submit_time character varying(254),
    start_time character varying(254),
    end_time character varying(254)
);


ALTER TABLE lava_work OWNER TO postgres;

--
-- Name: load_index; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE load_index (
    version_number character varying(255),
    event_time bigint,
    nidx bigint,
    name character varying(255),
    id bigint NOT NULL
);


ALTER TABLE load_index OWNER TO postgres;

--
-- Name: load_index_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE load_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE load_index_id_seq OWNER TO postgres;

--
-- Name: load_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE load_index_id_seq OWNED BY load_index.id;


--
-- Name: mbd_start; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE mbd_start (
    version_num character varying(255) NOT NULL,
    event_time bigint NOT NULL,
    master character varying(255),
    cluster character varying(255),
    numhost bigint,
    numqueues bigint
);


ALTER TABLE mbd_start OWNER TO postgres;

--
-- Name: queue_ctrl; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE queue_ctrl (
    version_num character varying(255) NOT NULL,
    event_time bigint NOT NULL,
    opcode bigint,
    queue character varying(255),
    userid bigint,
    username character varying(255)
);


ALTER TABLE queue_ctrl OWNER TO postgres;

--
-- Name: st_passports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE st_passports (
    id bigint,
    login_name character varying(254),
    passwd character varying(254),
    classificat bigint
);


ALTER TABLE st_passports OWNER TO postgres;

--
-- Name: t_cluster_info_from_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_cluster_info_from_api (
    id bigint NOT NULL,
    name character varying(255),
    status character varying(255),
    manage_name character varying(255),
    master_name character varying(255),
    create_time timestamp(6) with time zone DEFAULT now()
);


ALTER TABLE t_cluster_info_from_api OWNER TO postgres;

--
-- Name: t_cluster_info_from_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_cluster_info_from_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_cluster_info_from_api_id_seq OWNER TO postgres;

--
-- Name: t_cluster_info_from_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_cluster_info_from_api_id_seq OWNED BY t_cluster_info_from_api.id;


--
-- Name: t_host_info_from_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_host_info_from_api (
    id bigint NOT NULL,
    host_name character varying(255),
    host_model character varying(255),
    host_type character varying(255),
    cpu_factor character varying(255),
    max_cpu character varying(255),
    max_mem character varying(255),
    max_swap character varying(255),
    max_tmp character varying(255),
    resources character varying(255),
    windows character varying(255),
    busy_threshold character varying(255),
    is_server character varying(255),
    create_time timestamp with time zone DEFAULT now()
);


ALTER TABLE t_host_info_from_api OWNER TO postgres;

--
-- Name: t_host_info_from_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_host_info_from_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_host_info_from_api_id_seq OWNER TO postgres;

--
-- Name: t_host_info_from_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_host_info_from_api_id_seq OWNED BY t_host_info_from_api.id;


--
-- Name: t_host_load_from_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_host_load_from_api (
    id bigint NOT NULL,
    name character varying(255),
    statue character varying(255),
    r15s character varying,
    r1m character varying(255),
    r15m character varying(255),
    ut character varying(255),
    pg character varying(255),
    io character varying(255),
    ls character varying(255),
    it character varying(255),
    tmp character varying(255),
    swp character varying(255),
    mem character varying(255),
    create_time timestamp with time zone DEFAULT now()
);


ALTER TABLE t_host_load_from_api OWNER TO postgres;

--
-- Name: t_host_load_from_api_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_host_load_from_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_host_load_from_api_id_seq OWNER TO postgres;

--
-- Name: t_host_load_from_api_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_host_load_from_api_id_seq OWNED BY t_host_load_from_api.id;


--
-- Name: t_job_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_job_info (
    j_id character varying(64),
    j_user character varying(255),
    j_status character varying(64),
    j_reason_tb character varying(64),
    j_reasons character varying(64),
    j_job_pid character varying(64),
    j_submit_time character varying,
    j_resverve_time character varying,
    j_start_time character varying,
    j_time_predicted_start_time character varying,
    j_time_end_time character varying,
    j_cpu_time character varying(53),
    j_from_host character varying(255),
    j_ex_hosts character varying(255),
    j_submit_submit character varying(64),
    j_exit_status character varying(64),
    j_rusage_update_time character varying,
    record_create_time timestamp(6) with time zone DEFAULT now() NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE t_job_info OWNER TO postgres;

--
-- Name: COLUMN t_job_info.j_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_id IS 'job id';


--
-- Name: COLUMN t_job_info.j_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_user IS 'job user';


--
-- Name: COLUMN t_job_info.j_reason_tb; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_reason_tb IS 'pedding reason';


--
-- Name: COLUMN t_job_info.j_reasons; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_reasons IS 'suspend reason';


--
-- Name: COLUMN t_job_info.j_job_pid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_job_pid IS 'master process id(pid)';


--
-- Name: COLUMN t_job_info.j_start_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_start_time IS 'job start time';


--
-- Name: COLUMN t_job_info.j_from_host; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_from_host IS 'submit host';


--
-- Name: COLUMN t_job_info.j_ex_hosts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_job_info.j_ex_hosts IS 'execute hosts';


--
-- Name: t_job_info_as_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_job_info_as_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_job_info_as_seq OWNER TO postgres;

--
-- Name: t_job_info_as_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_job_info_as_seq OWNED BY t_job_info.id;


--
-- Name: t_lava_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_lava_role (
    id bigint NOT NULL,
    role_name character varying(255),
    role_description text
);


ALTER TABLE t_lava_role OWNER TO postgres;

--
-- Name: COLUMN t_lava_role.role_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_lava_role.role_name IS '角色名';


--
-- Name: t_lava_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_lava_user (
    id bigint NOT NULL,
    role bigint NOT NULL,
    last_login timestamp(6) with time zone,
    status character varying(255),
    phone character varying(255),
    email character varying(255),
    create_time date,
    name character varying(255)
);


ALTER TABLE t_lava_user OWNER TO postgres;

--
-- Name: t_queue_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_queue_info (
    queue_name character varying(255),
    priority bigint,
    user_list character varying(255),
    host_list character varying(255),
    q_status bigint,
    num_jobs bigint,
    num_pend bigint,
    num_run bigint,
    num_ssusp bigint,
    num_ususp bigint,
    record_create_time timestamp with time zone DEFAULT now(),
    id bigint NOT NULL
);


ALTER TABLE t_queue_info OWNER TO postgres;

--
-- Name: COLUMN t_queue_info.user_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_queue_info.user_list IS '用户列表';


--
-- Name: COLUMN t_queue_info.host_list; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_queue_info.host_list IS '节点列表';


--
-- Name: COLUMN t_queue_info.q_status; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_queue_info.q_status IS '队列状态';


--
-- Name: COLUMN t_queue_info.num_jobs; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_queue_info.num_jobs IS '作业总数';


--
-- Name: t_queue_info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE t_queue_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE t_queue_info_id_seq OWNER TO postgres;

--
-- Name: t_queue_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE t_queue_info_id_seq OWNED BY t_queue_info.id;


--
-- Name: t_submit_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE t_submit_info (
    id bigint NOT NULL,
    job_name character varying(255),
    queue character varying(255),
    asked_hosts character varying(255),
    res_req character varying(255),
    r_limits bigint,
    num_processors bigint,
    depend_cond character varying(255),
    begin_time character varying,
    term_time character varying,
    in_file character varying(255),
    err_file character varying(255),
    out_file character varying(255),
    cimmand character varying(255),
    pre_exec_cmd character varying(255),
    project_name character varying(255),
    max_num_processors bigint,
    user_group character varying(255),
    job_group character varying(255),
    record_create_time timestamp with time zone
);


ALTER TABLE t_submit_info OWNER TO postgres;

--
-- Name: COLUMN t_submit_info.queue; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.queue IS '所属队列';


--
-- Name: COLUMN t_submit_info.asked_hosts; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.asked_hosts IS '指定节点';


--
-- Name: COLUMN t_submit_info.res_req; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.res_req IS 'resource requirement';


--
-- Name: COLUMN t_submit_info.num_processors; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.num_processors IS 'slot num';


--
-- Name: COLUMN t_submit_info.in_file; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.in_file IS 'input file';


--
-- Name: COLUMN t_submit_info.err_file; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN t_submit_info.err_file IS 'err file';


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY get_log_detail ALTER COLUMN id SET DEFAULT nextval('get_log_detail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_start ALTER COLUMN id SET DEFAULT nextval('job_start_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_start_accept ALTER COLUMN id SET DEFAULT nextval('job_start_accept_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY load_index ALTER COLUMN id SET DEFAULT nextval('load_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_cluster_info_from_api ALTER COLUMN id SET DEFAULT nextval('t_cluster_info_from_api_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_host_info_from_api ALTER COLUMN id SET DEFAULT nextval('t_host_info_from_api_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_host_load_from_api ALTER COLUMN id SET DEFAULT nextval('t_host_load_from_api_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_job_info ALTER COLUMN id SET DEFAULT nextval('t_job_info_as_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_queue_info ALTER COLUMN id SET DEFAULT nextval('t_queue_info_id_seq'::regclass);


--
-- Data for Name: get_log_detail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY get_log_detail (id, read_line) FROM stdin;
1	1
10	49
\.


--
-- Name: get_log_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('get_log_detail_id_seq', 10, true);


--
-- Data for Name: job_clean; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_clean (version_number, event_time, jobid, idx) FROM stdin;
\.


--
-- Data for Name: job_execute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_execute (version_number, event_time, jobid, execuid, jobpgid, exechome, execcwd, execusername, jobpid, idx) FROM stdin;
\.


--
-- Data for Name: job_start; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_start (version_number, event_time, jobid, jstatus, jobpid, jobpgid, hostfactor, numexhost, exechost, queueprecmd, queuepostcmd, jflags, idx, usergroup, id) FROM stdin;
\.


--
-- Data for Name: job_start_accept; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY job_start_accept (version_number, event_time, jobid, jobpgid, idx, jflags, id) FROM stdin;
\.


--
-- Name: job_start_accept_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_start_accept_id_seq', 1, false);


--
-- Name: job_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('job_start_id_seq', 1, false);


--
-- Data for Name: lava_work; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lava_work (id, submit_user, type, name, status, application, queue, submit_time, start_time, end_time) FROM stdin;
2019056677310000119	刘工	作业	作业4	ok			2019-03-04 14:22:04	2019-03-04 14:22:04	
2019056670400000102	刘工	作业	作业3	ok			2019-03-04 14:10:35	2019-03-04 14:10:35	
2019056679500000129	刘工	作业	作业6	ok			2019-03-04 14:25:46	2019-03-04 14:25:46	
2019056678720000126	刘工	作业	作业5	ok			2019-03-04 14:24:29	2019-03-04 14:24:29	
2019056680260000134	刘工	作业	作业7	ok			2019-03-04 14:27:01	2019-03-04 14:27:01	
2019056680540000137	刘工	作业	作业8	ok			2019-03-04 14:27:28	2019-03-04 14:27:28	
2019056680820000140	刘工	作业	作业1	bad			2019-03-04 14:27:57	2019-03-04 14:27:57	
2019056680890000143	刘工	作业	作业2	ok			2019-03-04 14:28:06	2019-03-04 14:28:06	
\.


--
-- Data for Name: load_index; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY load_index (version_number, event_time, nidx, name, id) FROM stdin;
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	17
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	35
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	36
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	37
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	38
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	39
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	40
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	41
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	42
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	43
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	44
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	45
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	46
"33"	1549604526	11	"r15s""r1m""r15m""ut""pg""io""ls""it""tmp""swp"	47
\.


--
-- Name: load_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('load_index_id_seq', 47, true);


--
-- Data for Name: mbd_start; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY mbd_start (version_num, event_time, master, cluster, numhost, numqueues) FROM stdin;
"33"	1549604526	"el7-245"	"openlava"	0	1
\.


--
-- Data for Name: queue_ctrl; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY queue_ctrl (version_num, event_time, opcode, queue, userid, username) FROM stdin;
\.


--
-- Data for Name: st_passports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY st_passports (id, login_name, passwd, classificat) FROM stdin;
2019056603860009538	admin	0b4e7a0e5fe84ad35fb5f95b9ceeac79	1
\.


--
-- Data for Name: t_cluster_info_from_api; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_cluster_info_from_api (id, name, status, manage_name, master_name, create_time) FROM stdin;
1	openlava	1	openlava	el7-245	2019-03-04 12:50:38.68202+08
\.


--
-- Name: t_cluster_info_from_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_cluster_info_from_api_id_seq', 1, true);


--
-- Data for Name: t_host_info_from_api; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_host_info_from_api (id, host_name, host_model, host_type, cpu_factor, max_cpu, max_mem, max_swap, max_tmp, resources, windows, busy_threshold, is_server, create_time) FROM stdin;
4	el7-245	IntelI5	linux	100.0	2	7822	3071	26607	[]	-	[2147483648.0, 3.5, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0]	True	2019-03-04 16:01:22.003886+08
5	el7-246	IntelI5	linux	100.0	0	0	0	0	[]	-	[2147483648.0, 3.5, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0]	True	2019-03-04 16:01:22.003886+08
6	el7-249	IntelI5	linux	100.0	2	3790	3071	26607	[]	-	[2147483648.0, 3.5, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, 2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0, -2147483648.0]	True	2019-03-04 16:01:22.003886+08
\.


--
-- Name: t_host_info_from_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_host_info_from_api_id_seq', 6, true);


--
-- Data for Name: t_host_load_from_api; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_host_load_from_api (id, name, statue, r15s, r1m, r15m, ut, pg, io, ls, it, tmp, swp, mem, create_time) FROM stdin;
4	el7-249	[0, 0]	0.0	0.0199890136719	0.25	0.133911132812	0.0	0.0	0.0	155451392.0	19568.0	3070.0	2624.0	2019-03-04 15:22:38.223018+08
5	el7-245	[0, 0]	0.0500000007451	0.0299999993294	0.129999995232	0.137999996543	0.0	0.0	5.0	6.0	18602.0	3071.99609375	6119.07421875	2019-03-04 15:22:38.229822+08
6	el7-246	[65536, 0]	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2147483648.0	2019-03-04 15:22:38.230852+08
\.


--
-- Name: t_host_load_from_api_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_host_load_from_api_id_seq', 6, true);


--
-- Data for Name: t_job_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_job_info (j_id, j_user, j_status, j_reason_tb, j_reasons, j_job_pid, j_submit_time, j_resverve_time, j_start_time, j_time_predicted_start_time, j_time_end_time, j_cpu_time, j_from_host, j_ex_hosts, j_submit_submit, j_exit_status, j_rusage_update_time, record_create_time, id) FROM stdin;
210	openlava	4	[]	0	1518	1551083537	0	1551083541	0	0	0.0	el7-245	[el7-245]	sleep 10000000	0	0	2019-03-04 16:10:11.221692+08	73
211	openlava	4	[]	0	2883	1551084519	0	1551084522	0	0	0.0	el7-245	[el7-245]	sleep 10000000	0	0	2019-03-04 16:10:11.224267+08	74
212	openlava	1	[132387, 66841]	0	-1	1551145536	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.22508+08	75
213	openlava	1	[132387, 66841]	0	-1	1551145980	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.225857+08	76
220	openlava	1	[132387, 66841]	0	-1	1551150051	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.226618+08	77
224	openlava	1	[132387, 66841]	0	-1	1551150366	0	0	0	0	0.0	el7-245	[]	sleep 1000000	0	0	2019-03-04 16:10:11.227337+08	78
225	openlava	1	[132387, 66841]	0	-1	1551151198	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.228034+08	79
226	openlava	1	[132387, 66841]	0	-1	1551152444	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.228715+08	80
227	openlava	1	[132387, 66841]	0	-1	1551152485	0	0	0	0	0.0	el7-245	[]	sleep 10000000	0	0	2019-03-04 16:10:11.229435+08	81
\.


--
-- Name: t_job_info_as_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_job_info_as_seq', 81, true);


--
-- Data for Name: t_lava_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_lava_role (id, role_name, role_description) FROM stdin;
1	系统管理员	系统管理员
2	普通用户	普通用户
\.


--
-- Data for Name: t_lava_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_lava_user (id, role, last_login, status, phone, email, create_time, name) FROM stdin;
2019056603860009538	1	\N	0	\N	\N	\N	李工
2019056623210009580	1	\N	0	\N	\N	\N	wanggong
2019056624110009587	1	\N	0	\N	\N	\N	tiangong
2019056624850009595	1	\N	0	\N	\N	\N	ligong
2019056626060009604	1	\N	0	\N	\N	\N	fenggong
2019056675930009696	1	\N	0	\N	\N	\N	yugong
2019056677250009703	1	\N	0	\N	\N	\N	jigong
2019056697490009740	1	\N	0	\N	\N	\N	yy
\.


--
-- Data for Name: t_queue_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_queue_info (queue_name, priority, user_list, host_list, q_status, num_jobs, num_pend, num_run, num_ssusp, num_ususp, record_create_time, id) FROM stdin;
normal	30	[]	[]	7	9	7	2	0	0	2019-03-04 14:08:59.535326+08	4
\.


--
-- Name: t_queue_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('t_queue_info_id_seq', 4, true);


--
-- Data for Name: t_submit_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY t_submit_info (id, job_name, queue, asked_hosts, res_req, r_limits, num_processors, depend_cond, begin_time, term_time, in_file, err_file, out_file, cimmand, pre_exec_cmd, project_name, max_num_processors, user_group, job_group, record_create_time) FROM stdin;
\.


--
-- Name: job_clean_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_clean
    ADD CONSTRAINT job_clean_pkey PRIMARY KEY (event_time);


--
-- Name: job_execute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_execute
    ADD CONSTRAINT job_execute_pkey PRIMARY KEY (event_time);


--
-- Name: job_start_accept_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_start_accept
    ADD CONSTRAINT job_start_accept_pkey PRIMARY KEY (event_time);


--
-- Name: job_start_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY job_start
    ADD CONSTRAINT job_start_pkey PRIMARY KEY (event_time);


--
-- Name: load_index_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY load_index
    ADD CONSTRAINT load_index_pkey PRIMARY KEY (id);


--
-- Name: mbd_start_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY mbd_start
    ADD CONSTRAINT mbd_start_pkey PRIMARY KEY (event_time);


--
-- Name: queue_ctrl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY queue_ctrl
    ADD CONSTRAINT queue_ctrl_pkey PRIMARY KEY (event_time);


--
-- Name: t_job_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_job_info
    ADD CONSTRAINT t_job_info_pkey PRIMARY KEY (id);


--
-- Name: t_lava_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_lava_role
    ADD CONSTRAINT t_lava_role_pkey PRIMARY KEY (id);


--
-- Name: t_lava_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_lava_user
    ADD CONSTRAINT t_lava_user_pkey PRIMARY KEY (id);


--
-- Name: t_submit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_submit_info
    ADD CONSTRAINT t_submit_pkey PRIMARY KEY (id);


--
-- Name: role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY t_lava_user
    ADD CONSTRAINT role FOREIGN KEY (role) REFERENCES t_lava_role(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: t_job_info; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE t_job_info FROM PUBLIC;
REVOKE ALL ON TABLE t_job_info FROM postgres;
GRANT DELETE ON TABLE t_job_info TO postgres;
GRANT SELECT,INSERT,REFERENCES,TRIGGER,TRUNCATE,UPDATE ON TABLE t_job_info TO postgres WITH GRANT OPTION;
GRANT SELECT,INSERT,REFERENCES,TRIGGER,TRUNCATE,UPDATE ON TABLE t_job_info TO PUBLIC;


--
-- Name: t_lava_role; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE t_lava_role FROM PUBLIC;
GRANT ALL ON TABLE t_lava_role TO PUBLIC;


--
-- Name: t_lava_user; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE t_lava_user FROM PUBLIC;
GRANT ALL ON TABLE t_lava_user TO PUBLIC;


--
-- PostgreSQL database dump complete
--

