FROM solr

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

EXPOSE 8983

WORKDIR /opt/solr

ADD solr.sh /solr.sh

CMD ["/solr.sh"]