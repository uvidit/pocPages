#!/usr/bin/env bash

BUCKET_NAME=allure-poc-prjct-bucket

gsutil cp gs://${BUCKET_NAME}/* ./public/

ls ./public
