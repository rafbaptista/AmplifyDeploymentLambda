!/bin/bash

tar -a -cf AmplifyDeploymentLambda.zip $(ls) # not working when resource handler tries to unzip in cloudformation
aws s3api put-object --bucket demo-bucket-rafa --key AmplifyDeploymentLambda.zip --body AmplifyDeploymentLambda.zip
aws cloudformation deploy --template-file lambda.yml --stack-name AmplifyLambdaFunction
rm AmplifyDeploymentLambda.zip