# local-deploy
Docker-Compose setup of the system.

You can start the docker network with:

```
docker-compose up -d
```

When first deploying the network, it might be necessary to rerun above command after the postgres server is ready to accept connections, as the first initialization of the server will likely take longer which causes some services to crash.

## PostgreSQL database
You can log into PGAdmin then on your local webbrowser over localhost:8091 and log in with the email simcomp@jku.at and password simcomp.
Register the server with *host-name, username, password* = postgres.

You can add custom databases to the postgres server in the [init-file](./volumes/postgres/init/init.sql).

Once the container is started for the first time, the databases-folder will be mounted under *./volumes/postgres/data*.
If you change the contents of the [init-file](./volumes/postgres/init/init.sql) and want to rebuild the whole container, you also have to delete this folder beforehand.

## Adaptors
The adaptors are configured to automatically register themselves at the [service-registry](https://github.com/jku-swe-simcomp/simcomp-services/tree/main/service-registry).
There is a delay configured for the registration to mitigate the risk of the adaptors attempting registration while the registry is not ready to handle the request.
If registration still fails, either trigger registration manually using the swagger-ui of the adaptors, or restart the adaptor containers.

## Workflows
There are two github actions workflow for this repository [(see here)](./.github/workflows).
One workflow automatically updates the image tags and is triggered by a repository dispatch in the [main repository]().
The other workflow performs E2E tests on every change, see also [here](https://jku-swe-simcomp.github.io/simcomp-services/).

## Notes for developers
Container versions and other environment variables should be defined in the [env-file](./.env).

