# local-deploy
Docker-Compose setup of the system.

You can start the docker network with:

```
docker-compose up -d
```

You can log into PGAdmin then on your local webbrowser over localhost:8091 and log in with the email simcomp@jku.at and password simcomp.

You can add custom databases to the postgres server in the [init-file]().

## Notes for developers
Container versions and other environment variables should be defined in the [env-file]().
