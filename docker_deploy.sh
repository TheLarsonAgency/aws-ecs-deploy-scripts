#!/bin/bash

# Authenticate docker
`aws ecr get-login --region $AWS_REGION`

# Push docker image out
docker push $DOCKER_URI

# Find the task ID
task_id="$(aws ecs list-tasks --region $AWS_REGION --service-name $APP_NAME --cluster $AWS_ECS_CLUSTER | grep -A1 taskArns | tail -1 | sed 's/"//g' | cut -d'/' -f2 | cut -d',' -f1)"

# Restart AWS
[ "$task_id" != "" ] && aws ecs stop-task --region $AWS_REGION --cluster $AWS_ECS_CLUSTER --task $task_id
