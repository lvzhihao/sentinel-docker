# sentinel-docker
docker for sentinel
* WORKSPACE /app

# ENV
* SENTINEL_JAR
```
-jar /app/$SENTINEL_JAR
```
* AUTH_USERNAME
```
-Dsentinel.dashboard.auth.username=$AUTH_USERNAME
```
* AUTH_PASSWORD 
```
-Dsentinel.dashboard.auth.password=$AUTH_PASSWORD
```
* SESSION_TIMEOUT
```
-Dserver.servlet.session.timeout=$SESSION_TIMEOUT
```
* SERVER_PORT 
```
-Dserver.port=$SERVER_PORT
```
* PROJECT_NAME
```
-Dproject.name=$PROJECT_NAME
```

# docker-compose
```
version: '3.1'

services:

  sentinel-dashboard:
    image: edwinlll/sentinel:latest
    restart: always
    ports:
      - 8080:8080
    environment:
      AUTH_USERNAME: admin 
      AUTH_PASSWORD: admin
      SERVER_PORT: 8080
```
