if ! [ -x "$(command -v aws)" ]; then
then
  echo "ERROR: aws cli is needed"
  exit 1
fi

FILE=$(mktemp)
curl https://raw.githubusercontent.com/ispec-inc/aws-cost-weekly-notifier-lambda-layer/master/example/cfn/cfn.yaml > $FILE

aws cloudformation deploy \
  --template $FILE \
  --stack-name aws-cost-notif-stack \
  --capabilities CAPABILITY_NAMED_IAM \
  --parameter-overrides \
    AccountName=$ACCOUNT_NAME \
    SlackWebhookUrl=$SLACK_WEBHOOK_URL \
    SlackChannel=$SLACK_CHANNEL \
    SlackUsername="AWSコストお知らせくん" \
    SlackIconEmoji=":money_with_wings:"
