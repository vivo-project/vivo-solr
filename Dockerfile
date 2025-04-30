FROM solr:9.8.1

ARG CONFIGSET=vivocore
ENV CONFIGSET $CONFIGSET

USER root

COPY /vivocore/conf /opt/solr/server/solr/configsets/vivocore/conf

COPY setup.sh /setup.sh


RUN chown -R solr:solr /opt/solr/server/solr/configsets/vivocore
RUN chmod -R 755 /opt/solr/server/solr/configsets/vivocore

USER solr

CMD ["/bin/bash", "/setup.sh"]
