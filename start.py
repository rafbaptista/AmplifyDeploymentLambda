import boto3
import os

amplify_client = boto3.client('amplify')

def lambda_handler(event, context):
    amplify_client.start_job(
        appId=os.environ['APP_ID'],
        branchName=os.environ['RELEASE_BRANCH'],
        jobType='RELEASE',
        jobReason='Automatic Deployment',
    )