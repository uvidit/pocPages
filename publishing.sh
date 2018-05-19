#!/usr/bin/env bash

BUCKET_NAME=allure-poc-prjct-bucket

#clean up public dir
rm -rf ./public/**

# installing Google SDK
GCLOUD_DIR=google-cloud-sdk
echo "Google SDK install...."
curl https://sdk.cloud.google.com | exec bash #| echo "downloading in progress..."
chmod +x ~/${GCLOUD_DIR}/install.sh
CLOUDSDK_CORE_DISABLE_PROMPTS=1 ~/${GCLOUD_DIR}/install.sh

source /Users/ozinchenko/google-cloud-sdk/completion.bash.inc
source /Users/ozinchenko/google-cloud-sdk/path.bash.inc

gcloud auth activate-service-account \
    gc-svc-acc-allure-reporter-prj@test-gce-prjct.iam.gserviceaccount.com \
    --key-file ./test-gce-prjct-dbc00919a7ea.json
gcloud config set project test-gce-prjct
echo "Google SDK info:"
gcloud info

echo "Google SDK downloaded."
echo "Creating Bucket on Google Storage....."

gsutil -m cp gs://${BUCKET_NAME}/allure-report/** ./public/
ls ./public

git add ./public/*
git commit -m "Updated report data"
git push origin HEAD:master

echo "Report updated. Se you later! %)"

