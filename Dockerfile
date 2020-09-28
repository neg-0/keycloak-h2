FROM jboss/keycloak

COPY ./realm-export.json /tmp/realm-export.json
# COPY ./users.json /tmp/users.json

# RUN sed -i '/^SYS_PROPS=""/a\
#   SYS_PROPS+=" -Dkeycloak.migration.action=import -Dkeycloak.migration.provider=singleFile -Dkeycloak.migration.file=/tmp/users.json -Dkeycloak.migration.strategy=OVERWRITE_EXISTING "' /opt/jboss/tools/docker-entrypoint.sh

ENV KEYCLOAK_USER admin
ENV KEYCLOAK_PASSWORD admin
ENV DB_VENDOR H2
ENV KEYCLOAK_IMPORT /tmp/realm-export.json

EXPOSE 8080