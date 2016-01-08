#!/bin/bash

SOLR_CONFIG=/opt/solr/example/solr/ezp-default/conf/solrconfig.xml
SOLR_SCHEMA=/opt/solr/example/solr/ezp-default/conf/schema.xml


#/usr/bin/sed -i 's@solr.log=.*@solr.log=/var/log/@g' $RPM_BUILD_ROOT%{_datadir}/ezfind/resources/log4j.properties

exit 0