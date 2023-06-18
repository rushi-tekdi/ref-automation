# ref-automation

# Running the services

## Set PWD in .env file as your current directory path

## Start DB service

```bash
sudo docker-compose up -d db
```

## Start Keycloak service

```bash
sudo docker-compose up -d keycloak
```

## Open the keycloak admin console

http://localhost:8080/auth/

## Goto Clients -> admin-api -> Credentials

## Click on Regenerate Secret and copy the new value

## Set KEYCLOAK_SECRET with the copied value in .env file

## Start all the services,

```bash
sudo docker-compose up -d
```

## Check if all the services are started using

```bash
sudo docker-compose ps
```

Access the registry swagger json http://localhost:8081/api/docs/swagger.json

## To recreate docker service run below command

```bash
sudo docker-compose up -d --force-recreate --no-deps <service_name>
```
