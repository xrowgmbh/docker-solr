FROM solr

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

EXPOSE 8983

# Bug https://github.com/docker-solr/docker-solr/commit/949d6bece4e2ae1189d84210ae0b54b7ba87a37c
RUN sed -i -e 's/#SOLR_PORT=8983/SOLR_PORT=8983/' /opt/solr/bin/solr.in.sh

CMD ["/opt/solr/bin/solr", "-f"]