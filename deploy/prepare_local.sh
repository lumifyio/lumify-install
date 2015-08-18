#!/usr/bin/env bash
#setup variables
DEPLOY_ROOT=$PWD
SCRIPT_DIR=$(dirname $0)
if [ "$SCRIPT_DIR" = '.' ]; then
	SCRIPT_DIR=$DEPLOY_ROOT
fi

# NOTE: This needs to changed to point to the base directory that holds the lumify-data and lumify projects
#back up two directories
LOCAL_DIR="$SCRIPT_DIR/../.."
echo "LOCAL_DIR is set to $LOCAL_DIR"

GIT_REPO=/tmp/git-repo
LUMIFY_ALL=$GIT_REPO/lumify-data
SEC_GRAPH=$GIT_REPO/securegraph
LUMIFY_PUBLIC=$LUMIFY_ALL/lumify-public
LUMIFY_VERSION=0.5.0-SNAPSHOT
SECUREGRAPH_VERSION=0.10.0-SNAPSHOT
export GIT_REPO LUMIFY_ALL SEC_GRAPH LUMIFY_PUBLIC LUMIFY_VERSION SECUREGRAPH_VERSION DEPLOY_ROOT

#remove old artifacts and clone
echo "Setting up the local copies at $LUMIFY_ALL, $SEC_GRAPH $LUMIFY_PUBLIC"
rm -rfd $GIT_REPO
mkdir $GIT_REPO
cd $GIT_REPO
mkdir $LUMIFY_ALL

echo "Copying lumify-data and lumify directories from local machine based at $LOCAL_DIR."
cp -r $LOCAL_DIR/lumify-data lumify-data
cd $LUMIFY_ALL
cp -r $LOCAL_DIR/lumify lumify-public

# Build lumify artifacts
echo "Building Lumify"
cd $LUMIFY_ALL/lumify-public
mvn -DskipTests=true -P"grunt unix",web-war,web-war-with-gpw,web-war-with-ui-plugins clean install

echo "Preparing for deployment"
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

echo "Copying Secure graph artifacts "
curl -o deployment/secure-graph/securegraph-elasticsearch-0.9.1.jar \
 			  http://search.maven.org/remotecontent?filepath=org/securegraph/securegraph-elasticsearch/0.9.1/securegraph-elasticsearch-0.9.1.jar


mkdir deployment/web/lib

echo "Copying Web plugins "
cp $LUMIFY_PUBLIC/web/plugins/terms-of-use/target/lumify-terms-of-use-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/analysts-notebook-export/target/lumify-analysts-notebook-export-${LUMIFY_VERSION}-jar-with-dependencies.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-social/target/lumify-web-auth-social-${LUMIFY_VERSION}-jar-with-dependencies.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-username-only/target/lumify-web-auth-username-only-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-username-password/target/lumify-web-auth-username-password-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-x509/target/lumify-web-auth-x509-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/auth-x509ldap/target/lumify-web-auth-x509ldap-${LUMIFY_VERSION}-jar-with-dependencies.jar \
			  $LUMIFY_PUBLIC/web/plugins/change-email/target/lumify-web-change-email-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/change-password/target/lumify-web-change-password-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/geocoder-bing/target/lumify-geocoder-bing-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/google-analytics/target/lumify-google-analytics-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/import-export-workspaces/target/lumify-web-import-export-workspaces-${LUMIFY_VERSION}.jar \
			  $LUMIFY_PUBLIC/web/plugins/opennlp-dictionary-extractor/target/lumify-opennlp-dictionary-extractor-web-${LUMIFY_VERSION}-jar-with-dependencies.jar \
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

echo "Copying Configs"
mkdir deployment/config

cp -R $LUMIFY_PUBLIC/config/* deployment/config

echo "Copying Ontology"
mkdir -p deployment/ontologies/ontology-minimal
cp -R $LUMIFY_PUBLIC/examples/ontology-minimal/* deployment/ontologies/ontology-minimal

echo "Deployment to Vagrant folder"
cp -R deployment $DEPLOY_ROOT

echo "Ready to deploy!"
