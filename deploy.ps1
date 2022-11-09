# .\deploy.ps1

Get-ChildItem -LiteralPath . | Compress-Archive -DestinationPath AmplifyDeploymentLambda.zip -Force
aws s3api put-object --bucket demo-bucket-rafa --key AmplifyDeploymentLambda.zip --body AmplifyDeploymentLambda.zip
aws cloudformation deploy --template-file lambda.yml --stack-name AmplifyLambdaFunction
rm AmplifyDeploymentLambda.zip