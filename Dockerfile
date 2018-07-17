# docker build --rm --no-cache -t solr .

FROM solr:6.6.4

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

ENV SOLR_VERSION=6.6.4
ENV SOLR=solr-$SOLR_VERSION
ENV SOLR_USER=solr

RUN echo "SOLR_PORT=8983" >> /opt/solr/bin/solr.in.sh

USER root

COPY ezplatform/ /opt/solr/server/ezplatform/

RUN cp /opt/solr/server/solr/configsets/basic_configs/conf/currency.xml /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/configsets/basic_configs/conf/solrconfig.xml /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/configsets/basic_configs/conf/stopwords.txt /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/configsets/basic_configs/conf/synonyms.txt /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/configsets/basic_configs/conf/elevate.xml /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/configsets/basic_configs/conf/elevate.xml /opt/solr/server/ezplatform/conf/ \
    && cp /opt/solr/server/solr/solr.xml /opt/solr/server/ezplatform/

RUN sed -i.bak '/<updateRequestProcessorChain name="add-unknown-fields-to-the-schema">/,/<\/updateRequestProcessorChain>/d' /opt/solr/server/ezplatform/conf/solrconfig.xml \
 && sed -ie 's/${solr.autoSoftCommit.maxTime:-1}/${solr.autoSoftCommit.maxTime:20}/' /opt/solr/server/ezplatform/conf/solrconfig.xml
RUN chown -R $SOLR_USER:$SOLR_USER /opt/solr /opt/solr

USER solr
ENV SOLR_HOME /opt/solr/server/ezplatform

#Would work but the web backend would not be reachable anymore
#CMD ["solr-create", "-c", "ezplatform_core", "-d", "/opt/solr/server/ezplatform/conf"]

CMD ["/opt/solr/bin/solr", "-f"]
