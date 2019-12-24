FROM openjdk:8-jre-alpine
WORKDIR /app
RUN apk --no-cache add ca-certificates tzdata 
ARG sentinel_version
ENV SENTINEL_JAR="sentinel-dashboard-"${sentinel_version}".jar"
ENV SENTINEL_DOWNLOAD="https://github.com/alibaba/Sentinel/releases/download/"${sentinel_version}"/sentinel-dashboard-"${sentinel_version}".jar"
RUN /bin/sh -c "wget "$SENTINEL_DOWNLOAD" -O "$SENTINEL_JAR 
COPY docker-entrypoint.sh ./
RUN chmod a+x docker-entrypoint.sh
ENTRYPOINT ["/app/docker-entrypoint.sh"]
