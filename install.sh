if ! [ -x "$(command -v aws)" ]; then
  echo "ERROR: aws cli is needed"
  exit 1
fi

if [ -z "$ACCOUNT_NAME" ]; then
  echo "ERROR: \$ACCOUNT_NAME is nil"
  exit 1
fi
if [ -z "$SLACK_WEBHOOK_URL" ]; then
  echo "ERROR: \$SLACK_WEBHOOK_URL is nil"
  exit 1
fi
if [ -z "$SLACK_CHANNEL" ]; then
  echo "ERROR: \$SLACK_CHANNEL is nil"
  exit 1
fi

FILE=$(mktemp)
URL=https://raw.githubusercontent.com/ispec-inc/aws-cost-weekly-notifier/master/cfn.yaml

curl -s $URL > $FILE

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
