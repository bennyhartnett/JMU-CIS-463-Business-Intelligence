#Extremely basic creation of DynamoDB table

import boto3

dynamodb = boto3.resource('dynamodb')

table = dynamodb.create_table(
    TableName='JohnHartnettAWProductionBOM',
    KeySchema=[
        {
            'AttributeName': 'ProductID',
            'KeyType': 'HASH'  # Partition key
        },
        {
            'AttributeName': 'ProductName',
            'KeyType': 'RANGE'  # Sort key
        }
    ],
    AttributeDefinitions=[
        {
            'AttributeName': 'ProductID',
            'AttributeType': 'S'
        },
        {
            'AttributeName': 'ProductName',
            'AttributeType': 'S'
        },

    ],
    ProvisionedThroughput={
        'ReadCapacityUnits': 10,
        'WriteCapacityUnits': 10
    }
)
