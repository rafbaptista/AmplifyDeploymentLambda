#!/bin/bash

tar --exclude "\.git*" -cvf AmplifyDeploymentLambda.zip . # recommended to use zip, doesn't work in windows
aws s3api put-object --bucket demo-bucket-rafa --key AmplifyDeploymentLambda.zip --body AmplifyDeploymentLambda.zip
aws cloudformation deploy --template-file lambda.yml --stack-name AmplifyLambdaFunction
rm AmplifyDeploymentLambda.zip