#!/bin/sh

SOLR_CONFIG=/opt/solr/example/solr/ezp-default/conf/solrconfig.xml
SOLR_SCHEMA=/opt/solr/example/solr/ezp-default/conf/schema.xml
sed -i '/type="text_icu"/d' ${SOLR_SCHEMA}

sed -i '/<fieldType name="text_icu" class="solr.TextField" positionIncrementGap="100" autoGeneratePhraseQueries="false">/,/<\/fieldType>/d' ${SOLR_SCHEMA}
sed -i 's@<str name=\"confFiles\">.*@<str name=\"confFiles\">schema.xml,elevate.xml,stopwords.txt</str>@g' ${SOLR_CONFIG}
sed -i 's@<useColdSearcher>.*@<useColdSearcher>true</useColdSearcher>@g' ${SOLR_CONFIG}
sed -i 's@<maxWarmingSearchers>.*@<maxWarmingSearchers>1</maxWarmingSearchers>@g' ${SOLR_CONFIG}
sed -i 's@<filterCache class=\"solr.FastLRUCache\".*@<filterCache class=\"solr.FastLRUCache\" size=\"512\" initialSize=\"512\" autowarmCount=\"32\" />@g' ${SOLR_CONFIG}
sed -i 's@<queryResultCache class=\"solr.LRUCache\".*@<queryResultCache class=\"solr.LRUCache\" size=\"512\" initialSize=\"512\" autowarmCount=\"32\" />@g' ${SOLR_CONFIG}
sed -i '
/<\/fields>/ i\
<dynamicField name="*____loc" type="location" indexed="true" stored="true"\/>\
<dynamicField name="*____loc_0_coordinate" type="double" indexed="true" stored="true"\/>\
<dynamicField name="*____loc_1_coordinate" type="double" indexed="true" stored="true"\/>\
' ${SOLR_SCHEMA}
sed -i '
/<\/schema>/ i\
     <copyField source="*_lk" dest="ezf_df_tags"\/>\
     <copyField source="*_k" dest="ezf_df_tags"\/>\
' ${SOLR_SCHEMA}
sed -i '
/<\/fields>/ i\
     <field name="ezf_df_tags" type="text" indexed="true" stored="true" multiValued="true" termVectors="true"\/>\
' ${SOLR_SCHEMA}

#/usr/bin/sed -i 's@solr.log=.*@solr.log=/var/log/@g' $RPM_BUILD_ROOT%{_datadir}/ezfind/resources/log4j.properties

exit 0