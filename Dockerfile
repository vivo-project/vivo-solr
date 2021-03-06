FROM solr:7.7.3-slim

RUN chmod -R ugo+w /opt/solr/server/solr/
RUN chmod -R ugo+w /opt/solr/server/logs/

COPY /vivocore/conf /opt/solr/server/solr/configsets/vivocore/conf

COPY setup.sh /setup.sh

USER root

RUN chown -R solr:solr /opt/solr/server/solr/configsets/vivocore
RUN chmod -R 755 /opt/solr/server/solr/configsets/vivocore

USER solr

CMD ["/bin/bash", "/setup.sh"]
