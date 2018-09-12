# Your site is published at https://uvidit.github.io/pocPages/

initial readme for AllureJBehave reporter project

This project is created to publish POC Allure reports generated on running JBehave tests inside GCE

Don't forget set env variables:
GITHUB_TOKEN < the token required by TRAVIS CI to poll GITHUB

## GCE service key using example: http://scottsmerchek.com/2015/07/24/pushing-to-google-container-registry-from-circleci/
GCE_SVC_KEY_IN_BASE64  < the API key required by publishing script to work with Google cloud