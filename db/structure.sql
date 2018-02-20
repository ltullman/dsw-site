SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE active_admin_comments (
    id integer NOT NULL,
    resource_id character varying(255) NOT NULL,
    resource_type character varying(255) NOT NULL,
    author_id integer,
    author_type character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    namespace character varying(255)
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE active_admin_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE active_admin_comments_id_seq OWNED BY active_admin_comments.id;


--
-- Name: annual_schedules; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE annual_schedules (
    id bigint NOT NULL,
    year integer,
    dates jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: annual_schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE annual_schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: annual_schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE annual_schedules_id_seq OWNED BY annual_schedules.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attendee_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE attendee_messages (
    id bigint NOT NULL,
    subject character varying NOT NULL,
    body text NOT NULL,
    submission_id bigint NOT NULL,
    sent_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: attendee_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE attendee_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attendee_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE attendee_messages_id_seq OWNED BY attendee_messages.id;


--
-- Name: clusters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE clusters (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text
);


--
-- Name: clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE clusters_id_seq OWNED BY clusters.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    submission_id integer,
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE companies (
    id bigint NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: general_inquiries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE general_inquiries (
    id integer NOT NULL,
    contact_name character varying(255),
    contact_email character varying(255),
    interest text,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: general_inquiries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE general_inquiries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_inquiries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE general_inquiries_id_seq OWNED BY general_inquiries.id;


--
-- Name: homepage_ctas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE homepage_ctas (
    id integer NOT NULL,
    title character varying NOT NULL,
    subtitle character varying NOT NULL,
    body character varying NOT NULL,
    link_text character varying NOT NULL,
    link_href character varying NOT NULL,
    relevant_to_cycle character varying,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    track_id bigint
);


--
-- Name: homepage_ctas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE homepage_ctas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: homepage_ctas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE homepage_ctas_id_seq OWNED BY homepage_ctas.id;


--
-- Name: newsletter_signups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE newsletter_signups (
    id integer NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: newsletter_signups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE newsletter_signups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: newsletter_signups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE newsletter_signups_id_seq OWNED BY newsletter_signups.id;


--
-- Name: newsroom_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE newsroom_items (
    id bigint NOT NULL,
    title character varying NOT NULL,
    attachment character varying,
    external_link character varying,
    is_active boolean DEFAULT true NOT NULL,
    release_date date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: newsroom_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE newsroom_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: newsroom_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE newsroom_items_id_seq OWNED BY newsroom_items.id;


--
-- Name: pitch_contest_entries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pitch_contest_entries (
    id bigint NOT NULL,
    video_url character varying,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    year integer,
    is_active boolean DEFAULT true NOT NULL
);


--
-- Name: pitch_contest_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pitch_contest_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pitch_contest_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pitch_contest_entries_id_seq OWNED BY pitch_contest_entries.id;


--
-- Name: pitch_contest_votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pitch_contest_votes (
    id bigint NOT NULL,
    user_id bigint,
    pitch_contest_entry_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pitch_contest_votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pitch_contest_votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pitch_contest_votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pitch_contest_votes_id_seq OWNED BY pitch_contest_votes.id;


--
-- Name: registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE registrations (
    id integer NOT NULL,
    user_id integer,
    year integer,
    contact_email character varying(255),
    zip character varying(255),
    original_company_name character varying(255),
    gender character varying(255),
    primary_role character varying(255),
    track_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    calendar_token character varying(255),
    age_range character varying,
    learn_more_pledge_1p boolean DEFAULT false NOT NULL,
    company_id bigint
);


--
-- Name: registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE registrations_id_seq OWNED BY registrations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sent_notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sent_notifications (
    id integer NOT NULL,
    submission_id integer,
    kind character varying NOT NULL,
    recipient_email character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sent_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sent_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sent_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sent_notifications_id_seq OWNED BY sent_notifications.id;


--
-- Name: session_registrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE session_registrations (
    id integer NOT NULL,
    registration_id integer,
    submission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: session_registrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE session_registrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_registrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE session_registrations_id_seq OWNED BY session_registrations.id;


--
-- Name: sponsor_signups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sponsor_signups (
    id integer NOT NULL,
    contact_name character varying(255),
    contact_email character varying(255),
    company character varying(255),
    interest text,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sponsor_signups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sponsor_signups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sponsor_signups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sponsor_signups_id_seq OWNED BY sponsor_signups.id;


--
-- Name: sponsorships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sponsorships (
    id bigint NOT NULL,
    name character varying NOT NULL,
    logo character varying,
    link_href character varying NOT NULL,
    description text,
    year integer NOT NULL,
    level character varying NOT NULL,
    track_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    submission_id bigint
);


--
-- Name: sponsorships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sponsorships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sponsorships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sponsorships_id_seq OWNED BY sponsorships.id;


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE submissions (
    id integer NOT NULL,
    submitter_id integer,
    track_id integer,
    format character varying(255),
    location character varying(255),
    time_range character varying(255),
    title character varying(255),
    description text,
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    contact_email character varying(255),
    estimated_size character varying(255),
    is_confirmed boolean DEFAULT false NOT NULL,
    is_public boolean DEFAULT true NOT NULL,
    venue_id integer,
    volunteers_needed integer,
    budget_needed integer,
    start_hour double precision DEFAULT 0 NOT NULL,
    end_hour double precision DEFAULT 0 NOT NULL,
    year integer,
    state character varying(255),
    start_day integer,
    end_day integer,
    internal_notes text,
    slides_url character varying,
    video_url character varying,
    cluster_id integer,
    original_company_name character varying,
    proposed_updates json,
    open_to_collaborators boolean,
    from_underrepresented_group boolean,
    target_audience_description text,
    cached_similar_item_ids integer[] DEFAULT '{}'::integer[],
    live_stream_url character varying,
    company_id bigint
);


--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE submissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE submissions_id_seq OWNED BY submissions.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracks (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    icon character varying(255),
    email_alias character varying(255),
    display_order integer DEFAULT 0 NOT NULL,
    is_submittable boolean DEFAULT false NOT NULL,
    description text,
    color character varying
);


--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tracks_id_seq OWNED BY tracks.id;


--
-- Name: tracks_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracks_users (
    track_id integer,
    user_id integer
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    uid character varying(255),
    name character varying(255),
    email character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_admin boolean DEFAULT false NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    provider character varying(255),
    team_position character varying,
    avatar character varying,
    team_priority integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: venues; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE venues (
    id integer NOT NULL,
    name character varying(255),
    description text,
    contact_name character varying(255),
    contact_email character varying(255),
    contact_phone character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address character varying(255),
    city character varying(255),
    state character varying(255),
    suite_or_unit character varying,
    capacity integer DEFAULT 0,
    extra_directions text
);


--
-- Name: venues_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE venues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: venues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE venues_id_seq OWNED BY venues.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(255) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: volunteer_shifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volunteer_shifts (
    id integer NOT NULL,
    name character varying,
    day integer,
    start_hour double precision,
    end_hour double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    year integer,
    venue_id bigint
);


--
-- Name: volunteer_shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteer_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteer_shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteer_shifts_id_seq OWNED BY volunteer_shifts.id;


--
-- Name: volunteership_shifts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volunteership_shifts (
    id bigint NOT NULL,
    volunteership_id bigint,
    volunteer_shift_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volunteership_shifts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteership_shifts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteership_shifts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteership_shifts_id_seq OWNED BY volunteership_shifts.id;


--
-- Name: volunteerships; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE volunteerships (
    id integer NOT NULL,
    mobile_phone_number character varying,
    affiliated_organization character varying,
    user_id integer,
    year integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: volunteerships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE volunteerships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: volunteerships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE volunteerships_id_seq OWNED BY volunteerships.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE votes (
    id integer NOT NULL,
    user_id integer,
    submission_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments ALTER COLUMN id SET DEFAULT nextval('active_admin_comments_id_seq'::regclass);


--
-- Name: annual_schedules id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY annual_schedules ALTER COLUMN id SET DEFAULT nextval('annual_schedules_id_seq'::regclass);


--
-- Name: attendee_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY attendee_messages ALTER COLUMN id SET DEFAULT nextval('attendee_messages_id_seq'::regclass);


--
-- Name: clusters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY clusters ALTER COLUMN id SET DEFAULT nextval('clusters_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: general_inquiries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY general_inquiries ALTER COLUMN id SET DEFAULT nextval('general_inquiries_id_seq'::regclass);


--
-- Name: homepage_ctas id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY homepage_ctas ALTER COLUMN id SET DEFAULT nextval('homepage_ctas_id_seq'::regclass);


--
-- Name: newsletter_signups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY newsletter_signups ALTER COLUMN id SET DEFAULT nextval('newsletter_signups_id_seq'::regclass);


--
-- Name: newsroom_items id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY newsroom_items ALTER COLUMN id SET DEFAULT nextval('newsroom_items_id_seq'::regclass);


--
-- Name: pitch_contest_entries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_entries ALTER COLUMN id SET DEFAULT nextval('pitch_contest_entries_id_seq'::regclass);


--
-- Name: pitch_contest_votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_votes ALTER COLUMN id SET DEFAULT nextval('pitch_contest_votes_id_seq'::regclass);


--
-- Name: registrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations ALTER COLUMN id SET DEFAULT nextval('registrations_id_seq'::regclass);


--
-- Name: sent_notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sent_notifications ALTER COLUMN id SET DEFAULT nextval('sent_notifications_id_seq'::regclass);


--
-- Name: session_registrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_registrations ALTER COLUMN id SET DEFAULT nextval('session_registrations_id_seq'::regclass);


--
-- Name: sponsor_signups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sponsor_signups ALTER COLUMN id SET DEFAULT nextval('sponsor_signups_id_seq'::regclass);


--
-- Name: sponsorships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sponsorships ALTER COLUMN id SET DEFAULT nextval('sponsorships_id_seq'::regclass);


--
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY submissions ALTER COLUMN id SET DEFAULT nextval('submissions_id_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracks ALTER COLUMN id SET DEFAULT nextval('tracks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: venues id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY venues ALTER COLUMN id SET DEFAULT nextval('venues_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: volunteer_shifts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteer_shifts ALTER COLUMN id SET DEFAULT nextval('volunteer_shifts_id_seq'::regclass);


--
-- Name: volunteership_shifts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteership_shifts ALTER COLUMN id SET DEFAULT nextval('volunteership_shifts_id_seq'::regclass);


--
-- Name: volunteerships id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteerships ALTER COLUMN id SET DEFAULT nextval('volunteerships_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Name: active_admin_comments admin_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY active_admin_comments
    ADD CONSTRAINT admin_notes_pkey PRIMARY KEY (id);


--
-- Name: annual_schedules annual_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY annual_schedules
    ADD CONSTRAINT annual_schedules_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attendee_messages attendee_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attendee_messages
    ADD CONSTRAINT attendee_messages_pkey PRIMARY KEY (id);


--
-- Name: clusters clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY clusters
    ADD CONSTRAINT clusters_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: general_inquiries general_inquiries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY general_inquiries
    ADD CONSTRAINT general_inquiries_pkey PRIMARY KEY (id);


--
-- Name: homepage_ctas homepage_ctas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY homepage_ctas
    ADD CONSTRAINT homepage_ctas_pkey PRIMARY KEY (id);


--
-- Name: newsletter_signups newsletter_signups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY newsletter_signups
    ADD CONSTRAINT newsletter_signups_pkey PRIMARY KEY (id);


--
-- Name: newsroom_items newsroom_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY newsroom_items
    ADD CONSTRAINT newsroom_items_pkey PRIMARY KEY (id);


--
-- Name: pitch_contest_entries pitch_contest_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_entries
    ADD CONSTRAINT pitch_contest_entries_pkey PRIMARY KEY (id);


--
-- Name: pitch_contest_votes pitch_contest_votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_votes
    ADD CONSTRAINT pitch_contest_votes_pkey PRIMARY KEY (id);


--
-- Name: registrations registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT registrations_pkey PRIMARY KEY (id);


--
-- Name: sent_notifications sent_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sent_notifications
    ADD CONSTRAINT sent_notifications_pkey PRIMARY KEY (id);


--
-- Name: session_registrations session_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY session_registrations
    ADD CONSTRAINT session_registrations_pkey PRIMARY KEY (id);


--
-- Name: sponsor_signups sponsor_signups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sponsor_signups
    ADD CONSTRAINT sponsor_signups_pkey PRIMARY KEY (id);


--
-- Name: sponsorships sponsorships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sponsorships
    ADD CONSTRAINT sponsorships_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: venues venues_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY venues
    ADD CONSTRAINT venues_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: volunteer_shifts volunteer_shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteer_shifts
    ADD CONSTRAINT volunteer_shifts_pkey PRIMARY KEY (id);


--
-- Name: volunteership_shifts volunteership_shifts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteership_shifts
    ADD CONSTRAINT volunteership_shifts_pkey PRIMARY KEY (id);


--
-- Name: volunteerships volunteerships_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteerships
    ADD CONSTRAINT volunteerships_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: fulltext_submissions_description_english; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fulltext_submissions_description_english ON submissions USING gin (to_tsvector('english'::regconfig, description));


--
-- Name: fulltext_submissions_title_english; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fulltext_submissions_title_english ON submissions USING gin (to_tsvector('english'::regconfig, (title)::text));


--
-- Name: fulltext_users_name_english; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX fulltext_users_name_english ON users USING gin (to_tsvector('english'::regconfig, (name)::text));


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON active_admin_comments USING btree (namespace);


--
-- Name: index_admin_notes_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_admin_notes_on_resource_type_and_resource_id ON active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_annual_schedules_on_year; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_annual_schedules_on_year ON annual_schedules USING btree (year);


--
-- Name: index_attendee_messages_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_attendee_messages_on_submission_id ON attendee_messages USING btree (submission_id);


--
-- Name: index_comments_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_submission_id ON comments USING btree (submission_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_companies_on_lower_name_unique; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_lower_name_unique ON companies USING btree (lower((name)::text) varchar_pattern_ops);


--
-- Name: index_companies_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_name ON companies USING btree (name);


--
-- Name: index_homepage_ctas_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_homepage_ctas_on_track_id ON homepage_ctas USING btree (track_id);


--
-- Name: index_pitch_contest_votes_on_pitch_contest_entry_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pitch_contest_votes_on_pitch_contest_entry_id ON pitch_contest_votes USING btree (pitch_contest_entry_id);


--
-- Name: index_pitch_contest_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_pitch_contest_votes_on_user_id ON pitch_contest_votes USING btree (user_id);


--
-- Name: index_registrations_on_calendar_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_registrations_on_calendar_token ON registrations USING btree (calendar_token);


--
-- Name: index_registrations_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registrations_on_company_id ON registrations USING btree (company_id);


--
-- Name: index_registrations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_registrations_on_user_id ON registrations USING btree (user_id);


--
-- Name: index_sent_notifications_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sent_notifications_on_submission_id ON sent_notifications USING btree (submission_id);


--
-- Name: index_session_registrations_on_registration_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_session_registrations_on_registration_id ON session_registrations USING btree (registration_id);


--
-- Name: index_session_registrations_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_session_registrations_on_submission_id ON session_registrations USING btree (submission_id);


--
-- Name: index_sponsorships_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sponsorships_on_submission_id ON sponsorships USING btree (submission_id);


--
-- Name: index_sponsorships_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sponsorships_on_track_id ON sponsorships USING btree (track_id);


--
-- Name: index_submissions_on_cluster_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_cluster_id ON submissions USING btree (cluster_id);


--
-- Name: index_submissions_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_company_id ON submissions USING btree (company_id);


--
-- Name: index_submissions_on_submitter_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_submitter_id ON submissions USING btree (submitter_id);


--
-- Name: index_submissions_on_track_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_track_id ON submissions USING btree (track_id);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_volunteer_shifts_on_venue_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteer_shifts_on_venue_id ON volunteer_shifts USING btree (venue_id);


--
-- Name: index_volunteership_shifts_on_volunteer_shift_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteership_shifts_on_volunteer_shift_id ON volunteership_shifts USING btree (volunteer_shift_id);


--
-- Name: index_volunteership_shifts_on_volunteership_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteership_shifts_on_volunteership_id ON volunteership_shifts USING btree (volunteership_id);


--
-- Name: index_volunteerships_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_volunteerships_on_user_id ON volunteerships USING btree (user_id);


--
-- Name: index_votes_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_submission_id ON votes USING btree (submission_id);


--
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_user_id ON votes USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: pitch_contest_votes fk_rails_051f1858c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_votes
    ADD CONSTRAINT fk_rails_051f1858c3 FOREIGN KEY (pitch_contest_entry_id) REFERENCES pitch_contest_entries(id);


--
-- Name: sponsorships fk_rails_10fd4596a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sponsorships
    ADD CONSTRAINT fk_rails_10fd4596a4 FOREIGN KEY (submission_id) REFERENCES submissions(id);


--
-- Name: volunteerships fk_rails_26e12c935b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteerships
    ADD CONSTRAINT fk_rails_26e12c935b FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: registrations fk_rails_2e0658f554; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT fk_rails_2e0658f554 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: pitch_contest_votes fk_rails_4daa05456f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pitch_contest_votes
    ADD CONSTRAINT fk_rails_4daa05456f FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: registrations fk_rails_4dafc7e520; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY registrations
    ADD CONSTRAINT fk_rails_4dafc7e520 FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- Name: volunteership_shifts fk_rails_4deb72ee78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteership_shifts
    ADD CONSTRAINT fk_rails_4deb72ee78 FOREIGN KEY (volunteership_id) REFERENCES volunteerships(id);


--
-- Name: attendee_messages fk_rails_555266c0e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY attendee_messages
    ADD CONSTRAINT fk_rails_555266c0e1 FOREIGN KEY (submission_id) REFERENCES submissions(id);


--
-- Name: volunteership_shifts fk_rails_8ff1f98788; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteership_shifts
    ADD CONSTRAINT fk_rails_8ff1f98788 FOREIGN KEY (volunteer_shift_id) REFERENCES volunteer_shifts(id);


--
-- Name: volunteer_shifts fk_rails_9c4ffa0245; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY volunteer_shifts
    ADD CONSTRAINT fk_rails_9c4ffa0245 FOREIGN KEY (venue_id) REFERENCES venues(id);


--
-- Name: homepage_ctas fk_rails_d6aa0aad97; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY homepage_ctas
    ADD CONSTRAINT fk_rails_d6aa0aad97 FOREIGN KEY (track_id) REFERENCES tracks(id);


--
-- Name: sent_notifications fk_rails_da20014dea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sent_notifications
    ADD CONSTRAINT fk_rails_da20014dea FOREIGN KEY (submission_id) REFERENCES submissions(id);


--
-- Name: submissions fk_rails_fdef407c4c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY submissions
    ADD CONSTRAINT fk_rails_fdef407c4c FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20130116164738'),
('20130116164739'),
('20130116164740'),
('20130116164741'),
('20130116164742'),
('20130116164743'),
('20130116164744'),
('20130116164745'),
('20130116164746'),
('20130116164747'),
('20130116164748'),
('20130117040102'),
('20130508051211'),
('20130511175418'),
('20130511175511'),
('20130512230944'),
('20130514013000'),
('20130528190244'),
('20130601210506'),
('20130621041352'),
('20130624052955'),
('20130624062458'),
('20130624062459'),
('20130624065911'),
('20130624155048'),
('20130624155135'),
('20130717031259'),
('20130717164913'),
('20130717170045'),
('20130718145826'),
('20130723182248'),
('20130730175935'),
('20130806165927'),
('20130813182826'),
('20130814182029'),
('20130814183554'),
('20130815173006'),
('20130815173041'),
('20130820015528'),
('20130901170747'),
('20130905145009'),
('20130905145241'),
('20131203145334'),
('20140415172844'),
('20140415173508'),
('20140429002904'),
('20140513155451'),
('20140526225628'),
('20140624165038'),
('20140718155905'),
('20140803222351'),
('20140803224445'),
('20140816164036'),
('20140908044535'),
('20140908045403'),
('20140908045735'),
('20140909151338'),
('20140912060222'),
('20140912062536'),
('20150811052343'),
('20160617045028'),
('20160619043445'),
('20160627234846'),
('20160628040744'),
('20160710013925'),
('20160719182417'),
('20160719182706'),
('20160720160503'),
('20160726164453'),
('20160802021908'),
('20160802040055'),
('20160802042349'),
('20160802043811'),
('20160802050802'),
('20160804150055'),
('20160823024038'),
('20160823024807'),
('20160823044119'),
('20160909225854'),
('20160912034451'),
('20170320052451'),
('20170713164355'),
('20170718164505'),
('20170720060259'),
('20170811224733'),
('20170814173357'),
('20170818174841'),
('20170822225752'),
('20170828185347'),
('20170828224353'),
('20170828225347'),
('20170828225639'),
('20170830195828'),
('20170906024523'),
('20170908145727'),
('20170911231704'),
('20170912152330'),
('20170912153018'),
('20170912155744'),
('20170915145833'),
('20170918194840'),
('20170918201311'),
('20170920024945'),
('20170925061912'),
('20171010165924'),
('20171018232858'),
('20171023230412'),
('20171023230539'),
('20171024210033'),
('20171029211526'),
('20171130230321'),
('20171212024445'),
('20180218043834'),
('20180218194540'),
('20180220163023');


