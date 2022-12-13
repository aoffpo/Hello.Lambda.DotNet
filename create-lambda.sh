#!/usr/bin/env bash

awslocal lambda create-function \
    --function-name hello-lambda \
    --runtime dotnet6 \
    --zip-file fileb://lambda.zip \
    --handler index.handler \
    --role cool-stacklifter