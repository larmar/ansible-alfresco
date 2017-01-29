#!/bin/sh
export ALFRESCO_HOME=/srv/alfresco
export SOLR_HOME=/usr/local/share/solr4
cd /srv/alfresco/alf_data/keystore/
/bin/sh generate_keystores.sh
unalias cp
cp /root/browser.p12 $ALFRESCO_HOME/alf_data/keystore/
cp /root/ssl.keystore $ALFRESCO_HOME/alf_data/keystore/
cp /root/ssl.truststore $ALFRESCO_HOME/alf_data/keystore/
cp /root/ssl.repo.client.keystore $SOLR_HOME/workspace-SpacesStore/conf/
cp /root/ssl.repo.client.keystore $SOLR_HOME/archive-SpacesStore/conf/
cp /root/ssl.repo.client.truststore $SOLR_HOME/workspace-SpacesStore/conf/
cp /root/ssl.repo.client.truststore $SOLR_HOME/archive-SpacesStore/conf/
sed -e s%@@ALFRESCO_SOLR4_DIR@@%$SOLR_HOME%g \
    -e s%@@ALFRESCO_SOLR4_MODEL_DIR@@%$ALFRESCO_HOME/alf_data/solr4/model%g \
    -e s%@@ALFRESCO_SOLR4_CONTENT_DIR@@%$ALFRESCO_HOME/alf_data/solr4/content%g \
    /usr/local/share/solr4/context.xml > /etc/tomcat/Catalina/localhost/solr4.xml

sed -i s%@@ALFRESCO_SOLR4_DATA_DIR@@%$ALFRESCO_HOME/alf_data/solr4/index%g $SOLR_HOME/archive-SpacesStore/conf/solrcore.properties
sed -i s%@@ALFRESCO_SOLR4_DATA_DIR@@%$ALFRESCO_HOME/alf_data/solr4/index%g $SOLR_HOME/workspace-SpacesStore/conf/solrcore.properties
alias cp="cp -i"
