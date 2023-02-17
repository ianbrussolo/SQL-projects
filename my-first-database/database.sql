--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-02-17 17:46:18

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
-- TOC entry 215 (class 1259 OID 27489)
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    emailusp character varying(30),
    nome character varying(30) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 27484)
-- Name: disciplinas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplinas (
    id character varying(10) NOT NULL,
    nome character varying(60),
    professor_id integer,
    sala integer
);


ALTER TABLE public.disciplinas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 27506)
-- Name: disciplinas_alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplinas_alunos (
    alunos_nusp integer NOT NULL,
    disciplina_id character varying(10) NOT NULL,
    nota real
);


ALTER TABLE public.disciplinas_alunos OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27494)
-- Name: professores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professores (
    id integer NOT NULL,
    nome character varying(30),
    email_usp character varying(30)
);


ALTER TABLE public.professores OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 27489)
-- Dependencies: 215
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, emailusp, nome) FROM stdin;
18732161	lucasoliveira@usp.br	Lucas Oliveira
18712111	jvramos@usp.br	João Vitor
18732561	anaclarausp.br	Ana Clara
11234111	jutexeira@usp.br	Julia Texeira
11234521	peandrade@usp.br	Pedro Andrade
187211224	igorramos@usp.br	Igor Ramos
11232131	yasferraz@usp.br	Yasmin Ferraz
18123441	isatavares@usp.br	Isabela Tavares
1973423	macardoso@usp.br	Maria Cardoso
1675123	miguelsilva@usp.br	Miguel Silva
1234567	ianferreira@usp.br	Ian Ferreira
1278367	matcarvalho@usp.br	Matheus Carvalho
\.


--
-- TOC entry 3337 (class 0 OID 27484)
-- Dependencies: 214
-- Data for Name: disciplinas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplinas (id, nome, professor_id, sala) FROM stdin;
ACH2023	Algoritmos e estruturas de dados I	1	123
ACH2011	Cálculo I	2	124
ACH2013	Matemática discreta	2	225
ACH2053	Introdução à estatística	8	324
ACH2002	Introdução à Análise de Algoritmos	4	112
ACH2034	Organização e arquitetura de computadores	6	231
ACH2001	Introdução à Programação	5	211
ACH2033	Matrizes, vetores e geometrica analítica	2	215
ACH2024	Algoritmos e estruturas de dados II	7	135
ACH2063	Introdução à Administração e Economia para Computação	3	135
\.


--
-- TOC entry 3340 (class 0 OID 27506)
-- Dependencies: 217
-- Data for Name: disciplinas_alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disciplinas_alunos (alunos_nusp, disciplina_id, nota) FROM stdin;
1234567	ACH2023	3
1234567	ACH2053	8
1278367	ACH2002	2.5
1278367	ACH2053	8.9
18732161	ACH2011	6.3
18732161	ACH2053	2
18712111	ACH2023	5.5
18712111	ACH2053	4
18732561	ACH2001	2.1
18732561	ACH2011	9.3
11234111	ACH2001	7.8
11234111	ACH2034	6.9
11234521	ACH2011	4.3
11234521	ACH2024	1
187211224	ACH2013	1.5
187211224	ACH2034	9.8
11232131	ACH2002	8.9
11232131	ACH2023	5.6
18123441	ACH2034	3.1
18123441	ACH2024	1.3
11234111	ACH2033	9.1
18123441	ACH2002	7.3
1234567	ACH2013	4.1
11234111	ACH2023	1
18123441	ACH2033	6
1278367	ACH2033	7
11232131	ACH2063	8
187211224	ACH2001	7
1278367	ACH2063	8
1278367	ACH2034	3
1234567	ACH2033	1
11234521	ACH2013	6
18732561	ACH2023	5
18732161	ACH2034	5.1
11232131	ACH2013	5.6
18712111	ACH2024	5.3
18732161	ACH2001	4.3
18732161	ACH2002	5
18712111	ACH2001	4
11234111	ACH2053	6.1
18123441	ACH2013	7.3
18732561	ACH2024	2.5
187211224	ACH2063	7.8
11234521	ACH2063	5.9
1278367	ACH2011	6
\.


--
-- TOC entry 3339 (class 0 OID 27494)
-- Dependencies: 216
-- Data for Name: professores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professores (id, nome, email_usp) FROM stdin;
1	Lucio Digi	ludigi@usp.br
2	Claudio Garcia	claugarc@usp.br
3	Arlinda Lima	arlilima@usp.br
4	Alessandro Freitas	alefreitas@usp.br
5	Marcos Fortnato	fortmarcos@usp.br
6	Daniele Angel	daniang@usp.br
7	Flavio Nakata	flanakata@usp.br
8	Estevão Francisco	estevaofran@usp.br
\.


--
-- TOC entry 3187 (class 2606 OID 27493)
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 27510)
-- Name: disciplinas_alunos disciplinas_alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas_alunos
    ADD CONSTRAINT disciplinas_alunos_pkey PRIMARY KEY (alunos_nusp, disciplina_id);


--
-- TOC entry 3185 (class 2606 OID 27488)
-- Name: disciplinas disciplinas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT disciplinas_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 27498)
-- Name: professores professores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professores
    ADD CONSTRAINT professores_pkey PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 27511)
-- Name: disciplinas_alunos disciplinas_alunos_alunos_nusp_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas_alunos
    ADD CONSTRAINT disciplinas_alunos_alunos_nusp_fkey FOREIGN KEY (alunos_nusp) REFERENCES public.alunos(id);


--
-- TOC entry 3194 (class 2606 OID 27516)
-- Name: disciplinas_alunos disciplinas_alunos_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas_alunos
    ADD CONSTRAINT disciplinas_alunos_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES public.disciplinas(id);


--
-- TOC entry 3192 (class 2606 OID 27541)
-- Name: disciplinas disciplinas_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplinas
    ADD CONSTRAINT disciplinas_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professores(id);


-- Completed on 2023-02-17 17:46:18

--
-- PostgreSQL database dump complete
--

