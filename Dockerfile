FROM solr:5.4

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

# Bug https://github.com/docker-solr/docker-solr/commit/949d6bece4e2ae1189d84210ae0b54b7ba87a37c
RUN sed -i -e 's/#SOLR_PORT=8983/SOLR_PORT=8983/' /opt/solr/bin/solr.in.sh
ADD ezp-default /opt/solr/ezp-default

CMD ["/opt/solr/bin/solr", "-f"]