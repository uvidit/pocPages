#!/usr/bin/env bash

BUCKET_NAME=allure-poc-prjct-bucket

#clean up public dir
rm -rf ./public/**

echo "Google SDK install...."

gcloud version || true
if [ ! -d "$HOME/google-cloud-sdk/bin" ]; then rm -rf $HOME/google-cloud-sdk; export CLOUDSDK_CORE_DISABLE_PROMPTS=1; curl https://sdk.cloud.google.com | bash; fi
# Add gcloud to $PATH
source $HOME/google-cloud-sdk/completion.bash.inc
source $HOME/google-cloud-sdk/path.bash.inc
gcloud version

echo GCE_SVC_KEY > ./gcloud-api-key.json
gcloud auth activate-service-account \
    gc-svc-acc-allure-reporter-prj@test-gce-prjct.iam.gserviceaccount.com \
    --key-file ./gcloud-api-key.json
gcloud config set project test-gce-prjct

echo "Google SDK info:"
gcloud info

echo "Google SDK downloaded."
echo "Get report data from Bucket on Google Storage....."
gsutil -m cp -r gs://${BUCKET_NAME}/allure-report/* ./public/

echo "Check file list in 'public':"
ls ./public

echo "Adding/comitting/pushing...."
git add ./public/*
git commit -m "Updated report data"
git push origin HEAD:master

echo "Report updated. Se you later! %)"

