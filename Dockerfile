FROM makuk66/docker-solr:4.10.4

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

# Bug https://github.com/docker-solr/docker-solr/commit/949d6bece4e2ae1189d84210ae0b54b7ba87a37c
RUN sed -i -e 's/#SOLR_PORT=8983/SOLR_PORT=8983/' /opt/solr/bin/solr.in.sh

COPY ezp-default /opt/solr/ezp-default

# wget http://localhost:8983/solr/admin/cores?action=CREATE&name=ezpublish&instanceDir=/ezp-default/conf/&dataDir=data&persist=true&loadOnStartup=true
CMD ["/opt/solr/bin/solr", "-f"]