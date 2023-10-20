--
-- Roles
--

CREATE ROLE registry;
ALTER ROLE registry WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'registry';


--
-- Database "service_registry"
--
--
-- Name: service_registry; Type: DATABASE; Schema: -; Owner: service_registry
--

CREATE DATABASE service_registry WITH TEMPLATE = template0 ENCODING = 'UTF8';
ALTER DATABASE service_registry OWNER TO registry;

\connect service_registry

GRANT USAGE ON SCHEMA public TO registry;
GRANT CREATE ON SCHEMA public TO registry;

-- Tables of service registry

CREATE TABLE public.test (
    id integer primary key
);

-- Service registry initialization complete