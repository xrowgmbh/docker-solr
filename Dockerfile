FROM solr

MAINTAINER "Björn Dieding" <bjoern@xrow.de>

ENV container=docker

EXPOSE 8983

# no logic yet implemented

CMD ["/opt/solr/bin/solr", "-f"]