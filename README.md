# local-deploy
Docker-Compose setup of the system.

You can start the docker network with:

```
docker-compose up -d
```
## PostgreSQL database
You can log into PGAdmin then on your local webbrowser over localhost:8091 and log in with the email simcomp@jku.at and password simcomp.
Register the server with *host-name, username, password* = postgres.

You can add custom databases to the postgres server in the [init-file](./volumes/postgres/init/init.sql).

Once the container is started for the first time, the databases-folder will be mounted under *./volumes/postgres/data*.
If you change the contents of the [init-file](./volumes/postgres/init/init.sql) and want to rebuild the whole container, you also have to delete this folder beforehand.


## Notes for developers
Container versions and other environment variables should be defined in the [env-file](./.env).
