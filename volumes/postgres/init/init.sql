--
-- Roles
--

CREATE ROLE service_registry;
ALTER ROLE service_registry WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'service_registry';


--
-- Database "service_registry"
--
--
-- Name: service_registry; Type: DATABASE; Schema: -; Owner: service_registry
--

CREATE DATABASE service_registry WITH TEMPLATE = template0 ENCODING = 'UTF8';
ALTER DATABASE service_registry OWNER TO service_registry;

\connect service_registry

-- Tables of service registry

CREATE TABLE public.test (
    id integer primary key
);

-- Service registry initialization complete