--
-- Roles
--
CREATE ROLE registry;
ALTER ROLE registry WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'registry';
CREATE ROLE manager;
ALTER ROLE manager WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'manager';

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
-- Service registry initialization complete
--
-- Database "manager"
--
--
-- Name: manager; Type: DATABASE; Schema: -; Owner: manager
--
CREATE DATABASE manager WITH TEMPLATE = template0 ENCODING = 'UTF8';
ALTER DATABASE manager OWNER TO manager;

\connect manager

GRANT USAGE ON SCHEMA public TO manager;
GRANT CREATE ON SCHEMA public TO manager;
-- Manager DB initialization complete
