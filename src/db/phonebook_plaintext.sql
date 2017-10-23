--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2017-10-23 16:46:02

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2819 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 196 (class 1259 OID 25186)
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    firstname text,
    lastname text,
    address text
);


ALTER TABLE contacts OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 25192)
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contacts_id_seq OWNER TO postgres;

--
-- TOC entry 2820 (class 0 OID 0)
-- Dependencies: 197
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- TOC entry 198 (class 1259 OID 25197)
-- Name: numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE numbers (
    id bigint NOT NULL,
    phonetype text,
    phonenumber text,
    contactid bigint
);


ALTER TABLE numbers OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 25203)
-- Name: numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE numbers_id_seq OWNER TO postgres;

--
-- TOC entry 2821 (class 0 OID 0)
-- Dependencies: 199
-- Name: numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE numbers_id_seq OWNED BY numbers.id;


--
-- TOC entry 2678 (class 2604 OID 25205)
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- TOC entry 2679 (class 2604 OID 25206)
-- Name: numbers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numbers ALTER COLUMN id SET DEFAULT nextval('numbers_id_seq'::regclass);


--
-- TOC entry 2809 (class 0 OID 25186)
-- Dependencies: 196
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contacts (id, firstname, lastname, address) FROM stdin;
2	Андрей	Андреев	Санкт-Петербург
3	Антон	Антонов	Москва
4	Иван	Иванов	Москва
\.


--
-- TOC entry 2811 (class 0 OID 25197)
-- Dependencies: 198
-- Data for Name: numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY numbers (id, phonetype, phonenumber, contactid) FROM stdin;
2	MAIN	555-22-33	2
3	MOBILE	+7-911-111-11-11	2
4	MAIN	892-55-66	3
5	WORK	+7-911-332-13-44	3
6	MAIN	5562222	4
7	WORK	222-13-13	2
\.


--
-- TOC entry 2822 (class 0 OID 0)
-- Dependencies: 197
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contacts_id_seq', 4, true);


--
-- TOC entry 2823 (class 0 OID 0)
-- Dependencies: 199
-- Name: numbers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('numbers_id_seq', 7, true);


--
-- TOC entry 2681 (class 2606 OID 25208)
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25210)
-- Name: numbers numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numbers
    ADD CONSTRAINT numbers_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 1259 OID 25213)
-- Name: fki_fk_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_contact_id ON numbers USING btree (contactid);


--
-- TOC entry 2685 (class 2606 OID 25214)
-- Name: numbers fk9x3ohkor9lano09xaqahu3wmw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numbers
    ADD CONSTRAINT fk9x3ohkor9lano09xaqahu3wmw FOREIGN KEY (contactid) REFERENCES contacts(id);


--
-- TOC entry 2686 (class 2606 OID 25219)
-- Name: numbers fk_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numbers
    ADD CONSTRAINT fk_contact_id FOREIGN KEY (contactid) REFERENCES contacts(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2687 (class 2606 OID 25249)
-- Name: numbers fkcwmfo8ou75kos2m3xmjcu1tc1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY numbers
    ADD CONSTRAINT fkcwmfo8ou75kos2m3xmjcu1tc1 FOREIGN KEY (contactid) REFERENCES contacts(id);


-- Completed on 2017-10-23 16:46:02

--
-- PostgreSQL database dump complete
--

