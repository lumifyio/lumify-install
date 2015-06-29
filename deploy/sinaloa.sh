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

mkdir -p deployment/data
cp -R $LUMIFY_ALL/lumify-sinaloa/sinaloa-data-rdf deployment/data

cp -R $LUMIFY_ALL/lumify-sinaloa/sinaloa-data deployment/data