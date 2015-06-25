#!/usr/bin/env bash
#setup variables
DEPLOY_ROOT=$PWD
GIT_REPO=/tmp/git-repo
LUMIFY_ALL=$GIT_REPO/lumify-all
SEC_GRAPH=$GIT_REPO/securegraph
LUMIFY_PUBLIC=$LUMIFY_ALL/lumify-public
LUMIFY_VERSION=0.5.0-SNAPSHOT
SECUREGRAPH_VERSION=0.10.0-SNAPSHOT
export GIT_REPO LUMIFY_ALL SEC_GRAPH LUMIFY_PUBLIC LUMIFY_VERSION SECUREGRAPH_VERSION DEPLOY_ROOT

#remove old artifacts and clone
echo "Setting up the git clones at $LUMIFY_ALL, $SEC_GRAPH $LUMIFY_PUBLIC"
rm -rfd $GIT_REPO
mkdir $GIT_REPO
cd $GIT_REPO
mkdir $LUMIFY_ALL

git clone https://github.com/altamiracorp/lumify-all
cd $LUMIFY_ALL
git clone https://github.com/lumifyio/lumify lumify-public
cd $GIT_REPO
git clone https://github.com/lumifyio/securegraph


# Build lumify artifacts
echo "Building Lumify"
cd $LUMIFY_ALL/lumify-public
mvn -DskipTests=true -Pweb-war clean install

echo "Building Secure graph"
cd $SEC_GRAPH
mvn -DskipTests=true clean install

echo "Preparing for deplolymnent"
echo "Copying Web artifacts "
# Create a directory for the cluster deployment and copy files needed for deployment
cd $LUMIFY_ALL
rm -rfd deployment
mkdir deployment
mkdir deployment/web
mkdir deployment/secure-graph
mkdir deployment/tools

cp $LUMIFY_PUBLIC/web/war/target/lumify-web-war-${LUMIFY_VERSION}.war deployment/web/lumify.war

cp $LUMIFY_PUBLIC/tools/cli/target/lumify-cli-${LUMIFY_VERSION}-with-dependencies.jar \
	          deployment/tools

echo "Copying Secure grpah artifacts "
cp $SEC_GRAPH/securegraph-elasticsearch-plugin/target/release/elasticsearch-securegraph-${SECUREGRAPH_VERSION}.zip \
	          deployment/secure-graph


mkdir deployment/web/lib

echo "Copying Web plugins "
cp $LUMIFY_PUBLIC/web/plugins/terms-of-use/target/lumify-terms-of-use-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-social/target/lumify-web-auth-social-${LUMIFY_VERSION}-jar-with-dependencies.jar \
			  $LUMIFY_PUBLIC/web/plugins/dev-tools/target/lumify-web-dev-tools-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/core/plugins/model-bigtable/target/lumify-model-bigtable-${LUMIFY_VERSION}-jar-with-dependencies.jar \
	          deployment/web/lib

echo "Copying Graph Property workers for YARN "
mkdir deployment/gpw

cp `find $LUMIFY_PUBLIC/graph-property-worker/plugins -name "lumify-gpw-*-with-dependencies.jar"` \
	          deployment/gpw

mkdir deployment/yarn

cp $LUMIFY_PUBLIC/tools/long-running-process-yarn/target/lumify-long-running-process-yarn-${LUMIFY_VERSION}-with-dependencies.jar \
	             $LUMIFY_PUBLIC/graph-property-worker/graph-property-worker-yarn/target/lumify-graph-property-worker-yarn-${LUMIFY_VERSION}-with-dependencies.jar \
	             deployment/yarn

mkdir deployment/config

cp -R $LUMIFY_PUBLIC/config/* deployment/config

cp -R deployment $DEPLOY_ROOT
#cd $LUMIFY_ALL/deployment

mkdir -p deloyment/ontologies/ontology-minimal
cp -R $LUMIFY_PUBLIC/examples/ontology-minimal/* deployment/ontologies/ontology-minimal