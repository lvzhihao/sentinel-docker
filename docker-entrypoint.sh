#!/bin/sh

# default timezone
if [ ! -n "$TZ" ]; then
    export TZ="Asia/Shanghai"
fi

# set timezone
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
echo $TZ > /etc/timezone

# sentinel env default export
if [ ! -n "$AUTH_USERNAME" ]; then
    export AUTH_USERNAME="sentinel"
fi

if [ ! -n "$AUTH_PASSWORD" ]; then
    export AUTH_PASSWORD="sentinel"
fi

if [ ! -n "$SESSION_TIMEOUT" ]; then
    export SESSION_TIMEOUT="7200"
fi

if [ ! -n "$SERVER_PORT" ]; then
    export SERVER_PORT="8080"
fi

if [ ! -n "$PROJECT_NAME" ]; then
    export PROJECT_NAME="sentinel-dashboard"
fi

if [ ! -z "$1" ]; then
    exec "$@"
else
    java -Dsentinel.dashboard.auth.username=$AUTH_USERNAME \
-Dsentinel.dashboard.auth.password=$AUTH_PASSWORD \
-Dserver.servlet.session.timeout=$SESSION_TIMEOUT \
-Dserver.port=$SERVER_PORT \
-Dproject.name=$PROJECT_NAME \
-jar /app/$SENTINEL_JAR
fi
