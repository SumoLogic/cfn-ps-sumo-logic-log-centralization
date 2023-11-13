#!/bin/sh

echo "Start S3 upload Script....."

declare -a regions=("us-east-2" "us-east-1" "us-west-1" "us-west-2" "ap-south-1" "ap-northeast-2" "ap-southeast-1" "ap-southeast-2" "ap-northeast-1" "ca-central-1" "cn-north-1" "eu-central-1" "eu-west-1" "eu-west-2" "eu-west-3" "eu-north-1s" "sa-east-1")

cd ..\/..\/
for region in "${regions[@]}"
do
    cd quickstart-sumo-logic-log-centralization/scripts/
    bucket_name=appdevzipfiles-$region
    echo "Region is $region and Bucket Name is $bucket_name"
    cd ..\/..\/

    aws s3 cp quickstart-sumo-logic-log-centralization/ s3://$bucket_name/quickstart-sumo-logic-log-centralization/ --recursive --exclude '.git/*' --exclude '.idea/*' --acl public-read
done

echo "End S3 upload Script....."