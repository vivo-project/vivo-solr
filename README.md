# vivo-solr
Configuration and Installation instructions for VIVO's external Solr

## Requirements
This configuration has been tested with VIVO 1.11.0 and Solr 4.7.0

# Quick Start
1. Download and install Solr 7.4.0
   - [http://www.apache.org/dyn/closer.lua/lucene/solr/7.4.0](http://www.apache.org/dyn/closer.lua/lucene/solr/7.4.0)
1. Create directory:
   ```
   ${SOLR_HOME}//opt/solr/solr-7.4.0/server/solr/vivocore/
   ```
      - Where ${SOLR_HOME} is the directory in which you installed Solr
1. Add the `vivocore` directory of this GitHub repo and its contents into ${SOLR_HOME}/server/solr/
   - The end result should be a directory structure such as
   ```
   ${SOLR_HOME}/server/solr/vivocore/core.properties
                                 └── conf/
                                      ├── currency.xml
                                      ├── elevate.xml
                                      └── ... 
   ```
1. Start solr
   ```bash
   ${SOLR_HOME}/bin/solr start
   ```
1. Update VIVO runtime.properties
   ```
   vitro.local.solr.url = http://localhost:8983/solr/solrcore   
   ```
1. Start VIVO!

# Credits
The VIVO-specific configuration and general source of this repository comes from:
[Huda Khan](https://github.com/hudajkhan) [SolrVIVOConfiguration](https://github.com/hudajkhan/SolrVIVOConfiguration)
